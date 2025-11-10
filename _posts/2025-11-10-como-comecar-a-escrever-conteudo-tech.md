---
layout: blog-post
title: "Algoritmos de Hash para Particionamento no Kafka"
date: 2025-11-10
permalink: /artigos/:categories/algoritmos-de-hash-para-particionamento-no-kafka/
categories:
  - mensageria
tags: [ kafka, algoritmos de hash, particionamento, mensageria distribuída ]
image: /assets/images/posts/algoritmos-de-hash-para-particionamento-no-kafka/kafka.jpg
description: "Mensagens com chaves idênticas caindo em partições diferentes do Kafka? O problema pode estar nos algoritmos de hash incompatíveis entre seus produtores. Este artigo explora como CRC32, Murmur2 e FNV-1a afetam o particionamento de mensagens, apresenta testes comparativos de performance e distribuição com 100.000 mensagens, e explica por que a escolha do algoritmo correto é uma decisão de arquitetura, não apenas de performance. Se você trabalha com múltiplos produtores Kafka em linguagens diferentes, essa leitura pode te poupar algumas horas."
---

Recentemente enfrentei um bug bem específico que me custou algumas horas de sono e investigação. Mensagens com chaves
idênticas
estavam caindo em partições diferentes do Kafka. Parecia impossível para mim no momento, mas estava acontecendo.

O culpado? Algoritmos de hash incompatíveis entre produtores. Uma daquelas coisas que você nunca para pra pensar até
quebrar na sua frente.

## Kafka e as partições

Kafka é um sistema de mensageria distribuído que organiza mensagens em tópicos, e cada tópico é dividido em múltiplas
partições distribuídas entre os servidores (brokers) do cluster. Cada partição funciona como um log ordenado e imutável
onde as mensagens são escritas sequencialmente e mantêm sua ordem de chegada. O grande benefício dessa arquitetura é o
paralelismo: múltiplos consumidores podem processar partições diferentes simultaneamente, alcançando alto throughput e
baixa latência.

No entanto, existe uma restrição fundamental que impacta diretamente o design de sistemas: a garantia de
ordenação existe apenas dentro de uma partição individual, mensagens em partições diferentes podem ser processadas em
qualquer ordem, e o Kafka não oferece nenhuma garantia de sequência entre elas.

![Kafka Architecture](/assets/images/posts/algoritmos-de-hash-para-particionamento-no-kafka/kafka-architecture.jpg?class=w-80&w-md-80&w-xxl-60)

### A chave de partição

Quando você produz uma mensagem, pode enviar junto uma chave. Essa chave decide em qual partição a mensagem vai parar. A
promessa é simples: mensagens com a mesma chave sempre vão para a mesma partição. Isso é extremamente útil quando você
precisa processar eventos relacionados na ordem certa. Por exemplo: eventos de uma
mesma transação bancária, ações de um usuário específico, logs de uma requisição.

Se você não envia chave, o Kafka distribui as mensagens de forma round-robin entre as partições. Rápido, mas sem
garantia de ordem.

E aí que veio o problema, enquanto estava trabalhando num sistema que consolidava eventos de várias fontes. A ideia era
usar um ID de correlação como chave
de partição. Assim, todos os eventos de um mesmo fluxo iriam para a mesma partição e seriam processados na ordem pelo
mesmo worker. Funcionava perfeitamente até começarem as integrações com novos sistemas. De repente, mensagens com a
mesma chave
estavam indo para partições diferentes.

Investigando, descobri o motivo: cada cliente Kafka (Java, Python, Go, PHP) usa um algoritmo de hash diferente por
padrão. Mesma chave, hash diferente, partição diferente. O problema não estava no Kafka. Estava na forma como cada
linguagem calcula o hash da chave.

![A mensagem é enviada com base na chave de partição](/assets/images/posts/algoritmos-de-hash-para-particionamento-no-kafka/hash-partition.jpg?class=w-80&w-md-80&w-xxl-60)

## Como o Kafka decide onde colocar as mensagens

Quando você produz uma mensagem no Kafka com uma chave, o produtor precisa decidir em qual partição ela vai parar. A
fórmula é simples:

```php
partition = hash(key) % num_partitions
```

Parece trivial, mas tem um detalhe crucial aqui: **qual função de hash você está usando?**

