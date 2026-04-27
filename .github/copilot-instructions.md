# Instruções do Copilot para Criação de Artigos

## Propósito

Este documento contém instruções detalhadas para o GitHub Copilot auxiliar na criação de artigos para o blog
douglasmedeiros.dev **baseados em transcrições de fala**. As instruções foram criadas através de análise profunda dos
artigos existentes e capturam o estilo de escrita, tom de voz, estrutura e convenções específicas do autor Douglas
Medeiros.

**Objetivo principal:** Transformar transcrições de fala (áudio convertido em texto) em artigos bem estruturados
mantendo a autenticidade e o estilo pessoal do autor.

> **OBRIGATÓRIO:** Este documento define apenas o **processo, estrutura, formatação markdown e workflow**
> de transformação de transcrição em artigo. A **voz autoral** e a **execução automatizada** estão
> separadas em:
>
> 1. **Skill `douglas-voice`** (`.github/skills/douglas-voice/SKILL.md`) — referência de voz a ser
>    consultada **SEMPRE** durante a escrita e revisão. É a fonte primária pra fazer o texto soar
>    como o Douglas. Use no fluxo principal, parágrafo a parágrafo.
> 2. **Skill `humanizer`** (`.github/skills/humanizer/SKILL.md`) — identifica e remove padrões de
>    escrita que denunciam texto gerado por IA. Use ao finalizar cada artigo.
> 3. **Agent `article-writer`** (`.github/agents/article-writer.md`) — agente que **executa o
>    pipeline completo**: recebe uma transcrição em `.transcriptions/` e devolve o artigo pronto
>    em `_posts/`. É o ponto de entrada padrão pra transformar transcrição em artigo.
> 4. **Agent `voice-reviewer`** (`.github/agents/voice-reviewer.md`) — revisor de voz invocável pra
>    crítica final estruturada do rascunho pronto, com contexto isolado. Deve ser invocado
>    **antes de publicar** como passo 8 do workflow.
>
> **Pipeline padrão:** transcrição em `.transcriptions/` → `article-writer` → rascunho em
> `_posts/` → `voice-reviewer` → ajustes finais → publica.
>
> **Em caso de conflito entre voz (`douglas-voice`) e processo (este documento), o autor prevalece:
> peça desambiguação.** Mas em geral, este doc não fala de voz, e a skill não fala de processo.

## Público-Alvo

Os artigos são escritos para desenvolvedores de software de todos os níveis (júnior, pleno, sênior), focados
principalmente em:

- Boas práticas de desenvolvimento
- Arquitetura de software
- Cultura e soft skills
- Carreira em tecnologia
- Experiências práticas e aprendizados reais

**Pasta `.transcriptions/`:** ignorada pelo Git, serve como **workspace de matéria-prima** com dois
tipos de conteúdo distintos:

1. **Transcrições próprias do Douglas** — áudios convertidos em texto. São matéria-prima principal
   pra virar artigo. Salve com o formato `YYYY-MM-DD-slug-do-tema.txt` (ou `.md`). Exemplo:
   `2026-04-27-uso-de-ia.txt`.

2. **Material de referência externo** — artigos de outros autores, conteúdo de sites, posts,
   threads, papers, documentação. Servem como **base de argumentação, contraponto, fonte de
   citação ou inspiração**, mas **não viram artigo direto**. Salve com nome descritivo do
   tema/autor (ex: `clean-code-para-agentes-de-ia.md`, `apagao-dev-lucas-montano.md`). Quando
   possível, mantenha a URL de origem na primeira linha do arquivo pra atribuição correta.

> **Crítico:** o agente `article-writer` precisa **distinguir os dois tipos antes de começar**.
> Material de referência **nunca** é transformado em artigo do Douglas como se fosse fala dele.
> Pode ser citado, linkado, contestado ou usado como gancho de uma reflexão própria — mas a
> autoria sempre fica clara.

## Estrutura de Artigos

### 1. Front Matter (YAML)

Cada artigo deve começar com metadados YAML entre `---`:

```yaml
---
layout: blog-post
date: YYYY-MM-DD
permalink: /artigos/:categories/nome-do-artigo
title: "Título do Artigo"
categories:
  - categoria-principal
tags:
  - tag1
  - tag2
  - tag3
image: /assets/images/posts/nome-da-imagem.jpg
description: "Descrição em estilo ensaio, 3-5 frases no mesmo tom do corpo do artigo, antecipando a tese em vez de resumir. Veja a seção 'Description: estilo ensaio, não resumo' abaixo."
---
```

