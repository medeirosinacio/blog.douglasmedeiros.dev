---
layout: blog-post
date: 2026-03-30
permalink: /artigos/:categories/reflexoes-sobre-o-uso-de-ia-no-desenvolvimento
title: "Reflexões sobre o uso de IA no dia a dia do desenvolvimento de software"
categories:
  - ia
tags:
  - ia
  - produtividade
  - engenharia de software
  - agentes
  - opiniao
image: /assets/images/posts/reflexoes-sobre-o-uso-de-ia-no-desenvolvimento.jpg
description: "Eu não queria escrever sobre IA. Mas depois que um agente escalou uma instância paga sem me pedir, achei que era hora de colocar no papel o que venho pensando. Uso IA todo dia, construo agentes autônomos no trabalho, e ainda assim acho que a conversa sobre IA no desenvolvimento está passando por cima das partes que mais importam: o gargalo que mudou de lugar, a produtividade que não virou qualidade de vida, os layoffs com desculpa nova pra conta velha, e o que acontece quando a ferramenta erra e quem chamam na war room é você."
---

Sinceramente? Eu não gosto de falar de IA.

Todo assunto com muito hype me gera uma rejeição automática. Chega um ponto em que você simplesmente não
aguenta mais
ouvir falar daquilo e quer falar de qualquer outra coisa. IA virou exatamente isso pra mim: praticamente impossível
abrir qualquer canal de tecnologia sem ser bombardeado pelo assunto.

Mas eu uso IA há bastante tempo. E tem certas coisas que eu gostaria de refletir em conjunto.
Então aqui estou eu, escrevendo exatamente sobre o que eu não queria escrever.

> [!NOTE]
> Esse artigo quase ficou para abril. Fiz a transcrição em março, olhei para o rascunho, achei confuso demais e quase
> adiava. Mas tenho um compromisso comigo mesmo de lançar pelo menos um artigo por mês aqui no blog, e essa
> consistência importa. Corri pra honrar isso. E um episódio recente me convenceu de que essa conversa precisava
> acontecer agora mesmo.

Semana passada eu estava configurando um ambiente de QA para um projeto paralelo. Máquina gratuita, 250 MB de memória,
nada glamouroso. Pedi para o agente que eu estava usando ir ajustando as configurações até o sistema subir dentro
desse
limite. Deixei rodando, fui fazer outra coisa, voltei para acompanhar o chat e me deparei com o modelo me informando,
em tom de solução, que a máquina de 250 MB era insuficiente e que ele já tinha escalado para 500 MB. Fez isso
sozinho.
Via CLI. Sem pedir confirmação. Numa instância que cobra do meu cartão.

Eu tinha dito explicitamente que era uma máquina gratuita e que não queria pagar por nada em QA.

O que aconteceu ali não foi exatamente alucinação. Alucinação seria o modelo inventar um fato que não existe,
citar
um artigo que nunca existiu, descrever uma API com parâmetros errados. Isso é diferente. O agente achou um
subterfúgio,
uma situação que o meu prompt não cobria explicitamente, e tomou uma decisão sozinho. É quase como um pen tester
procurando onde o escopo não foi definido para ver o que consegue fazer. O objetivo dele era subir o sistema. Meu
prompt dizia pra subir em 250 MB. A máquina não subia. Então ele resolveu o problema à moda dele: escalou a
instância.
Tecnicamente, atingiu o objetivo. Só que pelo caminho errado e com o meu cartão. ~~kk~~

Por mais robusto que seja o prompt, você não vai antecipar todas as situações possíveis. Em algum momento o agente
vai estar num cenário que você não previu, e aí ele decide. Às vezes decide bem. Dessa vez não. E é esse tipo de
experiência que cria uma relação ambígua com a ferramenta.

## Fã ou hater?

Lembro quando o ChatGPT saiu, em 2022. A sensação era de que alguma coisa havia mudado de vez. Fui testando, fui
usando, fui construindo. Em algum ponto parei de ser usuário e comecei a operar IA como infraestrutura. Hoje tenho
agentes autônomos rodando no PicPay, sistemas que tomam decisão em produção sem esperar minha confirmação. Quando
algo quebra, sou eu que depuro. Esse contato cria uma relação diferente. Não posso dizer que não sou fã: a
ferramenta
me dá uma produtividade e agilidade que demorariam muito mais sem ela, e pretendo continuar aprendendo cada vez mais
sobre isso.

Só que tô meio de saco cheio com o discurso em volta. Não com a IA em si, mas com o que as pessoas
estão projetando em cima dela. Aquela narrativa de que o paradigma mudou, que engenheiro não precisa mais saber
nada, que é só dar o prompt certo, que quem não usar vai ficar pra trás. Esse discurso eu não compro.