O Kafka em si não força um algoritmo específico. Cada cliente implementa o que quiser. O cliente Java oficial usa
**Murmur2** por padrão. A librdkafka (base para Python, Go, PHP, C++) usa **CRC32**. E tem ainda o **FNV-1a** como
alternativa.

### O problema na prática

Imagine: você tem um produtor em Java mandando eventos de usuário para um tópico. Usa o `user_id` como chave. Funciona
perfeitamente. Agora você adiciona um novo produtor em Python que também envia eventos de usuário, com o mesmo `user_id`
como chave.
Você espera que os eventos do mesmo usuário caiam na mesma partição, independente de qual produtor enviou.

Mas não caem.

O produtor Java usa **Murmur2**. O Python (via librdkafka) usa **CRC32** por padrão. Mesma chave, hashs diferentes. Hash
diferente módulo número de partições = partições diferentes. Seu processamento ordenado quebrou.

O pior é que isso não gera erro. Não loga warning. Simplesmente não funciona como você espera.

![Incompatibilidades entre algorítimos](/assets/images/posts/algoritmos-de-hash-para-particionamento-no-kafka/algo.jpg?class=w-80&w-md-80&w-xxl-60)

## Testando na prática

Para entender qual algoritmo escolher, montei um benchmark comparando os três principais: CRC32, **Murmur2** e FNV-1a. O
código completo está [no repositório](https://github.com/medeirosinacio/kafka-partitioner-benchmark).

Testei três aspectos:

- **Performance**: tempo para calcular o hash e definir a partição
- **Distribuição**: o quão uniforme fica a distribuição entre partições
- **Escalabilidade**: comportamento com 10 vs 100 partições

Usei três tipos de chave para simular cenários reais:

- UUIDs (totalmente aleatórios)
- IDs sequenciais (1, 2, 3... comum em bancos relacionais)
- Strings estruturadas (`test_key_123`, tipo de prefixo comum em sistemas)

### Performance

Vou poupar suspense: todos são rápidos demais para fazer diferença.

A variação fica entre 0.386ms e 0.436ms para processar 100.000 mensagens. Na prática, qualquer um faz milhões de hashs
por segundo. Performance não é critério de decisão aqui.

### Distribuição

Aqui a coisa fica interessante. Usei o coeficiente de variação para medir a qualidade da distribuição (quanto menor,
mais uniforme).

**IDs sequenciais (pior caso possível) - 10 partições:**

| Algoritmo   | Coef. Variação | Diferença máx |
|-------------|----------------|---------------|
| **FNV-1a**  | 0.29%          | 89 msgs       |
| **CRC32**   | 0.84%          | 271 msgs      |
| **Murmur2** | 0.95%          | 333 msgs      |

O **FNV-1a** distribuiu significativamente melhor. A partição mais carregada tinha apenas 89 mensagens a mais que a
menos
carregada. No Murmur2, essa diferença foi de 333 mensagens.

**UUIDs - 100 partições:**

| Algoritmo   | Coef. Variação | Diferença máx |
|-------------|----------------|---------------|
| **CRC32**   | 2.66%          | 142 msgs      |
| **FNV-1a**  | 3.23%          | 160 msgs      |
| **Murmur2** | 3.33%          | 150 msgs      |

Com UUIDs, a diferença praticamente desaparece. Faz sentido: UUIDs já são aleatórios por natureza, então qualquer hash
razoável distribui bem.

**Conclusão dos testes**: **FNV-1a** distribui melhor em praticamente todos os cenários, principalmente com chaves
estruturadas ou sequenciais.

### Entendendo as diferenças

Os resultados revelam características importantes de cada algoritmo que vão além dos números.
**CRC32** foi originalmente desenvolvido para detecção de erros em transmissão de dados, não para distribuição uniforme.
Isso explica sua fraqueza com strings similares: chaves como `user_123`, `user_124`, `user_125` geram hashs próximos,
aumentando o risco de colisões e distribuição desigual. O algoritmo opera bit a bit e é sensível a padrões sequenciais,
o que se reflete nos resultados com IDs incrementais.

Murmur2 não é tecnicamente superior aos outros algoritmos em termos de distribuição (como os testes mostram). Sua
vantagem real é compatibilidade. Foi escolhido como padrão do cliente Java oficial do Kafka e, por consequência, virou o
padrão de fato do ecossistema. Kafka Streams, ksqlDB, e praticamente todas as ferramentas enterprise usam Murmur2.
Escolher **Murmur2** não é uma decisão técnica de performance, é uma decisão de arquitetura para evitar
incompatibilidades.

FNV-1a demonstrou a melhor distribuição nos testes, especialmente com chaves estruturadas. É um algoritmo simples,
rápido, e projetado especificamente para hash tables. Funciona bem com strings curtas e médias, que é exatamente o
cenário típico de chaves de partição. No entanto, seu uso em produção significa abrir mão da compatibilidade automática
com o ecossistema Java.

## Mas então é só usar FNV-1a?

Não é tão simples assim.

Se você está começando do zero, controlando todos os produtores, pode ir de **FNV-1a** tranquilo. Mas a realidade de
sistemas distribuídos raramente é essa.

Se você tem (ou vai ter) múltiplos produtores em linguagens diferentes, a resposta é **Murmur2**. Não porque distribui
melhor, mas porque é o padrão do ecossistema Java.

O cliente oficial do Kafka é em Java. Kafka Streams é Java. ksqlDB usa o cliente Java por baixo. Praticamente todo
framework de streaming usa **Murmur2** como padrão. Se você escolher outro algoritmo, vai precisar configurar
explicitamente
todos os produtores e ainda corre o risco de algum sistema legado ou biblioteca usar o padrão Java sem você saber.

A não ser que você tenha controle total e certeza absoluta de que nenhum produtor Java vai entrar no jogo, **Murmur2** é
o
caminho mais seguro.

## O que aprendi com isso

A escolha do algoritmo de hash no Kafka parece um detalhe técnico pequeno, mas tem impacto direto na arquitetura de
sistemas distribuídos. O problema não está no Kafka em si, a plataforma cumpre exatamente o que promete. A complexidade
surge quando múltiplos produtores em linguagens diferentes precisam compartilhar a mesma garantia de ordenação por
chave.

A decisão entre **CRC32**, **Murmur2** e **FNV-1a** não é puramente técnica. Embora **FNV-1a** tenha demonstrado melhor
distribuição nos
testes, especialmente com chaves estruturadas, **Murmur2** é a escolha mais pragmática para ambientes heterogêneos. A
razão
é simples: compatibilidade com o ecossistema Java, que domina o mundo Kafka.
Se você está começando um projeto novo com controle total sobre todos os produtores, pode considerar **FNV-1a** para
aproveitar sua melhor distribuição. Mas na maioria dos cenários corporativos, onde times diferentes criam produtores ao
longo do tempo, **Murmur2** evita problemas futuros.

Mais importante que escolher o "melhor" algoritmo é garantir consistência. Documente a decisão, configure explicitamente
todos os produtores, e teste com dados reais antes de ir para produção. UUIDs escondem fraquezas de distribuição; IDs
sequenciais as expõem. Se suas chaves não são aleatórias, valide o comportamento antes de assumir que está funcionando
corretamente.

O [repositório](https://github.com/medeirosinacio/kafka-partitioner-benchmark) com todos os testes está aqui. Se você
quiser replicar no seu ambiente ou testar com outros tipos de
chave, o código está aberto para contribuições.

### Para se aprofundar

- [Understanding Partition Keys](https://www.confluent.io/learn/kafka-partition-key/)
- [The Importance of Standardized Hashing Across Producers](https://www.confluent.io/blog/standardized-hashing-across-java-and-non-java-producers/)
- [Guide to Kafka Partitioning Strategies](https://medium.com/@deepakchandh/guide-to-kafka-partitioning-strategies-637c1cf3ccf1)
- [Kafka Message Key Hashing](https://medium.com/@omernaci/kafka-message-key-hashing-a1c2a9654060)
- [Which hashing algorithm is best for uniqueness and speed?](https://softwareengineering.stackexchange.com/questions/49550/which-hashing-algorithm-is-best-for-uniqueness-and-speed)
- [Kafka Architecture](https://medium.com/@cobch7/kafka-architecture-43333849e0f4)

> E se você descobrir que tem algoritmos diferentes rodando em produção? Bem, aí você tem um problema interessante pela
> frente. Mas isso é papo para outro post.