**Categorias comuns:**

- pessoal
- boas-praticas
- arquitetura
- cultura
- carreira
- conteudo
- performance

**Description: estilo ensaio, não resumo.**

A `description` aparece em link previews, RSS, SEO e na listagem do blog. É a primeira amostra de voz que o leitor recebe, então **não trate como resumo executivo**. Funciona melhor escrita no mesmo registro do corpo do artigo.

❌ **Evite:**
- Frase curta e crua que só descreve o tema ("Sobre X e Y")
- Tom corporativo, neutro ou genérico
- Recapitulação fria do conteúdo
- Usar a description como abstract acadêmico

✅ **Prefira:**
- 3-5 frases que **antecipam o ensaio** em vez de resumir
- Tese implícita já visível no primeiro período
- Tensão, contraste ou provocação que faça o leitor querer continuar
- Vocabulário e cadência idênticos ao corpo do artigo (a description já é voz autoral)
- Pode terminar com a fórmula "Sobre [tema], [ângulo do autor]" ou variação

**Exemplo: crua vs com aura**

❌ Crua:
> "O gargalo do ciclo de desenvolvimento mudou de endereço com a IA, e a gente acabou voltando pro papel de arquiteto sem pedir. Sobre vibe coding feito a sério, e por que qualidade virou um problema mais nosso, não menos."

✅ Com aura:
> "A IA tirou a digitação do caminho e a gente ficou sem o gargalo que justificava metade do nosso dia. No lugar dele, sobrou o trabalho que a máquina não faz: decidir o que vai pra produção, segurar a régua de qualidade, apertar guardrail, ler o que o agente escreveu antes que vire dor de cabeça em runtime. Sobre vibe coding feito a sério e o papel de arquiteto que ninguém pediu, mas que a gente herdou."

A diferença não é tamanho, é densidade: a versão com aura faz o leitor sentir o tom do ensaio antes de clicar.

### 2. Estrutura do Conteúdo

#### Abertura

O artigo deve começar de forma envolvente, geralmente:

- Uma história pessoal
- Uma reflexão ou observação
- Um problema comum que o leitor pode reconhecer
- Uma provocação

**Exemplos de aberturas:**

- "Finalmente saiu! Ah, fazia tempo que eu queria..."
- "Ao longo dos anos, notei que muitos dos problemas..."
- "Se alguém tivesse me dito no início da minha carreira..."
- "Sempre que pensamos em performance, a primeira coisa que vem à mente é cache."

#### Seções Principais

Use títulos `##` para seções principais e `###` para subseções:

```markdown
## Seção Principal

Conteúdo da seção...

### Subseção

Conteúdo da subseção...
```

#### Seções Comuns

1. **Contexto/Problema**: Apresenta o problema ou situação
2. **Desenvolvimento**: Explora o tema com profundidade
3. **Solução/Aprendizado**: Apresenta soluções ou insights
4. **Conclusão**: Geralmente chamada de "Por fim", "Conclusão", "Insights Finais" ou "Aprendizados"

#### Fechamento

O artigo deve terminar com:

- Uma reflexão final
- Um call-to-action sutil (pergunta ao leitor)
- Uma provocação para continuar pensando
- Agradecimento aos leitores

**Exemplos de fechamentos:**

- "Nos vemos nos próximos posts! 🚀"
- "E você, já aplicou X no seu código? Compartilhe suas experiências..."
- "Então, da próxima vez que você..."
- "No fim das contas..."

## Uso de Blockquotes e Alertas

O autor faz uso extensivo de blockquotes (>) para destacar pensamentos pessoais, reflexões e alertas especiais.

### 1. Blockquotes Simples (>)

Use `>` para:

- Pensamentos pessoais
- Reflexões importantes
- Citações
- Ênfase em conceitos

```markdown
> A modelagem de software é construir modelos que explicam as características ou o comportamento de um software.
```

### 2. Alertas com Emoji/Badges ([!NOTE], [!IMPORTANT], [!TIP])

O blog usa alertas especiais do GitHub Flavored Markdown:

