---
layout: blog-post
date: 2026-04-30
permalink: /artigos/:categories/boas-praticas-de-vibe-coding
title: "Boas práticas de vibe coding: o que não dá pra deixar passar"
categories:
  - ia
tags:
  - ia
  - vibe-coding
  - arquitetura
  - qualidade
  - opiniao
image: /assets/images/posts/boas-praticas-de-vibe-coding.jpg
description: "A IA tirou a digitação do caminho e a gente ficou sem o gargalo que justificava metade do nosso dia. No lugar dele, sobrou o trabalho que a máquina não faz: decidir o que vai pra produção, segurar a régua de qualidade, apertar guardrail, ler o que o agente escreveu antes que vire dor de cabeça em runtime. Sobre vibe coding feito a sério e o papel de arquiteto que ninguém pediu, mas que a gente herdou."
---
No último artigo, fechei dizendo que a gente nunca escreveu código tão rápido quanto agora. Por
décadas, a digitação foi o gargalo principal do nosso ciclo de desenvolvimento, e a IA tirou ele
do meio do caminho.

Só que tirar um gargalo não faz o sistema fluir sozinho. Faz ele se mover.

E é isso que eu quero destrinchar agora. Pra onde foi parar o gargalo, o que isso muda no papel
que a gente exerce no time, e por que qualidade virou um problema mais nosso, não menos.

> [!IMPORTANT]
> Esse artigo é continuação direta de [Reflexões sobre o uso de IA no dia a dia do desenvolvimento
> de software](/artigos/ia/reflexoes-sobre-o-uso-de-ia-no-desenvolvimento). Se você ainda não leu,
> vale passar lá antes. Boa parte do contexto vem de lá, e aqui eu vou direto pro próximo nível
> da reflexão.

## O gargalo mudou de lado

Antes, a gente codava devagar. Refinamento, alinhamento, code review, oito horas escrevendo
função e PR ficando dois dias parado. O gargalo sempre foi humano, e nessa fase o maior era a implementação.

Hoje a IA escreve em segundos o que antes levava uma manhã. Faço uma especificação, mando o
agente rodar, volto vinte minutos depois com 600 linhas de código prontas e teste passando.
Bacana.

Só que o ritmo de saída não é mais o problema. O problema agora é validar o que saiu. Se a IA
entrega 10 mil linhas por dia num squad médio (e essa é a conta de padaria pra um time
vibecodando sério), nenhum ser humano revisa isso linha a linha. Não tem sênior no mundo que sustenta esse
ritmo de leitura, muito menos com a profundidade que um code review honesto exige. A entrega
acelerou cem vezes. A largura de banda de revisão continua a mesma de sempre.

E não estou só teorizando. Em abril a Vercel teve token de IA vazado por uma extensão de
navegador, e o atacante puxou variáveis de ambiente que devs marcaram como "não sensíveis"
por descuido. Em dezembro a AWS ficou treze horas fora porque um agente decidiu sozinho
"excluir e recriar" parte de um ambiente, sem nenhum humano pausando pra duvidar do comando.
Ano passado o Replit apagou o banco inteiro de um cliente. Casos diferentes, padrão igual:
a IA empurra pra produção numa velocidade que o nosso processo de validação nunca foi
desenhado pra absorver.

O gargalo só mudou de endereço. Antes morava nos nossos dedos, agora mora na nossa cabeça.

## Uncle Bob estava quase certo

O Uncle Bob soltou um rant que rodou na bolha dev: a era de escrever código manualmente
acabou, e o jeito de manter qualidade é construir muros rígidos em volta da IA com testes
apertados, mutation testing, análise estática implacável. Quem vibecoda diariamente sabe que
ele não está errado. Eu concordo com a direção, com o ferramental, e principalmente com a
tese central: o desenvolvedor virou orquestrador, e a qualidade tem que vir de fora do agente.

A parte do rant que faz mais sentido é justamente essa: se humano não dá conta de revisar dez
mil linhas linha a linha, a gente troca leitura por métrica. E existem várias formas de medir
saúde de código a frio. Complexidade ciclomática, tamanho de método, tamanho de classe, número
de dependências injetadas, acoplamento entre módulos, profundidade de herança. Cada uma dessas
métricas é um sinal de que a unidade tá em forma, e o conjunto pega muita coisa que escaparia
da revisão humana cansada. Antes da IA, refatorar pra manter essas réguas apertadas era caro
demais; hoje o agente refatora cinco mil linhas num punhado de minutos.

