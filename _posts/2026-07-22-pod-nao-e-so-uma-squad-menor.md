---
layout: blog-post
date: 2026-07-22
permalink: /artigos/:categories/pod-nao-e-so-uma-squad-menor
title: De squad para pod? Por que isso não é apenas um time menor
categories:
  - cultura
tags:
  - pods
  - engenharia-de-software
  - autonomia
  - foco
  - ia
image: /assets/images/posts/de-squad-para-pod.jpg
description: >
  Agentes de IA aceleraram a execução em muitos contextos, mas até pouco tempo eu ainda
  organizava iniciativas em épicos, refinamentos, estimativas e sprints. Ao testar pods,
  comecei a questionar quanto desse processo ainda ajuda e quanto virou custo de coordenação.
---

A indústria de software tem uma habilidade curiosa para pegar ideias antigas, trocar o nome e vendê-las como a próxima
grande mudança. Muda o diagrama, entra um termo em inglês e, em pouco tempo, aparecem palestras, consultorias e gente
explicando que o futuro chegou. Minha reação inicial costuma ser desconfiar, não necessariamente porque a ideia é ruim,
mas porque a distância entre uma prática útil e uma onda de mercado pode ser bem pequena. Foi assim quando comecei a
ouvir mais sobre pods como modelo para organizar o trabalho de engenharia.

Quando falo em pod aqui, estou falando de uma pessoa ou de um grupo pequeno reunido em torno de uma missão bem
delimitada, com contexto, capacidade e autonomia para levá-la até um resultado. Não é uma definição universal, e parte
do problema está justamente aí. Ainda assim, dar nome a uma prática aumenta sua visibilidade, ajuda a comparar
experiências e abre espaço para discutir um problema que já estava ali. O marketing pode exagerar a novidade e, ao mesmo
tempo, iluminar algo que vale testar.

Pods não são uma descoberta recente, mas também não são apenas uma palavra vazia. O assunto ficou mais interessante
porque agentes de IA mudaram o custo de executar software. Em alguns contextos, essa formação consegue manter mais
contexto e levar uma missão muito mais longe do que conseguia há poucos anos. Isso não transforma pod em solução mágica,
mas deixa uma pergunta: se produzir código ficou mais rápido, ainda faz sentido organizar toda iniciativa como se cada
pedaço precisasse passar por várias pessoas, cerimônias e filas antes de virar uma entrega?

Planejamento, refinamento, estimativas e sprints não apareceram por acaso. Eles ajudam a distribuir contexto, reduzir
incerteza e organizar capacidade. Só que a relação de custo mudou. Quando uma implementação levava semanas, gastar dias
preparando e dividindo o trabalho podia ser razoável. Se um agente consegue executar boa parte dela em horas ou dias, o
fluxo pode se inverter: o time demora mais para entender, repartir, estimar e encaixar a iniciativa numa sprint do que
para implementá-la. A pergunta não é se devemos abandonar o planejamento, mas se todo problema ainda precisa percorrer o
mesmo caminho.

> [!IMPORTANT]
> Eu também não cheguei nessa discussão olhando de fora. Até pouco tempo, organizava o trabalho exatamente nesse fluxo.
> O problema virava épico, passava por entendimento, refinamento, estimativa e sprint antes de chegar à execução.
> Conforme fui estudando pods e percebendo na prática a velocidade que os agentes trouxeram para o desenvolvimento,
> começamos a testar pods em missões menores, temporárias e mais focadas. A experiência ainda é recente. Estamos
> entendendo onde esse modelo ajuda e onde apenas troca um problema por outro. Este texto nasceu das reflexões e dos
> trade-offs que apareceram durante esse teste.

## O mercado chama coisas diferentes de pod