#### [!NOTE] - Notas e Observações

Use para informações importantes ou observações contextuais:

```markdown
> [!NOTE]
> Uma estratégia prática para melhorar seu código legado!
```

```markdown
> [!NOTE]
> Antes de começar, quero agradecer pelo ano de 2025...
```

#### [!IMPORTANT] - Avisos Importantes

Use para contextos importantes, avisos ou informações que o leitor precisa saber:

```markdown
> [!IMPORTANT]
> Este artigo começou como um tweet, foi transformado em um breve artigo no dev.to e agora chega ao meu blog...
```

```markdown
> [!IMPORTANT]
> — Você já sentiu o desconforto de compartilhar uma ideia que ninguém deu atenção...
```

#### [!TIP] - Dicas e Conselhos

Use para dicas práticas ou frases de efeito importantes:

```markdown
> [!TIP]
> *"Quem não é visto, não é lembrado"*
```

```markdown
> [!TIP]
> **Performance é contexto.** Antes de otimizar, meça.
```

### 3. Blockquotes para Frases ou Diálogos

Use blockquotes para destacar frases que o leitor pode estar pensando:

```markdown
> [!NOTE]
> "Ah, mas eu não sou bom em me comunicar…"
>
> "Não sei explicar direito…"
>
> "Fico nervoso, travo, esqueço tudo na hora…"
```

## Formatação e Convenções

### 1. Ênfase em Texto

- Use **negrito** para conceitos importantes ou ênfase forte
- Use *itálico* para ênfase leve ou termos estrangeiros
- Use `código inline` para termos técnicos, comandos, nomes de arquivos
- Use ~~tachado~~ para humor ou ironia

**Exemplos:**

```markdown
**Comunicação Não Violenta**
*Regra do Bom Escoteiro*
`docker run hello-world`
~~gambiarras~~
```

### 2. Código

Para blocos de código, sempre especifique a linguagem quando possível:

````markdown
```python
def hello_world():
    print("Hello, World!")
```
````

### 3. Listas

#### Listas Numeradas

Use para passos sequenciais ou processos:

```markdown
1. Primeiro passo
2. Segundo passo
3. Terceiro passo
```

#### Listas com Marcadores

Use para itens não ordenados:

```markdown
- Item um
- Item dois
- Item três
```

#### Listas com Descrições

Para listas mais detalhadas:

```markdown
- **Refatore enquanto altera**: Sempre que fizer uma mudança em uma classe, aproveite para aplicar técnicas de
  refatoração.
- **Mudanças pequenas**: O objetivo não é realizar grandes mudanças de uma vez só.
```

### 4. Imagens

Imagens são referenciadas com paths absolutos e podem ter classes CSS:

```markdown
![Texto alternativo](/assets/images/posts/nome-da-imagem.jpg)

![Texto alternativo](/assets/images/posts/nome-da-imagem.jpg?class=w-80 w-md-60 w-xxl-40)
```

### 5. Links

Use links de forma natural no texto:

```markdown
- Link externo: [Dev.to](https://dev.to/)
- Link interno: [Nem Só de Código Vive o Dev](/artigos/carreira/nem-so-de-codigo-vive-o-dev)
```

## Trabalhando com Transcrições de Fala

**ATENÇÃO:** Esta é a funcionalidade principal destas instruções. Quando você receber uma transcrição de fala (áudio
convertido em texto), siga este processo:

> **Atalho recomendado:** invoque o agent `article-writer`
> (`.github/agents/article-writer.md`) passando o caminho da transcrição. Ele
> executa todas as fases descritas abaixo num contexto isolado e devolve o
> artigo pronto em `_posts/`, junto com um resumo de decisões editoriais.
> Use o processo manual abaixo só quando precisar de controle fino sobre
> alguma fase específica.

### 1. Análise Inicial da Transcrição

**Primeiro, identifique:**

- **Tema central:** Qual é o assunto principal da fala?
- **Subtemas:** Quais tópicos são abordados?
- **Tom emocional:** A pessoa estava animada, reflexiva, frustrada?
- **Experiências pessoais:** Que histórias ou exemplos concretos foram mencionados?
- **Mensagem principal:** O que a pessoa quer comunicar ao leitor?

### 2. Estruturação do Conteúdo

**Organize as ideias:**