Só que métrica não é prova. Já rodei copilot review três, quatro vezes seguidas no mesmo PR de
IA, com instructions afiadas, mutation testing rodando no CI, complexidade ciclomática baixa,
métodos curtos, e mesmo assim passou bug de performance que só sênior pega em leitura humana.
Análise estática vê padrão. Mutation testing vê buraco de teste. Mas nenhum dos dois pega
aquele N+1 escondido num loop que parece inocente, ou a política de retry que vira tempestade
de chamada quando der falha real. Pra esse tipo, ainda precisa olho humano de quem já viu
produção quebrar de madrugada.

Resumindo: a IA codifica melhor, sim, mas isso só faz sentido se o humano continuar na equação
fazendo um trabalho diferente. Para de revisar linha. Passa a revisar risco, fronteira, ponto
onde decisão técnica importa de verdade: contrato entre módulos, autenticação, persistência,
performance crítica. O resto delega pro agente, com guardrail apertado em cima. Menos
digitação, mais julgamento. E julgamento ninguém terceirizou ~~ainda~~.

## A volta da torre de marfim

Lendo *O Mítico Homem-Mês* esses dias, me caiu a ficha. Livro do Brooks, de 1975, em que ele conta
a experiência dele construindo o IBM System/360. Lá já tinha arquitetura como time separado dos
implementadores. Não é que ele defenda esse formato, é que ele descreve a realidade da época: tem
quem desenha o sistema e tem quem codifica. Cinquenta anos depois, esse modelo persistiu na
indústria por décadas, e em algumas empresas ainda persiste hoje. Em algum momento, quando esse
modelo dá errado, ganhou o apelido pejorativo de "arquiteto da torre de marfim".

> [!NOTE]
> "Arquiteto da torre de marfim" é o apelido pra arquiteto que define como o sistema deve ser,
> escreve a especificação, manda pro time codar e some. Não valida implementação, não testa, não
> sente o bug aparecer em produção, não sente trade-off na vida real. Define no papel e tchau.

Eu sempre achei esse modelo ruim. Quem coda é quem sente o trade-off de verdade. É o engenheiro
de software que descobre, no meio da implementação, que aquela decisão arquitetural não fecha. É
ele que vê o bug aparecer em produção. Excluir o engenheiro da decisão arquitetural sempre me
pareceu uma escolha péssima. Não porque os arquitetos de torre estivessem sempre errados, mas
porque a melhor arquitetura nasce de discussão, não de especificação fechada.

Felizmente a área evoluiu. A maioria das empresas grandes que conheço hoje opera com squads
decidindo a própria arquitetura, tech lead e seniors no chão de fábrica. Time de arquitetura
virou mais um time de boas práticas e padrões transversais do que o cara que define como dois
serviços vão se falar. No PicPay, por exemplo, são centenas de devs distribuídos em dezenas de
squads. Não tem como um time central definir tudo nessa escala, a complexidade é grande demais.

Aí veio a IA. E adivinha pra onde o nosso papel se moveu?

A gente voltou pra torre de marfim. Só que dessa vez somos nós lá em cima.

## Dessa vez é diferente

Mas tem uma diferença importante. Os arquitetos da torre lá atrás não validavam implementação:
especificavam, faziam o handover e iam pra próxima reunião. Hoje, quando mando uma spec pro
agente, ainda sou eu que leio o que ele entregou, rodo os testes, fecho o PR e garanto que
aquilo faz o que tinha que fazer. Sou arquiteto e revisor ao mesmo tempo.

A gente sempre foi um pouco revisor, no fim das contas. Código que sai com nosso nome em cima
é nosso pra responder quando quebra em produção. A diferença é que antes a revisão era etapa
do processo. Hoje é o processo.

O agente virou o engenheiro de software, escrevendo no ritmo que nenhum humano sustenta. E nós?
Nós viramos o arquiteto: define a spec, mapeia trade-off, decide o que entra e o que fica de
fora. E no fim, ainda somos nós que validamos.

