---
layout: blog-post
date: 2024-10-24
permalink: /artigos/:categories/por-que-criar-um-blog
title: "Por que criar um blog?"
categories:
  - pessoal
tags:
  - pessoal
image: posts/notebook-cabos-e-cafe.jpeg
introduction: "Depois de muito tempo planejando e repensando, finalmente decidi lançar meu próprio blog. Aqui, vou reunir meus artigos, experiências e pensamentos sobre tecnologia, todos em um espaço centralizado e pessoal. Embora já tenha conteúdo espalhado em outras plataformas, sempre senti a necessidade de ter um lugar que realmente fosse meu."
---

## Olá, Mundo!

Finalmente saiu! Ah, fazia tempo que eu queria um espaço para postar minhas ideias – sejam artigos, experiências
profissionais ou reflexões sobre tecnologia. Já tenho material espalhado
pelo [Dev.to](http://dev.to/), [Medium](https://medium.com/), Twitter e sabe-se lá onde mais. Essas plataformas até são
boas (~~nem sempre na real~~), mas sempre me incomodou criar conteúdo em lugares que não controlo, que poderiam
desaparecer de uma hora para outra. Isso me deixou com aquela vontade de ter um cantinho mais pessoal. Claro, posso
continuar postando nesses sites para dar visibilidade, mas ter um espaço meu facilita tanto na organização quanto na
preservação do que produzo.

Esse blog nasceu dessa inquietação. Eu queria um lugar onde pudesse centralizar minhas ideias, onde nada se perdesse com
o tempo, e onde eu pudesse ser dono de cada detalhe. E cá estamos:
[_blog.douglasmedeiros.dev_](http://blog.douglasmedeiros.dev).

Ele é um subdomínio focado em troca de experiências e compartilhamento de conhecimento. Vou ser sincero, demorou mais do
que eu imaginava. Como bom back-end, não foi fácil definir o layout e alinhar as coisas. Apesar da lista de afazeres
ainda ser longa, eu sabia que precisava lançar o MVP do blog para poder começar a postar. Caso contrário, ficaria
empacado por mais um bom tempo.

![TODO do Blog](/assets/images/posts/blog-todo.png?style=height:25rem)

Para você ter uma ideia, criei uns 10 ou 15 layouts diferentes. E sempre chegava aquele momento em que eu simplesmente
não suportava mais olhar para eles. Começava do zero, mudava de ideia, ou, às vezes, só percebia que aquilo não estava
me agradando mais e partia para outra. Foi um ciclo que me forçou a parar e refletir: o que eu realmente queria? O que o
MVP precisava entregar para que eu finalmente pudesse começar a postar de forma estruturada? E aí veio o momento de
clareza. Entendi que perfeição poderia ficar para depois. Eu precisava focar no essencial para dar vida ao blog e só
depois ajustar os detalhes com o tempo.

Alguns rascunhos ficaram pelo caminho, mas no fim das contas, estou bem satisfeito com o resultado. Tem muito a
melhorar, claro, mas agora posso seguir ajustando aos poucos.

## Um Pouco da Arquitetura

Minha ideia desde o início foi manter tudo simples e eficiente. Então, usei ferramentas que já conhecia e outras que
queria experimentar. O principal era não gastar além do que já gasto anualmente com meu domínio, cerca de R$ 40 por
mês (até aumentarem).

Todo o conteúdo do blog, incluindo o código-fonte e os artigos, fica em
um [repositório no GitHub](https://github.com/medeirosinacio/blog.douglasmedeiros.dev), o que facilita, pois a cada push
uma nova release é lançada e publicada automaticamente no GitHub Pages, tudo sem custos.

Os artigos ficam em uma pasta separada, em formato markdown, o que permite escrevê-los no Notion, por exemplo. Quando
prontos, copio, colo em uma nova página com os metadados, e, com o push, a nova página fica disponível automaticamente.

O framework que escolhi é o Jekyll, uma ferramenta poderosa para automatizar a criação de páginas HTML estáticas no
repositório. Assim, posso criar componentes HTML, configurar paginação e compilar tudo em páginas estáticas, que são
cacheadas automaticamente pelo GitHub e pelo navegador.

Além do Jekyll, usei Bootstrap para o frontend, que ainda é minha primeira escolha (kk não fui aprender Tailwind-CSS).

O blog, sendo totalmente estático e sem back-end, não suporta funções como contadores ou comentários diretamente. Para
contornar essas limitações, busquei as soluções mais modernas ~~gambiarras~~ para possibilitar comentários, pois o que é
um blog sem feedback, não é? Para isso, utilizei o [**_utterances_** 🔮](https://github.com/utterance/utterances), um
projeto open source que integra as issues do GitHub às páginas do blog. Ao carregar a página, Utterances procura a issue
correspondente; se não encontrar, o bot cria uma automaticamente no primeiro comentário. Para participar, os usuários
apenas autorizam o app pelo GitHub OAuth ou comentam diretamente na issue. Esse sistema, além de prático, permite um
design limpo e automático, usando o GitHub como banco de dados para os comentários.

## No Horizonte

Nos próximos dias, pretendo migrar meu conteúdo que está espalhado por outras plataformas para cá. Alguns posts podem
parecer "repetidos", mas vou aproveitar essa migração para revisitar, ampliar e dar uma cara nova ao material, criando
um senso de exclusividade para quem acompanha o blog. Por enquanto, este é apenas o post de introdução, mas se você
chegou até aqui, meu muito obrigado por dedicar um pouco do seu tempo a esta leitura.

Nos vemos nos próximos posts! 🚀