- Agrupe pensamentos relacionados em seções lógicas
- Identifique a sequência natural da narrativa
- Separe contexto, problema, solução e conclusão
- Remova repetições naturais da fala oral
- Mantenha apenas repetições que sirvam para ênfase intencional

**Crie uma estrutura:**

```
1. Abertura envolvente (gancho)
2. Contexto/Apresentação do problema
3. Desenvolvimento (2-4 seções principais)
4. Aprendizados/Solução
5. Conclusão reflexiva
```

### 3. Transformação de Fala em Escrita

**Limpe, mas preserve a voz:**

❌ **NÃO faça isso:**

- Não torne o texto formal demais
- Não remova toda a informalidade
- Não use jargão acadêmico
- Não apague a personalidade

✅ **FAÇA isso:**

- Transforme "ahm", "éh", "tipo assim" em pausas narrativas ou remova
- Converta frases soltas em parágrafos coesos
- Organize pensamentos dispersos mantendo a essência
- Preserve expressões coloquiais que soam naturais escritas

**Exemplos de transformação:**

**Transcrição original:**

```
"Então... ahm... eu tava pensando, sabe? Tipo, a gente sempre quer fazer tudo 
perfeito logo de cara, mas... éh... na real isso nunca funciona, entende?"
```

**Artigo transformado:**

```
A gente sempre quer fazer tudo perfeito logo de cara. Mas, na real, isso nunca funciona.
```

**Transcrição original:**

```
"E aí eu fiquei tipo 'cara, que que eu to fazendo?' porque o código tava uma bagunça, 
sabe? Aí eu parei e pensei, mano, preciso mudar isso."
```

**Artigo transformado:**

```
E aí veio aquele momento de clareza: "o que eu estou fazendo?" O código estava uma 
bagunça, e eu sabia que precisava mudar aquilo.
```

### 4. Enriquecimento do Conteúdo

**Adicione elementos que melhoram a leitura:**

- **Blockquotes** para destacar pontos importantes da fala
- **Exemplos de código** quando conceitos técnicos são mencionados
- **Analogias expandidas** se a pessoa começou uma comparação
- **Seções claras** com títulos descritivos
- **Formatação** (negrito, itálico) para dar ênfase

**Se a transcrição mencionar:**

- Um conceito técnico → Adicione exemplo de código simples
- Uma situação vivida → Transforme em storytelling estruturado
- Uma reflexão → Destaque com blockquote [!NOTE] ou [!IMPORTANT]
- Uma dica → Use blockquote [!TIP]

### 5. Preservação da Autenticidade

**CRÍTICO: Mantenha a voz do autor!**

✅ **Preserve:**

- Gírias brasileiras ("kk", "mano", "cara")
- Humor e autoironia
- Vulnerabilidade e honestidade
- Experiências pessoais específicas
- Opiniões fortes (não neutralize)

❌ **Não neutralize:**

- Não transforme "cara, isso é frustrante" em "isto causa frustração"
- Não remova opiniões pessoais
- Não formalize demais "achei muito legal" → mantenha natural
- Não apague erros admitidos (são pontos de conexão com o leitor)

### 6. Adição de Metadados

**Crie o Front Matter baseado no conteúdo:**

```yaml
---
layout: blog-post
date: [ data atual ou fornecida ]
permalink: /artigos/:categories/[slug-baseado-no-titulo]
title: "[Título impactante baseado no tema central]"
categories:
  - [ escolha UMA categoria apropriada ]
tags:
  - [ 3-5 tags relevantes ]
image: /assets/images/posts/[sugestao-de-nome].jpg
description: "[3-5 frases em estilo ensaio, mesmo registro do corpo, antecipando a tese — ver 'Description: estilo ensaio, não resumo' acima]"
---
```

**Como escolher a categoria:**

- Fala sobre experiência pessoal/blog? → `pessoal`
- Fala sobre código limpo, refatoração? → `boas-praticas`
- Fala sobre design, modelagem? → `arquitetura`
- Fala sobre times, processos? → `cultura`
- Fala sobre soft skills, crescimento? → `carreira`
- Fala sobre criar conteúdo, palestrar? → `conteudo`
- Fala sobre otimização, cache? → `performance`

### 7. Parágrafos densos, nunca anêmicos

