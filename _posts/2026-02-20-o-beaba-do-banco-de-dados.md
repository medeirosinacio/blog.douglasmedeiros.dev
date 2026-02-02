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
description: "Depois de 11 anos na área, acredito que existem práticas essenciais sobre banco de dados que todo desenvolvedor deveria dominar. Não saber disso traz problemas lá na frente."
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

No Sentinela, por exemplo, não buscamos no banco o `created_at` nem o `updated_at`. Por quê? Porque não usamos essas
colunas na aplicação. Por mais que isso "estrague" um pouco a modelagem (o `created_at` no banco é `NOT NULL`, mas na
entidade é nullable), é um tradeoff que vale a pena.

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

> [!IMPORTANT]
> Índices melhoram leitura, mas degradam escrita. Cada `UPDATE` num registro com índice precisa atualizar o índice
> também. Tem bancos com mais de 10 índices. Cuidado.

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
que uma consulta só com join. Parece contraintuitivo, mas em certos cenários, funciona melhor.

> [!TIP]
> Não é sobre “join é ruim”. É sobre **entender o plano de execução** e o volume de dados. Tem join que é lindo e tem
> join
> que vira um caminhão sem freio descendo ladeira.

Um exemplo bem simples (pensando em aplicação): você busca os `user_id` que estão ativos e, depois, busca os pedidos só
pra esse grupo.

```sql
-- Query 1: pega um conjunto pequeno de IDs
SELECT id
FROM users
WHERE status = 'active' LIMIT 1000;

-- Query 2: usa o conjunto de IDs (na aplicação) numa segunda consulta
SELECT id, user_id, total
FROM orders
WHERE user_id IN (/* ids ativos */);
```

Agora, quando o volume é grande e você consegue resolver tudo no banco, um join bem indexado costuma ser mais direto:

```sql
SELECT o.id, o.user_id, o.total
FROM orders o
         JOIN users u ON u.id = o.user_id
WHERE u.status = 'active';
```

### O Vilão ORDER BY

O `ORDER BY` é um grande vilão. Se você faz um select por status e depois faz um `ORDER BY` em ordem decrescente, ele
vai pegar todos os dados do banco, ordenar primeiro para depois fazer o filtro.

Isso muitas vezes vai degradar muito a performance. E às vezes esse `ORDER BY` vai ser feito só na aplicação para
ordenar o primeiro e último pagamento ou o último ou primeiro usuário de uma tabela.

Então às vezes é muito mais vantajoso fazer o `ORDER BY` na aplicação, em tempo de execução dentro da collection, do que
mandar esse `ORDER BY` ser feito pelo banco. Porque o banco pode degradar muita performance fazendo sorting,
principalmente se esse campo de `ORDER BY` não tiver índice.

> [!NOTE]
> Já pegamos problemas aqui onde o problema era só o `ORDER BY`. Tiramos da consulta e ela melhorou 10 vezes. O
> `ORDER BY` estava ordenando gigas e gigas de dados dentro do banco, e na aplicação só queríamos filtrar um registro.

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

Armazene data no tipo correto. Se é ID, use o tipo de ID. Se é booleano, use booleano. Parece básico, mas faz diferença.

E cuidado com conversões dentro de queries. Muitas vezes a gente quer fazer uma pesquisa e o campo no banco está em
minúsculo, mas o que estamos buscando está em maiúsculo. Aí fazemos um `UPPER` ou `LOWER` para mudar aquele registro
dentro da cláusula.

Só que isso faz com que o banco execute essa transformação em cada linha que ele vai percorrendo. Isso é muito custoso.
O ideal é fazer o filtro sem essas conversões de tipos e na aplicação você converter isso, ou converter de alguma forma
antes de fazer de fato o filtro.

> [!TIP]
> Se você está fazendo conversão de tipo filtrando terabytes de registro, isso não é viável. É melhor ajustar o filtro
> ou fazer a conversão antes na aplicação.

## Chaves Únicas: O Problema do UUIDv4

A maioria dos sistemas hoje gera UUID na versão 4. Eles são identificadores bons porque são aleatórios, é difícil ter
uma colisão entre eles. Porém, a maioria que usa esse tipo de abordagem também coloca o ID como índice da tabela.

**E aqui está o problema:** por não ser ordenado, o índice fica muito fragmentado. Você não consegue ter um índice muito
eficiente quando quer fazer um `ORDER BY`, por exemplo, ou qualquer outro tipo de pesquisa em algum período específico.

### A Vantagem do UUIDv7

Já com o UUIDv7, conseguimos ter IDs ordenados. Os primeiros cinco ou sete caracteres dele são um carimbo de data e o
resto final é o aleatório.

Isso faz com que a gente ainda mantenha os IDs seguros e aleatórios contra colisão, e muito mais eficientes para terem
chaves primárias e índices em cima deles.

