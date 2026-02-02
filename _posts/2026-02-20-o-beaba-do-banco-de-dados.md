---
layout: blog-post
date: 2026-02-01
permalink: /artigos/:categories/o-beaba-do-banco-de-dados
title: "O Beabá do Banco de Dados: O Mínimo que Todo Dev Deveria Saber"
categories:
  - boas-praticas
tags:
  - banco-de-dados
  - performance
  - postgresql
  - otimizacao
image: /assets/images/posts/o-beaba-do-banco-de-dados/beaba-banco-dados.png
description: "Banco de dados raramente é o gargalo… até virar. Depois de 11 anos mexendo com performance, modelagem e aquela query que ninguém quer encostar, eu juntei o beabá que todo dev deveria ter na ponta da língua. Se você quer parar de sofrer com consulta lenta, índice faltando e decisão que vira dívida pro teu eu do futuro, esse post é pra você."
---

Desde sempre eu gostei muito de banco de dados. E, sempre que aparecia alguma oportunidade de encostar num problema de
performance, modelagem ou query esquisita, eu tava lá: “deixa eu ver isso aí”.

Eu até brinco que, se não fosse dev, eu seria DBA. Mas não aquele DBA que só executa query (o que a gente vê bastante
por aí e parece uma vida meio triste, kkk) — e sim o DBA curioso, que gosta de entender o *porquê* das coisas e caçar
gargalo.

A questão é que hoje em dia a linguagem raramente é o vilão. Se você pegar sistemas rodando em Python, Node ou PHP, dá
pra ver claramente: a maior parte do tempo tá indo embora em I/O. E uma fatia enorme desse I/O é… banco de dados. Na
prática, o gargalo quase nunca é “a linguagem lenta”. Normalmente é consulta ruim, índice faltando, rede, lock, ou
qualquer combinação dessas coisas.

Então sim: saber trabalhar bem com banco, e saber otimizar quando precisa, é uma skill bem valiosa.

Nesses anos como dev, eu tive a oportunidade de mexer bastante com banco e fazer várias melhorias de performance. E
depois de apanhar o suficiente, eu fiquei bem convencido de uma coisa: existe um **beabá** que todo dev deveria ter na
ponta da língua.

