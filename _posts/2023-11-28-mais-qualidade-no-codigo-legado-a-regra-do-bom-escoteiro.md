---
layout: blog-post
date: 2023-11-28
permalink: /artigos/:categories/mais-qualidade-no-codigo-legado-a-regra-do-bom-escoteiro
title: "+ Qualidade no código legado: A Regra do Bom Escoteiro"
categories:
  - boas-praticas
tags:
  - boas-praticas
image: /assets/images/posts/escoteiros-card.png
description: "Manter a qualidade do código em nossos projetos é um desafio constante. À medida que o tempo passa, nosso código pode se tornar um verdadeiro emaranhado de funcionalidades antigas e mal organizadas, criando o que chamamos de 'dívida técnica' - um débito que, em algum momento, terá que ser pago."
---

> [!NOTE] 
> Uma estratégia prática para melhorar seu código legado!

## O famoso "legado"

Falar de código legado sempre desperta debates. Alguns dizem que é qualquer código que já não é novo. Outros definem
como o software antigo prestes a ser substituído, ou aquele sistema que ninguém quer mexer por causar dores de cabeça a
cada ajuste. Pode ser aquele sem documentação, ou até mesmo um código em uma versão desatualizada de uma tecnologia.

Tudo isso está parcialmente correto. Mas, para mim, código legado é algo mais profundo: é o código que carregamos sem
nunca "quitar" suas dívidas técnicas. São aquelas decisões rápidas ou mal planejadas que, com o tempo, vão acumulando
problemas. E isso é normal — afinal, quem nunca tomou atalhos? O verdadeiro problema está em nunca voltar para
corrigi-los.

Legado é aquilo que deixamos para trás, ignoramos, e que cresce como uma sombra até se tornar uma barreira.

### Mas legado é realmente um problema?

Durante uma palestra sobre modelagem de software, mencionei algo que sempre gosto de reforçar: sistemas são organismos
vivos. Eles mudam, se expandem, ou até encolhem conforme mais pessoas os usam. Só existem dois tipos de software que
nunca mudam: os que pertencem a nichos tão específicos que nunca precisam de atualizações, ou os que ninguém usa.

Sistemas em uso estão sempre em evolução. Novos insights, problemas e demandas surgem. Uma ideia na cabeça de um CEO ou
uma necessidade apontada por um usuário pode se transformar em uma funcionalidade inesperada, que nem sempre chega ao
time com a clareza necessária.

Essas demandas não planejadas acabam entrando no backlog e, com o tempo, uma funcionalidade que parecia pequena se
transforma em um Frankenstein de condicionais, fluxos alternativos e exceções. É aí que o código começa a gritar por
atenção. São alertas de melhoria de arquitetura, simplificação de lógica e otimização. Se ignorarmos esses sinais, o
custo técnico só aumenta.

### Lidando com o elefante branco

No início, essas "dívidas" podem ser pequenas, mas, se não forem pagas, tendem a crescer, tornando-se cada vez mais
difíceis de resolver. À medida que o software envelhece, os problemas de design vão se acumulando. É como uma dívida
financeira: se você não a paga, ela só aumenta com o tempo e os juros, tornando-se insustentável.

E qual é o grande desafio? Manter a qualidade do código e minimizar a dívida técnica. Isso significa que, enquanto
trabalhamos em novas funcionalidades, precisamos também priorizar a melhoria contínua do que já existe. Ao enfrentar
essas "dívidas", lidamos com mudanças estruturais e complexas que, se não forem abordadas, vão se tornar cada vez mais
difíceis e custosas de resolver no futuro.

## A Regra do Escoteiro

Toda essa discussão sobre código legado sempre me faz lembrar de uma frase que ouvi anos atrás: "Trabalhe no código como
se fosse um escoteiro, pois bons escoteiros sempre deixam o lugar mais limpo do que encontraram." Essa ideia ficou
gravada na minha mente, e no mesmo dia fui buscar entender melhor o que isso significava. É essa definição que quero
compartilhar aqui.

