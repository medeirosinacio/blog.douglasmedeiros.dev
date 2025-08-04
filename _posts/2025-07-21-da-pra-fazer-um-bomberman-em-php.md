---
layout: blog-post
date: 2025-07-21
permalink: /artigos/:categories/da-pra-fazer-um-bomberman-em-php
title: "Dá pra fazer um Bomberman em PHP?"
categories:
  - arquitetura
tags:
  - php
  - programação
image: /assets/images/posts/da-pra-fazer-um-bomberman-em-php/bomberman-php.jpg
description: "E se a gente usasse PHP pra recriar o Bomberman? Não como projeto sério, mas como uma desculpa pra estudar, testar limites e se divertir no processo. Esse texto é sobre isso: misturar paixão por games com vontade de explorar o inesperado na programação."
---

Eu sempre gostei de testar caminhos menos óbvios na programação. Usar Postgres como fila. Evitar Redis e ir na memória.
Brincar com o Google Sheets como banco de dados. São soluções que, à primeira vista, parecem estranhas, quase erradas.
Mas com contexto, estudo e bom senso, funcionam. E funcionam bem.

É isso que me fascina na nossa área: a liberdade criativa. A possibilidade de experimentar, de fugir do caminho
tradicional e descobrir novas formas de resolver problemas. Quando vejo alguém compartilhando essas soluções “fora da
curva”, eu paro pra ler. Quero entender a motivação por trás, os aprendizados no processo, e principalmente, como aquilo
se sustenta na prática.

### Duas paixões

Sou apaixonado por videogame desde pequeno. Meu primeiro foi um Dynavision. Depois vieram o Super Nintendo, o Play 1, o
2… e continuo vendo jogos como uma das formas mais interessantes de entretenimento e imersão. Sempre curti jogar, sempre
investi nisso. Mas nunca levei essa paixão pro meu lado profissional, sempre esteve ali, como válvula de escape.

![Foto aleatória dos meus controles — 2017](/assets/images/posts/da-pra-fazer-um-bomberman-em-php/controles.png?class=w-80 w-md-80 w-xxl-60)

Só que, nos últimos tempos, bateu a vontade de unir as coisas. Não pra virar dev de games, mas pra usar os games como
desculpa pra estudar conceitos técnicos de forma mais divertida. Criar algo pequeno, como hobby, mas que me desafiasse
como programador.

### O Insight

PHP foi minha primeira linguagem. Não é a única que uso hoje, mas é a que carrego com mais carinho. Conheço suas manhas,
seus limites, e sei que, quando bem usada, dá pra fazer muita coisa além do que a galera espera. E aí veio o estalo: por
que não escrever um game em PHP?

Pesquisando, acabei caindo em uns repositórios que me chamaram muita
atenção: [emuladores de NES](https://github.com/hasegawa-tomoki/php-terminal-nes-emulator), até de Game Boy, todos
feitos em PHP. E o mais louco: eles funcionam, com limitações, claro, mas funcionam. Aquilo me deu aquele estalo bom.
Me lembrou como a nossa área é um terreno fértil pra experimentação, até com linguagens que, à primeira vista, não
parecem feitas pra isso.

Mas eu não queria repetir o que já existia. Queria algo diferente. Um projeto pra estudar, testar ideias, aplicar
conceitos técnicos e, de quebra, me divertir no processo.

### Bomberman

Entre essas buscas, voltei a um assunto que já queria estudar há um tempo: matrizes. Juntando isso com a vontade de
fazer algo relacionado a games, surgiu uma ideia nostálgica e, ao mesmo tempo, desafiadora: recriar o Bomberman em PHP.

Pra mim, o Bomberman é especial. Joguei muito no Super Nintendo. E, olhando com olhos de dev, ele tem uma estrutura
ótima pra aplicar vários conceitos legais: mapa em grade (matriz), bombas com explosão em cruz, lógica de colisão,
estados de jogador, inimigos com movimentação semi-autônoma… Tudo isso encaixa muito bem numa arquitetura bem pensada.

> [!NOTE]
> Explicando rápido, pra quem não pegou essa época: **Bomberman** é um jogo em que os personagens se movem por um mapa
> em forma de grade, como se fosse um tabuleiro. A ideia é simples, você posiciona bombas que explodem em formato de
> cruz, quebram blocos e eliminam os adversários. Apesar da mecânica parecer básica, o jogo exige bastante estratégia.
> Posicionamento, tempo certo pra agir e leitura de cenário fazem toda a diferença.
>
> Toda a dinâmica gira em torno dessa matriz, das interações entre os elementos e do tempo de cada ação.

![(1995) Super Bomberman 3 - Super Nintendo](/assets/images/posts/da-pra-fazer-um-bomberman-em-php/bomberman-3.png?class=w-80 w-md-80 w-xxl-60)

### Um motor de jogo em PHP

A ideia é construir o motor do jogo, toda a lógica por trás: regras, movimentação, eventos, explosões. No início, tudo
rodando no terminal mesmo, via CLI, simples e direto. Mais pra frente, quem sabe, uma interface web com HTML, CSS e JS
só pra deixar mais visual.

Mas o core seria todo em PHP. E é aí que mora a graça: transformar esse projeto num laboratório pra estudar estrutura de
dados, arquitetura, padrões de design, controle de estado... até corrotinas, usando algo como ReactPHP ou Swoole. Se
virar multiplayer, dá até pra experimentar com WebSockets em realtime.

Talvez isso vire um repositório no GitHub. Talvez seja só um exercício mental. Talvez eu até chegue a jogar uma versão
jogável via navegador com PHP no backend. Sinceramente, não sei até onde isso vai.

Mas o que importa é: esse tipo de projeto é um respiro. Um espaço pra experimentar, aprender e se divertir, tudo ao
mesmo tempo. E é isso que eu queria compartilhar aqui.

## E você, já fez algo fora da curva?

Me conta: já criou algo fora do comum? Daqueles projetos que talvez não fossem os mais eficientes ou óbvios, mas que te
ensinaram algo, te arrancaram um sorriso? Compartilha aí, vai que a gente se inspira junto.