> [!NOTE]
> Este artigo saiu de uma talk minha chamada **Autópsia de um banco de dados de alta performance**.
> No meio dessa talk, eu falo sobre essas boas práticas que trago resumidas aqui.
>
> E se você curtiu esse assunto e quer levar essa conversa para dentro da sua empresa ou do seu time,
> pode [me pingar](https://links.douglasmedeiros.dev).

Obviamente, é difícil o dev saber tudo isso que eu vou comentar aqui *de cabo a rabo*. Mas, no final das contas, dominar
esse básico bem feito aumenta (e muito) a chance do seu sistema ser de alta performance.

## O Básico que Não É Tão Básico Assim

Quando a gente fala de "básico" ou "boas práticas", muita gente pensa logo em nomenclatura. E sim, nomenclatura é
importante. Quem nunca pegou um banco onde todas as tabelas começavam com `tb_` ou `tabela_`?

Mas esse "beabá" que quero trazer vai muito além de nomes bonitinhos. Estamos falando de estrutura e performance.
Existem guias ótimos sobre nomenclatura por aí, mas aqui vamos focar no que realmente faz diferença no dia a dia.

### Evite SELECT *

A primeira coisa que todo DBA vai apontar quando você chegar com problema de query é: "Não faz `SELECT *`". Mesmo que
esse não seja o problema, ele vai apontar isso. E com razão.

Selecionar todas as colunas tem vários efeitos colaterais. Você está trafegando muito mais dados na rede do que deveria.
Um payload que poderia ser menor, porque às vezes você vai usar só o ID e o status, acaba carregando todos os 10, 20
campos que existem na tabela.

Em um dos sistemas que trabalhei, por exemplo, não buscamos no banco o `created_at` nem o `updated_at`. Por quê? Porque
não usamos essas colunas na aplicação. Por mais que isso "estrague" um pouco a modelagem (o `created_at` no banco é
`NOT NULL`, mas na entidade é nullable), é um tradeoff que vale a pena.

Quem aqui não tem uma tabela com mais de 10, 20 colunas? E todo ano que passa sempre tem uma coluna a mais. "Essa é a
última coluna, daqui não sai". E do nada surge um campo novo. Já peguei tabelas com 100 colunas. Imagina fazer
`SELECT *` nisso.

**A regra é simples:** busque apenas o que você vai usar.

### Índices Corretos (Mas Sem Exagero)

Usar índices nas colunas onde você faz filtros é essencial. Se você faz muito `WHERE` em status, em `user_id`, em
`created_at`, esses campos precisam de índices.

Claro que muitos índices também é ruim, e nenhum índice também é ruim. Tudo é aquele tradeoff de avaliar o que é bom
para aquele contexto. Mas as colunas que vocês mais filtram devem ter os índices corretos para conseguir filtrar melhor
aqueles dados.

Índices melhoram leitura, mas degradam escrita. Cada `UPDATE` num registro com índice precisa atualizar o índice também.
Tem bancos com mais de 10 índices. Cuidado.

### ORM: Use com Cuidado

O ORM é um ponto polêmico. Tem gente que ama, tem gente que odeia. Ele é muito bom para coisas simples no código,
facilita bastante a construção de queries. Mas ele dificulta bastante a otimização ou esconde problemas reais quando faz
unions e joins.

Cada ORM vai fazer um union ou join de uma maneira diferente. Ele vai fazer uma subquery, ou vai fazer um join
diretamente na consulta, ou vai criar uma view temporária para guardar esses dados e depois cruzar. E isso às vezes é
ruim do ponto de vista do desenvolvedor, porque a gente não sabe exatamente como ele está fazendo aquilo por baixo.

Se você vai fazer um insert ou update, acho razoável fazer com ORM. É mais rápido, mais prático. Mas se você vai fazer
um join cruzado com outra tabela, e o resultado dessa você vai cruzar com uma terceira tabela ainda, o ideal talvez seja
fazer a query na mão mesmo. Assim você tem certeza do que está sendo escrito no banco de dados e consegue testar
performance.

**Não existe bala de prata.** ORM tem seus casos de uso. Vai ter casos que vai ser muito mais rápido e está certo, mas
vai ter casos que não convém. Faça na mão e teste a performance.

### Multi-Queries vs Joins

Às vezes vale mais a pena você fazer uma consulta, guardar ela num array em memória e fazer uma segunda consulta que
cruze com esse array do que fazer uma consulta com join.

Dependendo de como for sua query ou o que você está querendo buscar, é mais fácil fazer duas consultas e cruzar elas do
que uma consulta só com join. Parece contraintuitivo, mas em certos cenários funciona melhor.

E tem um outro ponto aqui que muita gente esquece: **muitas vezes uma CTE (`WITH`) bem feita é mais rápida (e mais fácil
de manter) do que um joinzão monstruoso**. Não porque join é “ruim”, mas porque você consegue quebrar o problema em
etapas, reduzir o conjunto de dados cedo e deixar o plano mais previsível.

Um exemplo (bem simplificado) de join que pode virar uma bomba quando você começa a misturar filtros, agregações e
volume grande:

```sql
SELECT u.id, u.name, SUM(o.total) AS total_30d
FROM users u
         JOIN orders o ON o.user_id = u.id
WHERE u.status = 'active'
  AND o.created_at >= NOW() - INTERVAL '30 days'
GROUP BY u.id, u.name;
```

A mesma ideia “fatiando” primeiro o conjunto de pedidos recentes e só depois relacionando com usuários:

```sql
WITH recent_orders AS (SELECT user_id, total
                       FROM orders
                       WHERE created_at >= NOW() -
    INTERVAL '30 days'
    )
   , active_users AS (
SELECT id, name
FROM users
WHERE status = 'active'
    )
SELECT au.id, au.name, SUM(ro.total) AS total_30d
FROM active_users au
         JOIN recent_orders ro ON ro.user_id = au.id
GROUP BY au.id, au.name;
```

De novo: não é regra absoluta. Em alguns bancos/versões, CTE pode inclusive ser materializada e piorar. Mas no dia a dia,
quando a consulta começa a crescer, **CTE costuma salvar**: fica mais legível, mais testável e (muitas vezes) mais rápida.

### O Vilão ORDER BY

O `ORDER BY` é um grande vilão. Se você faz um select por status e depois faz um `ORDER BY` em ordem decrescente, ele
vai pegar todos os dados do banco, ordenar primeiro para depois fazer o filtro.

Isso muitas vezes vai degradar muito a performance. E às vezes esse `ORDER BY` vai ser feito só na aplicação para
ordenar o primeiro e último pagamento ou o último ou primeiro usuário de uma tabela.

Então às vezes é muito mais vantajoso fazer o `ORDER BY` na aplicação, em tempo de execução dentro da collection, do que
mandar esse `ORDER BY` ser feito pelo banco. Porque o banco pode degradar muita performance fazendo sorting,
principalmente se esse campo de `ORDER BY` não tiver índice.

Já pegamos caso em que o problema era só o `ORDER BY`. Tiramos da consulta e ela melhorou 10x, porque o banco estava
ordenando gigas e gigas de dados, e na aplicação a gente só queria filtrar um registro.

### Enums como Texto

Em algumas versões mais modernas do banco tem uma coluna chamada `ENUM`. O cara olha e fala: "Caramba, tem uma coluna
Enum, é genial, vou fazer isso".

Só que isso tem um problema. A cada vez que você insere um registro novo naquela tabela, o banco de dados vai validar se
aquele Enum é válido ou não para aquele campo. Até aí, tudo bem, quando você tem campos predefinidos e que nunca vão
mudar.

Mas quando você tem campos no formato status, tipos, microsserviços ou meio de pagamento que costumam crescer conforme a
aplicação cresce, cada vez que você tem que fazer um `ALTER TABLE` nesse campo é muito custoso.

Pensa numa tabela com alguns terabytes de dados. Fazer um `ALTER TABLE` numa coluna dessa para adicionar um método de
pagamento novo é inviável, porque esse `ALTER TABLE` vai ter que percorrer esses terabytes para conseguir mudar esse
tipo da coluna.

**É muito melhor a coluna ser um `VARCHAR`** e a aplicação é que valida se aquele enum é válido ou não. Você pode sofrer
muito para fazer `ALTER TABLE` quando tiver que incluir um enum novo, porque a tabela pode estar muito grande e esse
`ALTER TABLE` vai ser custoso.

### Tipos Corretos Garantem Melhor Performance

Armazene cada coisa no tipo certo. Parece papo de guia básico, mas isso aqui tem impacto direto em **tamanho de linha**,
**índice**, **cache** e, no final das contas, I/O.

- Data é data (`DATE`, `TIMESTAMP`) — não é string.
- Boolean é boolean (`BOOLEAN`) — não é `VARCHAR('true')`.
- Número é número (`INT`, `BIGINT`, `NUMERIC`) — não é `VARCHAR`.

O detalhe que muita gente ignora é que, quando você escolhe um tipo “qualquer coisa” (normalmente `VARCHAR` pra tudo),
você não só gasta mais espaço. Você também força o banco a fazer mais trabalho pra comparar, ordenar e indexar.

### Conversões no WHERE

Aqui é onde muita query começa a ficar lenta sem ninguém perceber. A gente quer “só ajustar um detalhe” e mete uma
função no `WHERE`.

Por exemplo, buscar por dia usando `TRUNC`/`DATE` em cima da coluna:

```sql
-- Parece inocente… mas pode impedir o uso do índice em created_at
SELECT id
FROM orders
WHERE TRUNC(created_at) = DATE '2026-02-02';
```

Uma forma mais performática costuma ser filtrar por intervalo (e aí o índice em `created_at` tem chance de trabalhar de
verdade):

```sql
SELECT id
FROM orders
WHERE created_at >= TIMESTAMP '2026-02-02 00:00:00'
  AND created_at < TIMESTAMP '2026-02-03 00:00:00';
```

Outro clássico é normalizar texto no `WHERE`:

```sql
-- Pode matar índice em email
SELECT id
FROM users
WHERE LOWER(email) = 'douglas@exemplo.com';
```

O ideal aqui depende do banco e do contexto, mas geralmente você tem algumas saídas melhores:

1. **Normalizar na escrita** (armazenar sempre em minúsculo e validar na aplicação)
2. **Usar collation/citext** (Postgres) quando faz sentido
3. **Índice funcional** quando você realmente precisa usar `LOWER(...)` no filtro

No final das contas, a regra é: se você está fazendo conversão de tipo filtrando uma tabela grande, tem uma boa chance
de isso virar gargalo. Ajuste o filtro (intervalo, normalização, índice funcional) ou faça a transformação antes.

## Chaves Únicas: O Problema do UUIDv4

UUIDv4 é muito popular (com razão): é simples, é aleatório, praticamente elimina a chance de colisão e dá uma segurança
legal quando você não quer expor IDs sequenciais.

Só que tem um preço que quase ninguém percebe no começo. O preço aparece quando a tabela cresce e você começa a sentir a
escrita ficando mais cara.

Quando você usa UUIDv4 (totalmente aleatório) como chave primária e indexa isso, você está basicamente pedindo pro banco
inserir novos registros **no meio da árvore do índice o tempo todo**.

Em um índice B-Tree (que é o padrão na maioria dos bancos), isso costuma significar:

- mais *page split* (o banco quebrando páginas do índice pra encaixar o novo valor)
- mais fragmentação
- mais I/O
- e um índice “espalhado”, que piora cache e deixa range scan mais caro

E aí vem o efeito cascata: o insert em si não é “só inserir”. Ele vira inserir + ajustar páginas + atualizar estruturas
internas + escrever mais coisa em disco.

Isso também explica por que UUIDv4 costuma ser ruim quando você quer fazer consultas ordenadas por tempo usando o próprio
ID. Não tem “ordem natural” ali. É tudo aleatório.

Beleza, isso significa que UUIDv4 é proibido? Não. Mas significa que, se você tá num cenário de **alto volume de escrita**
(e o ID é PK + índice principal), vale pensar duas vezes.

### A Vantagem do UUIDv7

O UUIDv7 nasce justamente pra atacar esse ponto: ele é **time-ordered**. Ele carrega um timestamp no começo (em nível de
bits), e o resto continua sendo aleatório.

Na prática, isso dá um comportamento muito mais “amigável” pro índice:

- os inserts tendem a cair **mais perto do final do índice**, em vez de espalhados no meio
- reduz fragmentação
- reduz *page split*
- melhora locality (cache/CPU/IO agradecem)

E aqui tem um bônus bem legal: você continua com um ID que não é simplesmente “1, 2, 3…”, mas passa a ter alguma ordem
natural que ajuda em muita consulta do dia a dia (principalmente em tabelas de eventos, pagamentos, logs, etc.).

Sobre adoção: pra sistema novo, é uma troca bem tranquila. Em geral é literalmente “gerar v7 ao invés de v4” na
biblioteca que você já usa.

## O Custo de Múltiplos Índices

Índice é ótimo… até você ter índice demais.

Na prática, cada `INSERT`/`UPDATE` não mexe só na tabela. Ele precisa atualizar **todos os índices** que envolvem as
colunas alteradas. Ou seja: quanto mais índice você cria, mais você aumenta o custo de escrita.

Isso vira “write amplification”: uma operação simples vira várias escritas em disco/IO. E aí a conta chega em forma de
latência, CPU alta e banco suando em horário de pico.

### O Tradeoff dos Índices

O tradeoff é simples de entender:

- índice acelera leitura (`SELECT`)
- índice encarece escrita (`INSERT`/`UPDATE`/`DELETE`)
- índice ocupa espaço e precisa de manutenção (reindex, vacuum/analyze dependendo do banco)

Então, ao invés de sair indexando tudo, eu gosto de pensar em duas perguntas:

1. **Quais queries realmente importam?** (as que rodam o tempo todo e doem quando ficam lentas)
2. **Onde estão os filtros/join/order by dessas queries?** (é aí que índice costuma fazer diferença)

Se você tem uma coluna que quase nunca aparece em `WHERE`/`JOIN`/`ORDER BY`, o índice dela provavelmente só está
cobrando aluguel.

E uma regra bem pé no chão: se sua tabela é muito “write-heavy” (muita escrita), você tem que ser ainda mais conservador
com índice. Tem banco com 10+ índices que vive lento não por falta de otimização, mas porque toda escrita vira um
carnaval.

## Um Mundo à Parte

Esse beabá vai além da nomenclatura. Na real, ele é o tipo de coisa que você só sente falta quando dá ruim:
consulta lenta em produção, dado inconsistente, migração travando, lock bizarro, deploy que virou madrugada…

E o ponto aqui não é “virar DBA”. É só entender que banco não é um `JSON` gigante onde a gente joga coisa lá dentro e
reza. Banco tem regra, tem custo e tem comportamento.

Então, além das boas práticas que já falei, tem um pacote de hábitos que (pra mim) separa o “banco funciona” do “banco
aguenta o tranco”.

### Use Constraints

Use `NOT NULL`, `UNIQUE` e `FOREIGN KEY` pra garantir integridade. Isso aqui é sua primeira linha de defesa contra dado
inconsistente — e, de quebra, evita que a aplicação precise virar um juiz de tudo o tempo todo.

O famoso caso real: quando você não tem `UNIQUE` onde deveria, você só descobre depois… quando aparece duplicidade e
ninguém sabe mais qual registro é o certo.

### Filtre UPDATE e DELETE

Sempre filtre suas operações de `UPDATE` e `DELETE`. Parece óbvio, mas todo mundo já viu (ou quase fez) a tragédia do
"faltou o WHERE".

Se eu puder te dar uma regra simples é: se você vai rodar um `UPDATE`/`DELETE` “perigoso”, roda primeiro um `SELECT`
com o mesmo `WHERE`.

```sql
SELECT id
FROM users
WHERE status = 'inactive';

-- só depois:
-- DELETE FROM users WHERE status = 'inactive';
```

### Stored Procedures

Stored procedures reduzem tráfego e podem melhorar performance quando bem usadas — principalmente quando você precisa
executar vários passos perto dos dados.

Mas também podem virar um "software orientado a fofoca": ninguém sabe o que tem lá dentro, não tem versionamento direito,
e a regra de negócio vira um Frankenstein.

Meu meio-termo pessoal: procedure pra coisa bem data-centric (lote, manutenção, agregação). Regra de negócio da aplicação
fica na aplicação.

### Agregue Valores Consultados Frequentemente

Se você tem valores que são consultados com frequência (ex: total de pedidos do usuário, saldo, contadores), avalie
persistir um agregado.

Não é pra sair duplicando dado sem critério. É pra evitar recalcular a mesma coisa mil vezes por minuto. Em alto volume,
essa diferença é brutal.

### Monitore Bloqueios e Deadlocks

Bloqueios e deadlocks são inimigos silenciosos. Não dá pra otimizar o que você não enxerga.

Algumas coisas bem práticas que ajudam:

- transação curta (não abre transação e depois fica chamando serviço externo, por favor)
- evita lock "desnecessário" (ex: `SELECT ... FOR UPDATE` sem motivo)
- consistência na ordem de acesso às tabelas (pra reduzir chance de deadlock)

### Evite Cálculos Repetidos em SELECT

Se você precisa fazer o mesmo cálculo várias vezes, persista o resultado (ou cacheie). Não force o banco a recalcular a
mesma coisa toda hora.

Exemplo clássico: relatório que soma milhões de linhas em toda requisição. Na primeira semana é lindo… depois vira o
maior consumidor de CPU do teu banco.

### Planeje Backups e Restores Eficientes

Backup não é opcional. O que é opcional é *só perceber isso no dia que precisar restaurar*.

Não precisa ser exagerado, mas precisa ser testado: saiba quanto tempo leva pra restaurar, qual o RPO/RTO que você
aguenta, e onde isso quebra primeiro.

### Documente Schema e Regras

Documente o schema e as regras do seu banco. Seu eu do futuro (e seus colegas) vão agradecer.

E aqui vale qualquer coisa que funcione:

- README do banco (simples)
- diagrama básico
- comentários em migration
- descrição de índices “por que esse índice existe?”

## O Mínimo Necessário

Seguir boas práticas de banco de dados não é diferencial, é obrigação. Tipos corretos, índices bem definidos e modelagem
consistente deveriam ser parte natural de qualquer sistema, garantindo qualidade, performance e sustentabilidade desde o
início.

> [!NOTE]
> Depois de mais de 11 anos na área, acredito que isso é o mínimo que um desenvolvedor deveria saber para criar uma
> modelagem de dados que aguente o tranco ao longo prazo, sem dores de cabeça no futuro.

Não adianta só tocar as coisas e no meio do caminho tentar mudar. É muito mais custoso, porque o sistema já vai estar
engessado em certas decisões de arquitetura que tomamos lá atrás, e vai ser muito difícil mudar.

**Ter tempo para planejar com calma é muito importante** para um banco de dados de alta performance. Para chegar num
sistema que tenha um banco de dados que consiga aguentar muita porrada em produção e não dê muitos problemas com aumento
de volume ou trocas de contexto.

Banco de dados é um mundo à parte. Falei aqui 1%, poderia ter falado mais, poderia ter dado mais exemplos. Mas se você
gosta desse assunto tanto quanto eu, vale a pena se aprofundar. Com certeza vai melhorar a eficiência dos seus sistemas.

E aí, você tem aplicado essas práticas no seu dia a dia? Compartilhe suas experiências nos comentários.
