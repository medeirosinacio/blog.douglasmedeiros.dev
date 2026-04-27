Revise o artigo já escrito **comparando com o material de origem** em `.transcriptions/`.
Quero saber se o artigo capturou bem o que eu falei e se está dentro dos padrões do projeto.

## Inputs esperados

- Caminho do artigo em `_posts/` (ou eu colo o conteúdo).
- Caminho(s) da(s) transcrição(ões) e materiais de referência usados em `.transcriptions/`.

Se algum input estiver faltando, **pergunte antes de revisar**.

## Antes de revisar

Leia, na íntegra:

1. O artigo a ser revisado.
2. A(s) transcrição(ões) de origem.
3. Materiais de referência citados (se houver).
4. `.github/copilot-instructions.md` — padrões do projeto.
5. `.github/skills/douglas-voice/SKILL.md` — voz autoral.
6. `.github/skills/humanizer/SKILL.md` — padrões de IA.

## O que revisar (4 passadas)

### Passada 1 — Fidelidade ao material

Compare o artigo com a transcrição:

- **O que eu falei e ficou de fora?** Algum ponto importante perdido?
- **O que está no artigo e não tem base na transcrição?** Sinalize qualquer ideia, exemplo ou opinião inventada.
- **Histórias/episódios distorcidos?** O agente alterou fatos, números, nomes ou contexto?
- **Analogias inacabadas que ficaram pela metade?** Deveriam ter sido cortadas ou reformuladas.
- **Trechos com possível erro de transcrição** que viraram texto sem sentido ou tecnicamente errado.
- **Material de referência usado corretamente?** Atribuição clara, sem misturar voz, sem apropriação.

### Passada 2 — Voz e fingerprint

Use `douglas-voice` como referência. Aponte:

- Aberturas impessoais ou que não soam como eu falando.
- Frases longas demais sem punch curto compensatório.
- Subordinação excessiva, falta de "e/mas/aí/então".
- Pronomes errados (impessoal, "nós" formal indevido).
- Léxico do assistente em vez do meu (ver lista na skill).
- Falta do movimento concessão-oposição em momentos argumentativos.
- Fechamento de seção fraco (com condicional, longo, com transição).
- Analogias compridas demais (devem fechar em 2 frases).

### Passada 3 — Padrões de IA

Use `humanizer`. Aponte:

- Travessões substituíveis por vírgula/ponto.
- Rule of three excessivo, paralelismos negativos.
- Vocabulário inflado, simbolismo vazio, atribuições vagas.
- Conjunções/pseudo-transições em excesso.
- Análises superficiais com "-ing" / gerúndio promocional.

### Passada 4 — Estrutura e padrões do projeto

- Front matter completo e correto (categoria válida, slug, description com gancho).
- Seções com 2+ parágrafos de desenvolvimento real.
- Frases soltas entre parágrafos eliminadas (salvo punch intencional).
- No máximo 2-3 blockquotes (`[!NOTE]`, `[!TIP]`, `[!IMPORTANT]`) cirúrgicos.
- Linhas <= 120 caracteres.
- Links internos onde fazia sentido.
- Encerramento circular quando possível.

## Regras invioláveis

- **Não reescreva o artigo.** Aponte problemas com sugestão concreta de correção (1-2 frases) por trecho.
- **Não invente problemas.** Se está bom, diga que está bom.
- **Cite o trecho exato** do artigo e (quando relevante) o trecho correspondente da transcrição.
- **Quando suspeitar de erro de transcrição**, mostre o trecho do artigo, o trecho original do áudio convertido, e pergunte qual é a versão correta.
- **Não comite nada.**

## Output

Devolva um relatório em markdown com esta estrutura:

```
## Resumo geral
[2-3 frases: como o artigo está no geral, o que é prioridade corrigir]

## Fidelidade ao material
- [Achados, com trecho do artigo + trecho da transcrição]

## Voz e fingerprint
- [Achados com sugestão de reescrita]

## Padrões de IA
- [Achados com sugestão de reescrita]

## Estrutura e padrões do projeto
- [Achados com sugestão de correção]

## Perguntas pra você
- [Dúvidas sobre erro de transcrição, lacunas, contradições não resolvidas]

## Veredito
[ pronto pra publicar | precisa de ajustes leves | precisa de revisão estrutural ]
```