É um modelo bacana. Mais ágil, mais produtivo, com menos tempo queimado em boilerplate. Só que
essa nova posição vem com uma conta que poucos estão dizendo em voz alta nas empresas: o senso
crítico, a validação, a decisão de "isso aqui tá bom o suficiente pra ir pra produção", isso
tudo agora é integralmente nosso. Não dá pra delegar pro engenheiro IA, porque o engenheiro IA
não sabe quando parar.

Tem mais uma coisa que mexe com o sono. Quando subimos do Assembly pro C, do C pro PHP e similares, a gente subia uma camada de abstração mas continuava em controle. PHP não cai,
IDE não fica indisponível, compilador roda offline na sua máquina. Se a internet morresse
amanhã, dava pra continuar codando até o dia seguinte. Hoje a gente abstraiu pra cima de uma
ferramenta que, na maioria das vezes, não roda na sua máquina (~~pelo menos ainda~~), não é
determinística, depende de uma conta cobrada em dólar, e tem rate limit. Anthropic caiu em uns
dias do mês passado e times inteiros ficaram olhando a IDE. Copilot está restringindo plano.
Tem rumor (e algumas notícias) de que o custo do token vai subir, e empresas já estão limitando
acesso ou aumentando mensalidade. A bolha pode ou não estourar, mas o cenário "estourei o rate
limit, e agora?" já é real pra qualquer power user.

E não é só perder a ferramenta. É perder a ferramenta sem ter como continuar. Se um dev
acostumado a vibecodar oito horas por dia toma um 500 da LLM no meio da sprint e não souber
mexer no editor à mão na velocidade necessária, ele simplesmente para. Foi exatamente isso que
mudou em relação às camadas anteriores: não dá mais pra cair pro assembly se o compilador
falhar, porque o "compilador" agora é externo, cobrado e instável. A IA é serviço de
terceiro, e quem só sabe operar a IA fica refém. Por isso a gente continua tendo que saber
ler código, ler stack trace, debugar na unha quando precisa. Não é nostalgia: é continuidade
operacional. Sabe codar à mão é o seu plano B quando a ferramenta cai. E ela cai.

E essa nova era de spec driven development, de skills e de instructions versionadas no
projeto não vai retroceder tão cedo. As empresas já morderam a maçã. A gente não vai voltar a
digitar tudo na mão. Mas também não vai escapar da conta da qualidade.

## O código da IA não é determinístico

Tem um traço da IA que muda completamente como a gente revisa o que ela entrega: o código
gerado não é determinístico. Compilador é determinístico. Mesmo input, mesmo output, sempre.
PHP, C, Assembly, qualquer linguagem que a gente vinha empilhando há décadas, sempre operou
nesse contrato. Você manda compilar duas vezes o mesmo arquivo, sai idêntico. Esse contrato
fundamentou décadas de prática de engenharia: build reproduzível, CI confiável, "funciona na
minha máquina" só por bug de ambiente.

Com LLM, esse contrato sumiu. Você define uma spec dizendo exatamente o que quer, manda o
agente rodar dez vezes, e em duas ou três delas ele entrega coisas diferentes do que pediu.
Não porque a spec esteja ruim. Porque o modelo alucinou um método que não existe, ou porque o
contexto poluiu no meio da sessão e ele perdeu o fio, ou porque a temperatura do sampling
empurrou a próxima palavra pro lado errado. Não é bug do agente, é a natureza estatística de
como ele opera.

Isso muda a postura do supervisor. Não basta validar uma vez e seguir. A pergunta que eu
sempre faço hoje no review é "se eu rodar essa mesma tarefa de novo, vai sair igual?". Quase
nunca vai. Por isso teste forte vira proteção mínima: não pra pegar o bug óbvio, mas pra
pegar a deriva entre execuções aparentemente equivalentes. O determinismo nós garantimos na
saída, com asserts apertados em cima do que a IA produziu, porque dentro do agente ele não
existe mais.

## Vibe coding, na real

O termo "vibe coding" hoje carrega um peso meio pejorativo. Virou sinônimo de "cara que aceita
qualquer coisa que o agente cospe e dá deploy". Tem razão de ser. Muito SaaS vibecodado entrando
em produção sem revisão, sem teste, sem nenhuma camada de segurança. Justifica o desconforto.

