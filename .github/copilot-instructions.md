# Instruções para Criação de Artigos do Blog

## Contexto Geral

Este documento contém instruções detalhadas para auxiliar na criação de artigos para o blog douglasmedeiros.dev. As instruções foram baseadas em uma análise profunda dos artigos existentes e capturam o estilo de escrita, tom de voz, estrutura e convenções específicas do autor.

## Público-Alvo

Os artigos são escritos para desenvolvedores de software de todos os níveis (júnior, pleno, sênior), focados principalmente em:
- Boas práticas de desenvolvimento
- Arquitetura de software
- Cultura e soft skills
- Carreira em tecnologia
- Experiências práticas e aprendizados reais

## Tom de Voz e Estilo de Escrita

### Características Principais

1. **Conversacional e Autêntico**: O estilo é descontraído, como uma conversa entre colegas. Use linguagem direta, sem formalidades excessivas.
   - ✅ "Vou ser sincero, demorou mais do que eu imaginava."
   - ✅ "E cá estamos..."
   - ✅ "Pense bem: quantas vezes você..."
   - ❌ "Neste trabalho, será apresentado de forma sistemática..."

2. **Uso de Gírias e Expressões Brasileiras**: O autor usa gírias e expressões coloquiais brasileiras naturalmente.
   - "kk" (risos)
   - "~~gambiarras~~" (texto riscado com humor)
   - "No final das contas"
   - "Da próxima vez"
   - "Aí vem as frases clássicas"
   - "Caiu a ficha"
   - "Spoiler: esse momento não existe"

3. **Autoironia e Humor Sutil**: O autor não se leva muito a sério e usa humor para conectar com o leitor.
   - "Como bom back-end, não foi fácil definir o layout"
   - "~~nem sempre na real~~" (texto riscado)
   - "soluções mais modernas ~~gambiarras~~"
   - "(kk não fui aprender Tailwind-CSS)"

4. **Pessoal e Experiencial**: O autor compartilha experiências pessoais e vulnerabilidades.
   - Use primeira pessoa ("eu", "minha")
   - Conte histórias reais
   - Admita erros e aprendizados
   - Seja vulnerável quando apropriado

5. **Provocativo e Reflexivo**: O autor faz perguntas diretas ao leitor para provocar reflexão.
   - "E você, já aplicou a Regra do Bom Escoteiro no seu código?"
   - "Mas legado é realmente um problema?"
   - "Por que desenhar?"
   - "Você não é ruim em comunicação, só não treinou o suficiente"

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
description: "Descrição curta e impactante do artigo, geralmente 1-2 frases que capturam a essência e fazem o leitor querer ler."
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

```markdown
```python
def hello_world():
    print("Hello, World!")