![escoteiros.png](/assets/images/posts/escoteiros.png?class=w-80 w-md-80 w-xxl-60)

### Uma abordagem simples, mas poderosa

Imagine-se como um escoteiro em um acampamento. A mentalidade de deixar o campo um pouco mais arrumado do que encontrou
é a mesma que podemos aplicar ao desenvolvimento de software. Não é necessário resolver todos os problemas de uma vez,
mas sim fazer pequenas melhorias sempre que possível.

Essa é a essência da *Regra*: sempre que você estiver mexendo em uma parte do código, deixe-a um pouco mais limpa do que
quando a encontrou.

Cada pequena melhoria contribui para reduzir a dívida técnica, como se fosse uma economia de refatoração. Em vez de
permitir que o código acumule "sujeira", estamos constantemente fazendo ajustes que mantêm o código mais saudável e
sustentável.

Essa mentalidade também promove o senso de equipe. Quando todos assumem o compromisso de deixar o código mais limpo, o
projeto ganha em qualidade e sustentabilidade. Um código mais organizado não só facilita a manutenção, mas também reduz
o estresse de quem trabalha nele.

### Como aplicar a regra na prática?

Podemos aplicar essa abordagem de diversas formas: utilizando princípios de *Clean Code*, Refactor, técnicas de *Object
Calisthenics*, os fundamentos do SOLID ou qualquer outra boa prática de desenvolvimento. O segredo não está apenas nas
ferramentas ou metodologias, mas na consistência em aplicá-las regularmente em cada entrega.

Aqui vão algumas dicas práticas para colocar essa regra em ação:

1. **Refatore enquanto altera**: Sempre que fizer uma mudança em uma classe, aproveite para aplicar técnicas de 
   refatoração. Isso pode incluir renomear variáveis, extrair métodos de funções grandes ou eliminar código duplicado.
2. **Mudanças pequenas, mas constantes**: O objetivo não é realizar grandes mudanças de uma vez só, mas fazer melhorias 
   incrementais e constantes. Isso ajuda a manter o código mais limpo sem impactar o cronograma de entregas.
3. **Promova o coletivo**: Quando toda a equipe adota essa prática, o código se torna progressivamente mais organizado, 
   sem necessidade de grandes esforços. Isso cria uma cultura de colaboração, onde todos são responsáveis pela qualidade 
   do código.

No final das contas, a Regra do Bom Escoteiro não é sobre uma grande revolução no seu código, mas sim sobre a soma de
pequenos esforços que, ao longo do tempo, fazem uma grande diferença.

Da próxima vez que você abrir uma classe bagunçada, lembre-se da Regra do Escoteiro. Faça uma pequena melhoria. Deixe o
código um pouco melhor do que o encontrou. O legado pode ser desafiador, mas com pequenas mudanças constantes,
conseguimos criar sistemas mais robustos e saudáveis.

## Por fim

Manter o código limpo e organizado não é uma tarefa fácil, especialmente em sistemas legados, mas é uma estratégia
essencial para garantir que o software se mantenha sustentável e fácil de manter. Ao adotar uma mentalidade de melhorias
contínuas, como a *Regra do Bom Escoteiro*, você estará garantindo que seu código evolua de forma saudável, sem acumular
dívidas técnicas que se tornem um pesadelo no futuro.

Então, da próxima vez que você precisar mexer no código, lembre-se de deixá-lo um pouco mais limpo do que quando o
encontrou. Isso não só melhora a qualidade do seu projeto, mas também cria uma cultura de cuidado e responsabilidade
compartilhada.

E você, já aplicou a Regra do Bom Escoteiro no seu código? Compartilhe suas experiências e dicas nos comentários!

> [!IMPORTANT]
> Este artigo começou como um tweet, foi transformado em um breve artigo no [dev.to](https://dev.to/douglasmedeiros/-qualidade-no-codigo-legado-a-regra-do-bom-escoteiro-e30) e agora chega ao meu
> blog como parte da minha iniciativa de reescrever, expandir e refinar meus textos antigos.