Só que se a gente tirar o ranço do termo, vibe coding na essência é exatamente o ciclo que
descrevi nas seções acima: o desenvolvedor no papel de arquiteto, especificando o que precisa
ser feito, mapeando os trade-offs, entregando pro modelo executar e validando o resultado. Se a
gente leva a sério, vibe coding é só o nome da prática nova. Se a gente leva mal, vibe coding é
a piada que ele virou.

A diferença entre os dois lados é qualidade. E qualidade num projeto vibecodado não nasce do
agente. Nasce de quem opera o agente.

## O beabá que vibe code costuma esquecer

Antes de qualquer técnica nova, vale lembrar do óbvio. Projeto que vai pra produção precisa de
observabilidade, feature flags, alertas, camada de auditoria. Coisas que todo sistema sério
deveria ter desde sempre, vibecodado ou não.

Acontece que muito projeto vibecodado pula esse beabá. O agente entrega o feature, o teste
passa no caminho feliz, e o que falta nem aparece no PR. Sem flag pra desligar a função se der
ruim. Alerta de erro? No máximo um log no stdout. Trilha pra entender depois quem fez o quê?
Nem isso. Tudo funciona, até o dia que não funciona.

Observabilidade hoje, com IA escrevendo, virou mais importante, não menos. Quando o agente
modifica três arquivos pra implementar uma feature simples e sem te avisar mexe num quarto
arquivo de config porque "fazia sentido", a única forma de pegar o impacto disso em produção é
ter trace, métrica e log que te avisem antes do cliente. Logging estruturado, span por
operação crítica, dashboard com latência por endpoint, alerta em desvio de baseline. Não é
luxo de empresa grande: é o mínimo pra dormir tranquilo num projeto que tem agente
empurrando código todo dia.

E aí a conta vem grande. Porque a velocidade que a IA imprime na entrega não te ajuda em nada
quando o cliente está reclamando, o stack trace está cifrado e você precisaria de uma feature
flag que nunca foi criada.

O piso é esse. Antes de pensar em qualquer técnica nova, garanta que o projeto vibecodado tem
o mesmo nível de observabilidade, segurança e auditoria que você exigiria de qualquer outro
sistema seu. Se não tem, esse é o primeiro buraco a tampar. A IA não vai providenciar isso por
você.

## CLAUDE.md, skills e instructions são o piso, não o teto

A primeira coisa que todo mundo aprende quando começa a vibecodar pra valer é que precisa
documentar o projeto pra LLM. Um CLAUDE.md bem feito, um copilot-instructions.md descrevendo o
padrão, skills versionadas no repositório, instructions segmentadas por pasta quando faz
sentido. Sem isso, a IA inventa convenção a cada sessão e o projeto vira uma colcha de
retalhos.

Faz, e faz bem. Uma boa estrutura de instructions melhora absurdamente a qualidade do que sai
do agente, principalmente em code review. Já vi a diferença entre um projeto sem CLAUDE.md e
o mesmo projeto com guidelines bem escritas, e o salto é da ordem de noite e dia.

Mas para por aqui. Esses arquivos são o piso, não o teto. Eles ensinam o agente a respeitar o
seu padrão, mas não garantem que o que ele escreveu está certo. Pra isso, ainda é você quem
tem que olhar. Markdown não substitui review.

## Pare de economizar no modelo

Por muito tempo a moda foi planejar com um modelo grande e executar com um menor. A lógica era
boa no papel: o modelo grande pensa, o modelo barato executa, você economiza token. Faz
sentido.