Esse estudo que fizemos acabou sendo levado para outros projetos aqui dentro. Foi algo bem bacana. Tem projetos hoje que
só geram UUIDv7 e outros que já querem começar a gerar.

**E é super tranquilo:** você vai lá na sua biblioteca que gera UUID e coloca o 7. Ela gera o 7. É compatível com a
versão 4, é o mesmo padrão e funciona normalmente. É uma implementação muito simples que tem um ganho bem grande,
principalmente para sistemas novos que vão usar esses campos como chave primária.

## O Custo de Múltiplos Índices

Em tabelas com muitos índices, cada insert precisa atualizar todos os índices relevantes. Isso aumenta
significativamente o custo de escrita, pois o banco precisa recalcular posições, reorganizar árvores B ou estruturas
internas e escrever em disco várias vezes.

Quanto mais complexos e numerosos os índices, maior o impacto em CPU, I/O e latência de inserção. Em cenários de alta
escala, isso pode se tornar o principal gargalo, exigindo planejamento cuidadoso de quais índices são realmente
necessários.

### O Tradeoff dos Índices

Lembra que falei lá em cima que índices melhoram leitura? Pois é, mas eles degradam escrita. Cada `UPDATE` num registro
com índice precisa atualizar o índice também. É diferente você fazer update num registro que não tem índice do que fazer
update num registro que tem um índice, ou pior, que tem 10 índices.

**Desvantagens de múltiplos índices:**

- Cada insert atualiza todos os índices, aumentando o custo de escrita
- Maior uso de CPU e I/O
- Aumento da latência de inserção
- Mais espaço em disco ocupado pelos índices
- Necessidade de manutenção periódica, como reindexação

Tem bancos que têm mais de 10 índices. Cuidado com updates e índices, porque vai aumentando o tempo de updates desse
registro conforme mais índices a aplicação tem.

## Um Mundo à Parte

Esse beabá vai além da nomenclatura. Tem outras práticas importantes que fazem parte desse universo:

### Use Constraints

Use `NOT NULL` e `UNIQUE` para garantir integridade. Essas constraints são sua primeira linha de defesa contra dados
inconsistentes.

### Filtre UPDATE e DELETE

Sempre filtre suas operações de `UPDATE` e `DELETE` para evitar impactos totais. Um `UPDATE` sem `WHERE` pode destruir
uma tabela inteira em produção.

### Stored Procedures

Stored procedures reduzem tráfego e melhoram performance quando bem usadas. Tem gente que odeia, tem gente que faz o
sistema inteiro em stored procedures. Como tudo na vida, tem um meio termo.

### Indexe Colunas Usadas em JOINs

Se você faz joins frequentes em determinadas colunas, elas precisam de índices. Isso acelera drasticamente as consultas.

### Prefira Joins/CTEs a Subqueries

Quando possível, prefira joins e CTEs (Common Table Expressions) a subqueries desnecessárias. Elas costumam ser mais
eficientes e legíveis.

Um exemplo clássico de subquery que até funciona, mas começa a ficar difícil de manter:

```sql
SELECT u.id, u.name
FROM users u
WHERE u.id IN (SELECT o.user_id
               FROM orders o
               WHERE o.created_at >= NOW() - INTERVAL '30 days'
    );
```

A mesma ideia usando join (geralmente mais legível):

```sql
SELECT DISTINCT u.id, u.name
FROM users u
         JOIN orders o ON o.user_id = u.id
WHERE o.created_at >= NOW() - INTERVAL '30 days';
```

E quando você precisa organizar melhor a consulta (e dar nome pros “pedaços”), CTE ajuda demais:

```sql
WITH recent_orders AS (SELECT user_id
                       FROM orders
                       WHERE created_at >= NOW() - INTERVAL '30 days'
    )
SELECT u.id, u.name
FROM users u
         JOIN recent_orders ro ON ro.user_id = u.id;
```

### Agregue Valores Consultados Frequentemente

Se você tem valores que são consultados com frequência, considere armazená-los agregados. Isso pode economizar muito
processamento.

### Monitore Bloqueios e Deadlocks

Bloqueios e deadlocks são inimigos silenciosos. Monitore-os constantemente e evite transações longas que possam causar
esses problemas.

### Evite Cálculos Repetidos em SELECT

Se você precisa fazer o mesmo cálculo várias vezes, persista o resultado. Não force o banco a recalcular a mesma coisa
toda hora.

### Planeje Backups e Restores Eficientes

Backups não são opcionais. Mas também não precisam ser exagerados. Planeje de acordo com seu contexto de negócio e
necessidade real de retenção.

### Documente Schema e Regras

Documente o schema e as regras do seu banco. Seu eu do futuro (e seus colegas) vão agradecer.

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
