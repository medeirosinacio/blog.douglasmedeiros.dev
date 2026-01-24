---
layout: blog-post
title: "O Dia que o Redis Virou um Gargalo"
date: 2026-01-23
permalink: /artigos/:categories/o-dia-que-o-redis-virou-um-gargalo/
categories:
  - performance
tags: [ redis, cache, performance, arquitetura de sistemas, php, hyperf ]
image: /assets/images/posts/o-dia-que-o-redis-virou-um-gargalo/redis.jpg
description: "Sempre ouvimos que o Redis é a solução definitiva para cache. Mas o que acontece quando a própria solução de performance se torna o gargalo da aplicação? Neste artigo, conto como uma decisão arquitetural aparentemente sólida se tornou um problema em um sistema de alto volume e por que decidimos remover o Redis em favor de uma abordagem mais simples."
---

Sempre que pensamos em performance, a primeira coisa que vem à mente é cache. E logo em seguida, Redis. É quase um
reflexo: precisa ser rápido? Bota um Redis na frente. Já vi essa solução sendo defendida dezenas de vezes em
refinamentos técnicos e discussões online. Faz sentido: Redis é rápido, confiável e resolve problemas de escalabilidade,
principalmente quando a aplicação está martelando o banco sem necessidade.

Eu também acreditava nisso, até trabalhar em um sistema de altíssimo volume no PicPay.

Nos deparamos com um cenário onde essa "verdade" simplesmente não se sustentou. O que deveria ser nossa camada de
otimização virou o principal gargalo da aplicação.

> [!NOTE]
> Antes de começar, quero agradecer pelo ano de 2025. Foi intenso: palestrei em vários eventos, conheci muita gente
> bacana e fiz amizades que vou levar comigo. 2026 promete ser ainda melhor.
>
> Uma das minhas metas para este ano é escrever pelo menos um artigo por mês. Espero que você me acompanhe nessa
> jornada.

## O Contexto

Para dar uma dimensão do problema: estamos falando de um sistema que processa mais de
**45 bilhões de registros por ano**.
Nessa escala, otimizar milissegundos deixa de ser preciosismo técnico e vira necessidade operacional. Cada fração de
segundo economizada se multiplica bilhões de vezes.

O fluxo em si não era complexo. Recebíamos mensagens via Kafka, processávamos algumas regras de negócio e salvávamos o
resultado. O desafio, como quase sempre em sistemas distribuídos, era garantir a **idempotência**. Precisávamos garantir
que a mesma mensagem não fosse processada duas vezes, o que duplicaria registros e causaria inconsistência nos dados.

A solução canônica para isso? Um lock distribuído ou uma verificação rápida antes do processamento. E claro, usamos o
Redis.

A lógica era simples:

1. Chega a mensagem.
2. Verifica no Redis se o ID já foi processado.
3. Se não, processa e salva o ID no Redis com um TTL (Time To Live).
4. Vida que segue.

No papel, arquitetura de livro. Na prática, os traces começaram a contar outra história.

## A Descoberta

Começamos a notar que o throughput dos consumidores não acompanhava o volume de entrada, gerando lag no Kafka. A
primeira suspeita? O banco de dados. "Deve estar gargalando no insert", pensamos. Mas as métricas do banco estavam
saudáveis.

Partimos para o código. Será que a deserialização do JSON estava pesada? Não, era irrelevante.

Foi só quando mergulhamos nos traces da aplicação que a ficha caiu. A maior fatia do tempo de processamento de cada
mensagem não estava na regra de negócio, nem no banco de dados. Estava na comunicação com o Redis.

E não é que o Redis estava lento. O servidor respondia em microssegundos. O problema era a latência de rede.

Vamos fazer uma conta de padaria. Digamos que a ida e volta da sua aplicação até o cluster Redis leve 1ms. Parece pouco,
certo?

Agora multiplique isso por 1 milhão de mensagens. São 1.000 segundos gastos apenas esperando pacotes irem e voltarem
pela rede. Em um sistema que processa bilhões de registros, esse "custo de pedágio" se acumula de forma brutal.

Estávamos pagando o preço de IO de rede para cada mensagem processada, só para verificar uma chave. O Redis era rápido,
a rede interna era rápida, mas não dá para competir com acesso à memória local. A diferença é de ordens de grandeza.

## A Decisão "Errada"

Diante dos dados, tomamos uma decisão que pode parecer contraintuitiva: removemos o Redis da jogada.

Em vez de buscar o dado em um cache externo, movemos o controle de idempotência para a memória local da aplicação.

Como usamos Hyperf (um framework PHP de alta performance que roda em memória, similar a Node.js ou Go), podíamos manter
estado na memória do processo. Diferente do modelo tradicional request-response do PHP-FPM, aqui tínhamos um servidor
persistente.

Implementamos um cache LRU simples, direto na RAM do container.

A diferença foi imediata.

O tempo de processamento despencou. A latência de rede desapareceu da equação. A verificação que antes custava 1ms
passou a custar nanossegundos de acesso à RAM.

E o consumo de memória? Sim, aumentou. Tivemos que ajustar os recursos nos pods do Kubernetes. Mas quando colocamos na
ponta do lápis, escalar memória RAM nos pods saiu mais barato do que manter e escalar um cluster Redis dedicado para
aguentar aquela carga.

Além disso, simplificamos a infraestrutura. Menos uma peça móvel, menos uma dependência de rede, menos um ponto de
falha.

## Insights Finais

Essa experiência reforçou o que todo dev ouve a vida inteira nas talks por aí: não existe bala de prata. Existem
ferramentas e existem contextos.

O Redis continua sendo uma ferramenta excelente. Usamos em diversos outros serviços onde precisamos de cache
compartilhado entre múltiplas instâncias, onde a consistência entre réplicas importa, ou onde os dados precisam
sobreviver a um restart da aplicação.

Mas para aquele problema específico (idempotência de janelas curtas em altíssimo volume), a latência de rede era o
gargalo real.

Claro, cache em memória local tem suas limitações. Se duas mensagens idênticas chegarem em pods diferentes ao mesmo
tempo, ambas vão processar. Mas fizemos as contas: era mais rápido deixar o cache local barrar 99% dos casos e deixar o
banco de dados (com constraint de unique key) segurar os raros que vazassem, do que adicionar latência de rede em 100%
das verificações.

A melhor arquitetura nem sempre é a mais popular. Às vezes é aquela que olha para os números e toma a decisão menos
óbvia.

No nosso caso, memória local venceu cache distribuído. No seu, pode ser o contrário. O importante é medir.

> [!TIP]
> **Performance é contexto.** Antes de otimizar, meça. O gargalo real quase nunca é onde nossa intuição diz que está.