Só que na prática isso vem perdendo a graça. O [Akita rodou um benchmark recente](https://akitaonrails.com/2026/04/25/llm-benchmarks-vale-a-pena-misturar-2-modelos/) testando justamente essa combinação em várias rodadas, e
o resultado é desconfortável pra quem defende multi-agente: o modelo bom rodando sozinho
entrega num tempo e qualidade que nenhuma combinação "caro pra planejar, barato pra executar"
consegue bater simultaneamente. As variantes mistas perdem alguns pontos de qualidade, gastam
mais tempo, e quando você soma o custo escondido do orquestrador, a conta total chega a
triplicar. Três vezes mais caro pra entregar um pouco menos.

E isso tudo sem nem entrar no risco de o modelo menor alucinar uma decisão que vai custar caro pra
desfazer. Janela de contexto menor, raciocínio mais raso, mais tendência a inventar API que
não existe. Tudo isso vira bug que o modelo grande teria evitado por default. Em assinatura
mensal, a conta multi-agente fica ainda pior: o custo marginal de uma chamada extra do modelo
bom é zero até saturar a quota. Coordenar dois modelos pra economizar token nesse cenário é
otimização contra um custo que nem está sendo cobrado.

A regra que tenho seguido é simples. Codificação é onde o modelo bom rende mais. Pra outras
coisas, modelo barato é ótimo, manda ver. Mas no código, no plano, na arquitetura, paga o
modelo bom. O trade-off é melhor.

## Planejar é mais barato que recodificar

Uma das coisas que mais me ajudou no fluxo de vibe coding foi tratar o plano como artefato de
primeira classe. Antes de mandar o agente codar, eu peço pra ele propor um plano em markdown.
Leio, ajusto, discuto, e só depois autorizo a execução.

Pode parecer burocracia, mas é o oposto. Mudar três linhas de um plano custa
segundos. Mudar três arquivos de código gerado custa minutos, e às vezes muito mais. Se o
plano nasce errado e você só percebe depois do código pronto, você paga duas vezes: uma pra
gerar o errado, outra pra corrigir.

Tem várias abordagens estruturadas no ar pra isso. Spec Driven Development com Spec Kit,
Superpowers, e variantes. A ideia central de todas é a mesma: fase de spec, fase de plano,
fase de tarefas, fase de implementação, com humano validando entre cada uma. No papel, é
lindo. Na prática, é muita etapa. SDD by the book em projeto pequeno vira processo pesado que
te empurra pra escrever especificação detalhada de uma tarefa de duas horas. Eu não consigo
seguir tudo, e nem acho que devesse. É como Scrum: ninguém usa by the book, todo mundo pega o
que funciona pro time e ignora o resto.

Eu uso o que cabe. Spec curta quando a feature toca várias partes do sistema, plano em
markdown sempre, breakdown em tarefas só quando o escopo é grande o bastante pra justificar.
Pra patch e ajuste pequeno, plano de uma frase no próprio prompt já basta. O importante não é
o ritual; é a separação entre "o que vamos construir" e "vamos construir". Plano errado é só
texto. Código errado já é commit.

## Os guardrails que você precisa apertar

Se a IA escreve dez mil linhas por dia e o humano não consegue revisar tudo, a única saída é
empurrar a barreira de qualidade pra automação. Os guardrails que antes eram bom-ter, hoje
são obrigatórios. E os limites que antes pareciam exigentes demais, hoje são razoáveis.

Teste sempre foi caro de escrever à mão. Você gastava a manhã inteira cobrindo um service.
Hoje a IA escreve teste em minutos, e cobertura acima de 90% deixou de ser luxo de projeto
maduro pra virar linha de partida. Mas tem um detalhe que a galera demora a perceber: a IA é
mestre em escrever teste que parece teste e não testa nada. Aquele clássico `assertTrue` no
fim do método sem validar estado, ou o teste que mocka tudo e só verifica se o método foi
invocado. Cobertura sobe, qualidade fica igual.

A correção pra esse buraco é mutation testing. A ferramenta muda operadores no código (troca
`>` por `>=`, inverte boolean, muda constante) e checa se algum teste quebra. Se a mutação
sobreviveu, o teste é decorativo. Mutation score acima de 90% combinado com cobertura acima
de 90% pega o que cada um sozinho deixa passar. Antes era inviável manter; agora é uma noite
com o agente rodando.

E tem a régua da análise estática, que precisa ser apertada também. O Akita argumenta bem em
[Clean Code pra Agentes de IA](https://akitaonrails.com/2026/04/20/clean-code-para-agentes-de-ia/)
que as regras tradicionais do Uncle Bob viraram exigência técnica na era dos agentes: função
entre 4 e 20 linhas, classe abaixo de 200, nome único e grepável, arquivo curto que cabe numa
única leitura. Não é estética, é o que faz o agente raciocinar sobre a unidade inteira sem
perder atenção. Antigamente a régua era método de até 50 linhas, classe de até 500, no máximo
7 ou 8 dependências, e isso já parecia rigoroso. Refatorar pra padrão mais exigente custava
tempo de dev. Hoje não custa. A IA absorve a regra apertada e produz componente mais isolado,
com responsabilidade mais clara, sem chorar do esforço. Vale apertar.

Por fim, regressão automatizada virou crítica de outra forma. A IA frequentemente mexe em
arquivo que ninguém pediu pra ela mexer. Você pede pra ajustar uma função, ela ajusta e de
quebra renomeia variável noutro módulo, ou troca uma config "porque tava inconsistente". Sem
teste de regressão forte, você só descobre o efeito colateral em produção. Com teste forte,
o CI grita antes do merge. E sim, tem o caso da IA que altera o teste junto com o código pra
fazer ele passar; pra esse, code review humano segue sendo a defesa, e bloquear PR que mexe
em teste e código no mesmo commit sem justificativa ajuda também.

## QA manual não escala

Com testes unitários e de regressão na pipeline, sobra o end-to-end. E aqui aparece um
gargalo novo. Se o squad sobe dez mil linhas de código por dia, ninguém em QA manual consegue
validar feature por feature em tempo hábil. Em pouco tempo, o time de QA vira o gargalo que a
gente tinha tirado da digitação.

A saída é a mesma que a gente aplicou no resto: automatizar. Teste end-to-end automatizado,
preferencialmente rodando em ambiente parecido com produção, com dados sintéticos próximos
do real, cobrindo os fluxos críticos do sistema. Não dá pra cobrir tudo nesse nível, e nem
deveria. Mas os caminhos que tocam dinheiro, autenticação, criação de conta, exclusão de
dado, esses pedem cobertura E2E automatizada. Porque cada feature que sobe sem teste E2E é
uma roleta russa que o cliente vai puxar antes de você.

Eu ainda acredito que QA manual continua valendo num momento específico:
exploratório de feature nova, antes da automação ficar pronta. Mas pra regressão diária, pra
gate de release, pra validação de "essa feature ainda funciona depois da última centena de
PRs vibecodados", QA manual não escala. Automatiza, ou aceita o risco. Não tem terceira opção.

## Code review por decisão, não por linha

Falei lá em cima que mesmo com guardrails apertados ainda passa bug que só sênior pega. Isso
significa que code review humano não saiu da equação. Ficou mais importante, e o jeito de
fazer mudou.

Antes a gente revisava 200, 500 linhas no PR e isso já cansava. Hoje recebe PR de 2 mil,
3 mil linhas com regularidade, e o revisor é a mesma pessoa cansada. O cérebro não escala na
mesma velocidade da IA.

Por isso o jeito de revisar mudou. Não dá mais pra ler tudo, tem que
priorizar. Olha as fronteiras: entrada, saída, contrato. Olha os pontos de risco,
principalmente autenticação, persistência e chamada externa. E olha as mudanças não-óbvias,
tipo aquele arquivo que a IA mexeu sem você pedir. O resto, confia no guardrail automatizado.

Esse jeito novo de revisar é desconfortável no começo. Tem dia que eu mergeio um PR sem ter
lido cada linha, e o estranhamento bate. Mas é o único caminho viável quando o volume é o
que é. O que precisa ser excelente é o conjunto: testes apertados, mutation testing alto,
análise estática rígida, observabilidade afiada, e code review humano focado nos pontos onde
máquina não decide bem. É menos linha por linha, mais decisão por decisão.

## O overengineer crônico

Esse aqui é o ponto que mais me pegou de surpresa quando comecei a vibecodar pra valer. LLM
foi treinada pra responder. Pra ser positiva, pra trazer sugestão, pra nunca te deixar na mão
dizendo "não tenho mais o que falar". O efeito colateral é que ela nunca chega num "tá bom
assim". Você pede pra revisar o plano atrás de melhoria, ela acha alguma. Pede de novo, acha
mais. Pede cinquenta vezes, ela ainda vai achar.

Os primeiros planos que eu escrevia ano passado começavam com 200 linhas e terminavam com
1200, sem que o escopo da feature tivesse mudado um milímetro. Era um loop. Eu pedia revisão
de segurança, depois de gargalo de performance, depois de simplicidade, e tudo que eu jogava
pra ela analisar, ela achava forma de melhorar. Sempre tem o que melhorar quando você dá margem
pra LLM melhorar. E o plano vira um Frankenstein que ninguém consegue mais executar.

A solução não é mística. É lembrar que o agente não tem critério de parada, mas você tem.
Você define a fronteira do escopo. Você define quais critérios de aceite são suficientes pra
essa entrega. Você decide quando o plano está bom o bastante pra virar código, e quando o
código está bom o bastante pra virar PR.

Isso vale tanto pro plano quanto pra implementação. Dá pra fazer overengineer no plano (loop
de melhorias infinitas) ou no código (refatoração que nunca termina porque a IA sempre acha
mais uma camada de abstração). Os dois custam o mesmo: o seu tempo, o seu token, e um produto
que não fecha. O agente sempre tem mais. Você decide quando chega.

## Bugs que a IA gera com frequência

Tem uma parte da prática que ainda estou costurando, mas vale registrar. Mesmo com
instructions boas, plano bem feito e modelo certo, a IA ainda gera certos bugs com uma
regularidade que assusta. N+1 em loops com query individual, race condition em sequências
assíncronas, memory leak em cache sem TTL. São três padrões que reaparecem em projetos
diferentes, com stacks diferentes, e que revisão visual não pega na velocidade que a gente
revisa hoje. Em ambiente de dev tudo funciona, e a conta só aparece em produção.

Pra cada um deles, novas ~~ou às vezes nem tanto~~ técnicas viraram cada vez mais
necessárias. N+1 morre com contador de queries por request virando assertion explícita no
teste ("essa rota faz no máximo X queries"), e o clássico loop que consulta dentro do for
quebra antes do PR fechar. Race condition pede property-based testing repetindo o cenário
centenas de vezes com ordem variada, e em fluxo crítico (dinheiro, autenticação) teste de
integração com N requests simultâneas checando o invariante depois: saldo bate, contagem não
duplica. Memory leak aparece em load test rápido com profiler observando o heap, curva
subindo sem estabilizar é referência presa. Não pega tudo, mas pega o caso comum.

Vi parte desses argumentos bem desenvolvidos num vídeo recente do [Lucas
Montano](https://www.youtube.com/watch?v=T9V7EyB_B9w), que vale assistir pra ver o detalhe técnico
e adaptar pra sua stack. O ponto que importa pro fluxo é entender que a IA tem padrões de
erro previsíveis. E os melhores guardrails são os que pegam esses padrões cedo,
automaticamente, sem depender da gente lembrar de procurar. Erro recorrente pede automação.

## Fechando

A IA mudou o gargalo do nosso ciclo de desenvolvimento, mas não cancelou nada. O beabá de
produção, código que faz sentido, review antes de subir. Tudo isso continua valendo igual.

A diferença é que agora você está sentado na cadeira do arquiteto. A IA digita rápido, mas
qualidade não vem embutida com ela. Vem do que você fez antes do agente abrir o editor: a
spec, o plano, os guardrails, a escolha do modelo. Trabalho seu, decisão sua.

Se for pra resumir o que esse papel novo exige no dia a dia, é mais ou menos isso. Antes do
agente abrir o editor, paga o modelo bom, escreve uma spec curta quando o escopo pedir, monta
um plano em markdown, deixa as instructions e skills afiadas. Enquanto ele coda, deixa a régua
apertada por automação: cobertura alta, mutation testing pra testar o teste, análise estática
exigente com método curto e classe pequena, regressão e E2E cobrindo o que toca dinheiro e
segurança. Depois que o código sai, code review humano focado em fronteira e risco, e
observabilidade afiada pra pegar o que escapou de tudo isso. E em nenhum momento o agente
roda sozinho sem alguém supervisionando.

> [!TIP]
> Vibe coding bem feito é o desenvolvedor sentado na cadeira do arquiteto. Vibe coding mal
> feito é o desenvolvedor sentado na plateia, esperando o agente terminar.

Porque o gargalo não sumiu. Ele só mudou de endereço.