```
```

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
- **Refatore enquanto altera**: Sempre que fizer uma mudança em uma classe, aproveite para aplicar técnicas de refatoração.
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
- Link externo: [Dev.to](http://dev.to/)
- Link interno: [Nem Só de Código Vive o Dev](/artigos/carreira/nem-so-de-codigo-vive-o-dev)
```

### 6. Emojis

O autor usa emojis ocasionalmente, mas com moderação:
- 🚀 (foguete) - para fechamentos motivacionais
- 🔮 (bola de cristal) - para referências tecnológicas
- Geralmente no final de artigos ou em títulos de seções especiais

## Elementos de Escrita Específicos

### 1. Software Orientado a Fofoca

O autor criou este termo humorístico para descrever sistemas mal documentados onde o conhecimento está apenas nas cabeças das pessoas. Use referências criativas e humor quando apropriado.

### 2. Analogias e Metáforas

O autor usa analogias do dia a dia para explicar conceitos técnicos:
- "É como uma dívida financeira: se você não a paga, ela só aumenta"
- "Como bons escoteiros sempre deixam o lugar mais limpo do que encontraram"
- "Sistemas são organismos vivos"
- "Uma boa analogia para isso é a rotina de atletas de alta performance"

### 3. Expressões de Transição

Use expressões naturais para conectar ideias:
- "No final das contas"
- "Pense bem"
- "A questão é que"
- "Aí vem"
- "E então"
- "Por exemplo"
- "Além disso"
- "Mais do que isso"
- "Claro"
- "É aí que"

### 4. Storytelling

Conte histórias de forma cronológica e envolvente:
- Apresente o contexto
- Mostre o problema
- Descreva a jornada
- Revele a solução/aprendizado
- Conclua com reflexão

### 5. Referências Técnicas e Culturais

O autor faz referências a:
- Tecnologias modernas (Docker, Kafka, Redis, PHP, etc.)
- Cultura pop tech (Mr. Robot, Matrix)
- Comunidade tech brasileira (Dev.to, TabNews)
- Práticas de desenvolvimento (SOLID, Clean Code, TDD)
- Livros técnicos

## Trabalhando com Transcrições de Fala

Quando você receber uma transcrição de fala para transformar em artigo:

### 1. Estruturação

- Identifique o tema principal e subtemas
- Organize ideias dispersas em seções lógicas
- Remova repetições naturais da fala
- Adicione transições entre ideias

### 2. Conversão de Fala para Escrita

- Mantenha o tom conversacional, mas organize melhor
- Transforme "ahs" e "éhs" em pausas narrativas ou ênfases
- Converta redundâncias em ênfases intencionais
- Preserve expressões coloquiais que soam naturais escritas

### 3. Enriquecimento

- Adicione exemplos de código quando apropriado
- Inclua analogias que tornem conceitos mais claros
- Adicione blockquotes para destacar pontos importantes
- Use formatação (negrito, itálico) para dar ênfase

### 4. Preservação do Estilo

- Mantenha a autenticidade da voz do autor
- Preserve humor e autoironia
- Mantenha vulnerabilidade e honestidade
- Use as mesmas expressões e gírias do autor

## Checklist para Revisão de Artigos

Antes de finalizar um artigo, verifique:

- [ ] Front matter completo e correto
- [ ] Título impactante e claro
- [ ] Descrição que capture a essência do artigo
- [ ] Abertura envolvente que prenda o leitor
- [ ] Estrutura clara com seções e subseções
- [ ] Uso apropriado de blockquotes e alertas
- [ ] Formatação consistente (negrito, itálico, código)
- [ ] Analogias e exemplos claros
- [ ] Tom conversacional e autêntico
- [ ] Humor e autoironia quando apropriado
- [ ] Vulnerabilidade e honestidade
- [ ] Fechamento reflexivo ou provocativo
- [ ] Links funcionais (se houver)
- [ ] Imagens referenciadas corretamente (se houver)
- [ ] Revisão ortográfica e gramatical
- [ ] Linguagem inclusiva e respeitosa

## Exemplos de Frases Típicas do Autor

Para referência, aqui estão exemplos de frases que capturam o estilo:

**Aberturas:**
- "Finalmente saiu! Ah, fazia tempo que eu queria..."
- "Se alguém tivesse me dito no início da minha carreira que..."
- "Fazer parte do time X é quase como um privilégio..."
- "Esses dias vi um cara no Twitter perguntando..."

**Transições:**
- "E aí veio o momento de clareza."
- "Foi um choque perceber que..."
- "Aí vem as frases clássicas..."
- "E então, o mundo real chega."
- "No final das contas..."

**Ênfases:**
- "E não, comunicação não é sobre 'falar bonito'..."
- "Sim, é exatamente sobre isso."
- "A real é que ninguém cresce sozinho."
- "E spoiler: esse momento não existe."

**Reflexões:**
- "Essa é a essência da Regra..."
- "Esse episódio foi meu choque de realidade..."
- "O verdadeiro diferencial acontece quando..."
- "No fim das contas, tudo se resume a..."

**Fechamentos:**
- "Nos vemos nos próximos posts! 🚀"
- "E você, já aplicou X? Compartilhe suas experiências..."
- "Então, da próxima vez que você..."
- "Espero que você me acompanhe nessa jornada."

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

## Observações Finais

1. **Autenticidade é chave**: Nunca force um tom que não pareça natural
2. **Menos é mais**: Não encha linguiça; seja direto mas completo
3. **Empatia com o leitor**: Sempre pense em quem está lendo e o que ele ganha com o artigo
4. **Vulnerabilidade é força**: Admitir erros e compartilhar aprendizados é valorizado
5. **Comunidade importa**: O autor valoriza contribuir com a comunidade tech brasileira
6. **Experiência prática**: Sempre baseie em experiências reais, não em teoria vazia
7. **Qualidade sobre quantidade**: Um bom artigo vale mais que vários superficiais

---

**Lembre-se**: O objetivo não é apenas informar, mas conectar, inspirar e fazer o leitor refletir sobre sua própria prática profissional.
