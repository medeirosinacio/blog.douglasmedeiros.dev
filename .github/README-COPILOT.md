# Como Usar as Instruções do Copilot para Criação de Artigos

## Sobre

Este documento explica como usar o arquivo `copilot-instructions.md` para criar artigos para o blog douglasmedeiros.dev baseados em transcrições de fala ou ideias soltas.

## O que são as Instruções do Copilot?

As instruções do Copilot são um guia detalhado que ajuda o GitHub Copilot (ou qualquer assistente de IA) a entender:
- Como você escreve
- Seu tom de voz e estilo pessoal
- A estrutura dos seus artigos
- Convenções de formatação
- Como transformar fala em texto escrito mantendo sua essência

## Como Usar

### 1. Com GitHub Copilot no VSCode

O GitHub Copilot automaticamente lerá as instruções do arquivo `.github/copilot-instructions.md` ao trabalhar no repositório.

Para criar um artigo a partir de uma transcrição:

1. Crie um novo arquivo em `_posts/` com o formato: `YYYY-MM-DD-titulo-do-artigo.md`
2. Cole sua transcrição ou ideias no arquivo
3. Use o Copilot Chat e peça: 
   ```
   Transforme esta transcrição em um artigo para o blog seguindo as instruções do copilot-instructions.md
   ```

### 2. Com ChatGPT ou Claude

1. Abra o arquivo `.github/copilot-instructions.md`
2. Copie o conteúdo completo
3. Em uma nova conversa, cole as instruções e adicione:
   ```
   Estas são as instruções de estilo para criação de artigos do meu blog.
   Por favor, as leia e confirme que entendeu.
   ```
4. Após confirmação, envie sua transcrição ou ideias e peça:
   ```
   Agora transforme esta transcrição em um artigo seguindo o estilo documentado.
   ```

### 3. Diretamente com Transcrições de Áudio

Se você tem uma gravação de áudio (podcast, palestra, conversa):

1. Transcreva o áudio usando ferramentas como:
   - Whisper (OpenAI)
   - Google Speech-to-Text
   - Otter.ai
   - Descript

2. Cole a transcrição bruta no assistente de IA
3. Peça para transformar em artigo seguindo as instruções

## Exemplos de Prompts

### Para Criar um Artigo do Zero

```
Tenho as seguintes ideias para um artigo sobre [TEMA]:
- [Ideia 1]
- [Ideia 2]
- [Ideia 3]

Crie um artigo completo seguindo as instruções do copilot-instructions.md,
incluindo o front matter YAML apropriado.
```

### Para Transformar uma Transcrição

```
Aqui está a transcrição de uma conversa/palestra que quero transformar em artigo:

[COLE A TRANSCRIÇÃO]

Por favor, transforme isso em um artigo do blog seguindo as instruções,
organizando as ideias em seções lógicas e mantendo meu tom de voz autêntico.
```

### Para Revisar um Rascunho

```
Aqui está um rascunho de artigo:

[COLE O RASCUNHO]

Revise este artigo usando o checklist das instruções do copilot-instructions.md
e sugira melhorias para deixá-lo mais próximo do meu estilo.
```

## Dicas para Melhores Resultados

### 1. Seja Específico sobre o Tema

Forneça contexto sobre:
- Qual é o tema principal
- Qual experiência específica você quer compartilhar
- Que mensagem principal você quer passar

### 2. Inclua Detalhes Pessoais

Compartilhe:
- Histórias reais que aconteceram com você
- Aprendizados específicos
- Erros que cometeu
- Reflexões honestas

Quanto mais autêntico, melhor o artigo ficará.

### 3. Revise e Ajuste

As instruções são um guia, mas você conhece seu estilo melhor que ninguém:
- Revise o artigo gerado
- Ajuste o tom se necessário
- Adicione ou remova detalhes
- Certifique-se de que soa como você

### 4. Use o Checklist

Antes de publicar, use o checklist de revisão incluído nas instruções:
- Front matter completo
- Título impactante
- Abertura envolvente
- Formatação consistente
- Fechamento reflexivo

## Estrutura Esperada dos Artigos

Todo artigo deve seguir esta estrutura básica:

```markdown
---
layout: blog-post
date: 2026-02-02
permalink: /artigos/:categories/titulo-do-artigo
title: "Título do Artigo"
categories:
  - categoria
tags:
  - tag1
  - tag2
image: /assets/images/posts/imagem.jpg
description: "Descrição impactante do artigo."
---

## Título da Seção Principal

Texto da seção...

### Subseção

Texto da subseção...

> [!NOTE]
> Observação importante

## Outra Seção

Mais conteúdo...

## Por fim

Conclusão reflexiva...
```

## Categorias e Tags Comuns

### Categorias (escolha uma)
- `pessoal` - Experiências pessoais
- `boas-praticas` - Clean Code, qualidade
- `arquitetura` - Design, modelagem
- `cultura` - Times, processos
- `carreira` - Soft skills, crescimento
- `conteudo` - Sobre criar conteúdo
- `performance` - Otimização, escalabilidade

### Tags (escolha múltiplas)
- Tecnologias: `php`, `redis`, `kafka`, `docker`
- Práticas: `clean-code`, `refactoring`, `modelagem`
- Soft skills: `comunicação`, `liderança`
- Conceitos técnicos específicos

## Elementos de Estilo Importantes

### Blockquotes Especiais

Use blockquotes com badges para destacar informações:

```markdown
> [!NOTE]
> Para notas e observações

> [!IMPORTANT]
> Para avisos e contexto importante

> [!TIP]
> Para dicas e frases de efeito
```

### Tom Conversacional

- Use primeira pessoa (eu, minha)
- Faça perguntas ao leitor
- Use gírias brasileiras naturalmente
- Seja autêntico e vulnerável

### Formatação

- **Negrito** para ênfase forte
- *Itálico* para termos estrangeiros
- `código` para termos técnicos
- ~~tachado~~ para humor

## Workflow Recomendado

1. **Captura** → Grave sua fala ou escreva ideias soltas
2. **Transcrição** → Transcreva o áudio (se aplicável)
3. **Geração** → Use IA com as instruções para criar o artigo
4. **Revisão** → Leia e ajuste para soar como você
5. **Checklist** → Verifique todos os itens
6. **Publicação** → Commit e push para o repositório

## Recursos Adicionais

- **Notion**: Ótimo para rascunhos antes de mover para Markdown
- **Vale.sh**: Linter para revisar estilo de escrita
- **Grammarly**: Para revisão ortográfica (cuidado com sugestões que removem seu estilo)

## Atualizando as Instruções

À medida que seu estilo evolui:

1. Adicione novos padrões que você identifica
2. Atualize exemplos de frases típicas
3. Inclua novas categorias ou tags
4. Refine as descrições de estilo

As instruções devem ser um documento vivo que cresce com você.

## Exemplos Reais

Os seguintes artigos do blog são bons exemplos do estilo:

- **Conversacional**: "Por que criar um blog?"
- **Técnico com Storytelling**: "O Dia que o Redis Virou um Gargalo"
- **Soft Skills**: "Nem Só de Código Vive o Dev"
- **Cultura**: "Times de Alta Performance"
- **Boas Práticas**: "A Regra do Bom Escoteiro"

Leia estes artigos para entender melhor o estilo antes de criar novos conteúdos.

---

**Lembre-se**: O objetivo das instruções não é robotizar a escrita, mas facilitar a criação de conteúdo mantendo sua voz autêntica e única. Use as instruções como um guia, não como uma prisão.
