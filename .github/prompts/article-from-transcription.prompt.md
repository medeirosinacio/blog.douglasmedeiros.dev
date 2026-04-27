Escreva a **primeira parte** de um artigo do blog a partir do material em `.transcriptions/`.
Tenho mais coisa pra falar depois — agora quero ver como está esse início.

## Antes de escrever

1. **Leia tudo com atenção.** Liste os arquivos em `.transcriptions/` e leia integralmente:
   - O(s) áudio(s) transcrito(s) que vão virar este artigo.
   - Qualquer material de referência relacionado (notas, links, rascunhos prévios na mesma pasta).
2. **Releia os padrões do projeto** antes de redigir:
   - `.github/copilot-instructions.md` (estrutura, front matter, tom, fingerprint linguístico, lições aprendidas).
   - `.github/skills/douglas-voice/SKILL.md` e `.github/skills/humanizer/SKILL.md`.
3. **Pense bastante.** Antes de escrever uma linha, tenha clareza sobre:
   - Tema central e mensagem principal desta parte.
   - Quais histórias/episódios concretos ancoram o argumento.
   - O que **fica de fora** porque pertence aos próximos pontos.
   - Onde cabe storytelling que envolve o leitor (problema reconhecível, "você" estratégico, cena concreta antes de abstração).

## O que entregar

- Um **único arquivo `.md`** em `_posts/` no formato `YYYY-MM-DD-slug.md`, com:
  - Front matter completo (layout, date, permalink, title, categories, tags, image, description).
  - Artigo escrito nos padrões do projeto — voz autêntica, storytelling, blockquotes cirúrgicos, fingerprint do Douglas.
  - Ao final, uma seção **"Próximos pontos"** (fora do corpo do artigo, como nota de trabalho — pode ser um bloco `<!-- -->` ou uma seção `## Próximos pontos` que será removida antes de publicar) listando o que ficou pra abordar nas próximas partes.
- **Não comite nada.** Só deixe o arquivo salvo pra eu revisar.

## Depois de escrever

- Rode o agente **`voice-reviewer`** sobre o rascunho final e me traga a crítica estruturada junto com a entrega.
- Se houver pontos críticos da revisão que dá pra corrigir sem mudar a estrutura, aplique e mostre o diff.
- Não passe o `humanizer` automaticamente — só sinalize se identificar padrões de IA óbvios.

## Regras invioláveis

- **A transcrição não é confiável palavra-por-palavra.** Vem de áudio convertido em texto e às vezes erra termos técnicos, nomes, números e frases inteiras. Se algum trecho parecer fora de contexto, sem sentido, com termo técnico estranho ou contradizendo o raciocínio, **pergunte antes de reescrever**. Não chute o que eu "devo ter dito".
- **Sinalize informações falsas ou duvidosas** que eu falei (mesmo que a transcrição esteja correta) — fatos técnicos errados, generalizações excessivas, datas/versões improváveis. Pare e pergunte se corrige ou ajusta.
- **Não invente fatos, episódios ou opiniões** que não estejam na transcrição. Se faltar contexto, marque com `[CONFIRMAR]` no texto.
- **Não resolva contradições honestas** que aparecem na fala — preserve a tensão.
- **Não formalize a voz.** Mantém gírias, "a gente", contrações, autoironia.
- **Corrija erros técnicos** factuais que aparecerem na transcrição (ver seção "Verificação de Informações" nas instruções), mantendo o tom natural.
- **Não comite, não faça push, não crie PR.** Apenas salve o arquivo.