O mercado usa a palavra de vários jeitos. Pod pode ser sinônimo de time, uma subunidade dentro de uma equipe maior, um
grupo multidisciplinar ou uma formação temporária para resolver uma missão específica. A palavra sozinha não diz quase
nada, e esse problema não começou agora. Em 2019,
uma [análise da TechTarget sobre squads, pods e células](https://www.techtarget.com/searchcio/tip/Squads-pods-cells-Making-sense-of-Agile-teams)
já mostrava a quantidade de nomes usados para organizar grupos de tecnologia. O texto cita uma definição de pod como
time multifuncional e multidisciplinar, mas também alerta para empresas que apenas renomeiam a estrutura existente.

Neste artigo, uso pod num sentido mais específico: uma formação tática e temporária criada para resolver um problema
delimitado, com capacidade reservada, autonomia, resultado esperado e critério de saída. Quando a missão termina, as
pessoas voltam para a squad e o artefato segue para quem vai sustentá-lo. A squad cumpre outro papel. Ela é a estrutura
permanente que acumula contexto sobre um domínio e continua responsável por suporte, incidentes e evolução. Por isso, pod não é apenas
uma squad menor. Se o mesmo grupo permanece indefinidamente cuidando dos mesmos sistemas ou produto, estamos falando de
uma squad, ainda que a empresa prefira outro nome.

Algumas ideias próximas aparecem em outros modelos, mesmo sem usar a palavra
pod. [Team Topologies](https://martinfowler.com/bliki/TeamTopologies.html) trata de times alinhados a fluxo, carga
cognitiva e modos temporários de
colaboração. [Dynamic Reteaming](https://agilealliance.org/resources/experience-reports/dynamic-reteaming-how-we-thrive-by-rebuilding-teams/)
questiona o dogma de que a composição dos times precisa permanecer intocável para sempre. Esses modelos não definem pod,
mas ajudam a entender por que grupos menores, fronteiras claras e formações adaptáveis continuam reaparecendo.

Até o Agile tem uma história parecida.
O [Manifesto Ágil foi publicado em 2001](https://agilemanifesto.org/history.html), reunindo métodos e práticas que já
vinham sendo desenvolvidos antes. A indústria não começou a trabalhar de forma ágil nos anos 1990. Ela já experimentava
abordagens que, depois, ganharam um nome comum e mais alcance.

Com pod acontece algo semelhante. O nome atual junta práticas que já existiam em projetos, grupos de especialistas,
forças-tarefa e equipes pequenas. Eu mesmo já vi especialistas saírem do fluxo normal por uma ou duas semanas,
resolverem um problema específico e depois voltarem aos seus times. Na época, ninguém chamava isso de pod, embora a
missão curta, o contexto concentrado e a volta para o time já estivessem ali.

Em 2026,
o [Wall Street Journal](https://www.wsj.com/cio-journal/your-work-team-is-now-a-pod-and-your-co-workers-are-ai-agents-f51994f5)
descreveu pods formados por poucos humanos e agentes como uma tendência de mercado.
O [Business Insider](https://www.businessinsider.com/metas-reality-labs-shifts-to-ai-native-pods-efficiency-2026-3)
noticiou o uso do termo em uma reorganização na Meta. São sinais de que a palavra ganhou força, não provas de que o
modelo funciona em qualquer lugar. O que trouxe o assunto de volta, mais do que o nome, foi a quantidade de trabalho que
os agentes passaram a colocar nas mãos de uma pessoa.

## O código ficou mais barato. O software não

Agentes de IA conseguem pesquisar uma base, propor um plano, alterar dezenas de arquivos, escrever testes e abrir um
conjunto de mudanças pronto para revisão. Isso não acontece com a mesma qualidade em todo problema ou repositório. Mesmo
assim, em muitos fluxos, gerar a primeira versão do código ficou mais rápido e barato. Eu já escrevi sobre essa mudança nas
minhas [reflexões sobre o uso de IA no desenvolvimento](/artigos/ia/reflexoes-sobre-o-uso-de-ia-no-desenvolvimento) e
também sobre os cuidados de [vibe coding com responsabilidade](/artigos/ia/boas-praticas-de-vibe-coding). Não vou
repetir toda a discussão aqui. O ponto para este artigo é outro: quando a capacidade de escrever código cresce, o
restante do sistema de trabalho começa a aparecer com mais nitidez.

Entender o problema e decidir o que não fazer continuam custando tempo, assim como testar, revisar, integrar, observar em
produção e assumir o impacto de uma escolha continuam exigindo julgamento. Às vezes, o código nem era o principal
gargalo antes; em outros casos, era e deixou de ser. A própria OpenAI descreve agentes como responsáveis pela primeira
passagem de implementação, enquanto pessoas mantêm a
responsabilidade por arquitetura, segurança, risco de migração e manutenção no longo prazo. O guia usa uma ideia
simples: [delegar, revisar e continuar dono do resultado](https://developers.openai.com/codex/guides/build-ai-native-engineering-team).
A Anthropic relata uma mudança parecida na sua organização: automação para estilo, bugs e testes, com revisão humana
onde o conhecimento de domínio importa, além
de [autonomia para pequenos pods adaptarem o próprio processo](https://claude.com/blog/running-an-ai-native-engineering-org).

Esses relatos não provam que toda empresa deveria copiar o modelo. Eles mostram que a fronteira do trabalho está
mudando. A pessoa deixa de gastar toda a energia digitando a implementação e passa a gastar mais energia dirigindo,
avaliando e corrigindo a execução. Esse deslocamento ajuda a explicar por que pods voltaram à conversa. Se uma pessoa
consegue executar mais partes de uma missão, talvez a organização não precise fragmentar tanto o caminho até o resultado.
Código mais barato não torna software barato; ele desloca o custo para contexto, decisão, validação e responsabilidade.

## Quando a coordenação vira a maior entrega

Existe um fluxo bastante conhecido em empresas de software. Uma iniciativa nasce, vira um épico e depois é quebrada em
muitas tarefas. O time faz entendimento, refinamento, estimativa e planejamento, as tarefas entram em sprints diferentes
e várias pessoas começam partes relacionadas em PRs paralelos. Cada etapa tem uma razão: quebrar trabalho reduz
incerteza, refinar distribui contexto, estimar ajuda a discutir capacidade e revisar protege a base. O problema começa
quando o processo inteiro é aplicado por padrão, mesmo quando custa mais do que a complexidade da entrega exige.

Uma pessoa altera a API enquanto outra prepara o banco e uma terceira faz a interface. Elas precisam combinar contratos,
esperar decisões e resolver conflitos, além de participar de outras frentes, atender mensagens, entrar em reuniões e
trocar de repositório várias vezes no mesmo dia. No fim, a iniciativa ganhou vinte tarefas, quatro responsáveis, três
sprints, vários PRs e uma quantidade respeitável de status. Talvez tenha ganhado clareza. Talvez só tenha transformado
execução em coordenação.

Não estou atacando Scrum, planejamento ou trabalho coletivo. O problema não é uma cerimônia existir. O problema é ela
virar pedágio. Se uma conversa ajuda a descobrir risco ou alinhar uma decisão difícil, ela tem valor. Se reúne oito
pessoas para acompanhar tarefas que já estão visíveis, provavelmente virou hábito. A IA deixa esse desperdício mais
aparente porque um agente pode terminar uma parte em minutos e ficar esperando a próxima informação. A pessoa poderia
seguir adiante, mas a tarefa depende de outra fila: a geração de código acelerou, enquanto as filas continuaram no mesmo
lugar.

## Uma pessoa, uma missão e vários agentes

Imagine uma pessoa que entende o problema junto com produto e engenharia. Ela conhece o domínio, conversa com os
especialistas necessários e desenha uma direção. Depois, em vez de distribuir cada parte para alguém, abre três ou
quatro sessões de um agente de código: uma mexe na API, outra prepara os testes, uma terceira ajusta a interface e talvez
uma quarta investigue uma migração ou atualize a documentação. A pessoa acompanha os planos, responde dúvidas, compara
as mudanças e integra o resultado.

A pessoa continua conduzindo o trabalho, mas agora consegue paralelizar partes mecânicas sem distribuir o contexto entre
quatro engenheiros. Isso não significa que ela substituiu quatro pessoas, apenas que a divisão do trabalho pode ser
diferente. O ganho aparece porque há menos tradução: quem entendeu o problema continua perto das decisões, quem discutiu
o contrato vê a implementação e ninguém precisa reconstruir o raciocínio a cada tarefa ou explicar novamente por que
uma escolha foi feita.

Só que concentrar contexto também concentra risco. Se só uma pessoa acompanha tudo, o conhecimento pode ficar
centralizado. Ela pode aceitar uma solução ruim porque está cansada, confiar demais no agente ou simplesmente deixar
passar algo. Quanto mais código é produzido, maior pode ser o volume que precisa de validação. Existe ainda um risco que
não aparece olhando cada entrega separada: uma sessão pode acertar a API, outra os testes e outra a interface, enquanto o
conjunto continua errado. Nenhuma delas protege, sozinha, o objetivo do sistema inteiro, então alguém precisa manter
essa visão de ponta a ponta.

Também existe uma questão de senioridade. Autonomia não surge ao entregar um problema complexo para alguém sem
repertório e desejar boa sorte. Pessoas menos experientes precisam de missões compatíveis, mentoria e espaço para
discutir decisões. Caso contrário, o pod vira uma forma elegante de abandono.

Ser responsável pela missão não significa decidir tudo sozinho, mas garantir que as conversas certas aconteçam e que o
resultado chegue ao fim. Uma pessoa pode chamar especialistas, revisar arquitetura com o time e pedir uma segunda
leitura. O que muda é o
ownership da execução. Em vez de esperar que o processo mova a iniciativa, alguém assume a responsabilidade de fazê-la
andar. A composição também não precisa ficar congelada durante toda a missão. Três pessoas podem ser necessárias para entender
o problema e discutir arquitetura. Quando o caminho estiver claro, uma delas pode tocar a execução com agentes. Se o
risco aumentar, chama mais gente de volta. O tamanho responde ao problema, não ao nome do modelo.

## Foco não aparece por decreto

Nos primeiros dias desse teste, grupos pequenos ficaram concentrados em um único problema. O que eu mais ouvi foi que o
trabalho finalmente andava porque ninguém precisava parar a cada mensagem ou reunião. Isso é uma percepção qualitativa,
não uma métrica de produtividade, mas aponta para um problema conhecido.
A gente fala que uma demanda é prioritária, mas mantém a pessoa em cinco canais, três cerimônias, chamados, suporte e
incidentes. Depois pergunta por que a entrega não andou.

Foco exige proteção. Se alguém está em uma missão tática, outra parte da organização precisa absorver o trabalho que
continua chegando. Chamados não desaparecem. Incidentes não respeitam o planejamento. Clientes internos continuam
pedindo ajuda e sistemas em produção continuam precisando de sustentação. Essa conta não fecha só tirando a pessoa da
daily. É preciso decidir quem cobre a operação, por quanto tempo e com qual
capacidade. Se todo mundo estiver em pod, ninguém estará cuidando do que já existe. Se sempre as mesmas pessoas ficarem
na sustentação, o foco de alguns será pago com a sobrecarga de outros.

Foco também tem custo de oportunidade. Proteger uma missão reduz a capacidade disponível para as demais. Quando uma nova
prioridade entra, alguma coisa precisa sair, perder escopo ou mudar de data. Chamar tudo de urgente apenas devolve a
fragmentação com outro nome.

## Autonomia não é ausência de gestão

O segundo pilar é autonomia. Para mim, ela significa que o pod pode decidir o caminho até o resultado. Não faz sentido
micro gerenciar a quantidade de tarefas, o tamanho de cada PR, a distribuição diária do trabalho ou uma sequência fixa de
cerimônias se isso não reduz risco. Esse tipo de autonomia muda o papel da gestão. Em vez de acompanhar cada tarefa, a
gestão passa a cuidar do contexto,
dos bloqueios, da capacidade e do resultado combinado. Ela continua existindo, mas interfere menos no caminho escolhido
pelo pod.

Existe uma leitura ruim dessa ideia: entregar um prazo agressivo, retirar apoio e chamar a pressão de autonomia. Isso
não tem nada de moderno, pois apenas responsabiliza alguém por uma decisão que ela não pôde tomar. Autonomia real inclui
poder discutir escopo, chamar ajuda, expor incerteza e discordar do caminho, além de ter acesso
ao contexto necessário. Uma pessoa não deveria descobrir uma dependência crítica depois de semanas porque a informação
estava presa em outra área. Na prática, menos cerimônia não significa silêncio. Um pod pode ter uma conversa curta para
validar arquitetura, pedir
uma revisão ou mostrar uma evidência em ambiente de teste. O ritual só vale quando reduz uma incerteza relevante agora.

## Os limites são qualidade, segurança e visibilidade

Autonomia sem limite vira caixa-preta. Eu tenho usado três restrições para pensar no modelo: qualidade, segurança e
visibilidade. Elas não dizem como executar cada tarefa, mas deixam claro o que não pode ser terceirizado para o
entusiasmo com velocidade. Qualidade começa antes do code review, com testes, análise estática, linters, limites de
complexidade e convenções executáveis que funcionam como guardrails. Se agentes conseguem gerar muito mais código,
depender apenas de uma leitura humana linha
por linha deixa de escalar. Isso não elimina a revisão. Obriga a gente a escolher melhor onde o olhar humano é
indispensável.

Segurança exige o mesmo cuidado. Permissões, dados sensíveis, concorrência, idempotência, migrações e comportamento em
falha não podem ser detalhes descobertos depois. Quanto maior o risco da mudança, menor deve ser a liberdade para um
fluxo totalmente independente. Há missões que pedem revisão especializada, aprovação formal e validação mais lenta. Tudo
bem. Velocidade não merece prioridade automática.

Visibilidade evita que autonomia vire sumiço. O pod não precisa produzir uma apresentação semanal cheia de caixas
verdes. Precisa deixar problema, decisões, estado atual, riscos e próximos passos compreensíveis. Uma nota curta, um
desenho atualizado, evidências em QA e um PR bem explicado muitas vezes resolvem. O formato importa menos do que ter um
lugar consultável. Se plano, decisões e evidências estão espalhados entre mensagens
privadas, reuniões e a memória de uma pessoa, o restante do time continua sem contexto. Autonomia precisa deixar um
rastro que outra pessoa consiga seguir. O problema não é uma missão levar um mês, mas passar um mês sem ninguém entender
o que está sendo decidido, validado ou bloqueado.

Esses limites preservam a responsabilidade humana porque o agente pode escrever testes ruins que passam, escolher uma
abstração elegante e inadequada ou repetir um erro em vários arquivos com uma consistência impressionante. A pessoa
continua responsável por entender o impacto e decidir se aquilo deve chegar à produção.

## O pod termina. O domínio continua

Aqui está a distinção que mais importa para mim. Um pod tático existe para cumprir uma missão temporária. Uma squad ou
time de domínio existe para sustentar uma responsabilidade no longo prazo. Se um grupo cuida continuamente dos mesmos
sistemas, atende incidentes, evolui o produto e mantém conhecimento, ele é um time permanente. Isso não diminui o valor
de construir [times de alta performance](/artigos/cultura/times-de-alta-performance); pelo contrário, é o time
permanente que acumula relações, repertório e responsabilidade suficientes para emprestar pessoas a missões curtas sem
perder completamente o chão.

O pod tático deveria nascer com um problema claro, um resultado esperado, capacidade reservada, uma pessoa responsável
pela missão, um destino para a manutenção e um critério de saída. Sem isso, ele tende a virar uma squad pequena sem
estrutura suficiente ou uma iniciativa eterna esperando a próxima tarefa. O critério de saída é especialmente
importante. "Melhorar a plataforma" não termina, enquanto "entregar e validar determinado
fluxo, transferir o contexto e definir quem sustenta" termina. O pod pode ser encerrado quando o resultado estiver
entregue, quando a hipótese for invalidada ou quando a organização decidir cancelar a missão. Cancelar também é uma saída
legítima.

Depois vem a parte menos atraente: definir quem recebe o artefato, atende o primeiro incidente e entende as decisões que
não estão no código. Se essas respostas não existem, a velocidade do pod criou uma dívida para o domínio pagar. A
transferência de conhecimento ajuda, mas não resolve tudo, porque quem executou conhece detalhes que uma documentação não
carrega. Por isso, centralização de conhecimento é um trade-off real do modelo, não um item que some depois de uma
apresentação. Rotacionar pessoas, revisar decisões e manter o domínio próximo reduz o risco sem eliminá-lo.

Essa separação permite um desenho híbrido. A estrutura permanente cuida da operação e da evolução contínua. Pods táticos
recebem missões específicas e, quando terminam, devolvem as pessoas ao time e transferem o ownership. A proporção muda
conforme capacidade, risco e volume de sustentação. Não existe número universal.

## Quando eu não usaria

Eu evitaria esse modelo quando o problema ainda é vago demais, quando quase toda decisão depende de outra área ou quando
não existe alguém com contexto para conduzir a missão. Também teria cuidado em mudanças críticas, com alto risco
regulatório, financeiro ou operacional, nas quais separar o trabalho e ampliar as revisões pode ser uma proteção
necessária. Não abriria um pod sem cobertura de sustentação nem vários ao mesmo tempo apenas para dizer que a organização
adotou o modelo. Trabalho em andamento continua sendo trabalho em andamento, mesmo quando recebe um nome mais moderno.

Também não usaria IA como justificativa para reduzir pessoas antes de entender o novo fluxo. Agentes ampliam capacidade
de execução, mas colaboração, formação de gente, conhecimento de domínio e confronto de ideias continuam importantes. Um
grupo pequeno pode ser mais rápido e também tomar decisões piores sem perceber. O mesmo vale para pessoas juniores:
colocá-las apenas no domínio, cuidando de suporte, enquanto as missões interessantes
ficam com os mais experientes cria uma divisão ruim. Colocá-las sozinhas em problemas grandes também. O modelo precisa
incluir mentoria, rotação e missões que aumentem a autonomia de verdade.

Por fim, eu desconfiaria de qualquer adoção sem uma hipótese observável. Eu acompanharia o tempo entre problema e
produção, a quantidade de bloqueios, a qualidade e a sobrecarga do domínio. No fim, o time sente mais foco ou apenas
mais pressão? Sem perguntas assim, pod vira estética organizacional.

## O nome só vale se o trabalho mudar

Daqui a algum tempo, talvez outro nome ocupe o espaço. A indústria é muito boa nisso. O que deveria permanecer é a
pergunta sobre como organizar trabalho quando a capacidade de execução muda. Se a empresa renomeia uma squad pequena,
mantém as mesmas filas, as mesmas cerimônias, o mesmo microgerenciamento e as
mesmas interrupções, não criou um pod. Criou um novo rótulo no organograma.

Se ela concentra uma missão, protege foco, dá autonomia, mantém responsabilidade humana e sabe quando encerrar o grupo,
pode haver ganho real. Ainda haverá sustentação, conflito, dependência, revisão e erro. Alguns problemas vão responder
melhor do que outros, e é por isso que eu prefiro tratar pods como experimento: começar com uma missão clara, observar o
fluxo, conversar com as
pessoas e ajustar. Sem promessa de revolução e sem cinismo automático com o nome novo.

O nome pode ser marketing. Às vezes, porém, o marketing aponta para uma prática que merecia mais atenção. O valor não
está em chamar de pod. Está em mudar, de fato, foco, autonomia, responsabilidade e custo de coordenação.
