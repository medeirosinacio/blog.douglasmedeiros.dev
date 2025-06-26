---
layout: blog-post
date: 2024-12-23
permalink: /artigos/:categories/do-caos-a-clareza-explorando-a-modelagem-de-software
title: "Do Caos à Clareza: Explorando a Modelagem de Software"
categories:
  - arquitetura
tags:
  - arquitetura
image: /assets/images/posts/do-caos-a-clareza-explorando-a-modelagem-de-software/caos.jpeg
description: "Softwares confusos, difíceis de entender e mal documentados geram estresse e frustração, especialmente em equipes que enfrentam dificuldades na integração de novos membros. Este artigo explora como a modelagem de software pode transformar esse cenário, trazendo clareza, organização e eficiência aos projetos."
---

Ao longo dos anos, notei que muitos dos problemas que enfrentamos em diferentes projetos e empresas têm uma origem
comum: a falta de clareza na modelagem de software. Softwares confusos, difíceis de entender e sem documentação adequada
são uma constante. Esse cenário se agrava ainda mais com a chegada de novos desenvolvedores nos projetos, tornando o
ambiente de trabalho estressante e frustrante. Na minha experiência, lidar com códigos desorganizados e labirínticos é
uma realidade que torna nossos dias mais complicados e menos produtivos.

Esse caos nas equipes e projetos, no entanto, pode ser mitigado com o uso de uma modelagem bem documentada e uma
organização interna mais eficaz. Ao adotar essas práticas, conseguimos transformar um ambiente hostil em um lugar de
trabalho mais claro e produtivo.

> [!IMPORTANT]
> Este artigo nasceu da minha palestra "Do Caos à Clareza: Explorando a Modelagem de Software". Recentemente, tive a
> oportunidade de apresentá-la pela terceira vez, desta vez no evento PHP Velho Oeste, em maio de 2024. Palestrar e
> participar ativamente da comunidade foi uma experiência extremamente gratificante, e isso me deu um empurrãozinho para
> criar uma nova talk ([Nem Só de Código Vive o Dev](/artigos/carreira/nem-so-de-codigo-vive-o-dev)), para seguir
> contribuindo com temas que acredito que possam
> fazer a diferença.

Então como uma forma de concluir este ciclo, decidi escrever este artigo dedicado ao conteúdo base da palestra. Nele,
vou explorar as ideias e práticas que compartilhei sobre a importância da modelagem de software, e como essa prática
pode transformar nossos projetos de software, trazendo clareza e eficiência para nossos times.

## A Modelagem de Software

Eu gosto de partir de um ponto em comum, então se a gente procurar sobre modelagem de software, comumente na literatura
vamos achar a seguinte frase:

> [!NOTE]
> A modelagem de software é construir modelos que explicam as características ou o comportamento de um software,
> oferecendo uma visão abstrata.

Ao ler isso, a definição pode parecer técnica e distante do nosso dia a dia. No entanto, vamos simplificar. Basicamente,
modelar software é desenhar nosso sistema. Significa criar representações visuais que explicam como o software deve
funcionar e como suas diferentes partes se conectam e se comunicam. Esses modelos se tornam um "mapa" que orienta a
construção do software, ajudando desenvolvedores e stakeholders a entender melhor o projeto. Esses modelos ou desenhos
não precisam ser necessariamente técnicos, mas podem servir como referência para discussões entre as equipes, mesmo que
simplificados.