Então, fã ou hater? Talvez seja por isso que esse meme me pega tanto quando o assunto é IA. Porque dependendo do
dia que você me perguntar, vou estar mais crítico, mais entusiasmado ou mais cético. O que não muda é que ela me
ajuda bastante e que ela erra bastante também.

## O problema com "mais produtividade"

A narrativa que a indústria vende é que IA democratiza a produção de software. Tem verdade nisso, mas é uma verdade
incompleta. Na maior parte dos contextos que observei, quem mais se beneficia são devs que já sabem o que estão
fazendo.
Um sênior que usa IA bem entrega mais rápido porque valida o output, sabe quando o modelo está alucinando e consegue
corrigir o rumo antes de o problema crescer. Faz sentido: quem já entende o domínio, a arquitetura e as regras de
negócio consegue guiar a ferramenta com muito mais precisão.

Pra quem está começando, é um momento difícil. Um júnior usando IA sem senso crítico está, na melhor das
hipóteses,
aprendendo devagar. Na pior, está produzindo código que ninguém entende, nem ele. É um trade-off real: ou você
aceita a dor de aprender de verdade, entendendo o que a IA está fazendo por baixo, ou delega o raciocínio desde o
começo e não desenvolve o julgamento necessário pra perceber quando ela está errada. E ela vai estar errada.
Várias vezes.

Eu já vi a IA recomendar duas coisas contraditórias na mesma conversa e acatar as duas com o mesmo entusiasmo. Você
pede pra refatorar uma classe que está inchada, ela refatora e diz que ficou ótimo. Você fala pra colocar tudo de
volta numa classe só pra simplificar, ela coloca e diz que assim fica melhor. Não tem oposição. Não tem crítica.
Ela
concorda com o que você acabou de pedir, e só isso.

E tem uma consequência óbvia disso que ninguém nas empresas está dizendo em voz alta: IA não vai te dar mais
qualidade
de vida. Vai te fazer entregar mais. A régua sobe, e a expectativa sobre o que uma pessoa consegue fazer sozinha
também. Não estou querendo ser pessimista com isso. Mas historicamente, tecnologias que evoluíram e aumentaram
produtividade não fizeram a gente trabalhar menos. Fizeram a gente entregar mais, muitas vezes trabalhando mais
também. O trator não deu ao agricultor mais horas de descanso. Deu a ele a capacidade de cultivar mais terra.

E o agricultor ainda precisava saber operar o trator.

## O gargalo virou revisão

Se a gente entrega mais rápido, o gargalo muda de lugar. Antes o limite era o humano: tem um teto de quantas linhas
uma pessoa consegue escrever por dia, por semana, num sprint. Com IA, esse teto sumiu. A ferramenta gera código numa
velocidade que nenhum dev consegue acompanhar escrevendo na mão. Então o gargalo saiu da geração e foi pra revisão
e pro teste. O problema é que a cultura de revisão e QA não escalou junto. Cinquenta mil linhas geradas
por IA e ninguém sabe o
que tem dentro. Não é exagero. É o que acontece quando a produção escala e o processo de validação fica no mesmo
ritmo de antes. Código sem revisão adequada entra em produção com bugs, com falhas de segurança, com design
ruim que
vira dívida técnica em seis meses. E teste de QA vira gargalo também, porque a gente nunca entregou código
tão rápido.

Abre o X qualquer semana e você vai ver o mesmo ciclo: alguém anuncia que lançou um SaaS em 48 horas usando IA, bate
a euforia nos replies, e algumas horas depois aparece outro post falando que o sistema foi invadido ou que os dados de
todos os usuários estão expostos. A IA possibilitou muita gente a criar coisas que antes não conseguiria. Mas criou
junto um volume enorme de software indo pra produção sem que ninguém entendesse o que estava dentro dele.

Não porque IA é ruim. Porque a velocidade de geração escalou e a capacidade de revisar e testar não acompanhou.
Aliás, um dos usos mais legítimos de IA que eu vejo é exatamente nessa ponta: LLMs rodando code review automatizado,
tentando invadir a própria base de código, identificando vulnerabilidades antes de subir pra produção. Isso dá mais
segurança pro desenvolvedor. Mas são apoios. A decisão final ainda é humana.

> [!IMPORTANT]
> Senso crítico não é opcional quando você usa IA para produção. O modelo vai te dar uma resposta. Vai soar confiante.
> Pode estar errada. E quando você pedir para desfazer, ele vai te dizer que a versão anterior também estava boa. Isso
> não é julgamento, é como o sistema funciona. A responsabilidade de validar continua sendo sua.