Um dos vícios mais comuns ao transformar transcrição em artigo é deixar parágrafos
**anêmicos**: 2-3 frases que afirmam algo, mas não desenvolvem o raciocínio até a tese.
O leitor sai do parágrafo sem ter ganhado uma reflexão concreta — só uma posição
declarada.

**Sinais de parágrafo anêmico:**

- Tem 2-3 frases curtas, declara uma posição, e segue pra próxima seção sem ancorar
  o argumento em algo concreto (incidente, número, episódio, contraste).
- Cita um fato externo ("a Vercel teve um incidente") sem detalhar **o que aconteceu**,
  **por que importa**, **o que isso ensina**.
- Usa um conceito técnico ("rate limit", "não-determinístico", "complexidade ciclomática")
  sem traduzir em consequência prática pra quem lê.
- Termina com uma frase de transição ("e é por isso que precisamos de qualidade") em
  vez de uma frase-punch que feche o ponto.

**Como adensar um parágrafo:**

1. **Ancore em concreto.** Se a transcrição menciona um incidente de passagem, leia o
   material de referência (se houver) e traga 2-3 detalhes específicos: data, vetor do
   ataque, consequência. Resumo de 1 frase é anêmico; recapitulação de 3-4 frases que
   reconstrói o caso é denso.
2. **Use "conta de padaria" sempre que houver magnitude.** Se o argumento depende de
   "a IA escreve muito código", traduza em número: "10 mil linhas por dia, impossível
   revisar à mão". Magnitude abstrata não convence; magnitude com número convence.