> UML Class Box: [Eclipselink_uml_class_diagram.gif](https://wiki.eclipse.org/File:Eclipselink_uml_class_diagram.gif)

Isso não significa que a UML ou outros tipos de modelagem não sejam importantes. Elas, assim como todos os padrões e
referências, têm seus casos de uso e propósitos. No entanto, a ideia aqui é mostrar que podemos começar com algo mais
simples que nos ajude a nos organizar e melhorar nosso fluxo de desenvolvimento, conectando pontos e caixas em diagramas
de referência de nossos fluxos.

![exemplos-de-diagramas-bpmn.png](/assets/images/posts/do-caos-a-clareza-explorando-a-modelagem-de-software/exemplos-de-diagramas-bpmn.png)

## Mas, por que desenhar?

Quando perguntamos "por que desenhar?", muitas vezes ouvimos respostas como "é perda de tempo" ou "não vai ajudar
muito". Essas respostas são semelhantes ao que ouvimos sobre testes unitários.

Ao longo dos meus anos de desenvolvimento, participei de diversos projetos que foram verdadeiros caos. Houve onboardings
que literalmente demoraram mais de três meses. Às vezes porque a senha da VPN demorava para chegar, outras vezes porque
o ambiente era tão confuso e mal documentado que subir o projeto parecia um quebra-cabeça que você desvendava enquanto
conversava com metade da empresa. Infelizmente, cenários assim são comuns, e esse caos se reflete no dia a dia.

Muitos desses projetos demandavam alta carga cognitiva para compreensão. Não temos como absorver 100% da base de código
sem uma orientação clara, apenas lendo código fonte. Eram métodos em cima de métodos, formando uma verdadeira teia de
aranha. Isso é muito frustrante e saímos do dia com aquela sensação de estresse. Para resolver um problema, muitas vezes
precisamos falar com três ou quatro pessoas. A informação está toda distribuída entre cabeças específicas da empresa.
Todo mundo sabe que fulano é quem entende disso ou beltrano é quem sabe daquilo. Esses problemas sempre me soam como um
**_Software Orientado a Fofoca_**.

![Do Caos à Clareza : Slide 14](/assets/images/posts/do-caos-a-clareza-explorando-a-modelagem-de-software/software-orientado-a-fofoca.png)

Esse tipo de sistema é um clássico, infelizmente. Geralmente, ele pode ser identificado por alguns pontos. Temos aquele
sênior de 10 anos de empresa, que é considerado sênior não necessariamente por suas habilidades, mas porque está há 10
anos na empresa. Ele se torna o oráculo dos desenvolvedores, a referência para qualquer dúvida ou problema. Isso cria
uma dependência perigosa, pois se ele sair um dia, sua ausência será sentida por um longo tempo nas equipes.

Outro ponto que identifica um software desse tipo é a comunicação boca a boca como forma de documentação. Não somos
robôs; se eu perguntar a mesma coisa várias vezes para a mesma pessoa, ela responderá de maneira diferente a cada vez. O
problema surge quando uma empresa não tem uma organização interna, pois cada equipe tem uma ideia diferente de como o
sistema funciona. Com cada novo membro, as coisas mudam ainda mais. Sem um ponto central para identificar ou estudar
como as coisas funcionam, começam a surgir bugs fantasmas. Muitas regras de negócio são simplesmente esquecidas e só
lembramos que existem quando causam problemas em produção.

A modelagem de software oferece uma solução prática para esses problemas. Ela cria uma linguagem comum e uma visão
compartilhada que facilita a comunicação e a colaboração entre todos os membros do time. Desenhar o software não é uma
perda de tempo; é um investimento que poupa tempo e reduz a frustração no longo prazo. Com uma modelagem clara, podemos
transformar a confusão em clareza, documentar de maneira eficaz e criar um ambiente onde todos compreendem o sistema da
mesma forma. Isso não só melhora a produtividade, mas também contribui para um ambiente de trabalho mais saudável e
colaborativo, onde o conhecimento é compartilhado e todos podem contribuir de maneira mais eficaz.

## Por Onde Começar

Eu gosto de falar que apenas comece, simples assim. Acredito que modelar seu sistema é parecido com aprender uma
linguagem de programação: você vai lá, faz o "Hello World" de qualquer forma e, conforme vai sentindo as dificuldades,
curiosidades ou necessidades, vai se aprofundando e estudando mais a fundo.

Eu sempre digo: apenas comece, simples assim. Acredito que modelar seu sistema é semelhante a aprender uma linguagem de
programação. Você começa com o básico, faz o seu "hello world" e, conforme vai percebendo as dificuldades, curiosidades
ou necessidades, você se aprofunda e estuda mais.

O processo de modelagem tem três etapas primordiais: início, processamento e fim. Embora eu não queira focar em padrões
aqui, é importante termos uma linguagem comum para facilitar nosso entendimento. Nestas três etapas, podemos representar
o início como uma bolinha branca, o quadrado para uma ação e o círculo preto para finalizar.

![Do Caos à Clareza : Slide 18](/assets/images/posts/do-caos-a-clareza-explorando-a-modelagem-de-software/diagrama-1.png)

Seja qual for, um worker que irá ler uma mensagem e processá-la, ou um cron job que realizará uma rotina e disparará
alguns eventos, todo e qualquer fluxo sempre terá um início, um processamento e um fim. Isso pode começar com uma
solicitação ou entrada de dados e, após executar o fluxo necessário, chegará a uma conclusão ou finalização.

Tenha em mente que "***o fluxo precede o sistema***". A empresa ou cliente nunca vai, do nada, pensar em um sistema.
Quando surge uma demanda ou uma ideia de software, é para abraçar, automatizar ou implementar algum fluxo existente. Por
isso, é fundamental entender que todo e qualquer fluxo pode ser desenhado.

### O Problema da Notificação de Usuário

Vamos explorar um exemplo prático para entender melhor a importância da modelagem de software: o problema da notificação
de usuário. Imagine que sua equipe precisa implementar um sistema para enviar notificações de e-mail aos usuários.
Parece simples, certo? Mas, sem um desenho claro, essa tarefa pode se tornar um verdadeiro pesadelo.

Primeiro, vamos visualizar o fluxo básico da notificação de usuário.

![Do Caos à Clareza : Slide 19](/assets/images/posts/do-caos-a-clareza-explorando-a-modelagem-de-software/diagrama-2.png)

Primeiro, lemos as mensagens de uma fila chamada "user_notify". Depois, verificamos se há mensagens nessa fila. Se não
houver mensagens, o fluxo termina. Caso haja mensagens, iteramos sobre cada uma delas e enviamos um e-mail para o
respectivo usuário.

Um desenho desse fluxo torna tudo mais claro. A ideia e a implementação não ficam mais dispersas nas mentes dos
desenvolvedores, mas sim materializadas no desenho. Isso permite que todos possam visualizar, discutir pontos
específicos, identificar melhorias e prever possíveis problemas de forma muito mais eficaz.

### O Desenho é vivo, como o sistema

Imagine que, após implementar o fluxo, começam a surgir erros no sistema. Sem um desenho claro, identificar a origem do
problema pode ser complicado. No entanto, com o diagrama em mãos, podemos rapidamente verificar cada etapa do fluxo e
localizar onde o erro está ocorrendo. Por exemplo, se a exceção está sendo lançada porque o corpo da mensagem está
vazio, podemos ver que faltou uma etapa de validação antes do envio do e-mail.

![Do Caos à Clareza : Slide 20](/assets/images/posts/do-caos-a-clareza-explorando-a-modelagem-de-software/diagrama-3.png)

Esses problemas podem ser identificados e resolvidos durante as sessões de entendimento e desenho. Muitas vezes, após
horas de discussão, alguém olha para o fluxo e percebe um gap, algo que pode evitar um bug em produção.

Nesse contexto de erros, podemos voltar ao desenho e atualizá-lo junto com o software. Manter o desenho atualizado é
útil para consultas futuras e para que outros membros da equipe possam entender se o fluxo antigo mudou ou não.
Lembre-se que seu software é vivo; dificilmente ele ficará sem receber melhorias ou novas funcionalidades. A menos que
ele seja muito específico ou não esteja sendo usado, o software está em constante evolução. Da mesma forma, seu desenho
deve ser mantido atualizado. Isso é fundamental. Ele não apenas documenta o sistema atual, mas também serve como guia
para futuras adaptações. Com uma modelagem clara, qualquer desenvolvedor novo na equipe pode rapidamente entender como o
sistema funciona e contribuir efetivamente.

Mesmo que o fluxo ganhe novas formas de envio, como Telegram, ou novas tratativas de erros, podemos voltar ao desenho e
discutir a melhor forma de implementar essas mudanças.

![Do Caos à Clareza : Slide 22](/assets/images/posts/do-caos-a-clareza-explorando-a-modelagem-de-software/diagrama-4.png)

### Nem Só de Software Vive o Desenho

Quando comecei a escrever a palestra que apresentei, tinha tantas coisas que queria falar que ficou difícil criar um
roteiro coeso. Foi aí que usei o [miro.com](http://miro.com/) para criar um mapa mental dos assuntos. Fui organizando as
ideias até encontrar uma ordem que fizesse sentido e que transmitisse o que eu queria dizer.

![Mapa mental feito via miro.com](/assets/images/posts/do-caos-a-clareza-explorando-a-modelagem-de-software/miro.png)

Mas essa técnica vai além do software. Minha esposa, que é psicóloga, usa diagramas de emoções com seus pacientes.
Enquanto conversava com eles, ela desenhava as relações entre as pessoas e os sentimentos que surgiam. Esses diagramas
ajudavam a visualizar a intensidade e o impacto de cada emoção. Fiquei surpreso e começamos a conversar sobre como essa
técnica a ajudava no trabalho dela.

Se você prestar atenção, verá que todas as profissões têm alguma forma de representação visual, fluxo ou desenho. E na
nossa área de desenvolvimento de software, não é diferente. Utilizar desenhos e diagramas é uma maneira poderosa de
organizar ideias, entender processos e comunicar informações de forma clara e eficiente.

## Consequências De Um Desenho

Ter desenhos e diagramas em projetos de software traz inúmeros benefícios. Eles tornam a comunicação entre membros da
equipe mais clara, facilitando a compreensão do sistema, especialmente para novos desenvolvedores. Visualizar o fluxo de
trabalho ajuda a identificar possíveis falhas antes da codificação, reduzindo bugs e problemas em produção. Manter
diagramas atualizados junto com o código cria uma documentação viva que reflete o estado atual do sistema, facilitando a
manutenção e evolução. Documentação visual permite que novos desenvolvedores entendam rapidamente o funcionamento do
sistema e localizem funcionalidades principais. Além disso, diagramas padronizam práticas na equipe e facilitam a
implementação de melhorias contínuas, permitindo revisões regulares dos fluxos para identificar e ajustar pontos
críticos.

### Mais simples mesmo que às vezes não pareça

Mesmo que inicialmente pareça trabalhoso criar e manter diagramas, a longo prazo, essa prática se revela extremamente
benéfica. A alternativa seria muito mais complexa, envolvendo a leitura extensiva da base de código para entender o
sistema. Com diagramas, a compreensão se torna muito mais rápida e eficiente.

## Padrões e Ferramentas

Existem várias ferramentas e padrões que podem nos ajudar a desenhar e versionar nossos diagramas em equipe. Algumas das
ferramentas mais populares incluem:

- **Miro**: Excelente para criar mapas mentais e diagramas colaborativos.
- **Lucidchart**: Ótima para diagramas de fluxo e UML.
- **Draw.io**: Uma ferramenta gratuita e poderosa para criar diagramas.
- **PlantUML**: Permite criar diagramas de UML através de código, facilitando a integração com sistemas de
  versionamento.

### Indo mais fundo

Assim como em qualquer linguagem de programação, à medida que você se aprofunda na modelagem de software, perceberá a
necessidade de padrões mais complexos. Existem muitos padrões de diagramas que podem ser extremamente úteis em
diferentes contextos, como diagramas de estados, diagramas de banco de sequencia, entre muitos.

- **Diagrama de Classes**: Mostra a estrutura do sistema em termos de classes e suas relações.
- **Diagrama de Sequência**: Detalha como os objetos interagem em um fluxo específico.
- **Diagrama de Estados**: Representa os estados pelos quais um objeto passa durante seu ciclo de vida.
- **Diagrama de Atividades**: Ilustra o fluxo de trabalho ou as atividades dentro de um sistema.

## Conclusão

Modelar software não é apenas uma prática útil; é essencial para criar sistemas claros, eficientes e de fácil
manutenção. Ao adotar a modelagem de software, transformamos ambientes caóticos em espaços de trabalho organizados e
produtivos. Desenhar não é uma perda de tempo, mas um investimento valioso que facilita a comunicação, reduz erros,
melhora a documentação e torna o onboarding mais fácil. Com as ferramentas e padrões corretos, podemos criar diagramas
que evoluem com nosso software, garantindo que todos na equipe estejam sempre na mesma página. Em última análise, a
modelagem de software é uma prática que transforma a maneira como desenvolvemos, entendemos e mantemos nossos projetos,
trazendo clareza e eficiência para o nosso trabalho diário.

[Slides da Palestra](https://docs.google.com/presentation/d/1EaRerRVi9y6xAyJebmKKZLj8Fi4EKPgsdLcIaMdyY3I/edit?usp=sharing)