## A positividade tóxica

Tem um comportamento que me irrita mais do que ceticismo exagerado: a positividade tóxica com IA.

É a galera que, diante de qualquer crítica, responde com "mas você está usando errado" ou "com o prompt certo
resolve". Como se todo problema fosse de skill do usuário e a ferramenta fosse perfeita por definição. E o pior é
quando isso vem de executivo. "Você tem que usar mais", "cria um agente pra isso", "olha o que eu fiz em duas
horas". Como se a complexidade real de um produto coubesse num prompt.

Eu já vi executivo no Twitter vibe-codar um app num fim de semana e apresentar como se fosse o negócio
dele. Só que aquilo é
uma casca. Bonita, funcional na superfície, mas sem nada por trás. O produto real tem dezenas de serviços se
comunicando, resiliência, regras de negócio espalhadas, tratamento de falha, consistência de dados. A IA fez o
frontend e uma API básica. O iceberg inteiro que sustenta aquilo, ela não fez. Quando você vai a fundo e tenta
criar features mais complexas, sistemas maiores, o buraco é muito mais embaixo do que vibe-codar por algumas horas.

E como eu disse lá em cima: não existe prompt ou contexto suficiente pra garantir que a IA não vai tomar um caminho
errado. Eu já vi modelo afirmar com confiança que `sleep()` não bloqueia dentro de uma corrotina em PHP. Estava
errado. Ele mesmo, no reasoning, indicou que poderia bloquear, e mesmo assim entregou o código com sleep. Se isso
tiver enterrado em cinquenta mil linhas que ninguém revisou, boa sorte no postmortem.

Reconhecer as limitações não é ser anti-IA. É a única forma de usar a ferramenta com responsabilidade.

## O troubleshooting real

Tem alguns problemas que eu ainda não vi IA resolver bem. Um deles é troubleshooting em sistemas distribuídos com
estado inconsistente.

Aquele bug que só acontece em produção, às terças, quando tem milhões de usuários simultâneos, e os logs não
deixam
claro o que houve. Você abre um breakpoint, vai rastreando chamada por chamada, entendendo o estado em cada ponto,
até encontrar onde o contrato quebrou. Já passei horas assim, indo de serviço em serviço, reconstruindo a linha do
tempo de um evento que ninguém viu acontecer em tempo real.

Já tentei colocar IA pra acompanhar esse tipo de investigação. Pra sugerir hipóteses, identificar padrões nos logs,
apontar onde pode estar o problema. Na maioria das vezes, ela entra em loop. Tenta uma coisa, não funciona. Tenta
outra, não funciona. Gasta milhares de tokens rodando em círculos, resetando a abordagem sem realmente entender o
contexto profundo de por que aquele problema aconteceu. As hipóteses que ela gera são plausíveis, mas plausível não
é o mesmo que correto. Sem acesso ao estado real do sistema, ela está chutando. Um problema denso, que cruza vários
times e vários contextos, com regra de negócio espalhada em diferentes serviços, é exatamente onde ela se perde
mais rápido.

Alguém que conhece a arquitetura de dentro vai direto no lugar certo, ou pelo menos guia a investigação de forma
muito mais eficiente. Sabe onde olhar e o que aquele valor fora do esperado significa no contexto do negócio. Isso
agiliza muito. Às vezes a IA aponta a direção certa antes de mim, acontece. Mas conduzir a investigação até o fim,
entender o porquê e garantir que a correção não quebra outra coisa, ainda é trabalho de engenheiro.

E a nossa área nunca foi só sobre código. Sempre foi sobre resolver problemas de pessoas. Entender o negócio,
conversar com quem usa o sistema, saber o que o bug está causando na ponta. IA pode ajudar a escrever o código mais
rápido, mas entender qual problema resolver, para quem, e por quê, isso exige um humano que se importa com o
resultado.
Escrevi mais sobre isso em [Nem só de código vive o dev](/artigos/carreira/nem-so-de-codigo-vive-o-dev).

Se engenheiro ainda é essencial pra tudo isso, é irônico que empresas usem justamente IA pra justificar cortes.

## Sobre os layoffs com desculpa de IA

Cada vez que uma empresa anuncia cortes e menciona IA como justificativa, aparece uma galera dizendo que "era
previsível" e que "os devs deveriam ter se adaptado antes". Acho essa leitura preguiçosa.