3. **Aplique concessão-oposição dentro do parágrafo.** Não basta declarar a tese:
   reconheça o contra-argumento ("Uncle Bob tem razão de que a gente não dá conta") e
   vire ("Mas mesmo com complexidade ciclomática baixa, ainda passa bug que só sênior
   pega"). A virada é o que dá peso.
4. **Feche com punch.** Última frase do parágrafo deve ser curta, afirmativa, sem
   condicional. Se o parágrafo termina em transição ("e isso nos leva a pensar..."),
   reescrever.

**Regra prática de tamanho:** parágrafo de seção principal raramente fica abaixo de
4-5 frases. Se estiver com 2-3, provavelmente falta substância — desenvolva ou funda
com o parágrafo vizinho.

**Cuidado com o modo jornalístico.** Adensar parágrafo não é encher de nome, data,
fonte e citação. Esse é o vício oposto ao anêmico, e arruína a voz na mesma medida.
Se o parágrafo virou matéria de portal de tecnologia, com 4 nomes próprios em 5 linhas
("a empresa X, segundo o veículo Y, citando o pesquisador Z, no incidente W..."), o
excesso de detalhe matou a reflexão. O leitor sai do parágrafo sabendo o quê, mas não
sabendo o que o autor pensa daquilo.

Sinais de modo jornalístico:

- Mais de 2-3 nomes próprios (pessoa, empresa, veículo) em sequência num mesmo
  parágrafo.
- Citações diretas longas de terceiros, especialmente em aspas, no lugar de
  paráfrase + reflexão.
- Datas, versões e cifras precisas que não servem ao argumento.
- Frase do tipo "segundo X, citando Y..." sem o autor entrar com posição própria
  depois.
- O parágrafo descreveria o mesmo fato pra qualquer leitor, sem assinatura.

Como corrigir: **detalhe é insumo da reflexão, não substituto**. Mantenha o exemplo
concreto, mas com nomes essenciais apenas (1-2 por parágrafo, raramente 3), sem
citação direta longa, e abrindo espaço pra o autor virar pra reflexão dele.

Antes (jornalístico):
> A Vercel publicou em abril um boletim de incidente confirmando acesso não
> autorizado. O vetor não foi força bruta nem CVE: um funcionário da Context.ai foi
> infectado por infostealer, o atacante pulou pra um token OAuth do Google Workspace
> de um funcionário da Vercel, e de lá leu variáveis de ambiente. O CEO Guillermo
> Rauch reconheceu publicamente o problema.

Depois (com voz):
> A Vercel passou um perrengue feio em abril que nem foi por código deles: um
> funcionário tinha instalado uma extensão de IA no navegador, o token de acesso
> dela vazou, e por essa porta o atacante leu variáveis de ambiente que vários devs
> tinham marcado como "não sensíveis" por descuido. Não foi exploit, não foi
> zero-day. Foi a superfície de ataque crescendo pelo lado das integrações de IA
> que ninguém audita.

A versão "depois" tem o mesmo fato, perde detalhe que ninguém ia lembrar dois
parágrafos depois (Context.ai, Google Workspace, Guillermo Rauch), e ganha espaço
pra fechar com a reflexão que ancora o argumento ("a superfície de ataque
crescendo..."). Isso é o que importa.

**Bullets dentro de seção quase sempre são preguiça.** Se você está pensando em
abrir uma lista de itens com bullets ou em quebrar uma seção com bold sub-headings
(`**Cobertura.** ... **Análise estática.** ... **Regressão.**`), pare. Quase sempre
isso é o sinal de que você está organizando informação como se fosse documentação
técnica, não argumento. O Douglas raramente usa lista. Quando usa, é pra elemento
genuinamente paralelo e curto. Sub-heading em negrito dentro de seção quebra o
fluxo de prosa e dá tom de manual de instruções.

**Quando uma seção inteira é anêmica:** se a seção tem só 1 parágrafo curto, ou ela
não justifica existir como seção (funde com a vizinha) ou ela precisa de 2-3 parágrafos
de desenvolvimento. Não existe seção legítima de "declaração rápida".

**Em transcrições longas com muitos pontos rasos:** o trabalho é justamente desenvolver
cada ponto em parágrafo denso usando material de referência (`.transcriptions/` de
fontes externas), textos antigos do próprio blog, e conta-de-padaria pra ancorar
argumentos. Transcrição é matéria-prima, não rascunho — capturar **o que ele quis
dizer**, desenvolver até a tese.

### 8. Checklist de Transformação

Antes de entregar o artigo transformado, verifique:

- [ ] A transcrição foi organizada em seções lógicas?
- [ ] Repetições desnecessárias foram removidas?
- [ ] A voz autêntica foi preservada?
- [ ] Gírias e expressões naturais foram mantidas?
- [ ] Histórias pessoais estão bem estruturadas?
- [ ] Blockquotes destacam pontos importantes?
- [ ] Front matter está completo e correto?
- [ ] Título é impactante e claro?
- [ ] Descrição captura a essência?
- [ ] Há uma abertura envolvente?
- [ ] O artigo soa como o autor falando?
- [ ] O texto foi validado pela skill `humanizer` para remover padrões de IA?

### 9. Revisão Final pelo Agent `voice-reviewer`

**Antes de salvar/publicar o artigo**, invoque o agent `voice-reviewer` (`.github/agents/voice-reviewer.md`)
passando o caminho do arquivo do rascunho. O agent vai fazer 3 passadas (voz, padrões de IA, estrutura) e
devolver crítica estruturada com:

- Veredito geral (pronto / ajuste leve / retrabalho)
- Pontos fortes específicos
- Violações de voz com sugestão de reescrita
- Padrões de IA detectados
- Problemas estruturais
- Reescritas prioritárias (top 3-5)

Aplique as reescritas prioritárias antes de publicar. Não trate as sugestões como ordem absoluta: se
discordar, mantenha sua escolha — o autor sempre prevalece. Mas leia tudo antes de decidir.

### 10. Exemplo de Fluxo de Trabalho

**INPUT (Transcrição):**

```
"Esses dias eu tava debugando um problema de performance, sabe? E descobri que o 
Redis tava sendo o gargalo. Eu fiquei tipo 'como assim?' porque a gente sempre 
acha que Redis resolve tudo, né? Mas não é bem assim... depende do contexto."
```

**OUTPUT (Artigo):**

```markdown
---
layout: blog-post
date: 2026-02-02
permalink: /artigos/:categories/quando-o-redis-vira-gargalo
title: "Quando o Redis Vira o Gargalo"
categories:
  - performance
tags:
  - redis
  - cache
  - otimização
image: /assets/images/posts/redis-gargalo.jpg
description: "Redis sempre resolve tudo, certo? Errado. Descobri isso da pior forma 
ao debugar um problema de performance que me deixou em choque."
---

Esses dias eu estava debugando um problema de performance que, no papel, não fazia
sentido. Tudo estava configurado corretamente, a arquitetura estava sólida, mas algo
estava lento demais.

Aí veio o choque: o Redis era o gargalo.

> [!NOTE]
> "Como assim o Redis é o problema?" Foi exatamente o que pensei.

A gente sempre acha que Redis resolve tudo, né? É rápido, confiável, a solução
padrão para cache. Mas descobri que não é bem assim... depende do contexto.

[Continue desenvolvendo o artigo...]
```

## Checklist para Revisão de Artigos

Antes de finalizar um artigo, verifique itens de **processo, estrutura e formatação** (a checklist
de **voz autoral** está na skill `douglas-voice`):

- [ ] Front matter completo e correto (layout, date, permalink, title, categories, tags, image, description)
- [ ] Título e descrição preenchidos e coerentes com o conteúdo
- [ ] Abertura envolvente (a skill `douglas-voice` define o que conta como "envolvente")
- [ ] Estrutura clara com seções (`##`) e subseções (`###`) quando necessário
- [ ] Uso de blockquotes/alertas (`[!NOTE]`, `[!TIP]`, `[!IMPORTANT]`) conforme convenção
- [ ] Formatação consistente (negrito, itálico, código inline, listas)
- [ ] Links funcionais (internos pra outros posts do blog quando o tema toca algo já abordado; externos válidos)
- [ ] Imagens referenciadas com path absoluto e classes corretas (se houver)
- [ ] Revisão ortográfica e gramatical
- [ ] Texto não ultrapassa 120 caracteres por linha sempre que possível
- [ ] **Voz validada pela skill `douglas-voice`** (use a checklist completa lá)
- [ ] **Padrões de IA removidos pela skill `humanizer`**
- [ ] **Rascunho passou pelo agent `voice-reviewer`** antes de publicar (passo 8 do workflow)

## Categorias e Tags Sugeridas

### Categorias (uma por artigo)

- `pessoal` - Sobre o autor, blog, experiências pessoais
- `boas-praticas` - Clean Code, refactoring, qualidade
- `arquitetura` - Design de sistemas, modelagem, padrões
- `cultura` - Times, processos, melhoria contínua
- `carreira` - Soft skills, crescimento profissional
- `conteudo` - Sobre criar conteúdo, escrever, palestrar
- `performance` - Otimização, cache, escalabilidade

### Tags (múltiplas por artigo)

Use tags específicas relacionadas ao conteúdo:

- Tecnologias: `php`, `redis`, `kafka`, `docker`, `kubernetes`
- Práticas: `clean-code`, `tdd`, `refactoring`, `modelagem`
- Soft skills: `comunicação`, `liderança`, `colaboração`
- Conceitos: `legado`, `alta-performance`, `idempotência`

## Verificação de Informações e Correção de Erros

**IMPORTANTE**: Durante a transformação de transcrições em artigos, o Copilot deve **sempre** verificar e questionar
informações técnicas falsas, duvidosas ou imprecisas.

### 1. Identificar Informações Duvidosas

Ao processar uma transcrição, fique atento a:

- **Afirmações técnicas incorretas** (ex: "Redis é sempre a melhor solução para cache")
- **Generalizações excessivas** (ex: "Todos os desenvolvedores fazem X")
- **Informações desatualizadas** (ex: versões antigas de tecnologias apresentadas como atuais)
- **Conceitos mal explicados** que podem confundir o leitor
- **Mitos ou más práticas** apresentados como boas práticas
- **Datas ou eventos incorretos**

### 2. Ações a Tomar

Quando identificar informações problemáticas:

#### ✅ Corrija Erros Factuais Claros

Se algo está objetivamente errado, corrija diretamente no artigo:

❌ **Transcrição original:**

```
"O PHP 7 ainda não tem tipagem forte, então você não pode definir tipos nas funções."
```

✅ **Artigo corrigido:**

```
O PHP 7 trouxe tipagem forte, permitindo definir tipos nos parâmetros e retornos de funções.
```

#### ⚠️ Suavize Generalizações Excessivas

Transforme afirmações absolutas em reflexões mais equilibradas:

❌ **Transcrição original:**

```
"Microserviços são sempre melhores que monolitos."
```

✅ **Artigo ajustado:**

```
Microserviços podem ser uma ótima escolha em muitos cenários, mas não são uma bala de prata. 
Monolitos bem estruturados têm seu valor, especialmente para times menores.
```

#### 🔍 Adicione Contexto a Afirmações Duvidosas

Se uma afirmação precisa de nuances, adicione contexto:

❌ **Transcrição original:**

```
"Cache resolve todos os problemas de performance."
```

✅ **Artigo contextualizado:**

```
Cache é uma ferramenta poderosa para performance, mas não é solução para tudo. 
É preciso entender o contexto, medir os gargalos e aplicar a estratégia certa.
```

#### 📝 Questione ao Usuário Quando Necessário

Se algo não faz sentido e você não tem certeza da intenção, **pause e pergunte ao usuário**:

```
⚠️ **Atenção**: Na transcrição há uma afirmação que parece incorreta ou imprecisa:

"[citação da transcrição]"

Isso não está alinhado com as boas práticas/documentação oficial. 
Posso corrigir para "[sugestão de correção]", ou você prefere manter 
a ideia original com algum ajuste específico?
```

### 3. Checklist de Verificação Técnica

Antes de finalizar o artigo, verifique:

- [ ] Todas as afirmações técnicas estão corretas?
- [ ] Versões de tecnologias mencionadas estão atualizadas?
- [ ] Conceitos técnicos estão bem explicados?
- [ ] Não há generalizações que precisam de nuances?
- [ ] Exemplos de código (se houver) funcionam corretamente?
- [ ] Links externos (se houver) estão corretos e ativos?
- [ ] Datas e eventos mencionados estão corretos?
- [ ] Não há contradições internas no texto?

### 4. Equilibrando Autenticidade e Precisão

**IMPORTANTE**: O objetivo é manter a voz autêntica do autor enquanto garante precisão técnica.

✅ **Mantenha:**

- Opiniões pessoais (mesmo que controversas, se fundamentadas)
- Estilo conversacional e informal
- Gírias e expressões coloquiais
- Vulnerabilidade e admissão de erros do autor

❌ **Corrija:**

- Fatos técnicos incorretos
- Informações desatualizadas
- Má interpretação de conceitos
- Mitos ou desinformação

### 5. Exemplo Prático

**Transcrição original:**

```
"Eu sempre uso var_dump pra debugar porque é mais rápido que qualquer ferramenta. 
E outra, o PHP não tem tipagem forte, então você precisa sempre fazer validação manual."
```

**Análise:**

- ✅ Primeira parte: Opinião pessoal válida (preferência por var_dump)
- ❌ Segunda parte: Informação incorreta (PHP tem tipagem desde versão 7)

**Artigo transformado:**

```
Eu sempre uso var_dump pra debugar porque, pra mim, é mais rápido que configurar 
ferramentas complexas. Pode não ser a abordagem mais sofisticada, mas funciona.

Claro que hoje, com as melhorias de tipagem forte que o PHP trouxe desde a versão 7, 
muitos erros são pegos antes mesmo da execução. Mas ainda assim, validações manuais 
têm seu lugar, especialmente com dados externos.
```

### 6. Tom ao Corrigir

Quando corrigir algo, mantenha o tom conversacional:

❌ **Não faça assim (tom professoral):**

```
É importante ressaltar que essa afirmação está incorreta. Segundo a documentação oficial...
```

✅ **Faça assim (tom natural):**

```
Hoje em dia, isso mudou bastante. Com as versões mais recentes...
```

ou

```
Na real, descobri depois que...
```

## Observações Finais

1. **Autenticidade é chave**: Nunca force um tom que não pareça natural
2. **Menos é mais**: Não encha linguiça; seja direto mas completo
3. **Empatia com o leitor**: Sempre pense em quem está lendo e o que ele ganha com o artigo
4. **Vulnerabilidade é força**: Admitir erros e compartilhar aprendizados é valorizado
5. **Comunidade importa**: O autor valoriza contribuir com a comunidade tech brasileira
6. **Experiência prática**: Sempre baseie em experiências reais, não em teoria vazia
7. **Qualidade sobre quantidade**: Um bom artigo vale mais que vários superficiais
8. **Precisão técnica**: Sempre verifique e corrija informações falsas ou duvidosas, mantendo a autenticidade da voz do
   autor

---

**Lembre-se**: O objetivo não é apenas informar, mas conectar, inspirar e fazer o leitor refletir sobre sua própria
prática profissional. E isso só funciona quando o conteúdo é **autêntico E tecnicamente preciso**.

---