Empresa demite quando quer reduzir custo. IA é a desculpa do momento. Antes era "otimização de processos", antes
disso era "reestruturação". Se você pesquisar notícias de layoff dos últimos dez anos, vai ver que sempre tem uma
justificativa nova, sempre apresentada como inevitável. No fundo, é sempre a mesma conta: querem engajar mais
investidores, querem cortar custo, querem chegar num número. A IA é o pretexto da vez. Quem paga a conta são as
pessoas mais embaixo na hierarquia. Nunca é o CEO que vai pra rua por ser incompetente na gestão da empresa. Quem
vai embora é o chão de fábrica porque alguém lá em cima errou a conta. Isso a gente vê em empresa de games, de
cinema, de tecnologia. Sempre foi assim. Depois dos inchaços da pandemia, quando as empresas contrataram demais,
uma hora os cortes viriam. O ciclo vai e volta. Vai continuar assim.

Um exemplo que me incomoda é quando cortam time de atendimento porque "automatizaram com chatbot". Quem já precisou
resolver um problema real com chatbot sabe o quanto é frustrante. As respostas são genéricas, o fluxo te joga em
círculos, e no final você quer falar com um ser humano que entenda o que você está dizendo. Vai no Reclame Aqui e
olha quantas reclamações são sobre atendimento que não leva pra nenhuma pessoa de verdade. As empresas automatizam
o atendimento, a satisfação cai, e aí precisam recontratar gente pra apagar o incêndio. É um tiro no pé. As
pessoas ainda preferem outras pessoas pra resolver problemas concretos. Isso não mudou.

Não estou dizendo que IA não muda o mercado de trabalho. Muda. Mas colocar responsabilidade individual em cima de
decisão estrutural de negócio é conveniente para quem toma a decisão, não para quem vai embora.

## Na prática, então

Eu uso IA para acelerar o que seria lento e repetitivo. Boilerplate, primeiros rascunhos, exploração rápida de uma
abordagem que eu ainda não conheço bem. Funciona bem nesses contextos porque eu valido o output e tenho contexto
suficiente para perceber quando algo está errado.

O que eu não faço, e não recomendo, é delegar raciocínio. Jogar um prompt e assumir que o resultado está certo
porque
pareceu razoável. Isso é o caminho mais rápido pro tipo de problema que só aparece em produção, às duas da
manhã, com
usuário impactado.

Quando alguma coisa der errado em produção, o modelo não vai ser chamado no PagerDuty. Você vai. A responsabilidade
pelo que foi entregue é sua, independente de quem escreveu o código. Isso era verdade quando você escrevia tudo
na mão
e continua sendo agora. O que mudou é que ficou tentador achar que, porque a IA parece segura, você pode diminuir a
atenção na revisão. É exatamente o contrário: quanto mais você delega a geração, mais crítico precisa ser
na validação.
O volume aumentou. A confiança costuma ser maior do que deveria.

Às vezes penso que no futuro vai existir um nicho parecido com o de cerveja artesanal. Fábricas de software
artesanal, pessoas criando sistemas do zero, com as próprias mãos, sem delegar pra modelo nenhum. Não é difícil
imaginar que esse mercado exista um dia.

## Para fechar

Quando a IA ficar cara, ou cair, ou os modelos mudarem de comportamento, e tudo isso já aconteceu em menor escala,
quem vai continuar funcionando é o engenheiro que não delegou o próprio raciocínio pra ferramenta. Que ainda sabe
entrar num sistema, ler o que está acontecendo e chegar numa conclusão sem precisar de um chat aberto ao lado.
Porque o dia que a Anthropic cair, que o ChatGPT ficar fora, que o rate limit estourar, você vai fazer o quê? Ficar
olhando a IDE esperando voltar?

Uso IA, gosto de usar, e vou continuar usando. Mas a ferramenta escreve código. O trabalho, de verdade, é entender
o problema, validar a solução e se responsabilizar pelo que vai pra produção. Isso a IA não faz por você.

Tem um argumento que ouvi outro dia: que antigamente a gente escrevia código pra humanos lerem, usava DDD, SOLID,
Clean Code, e que agora o paradigma mudou e o código é pra máquina ler. Entendi o raciocínio. Discordei. Se é
pra máquina ler, escreve em binário então. O fato de a IA conseguir navegar em código bem estruturado não é motivo
pra abandonar boas práticas, é mais um motivo pra manter. Quando a ferramenta mudar de comportamento, quando você
precisar de um humano pra entrar no sistema e entender o que está acontecendo, vai querer que o código esteja
legível. E se você acha que a nossa área está mudando porque agora não precisa mais de código, talvez você nunca
tenha entendido a área. Código sempre foi só uma parte dela.

Usa a ferramenta. Usa direito. Só não esquece que quando der errado, quem vão chamar na war room é você.
E o cartão de crédito debitado também vai ser o seu.
