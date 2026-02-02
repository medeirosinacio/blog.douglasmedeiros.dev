Douglas Medeiros Inacio - Autópsia de um Banco de Dados de Alta Performance
0:03
Aí tá aparecendo aí? Tá sim.
0:06
Boa. Bom, e aí pessoal, boa tarde. Para quem ainda não disse boa tarde. E vim
0:11
trazer uma um assunto bem bacana, pelo menos do ponto de vista de quem gosta um
0:16
pouco de banco de dados, né? Sou meio suspeito para falar porque eu acho se eu
0:19
não fosse um desenvolvedor PHP, eu ia ser um desenvolvedor, um DBA, porque eu
0:24
gosto muito de banco de dados, eu gosto muito da arquitetura, de como um banco
0:27
de dados funciona e a forma que a gente consegue trabalhar ele para vários
0:31
cenários diferentes, né? seja fazer uma fila no banco de dados, trabalhar com
0:36
com API diretamente no banco, enfim, o banco de dados é uma ciência parte que
0:40
dá para ir para muitos lugares e entender como essa ferramenta funciona a
0:44
fundo faz com que a gente desenvolva softwares melhores, né? Então essa tal
0:48
que eu escrevi no ano passado, eu apresentei lá no Pegapest do ano passado
0:53
e tô trazendo aqui para Wekley agora. Ela é um pouquinho extensa. Eu até acho
0:57
que ela é extensa demais, talvez porque a gente brincou de workshop, mas se eu
1:00
não conseguir falar tudo, eu vou passar aí alguns tópicos rapidamente ali
1:03
também. A gente pode tirar dúvida no off depois, não tem problema. mas é passar
1:07
uma visão assim pelo menos da experiência que eu tive com o banco de
1:10
dados e tudo que eu aprendi e acho de essencial que a nossa área e os nossos
1:15
projetos têm que ter para trabalhar no dia a dia. Então a ela essa tal que ela
1:19
vai se concentrar muito nesses conceitos que eu acho importante pra gente e no
1:23
que eu apliquei aí no no dia a dia, seja aqui no PicPay ou em outros projetos que
1:28
que eu já atuei. Beleza? Então, né, só me apresentando
1:33
rapidamente para quem ainda não me conhece, eu sou o Dougle, sou Douglas
1:36
Medeiros aqui desde 1993, sou gaúcho da cidade de Cachoeirinha, que é uma região
1:41
metropolitana aqui de Porto Alegre. Então, moro pertinho aqui da capital,
1:45
essa capital que não tem praia, então e os 34º tá agora é bem tenso, que é muito
1:50
quente, né? Então, mas a gente vai sobrevivendo como pode. Eu sou Techad e
1:55
aqui do time de integridade transnacional. Cuido aqui principalmente
1:58
dos sistemas do escutativo e sentinela. Sou PHP chapter lead aqui também desde o
2:03
ano passado que a Jaí passou bastão para mim. Então tento fazer um acompanhamento
2:06
mais de perto aqui com a comunidade, ajudando sempre no que eu posso aqui
2:10
dentro. Ã, tô lá no sheer também, aquele metal. Para quem gosta dessa rede tóxica
2:15
aqui, eu tô lá também. Então, às vezes, eh, compartilha ali o que eu tô
2:18
estudando, alguma coisa que eu tô vendo. Ã, tem bastante criadores de conteúdo lá
2:22
dentro também que fazem artigos bem bacanas lá dentro do Twitter, então é
2:26
legal de acompanhar também. Então, quem tem o arroba aí e costuma acompanhar a
2:29
rede, eu tô lá também. Ah, tem o meu blog, blog.douglasmedeiros.dev,
2:34
onde eu escrevo o que eu tô estudando, impressões sobre eventos que eu tô ou
2:38
alguma outra coisa assim, sites, carreira. Então eu pratico a escrita
2:43
também que eu acredito que escrever é uma forma de eu fixar muito conteúdo.
2:47
Então eu comecei escrevendo muito assim, né? Pô, tô estudando algo novo e não
2:51
quero perder esse conteúdo da minha cabeça. E eu esqueço muito rápido, né?
2:54
Passou dois meses, eu não usei aquele framework com aquela ferramenta, eu
2:57
acabo esquecendo. Então escrever sobre isso faz com que eu volte meus artigos e
3:01
relembre o que eu estudei. Então é uma forma também de eu me manter ali sempre
3:04
com aquelas memórias mais documentadas. Então, uso o blog bastante para isso.
3:09
Ah, tirando essa questão mais profissional, né? Gosto muito, essa é a
3:12
minha família, a IS e a Lulu, a gente gosta muito de viajar, vai bastante ao
3:16
cinema, eh, gosta bastante de games, então games de todo tipo, né? Então,
3:20
ontem a gente tava jogando Bomberman e depois a gente foi jogar dama, então a
3:24
gente tá sempre jogando alguma coisa que seja online ou físico, né? A gente gosta
3:28
bastante. Participo também da comunidade ali de tecnologia, seja de PHP, tec em
3:33
geral. Então, costumo fazer hã fazer palestras em eventos, né? Ano passado eu
3:38
palestrei em cinco eventos. Esse ano eu quero ver que eu se consigo não dobrar
3:42
essa meta, porque 10 eventos é bastante coisa, mas continuar nessa média de
3:46
eventos, né? que eu conheço bastante gente [ __ ] nesses eventos e consigo
3:49
aprender bastante também, porque é uma troca ali bem sincera e bem legal de
3:53
conteúdo. Então, para quem não vai em evento de comunidade, recomendo bastante
3:57
vocês acharem o evento. A maioria das capitais tem eventos, então procurem aí
4:01
a sua comunidade e interaja, né? É muito bacana para esse para compartilhar esse
4:06
conhecimento. O que a gente tá fazendo aqui é comunidade também, né? Então a
4:09
gente é comunidade de desenvolvedores PHP de dentro do PICPay que se reúne
4:13
aqui para ã ã compartilhar conhecimento. Então isso é bem legal. Para quem é do
4:18
Sul, tem o PHPRS, que é a comunidade que eu faço parte aqui no Sul, a gente
4:22
organiza alguns meetaps aí pelo ano, compartilhando conhecimento com
4:25
desenvolvedores locais, certo? E também opence, sempre que eu tenho tempo, acho
4:29
um bug ali, alguns projetos, costumo contribuir também. Então tem alguns pers
4:33
meio soltos no Sfoney, no Larv em alguns outros projetos aí
4:37
pela web à parte. Disclaimerzinho rápido. Eu não sou DBA,
4:44
né? Então não sou especialista de banco de dados. Então eu sou só um
4:47
desenvolvedor aí que trilhou a carreira resolvendo vários problemas de banco de
4:51
dados que muitas vezes o DBA ou não conseguiu atender no momento, ou tava
4:55
ocupado ou tava fazendo outra coisa, ou não tinha DBA em muitos lugares. Então
4:59
eu sou esse dev que teve que entrar a fundo em várias questões para tentar
5:02
resolver. E eu vou compartilhar aqui um pouco de toda essa história e do que eu
5:06
descobri nesse meio do caminho que eu acho importante, né? Então o o início de
5:10
tudo, né? Eu e um banco. E cara, o meu primeiro contato com o banco foi logo no
5:16
início da carreira, porque eu trabalhava numa empresa onde só era eu e um outro
5:20
colega, então era uma do KIP e a gente fazia tudo, né? desde configurar o DNS,
5:24
configurar servidores de rede, a subir um Apache com PHP, configurar lá e e
5:29
subir um MySQL na mão e depois configurar esse esse MyScell para fazer
5:33
backup via Chrome, sabe? Então eu tive essa oportunidade de trabalhar de ponta
5:37
a ponta nos projetos e isso fez com que eu conhecesse muito
5:43
de infraestrutura, rede e bancos de dados, né? E desde essa época a gente
5:47
trabalhava numa provedora, tinha um serviço lá que registrava o consumo de
5:52
velocidade que os clientes usavam na internet. E quem fazia eh quem guardava
5:57
essas informações eram posteries. E isso era atualizado a cada segundo. Então, se
6:02
eu uso 1 me agora e daqui a 1 segundo eu uso 3 me, daqui a 4 segundos eu uso mais
6:06
1, todo segundo eu tô atualizando quanto de rede eu tô consumindo de upload e
6:12
download. A gente tinha mais ou menos na época 10.000 1000 clientes. Então,
6:15
imagina que esses 10.000 clientes conectados à internet, a gente recebe
6:18
atualizações uma vez por segundo de cada um deles de recurso de banda. E quem e
6:23
quem pegava isso, né, e quem conseguia salvar isso era um posters. E naquela
6:28
época eu ficava impressionado com isso, tá ligado? Porque, cara, como a gente
6:32
trabalhava num sistema muito legado, era um my sequel na época, era era uma kelle
6:37
e cara, as carriers eram feitas navio, sabe? tinha um HTML, o HTML fazia um
6:41
select usuário, pegava o ID global da sessão e fazia car no banco. Então era
6:46
tudo mal otimizado. E olhar aquele post recebendo aquele quantidade de
6:50
requisição, cara, foi algo que brilhou meus olhos, sabe? Falei: "Caramba, mano,
6:53
o banco é muito mais que isso, sabe? Um banco bem configurado, bem planejado,
6:57
não é isso aqui que a gente tá trabalhando agora, sabe? Ele pode ser
7:00
muito mais que isso." E desde aí eu tive esse, a, entre aspas, né? Assim como eu
7:05
tive por por PHP, mas eu tive esse amor pelo banco de dados. eu olhei aquilo
7:09
como uma [ __ ] ferramenta para nos ajudar no dia a dia ou nos nossos projetos.
7:14
Então, foi assim que eu comecei a minha visão com o banco de dados ali. E para
7:19
dar um contexto hoje, né, do projeto aqui, que a maioria dessas técnicas que
7:24
a gente usou aqui eu posso falar, né, eu botei aqui mais agnóstico, porque como
7:29
apresenta essa tal que em outros eventos a gente não pode falar exatamente do que
7:32
se trata, mas aqui eu tô falando sentinela, né? Então, quando a gente
7:34
projetou o Sentinela aqui no Integridade Transacional, a gente tinha isso em
7:39
mente, né, que o Sentinela ele era um banco de dados, ele é um sistema que tem
7:43
um banco de dados e esse sistema iria receber eventos transacionais de todos
7:47
os serviços do PicPay. Essa é a meta dele. E para cada serviço novo que a
7:52
gente ia incluindo, a plataforma iria crescendo exponencialmente, né? Então,
7:56
pô, no começo era só o Core transacional, depois era o Core Wallet.
7:59
Core Wallet, plataforma de cartões. Core Wallet, plataforma de cartões. Agora tem
8:03
boleto, cashback, a gente tem, ã, ali, tem lá o pessoal de Pix Cashin, Pix Cash
8:10
out, ã, portabilidade de salário e outros aqui que eu que eu esqueci com
8:14
certeza. Mas cada serviço que a gente vai integrando vai aumentando, porque a
8:18
gente lê basicamente quase todos os eventos desses serviços para
8:22
internamente a gente cruzar esses eventos e entender se aquela transação
8:25
tá íntegra ou não. Então, dado esse contexto lá atrás que a gente teve, a
8:29
gente se viu que, pô, a gente tem que ter um planejamento para banco de dados,
8:33
a gente tem que planejar bem nosso banco de dados, porque não vai escalar se a
8:36
gente fizer uma carry mal otimizada, se a gente não fizer uma modelagem bem
8:40
feita, se a gente não usar técnicas corretas de banco, o sistema não vai
8:43
escalar como a gente quer e vai ser um problema lá na frente, tanto de custo,
8:47
porque a gente vai ter que usar uma máquina, a maior máquina da WS, sendo
8:50
que não precisa, que talvez a maior máquina é porque o nosso sistema é mal
8:54
otimizado, ou seja, porque vai ser ruim de dar manutenção, de adicionar novas
8:58
features. Então esse era o contexto que a gente tinha no início de sentinela,
9:03
né? E por isso que várias técnicas que eu vou estar falando aqui foi aplicada
9:06
desde o começo para fazer com que ele fosse um banco performático, né, a nível
9:11
de sistema, assim, porque ele se propunha a fazer.
9:16
A escolha que teve ali foi Posters. A gente fez uma um estudo aqui
9:21
internamente ã para entender qual banco era melhor ali no cenário do do
9:26
Sentinela, né? Então, a gente fez alguns benchmarks e notou que novos benchmarks
9:30
locais que a gente fez ã tanto o Mykell quanto o o PG tinha ali uma performance
9:37
equivalente, então eles não tinham muita diferença, mas em recomendações tanto da
9:42
web quanto da própria WS eles diziam que para um banco otimizado à escrita, o
9:48
essencial ali fosse um Postgers e não uma SCL. Então foi uma das coisas que a
9:52
gente levou em conta também. Outra coisa é que posts ele tem algumas
9:56
funcionalidades um pouco mais avançadas que o maisk em questões a
10:00
particionamento de dados, a a questões de tipos nativos que alguns Mycell não
10:05
tem, a instruções avançadas como como fazer um up insert. Então, pô, eu não
10:09
preciso fazer um select no banco, vê se meu dado existe, se o dado existe, eu
10:13
atualizo. Se não existe, eu faço insert. São três operações quase ou duas que eu
10:18
tenho que fazer. O post nativamente ali ele consegue fazer instruções de upert,
10:23
o que facilita a nossa ingestão de eventos, porque não precisa fazer várias
10:26
consultas. Então essa é algumas das coisas que fez. A gente escolheu o
10:30
Posters, mas toda documentação e estudo tá no confluence lá do time do
10:34
integridade para quem quiser dar uma olhada. Mas a gente escolheu justamente
10:37
por causa dessas funcionalidades e algumas outras coisas que iriam
10:40
facilitar pra gente. E desde o começo tudo era planejamento, né? Então, pra
10:44
gente construir um sistema de alta performance, a gente precisa planejar
10:47
desde o início. Não adianta a gente só tocar as coisas ali e no meio do caminho
10:51
tentar mudar. É muito mais custoso, né? Porque o sistema já vai est engessado em
10:54
certas coisas, em certas decisões de arquitetura que a gente decidiu lá
10:58
atrás, que vai ser muito difícil mudar. Então, ter um tempo para ter um tempo
11:04
para planejar com calma essas coisas é muito importante para um banco de dados
11:09
de alta performance, né? a gente chegar num sistema que tem um banco de dados
11:12
que que consiga aguentar muita porrada ali em produção e não dá muito problema
11:17
em questões de aumento de volume ou trocas ali de contexto que o banco
11:21
tiver. E aí esse planejamento entra no beabá
11:26
sobre banco de dados, né? O que que a gente como desenvolvedor deveria saber
11:31
sobre banco de dados quando vai criar um sistema ou quando vai criar uma tabela,
11:34
sabe? ou quando vai modelar um campo novo, pô, eu vou criar uma coluna nova
11:38
no meu banco. Que que a gente precisa saber? Certas coisas aqui dentro eu
11:42
também não sabia e fui descobrir e hoje eu assumo como babá, porque, pô, isso
11:47
aqui era essencial eu saber antes, porque não saber disso me traz problemas
11:50
lá na frente, porque são coisas que parecem óbvias, mas não é. E aí, ah, a
11:56
gente vem que esse bebai é mais do que nomenclatura, né? Porque a gente, não
12:01
sei se quem já trabalhou aqui com muitos bancos legados, mas, pô, eu já trabalhei
12:03
em bancos que todas as tabelas tinha prefixo tabela, tabela underline, alguma
12:08
coisa. Pô, eu tô num banco, eu tô num esquima e eu tenho uma tabela e todas as
12:12
tabelas sem tabela, sabe? Então tem guias e boas práticas de nomenclatura de
12:17
coluna, nomenclatura de de tabela, nomenclatura de índex, mas é mais que
12:22
isso esse beabat, né? a gente entra nas boas práticas que a gente tem que fazer
12:26
mesmo. A primeira delas é o básico, eu acho que é que todo mundo já ouviu falar
12:30
isso em alguma vez, que é evite select tudo, né? Porque selecte tudo vai fazer
12:34
que tu selecione todas as tabelas, todas as colunas do teu banco naquela
12:39
consulta. Isso pode ter vários efeitos colaterais, né? Quando a gente chega num
12:43
DBA com problema de carry, a primeira coisa, eu acho que muitos aqui já
12:46
passaram, a primeira coisa que ele pergunta se tiver isso aqui é: "Pô, não
12:49
faz select tudo, tá ligado?" Daí a primeira coisa, mesmo que esse não for o
12:53
problema, o DBA ele vai apontar isso, porque a nível de a nível de alta
12:58
performance é um problema de selecionar tudo. No sentinela, por exemplo, a gente
13:02
não busca no banco o created jet, nem o update jet. Por quê? Porque a gente não
13:07
usa essas colunas na aplicação. Por mais que a gente, entre aspas, estrague um
13:11
pouco a modelagem, porque, pô, o meu Created Jet no banco de dados, ele é uma
13:16
ele é uma coluna required, not new. Então ele existe, mas dentro da minha
13:21
aplicação, o campo na minha entidade é nulable. Pô, é estranho, né? A entidade
13:26
do código é nulable, mas no banco ele ela é obrigatória. Isso é é um tradeoff,
13:32
sabe? Pô, para não trazer campos que eu não vou usar na minha entidade, eu deixo
13:37
nulable e eu faço outras formas de validar isso quando eu preciso. Se não
13:41
precisa, esse dado nem precisa estar na entidade. Ele pode ser somente
13:45
cadastrado ali automaticamente no banco ali quando fizer o insert, por exemplo,
13:49
ou update e nem vim pra tua aplicação ã para popular tua entidade. Então, eh,
13:54
fora isso, né, essas questões de de não trazer de de ficar diferente a
13:59
modelagem, a gente ganha com algumas coisas, porque quem quem aqui não tem
14:03
uma tabela que tenha mais, sei lá, de 10 colunas, 20 colunas e quanto e todo ano
14:08
que passa sempre tem uma coluna mais, né? Sempre diz: "Pô, essa é a última
14:11
coluna, daqui não sai". E aí do nada surge um campo novo, pô, isso aqui vai
14:14
ter que ser uma coluna e vai indo, vai crescendo, a tabela vai crescendo e a
14:17
tabela ali fica lá com 20 colunas, 30 colunas. Já peguei tabelas com 100
14:22
colunas de banco de dados, sabe? Imagina tu fazer um select de tudo para isso. É
14:26
muito ruim paraa aplicação, porque tu vai tá trafegando muito mais dados na
14:29
rede do que deveria. Então, um payload que poderia ser menor, porque às vezes
14:33
tu vai só vai usar o ID e o status, tu tá pegando todos os 10, 20 campos que tu
14:38
precisa. Então, eh, a gente consegue, sabe, tem esse
14:43
tradeoff, eu sei que às vezes é ruim ali o nosso objeto de valor, a nossa
14:46
entidade ter campus nulable, sendo que não deveria, mas a nível de performance
14:50
é melhor, porque a gente traz menos recur menos dados pra aplicação e as
14:55
requisições de redes ficam mais rápida pelas requests serem menores, certo?
14:59
Então é uma coisinha aí que a gente vai aprendendo conforme vai utilizando,
15:03
utilizando bancos com altos fluxos de dados.
15:07
Índices corretos também é super importante, então usar índices nas
15:11
colunas que vocês fazem as ã os filtros, né, principalmente no usar. Então, pô,
15:16
se eu faço muito wear em status, se eu faço muito wear em ID de usuário, se eu
15:21
faço muito weare em orange, nesses campos, é ideal ter índices, né? Claro
15:25
que muitos índices também é ruim e nenhum índice também é ruim. Então tudo
15:29
vai aquele tradeoff ali de avaliar o que o que é bom para aquele contexto, né?
15:33
Mas as colunas que vocês mais fazem filtros, é o ideal ali ter os índices
15:37
corretos ali para conseguir filtrar melhor aqueles dados. O o famoso uso do
15:42
RM, né, que é um ponto polêmico aí, tem gente que ama, tem gente que odeia. Hã,
15:46
ele é muito bom para quando tu for fazer coisa simples no código, porque ele
15:49
facilita bastante a construção de carries, mas ele dificulta bastante a
15:53
otimização ou esconde problemas reais ali quanto faz unions, quanto faz joins
15:58
dentro de ORM, porque cada ORM vai fazer às vezes um union ou um join de uma
16:03
maneira diferente. Ou ele vai fazer uma subcarry, ou ele vai fazer um join
16:06
diretamente na consulta, ou ele vai criar uma view temporária para guardar
16:11
esses dados e depois cruzar. Cada ORM tem sua maneira de fazer. E isso às
16:15
vezes é um pouco ruim no no ponto de vista do desenvolvedor,
16:20
porque a gente não sabe exatamente como é que ele tá fazendo aquilo por baixo.
16:23
Então, pô, se eu vou fazer um insert, um update, eu acho que é razoável fazer com
16:27
RM, é mais rápido, é mais prático, mas, pô, eu vou querer fazer o up insert ali,
16:31
eu vou querer fazer um join cruzado com uma outra tabela e o resultado dessa eu
16:35
vou cruzar com uma terceira tabela ainda. O ideal talvez seja fazer carry
16:39
na mão mesmo para tu ter certeza do que tá sendo escrito no banco de dados e
16:43
conseguir testar performance. Então eu não gosto de dizer que algo é ruim ou
16:46
bom. Eu acho que tudo tem meio termo nessa vida, né? Não existe bala de
16:49
prata, mas é isso. OMS tem seus casos de uso. Vai ser, vai ter casos que vai ser
16:54
muito mais rápido e tá certo, mas vai ter casos que, pô, aqui não convém o RM,
16:58
eu vou ter que fazer uma carry na mão. E é isso, sabe? Faz na mão ali e testa a
17:01
performance para saber se é o melhor dos casos. Então, usem com cuidado.
17:06
Ã, multicarries, né? É uma coisa que a gente tem que cuidar também, porque os
17:10
joins eles podem piorar algumas consultas. Então, às vezes vale mais a
17:14
pena tu fazer uma consulta, guardar ela num arrei em memória e fazer uma segunda
17:20
consulta que cruze com esse arrei do que fazer uma consulta, uma consulta com
17:24
join depois. Então, dependendo ali de como for a sua a sua carry ou o que você
17:29
tá querendo buscar, é mais fácil fazer duas consultas e cruzar elas do que uma
17:33
consulta só com join. Eu acho que deveria trazer exemplos, né, nessas
17:37
nessas coisas que eu tô falando. Se não ficar claro, desculpem, tô tentando ser
17:40
o mais claro possível, mas como é são bastante termos, assim, eu espero que a
17:43
maioria esteja um pouquinho familiarizado com join, com union, né,
17:47
com selects, que eu vou passando mais rápido.
17:50
Orderby é um grande vilão também, porque o order buy, pô, se tu faz um select lá
17:56
por status e aí faz um order buy por por ordem decrescente, por exemplo, cara,
18:02
ele vai pegar todos os dados do banco, ordenar primeiro para depois fazer o
18:07
filtro, sabe? Isso muitas vezes vai degradar muito a performance e às vezes
18:11
esse order buy vai ser feito só na aplicação para, sei lá, ordenar ali e o
18:15
primeiro e último pagamento ou, sei lá, o último ou primeiro usuário de uma
18:19
tabela. Então, às vezes é muito mais vantajoso fazer o order buy na aplicação
18:24
em tempo de execução dentro da collection do que mandar esse order buy
18:28
ser feito pelo banco, tá? Porque o banco ele pode degradar muita performance
18:33
fazendo sorting lá, porque muitas vezes ele tem que vai ter ele vai ter que
18:35
fazer o sorting da tabela inteira para depois filtrar tua cláusula. E se essa e
18:41
se esse campo de order by não tiver index é pior ainda. Então eu já a gente
18:45
já pegou problemas aqui dentro que o problema era só o order buy, só isso. A
18:49
gente tirou o orderby da consulta, a consulta melhorou 10 vezes, porque o
18:53
orderby é que tava ordenando gigas e gigas e gigas de de dados dentro do
18:58
banco. E na aplicação a gente só queria fazer o orderby para filtrar um
19:02
registro, sabe? Então tomem cuidado com ordery porque ele pode ser uma pegadinha
19:06
ali eh no meio dele. Tomem cuidado também com updates e e
19:12
index, né? Porque eu falei lá atrás que fazer índice é muito legal e é muito bom
19:17
para essas questões que vocês têm campos ali que vocês filtram bastantes, mas
19:21
lembrem que quando você faz um update num registro e se ele tiver um index
19:26
atrelado, ele tem que atualizar um index também. Então ele vai ali, não é
19:30
exatamente duplicar aquele update, mas ele vai ter um tempo a mais. É diferente
19:34
tu fazer o update num registro que não tem index do que tu fazer um o update
19:39
num registro que tem um index ou update num registro que tem 10 index, sabe? Tem
19:44
bancos que t mais de 10 index. Então cuidado com updates index, sabe? Porque
19:48
vai aumentando ali o tempo ali de updates desse registro, quanto mais
19:53
índice a aplicação tem. Enuncio como texto, né? Então eu não sei
19:59
quem já teve esse problema aqui, mas em algumas versões mais modernas do banco
20:03
tem uma coluna chamada Enum. Aí o cara olha lá e fala: "Caramba, tem uma coluna
20:07
Enum. É genial, vou fazer isso". Aí tu vai lá e coloca lá que o enum lá de
20:12
status é esse. Isso tem um problema porque ele ele gera um overhead no
20:16
banco. Ã cada vez que tu insere o registro novo
20:22
naquela tabela, o o banco de dados ele vai validar se aquele Enum é válido ou
20:27
não para aquele campo. Beleza? Até então, quando tu tem campos ali
20:31
pré-definidos e nunca vai mudar, funciona. Só que quando tu tem campos no
20:35
formato status, no nosso caso sentinela, ali, tem regras. ou tipos que costumam a
20:41
crescer eh tipos ou microsserviços ou meio de pagamento conforme a aplicação
20:46
cresce. Para cada vez que eu tenho que fazer um alter table nesse campo, é
20:51
muito custoso, né? Então pensa que uma tabela de sentinela lá pode ter alguns
20:55
terabyte de dados e eu fazer um alter table numa coluna dessa para adicionar
20:59
um método de pagamento novo numa coluna é inviável, porque esse alter table vai
21:02
ter que percorrer esses terabytes aí para conseguir mudar esse tipo da
21:05
coluna. Então é muito melhor a coluna ser um varchar e aí a aplicação é que
21:11
valida para mim se aquele enum é válido ou não, do que eu deixar o banco de
21:14
dados validar isso, porque vocês podem sofrer muito para fazer alter table
21:18
quando eu tiver que incluir um enum novo nessa coluna, porque a tabela pode estar
21:22
muito grande e aí esse alter table vai ser custoso nessa tabela, sabe? Então
21:27
muito cuidado quando forem usar colunas de anuns, porque a gente pode ter
21:30
problema ali com altos valores, tipos corretos, né? garantem ali melhor,
21:36
as melhores buscas e funcionalidades do banco ali, se a gente conseguir armaar
21:40
data no tipo correto, o ID, se é um campo de botar de então beabá também de
21:46
banco de dados e cuidar com conversões que é outra pegadinha que tem em banco
21:50
de dados, né? Muitas vezes, sei lá, a gente quer fazer uma pesquisa e o campo
21:54
que tá no banco é em minúsculo e o que a gente tá quer pesquisar tá em maiúsculo.
21:59
A gente vai lá e faz um tocha ou um ou um toper para mudar aquele registro
22:05
dentro da cláusula. Só que isso faz com que o banco ele execute essa
22:09
transformação em cada linha que ele vai percorrendo. Isso é muito custoso pro
22:13
banco. Então o ideal é tu faz tentar fazer o filtro sem essas conversões de
22:18
tipos e na aplicação tu converter isso ou converter isso de alguma forma antes
22:22
de fazer de fato o filtro do a isso pode degradar muita performance, sabe? Porque
22:27
pô, tu tá fazendo uma conversão de tipo filtrando ali terabyes de registro,
22:33
sabe? Isso não é viável. Então é melhor tu, pô, ã, tenta fazer ali o air com um
22:38
filtro diferente do que tu quer, né? No caso, pô, se tá em minúsculo, faz em
22:42
minúsculo. E na aplicação tu coloca ali maiúsculo, né? Tem alguns outros tipos
22:46
também, tem gente que vai procurar por ano e aí trunca, data somente o ano, mas
22:50
pode ter alguns problemas em relação a isso. A ideia aqui mais é tomar cuidado
22:53
quando eu tenho que converter eh valores dentro de cláusula, porque pode fazer
22:58
com que o banco perca muita performance quando ele tá passando por esses
23:02
registros. E cara, é um mundo à parte, né? Isso
23:05
aqui foi um uma pincelada sobre boas práticas ali, que eu acredito ser boas
23:10
práticas, mas a gente pode entrar muito mais a fundo aí com tabela CTS, com
23:16
bloqueios e dead locks, com story procedures que muita gente odeia e tem
23:20
gente que faz o sistema inteiro em story procedures, sabe? Então tem muitos
23:24
tradeoffs e nesse mundo de banco de dados e tem muita coisa que a gente pode
23:28
se aprofundar para ganhar performance, né? Então, vale a pena se aprofundar,
23:31
caso você tenha alguma questão ali que esteja impactando ou queira conhecer
23:35
mais ali para melhorar o sistema no geral.
23:40
Eu acredito, né, depois de sei lá, 11 anos na área, eu acredito que isso é o
23:45
mínimo que um dev teria que saber para criar uma modelagem de dados, sabe?
23:49
Porque questão de colunas, tipos, forma de fazer um wear, índices bons, eu acho
23:53
que é o ideal assim pra gente ter sistemas aí que que aguentem o tranco aí
23:57
a longo prazo ou tenha anos aí com com bastante eficiência e não dê muitos
24:03
problemas aou dores de cabeça no futuro. Mas a gente entra num outro ponto que é
24:08
o mundo quântico da engenharia de software, né? Então, a gente sempre ouve
24:12
falar que no mundo quântico a física funciona um pouco diferente do que na
24:16
física eh na física tradicional, né, que as coisas não funcionam exatamente como
24:20
deveriam lá e que é um mundo à parte ali o essas regras do mundo quântico. E eu
24:25
faço essa brincadeira aqui porque tem coisas que a gente acredita também que é
24:29
contrainttuitivo, né? Quando a gente vai e vê na prática fica contrainttuitivo
24:32
dentro do banco de dados. Então o paradoxo o paradoxo do cash que atrasa,
24:38
né? Então a gente tinha um sistema lá, né? que recebia muitas requests. Eu acho
24:42
que eu já falei isso aqui algumas vezes na weekly, talvez, mas, pô, a gente
24:45
tinha um sistema que, cara, fazia muita request, né? Era o próprio sentinela e a
24:48
aplicação recebia essas request, guardava o ID dessa request no cash e
24:53
salvava no banco. E a gente tá falando aí com de 3.000 requisições por segundo,
24:57
né? 3.000 inserts por segundo ali para mais.
25:01
E a aplicação rodava assim, pô, peguei uma aplicação, guardei no banco, guardei
25:05
no cash. O cash ele servia como potência para não fazer com que a gente
25:10
inserisse esse registro duas vezes ou sei lá, a gente não batesse no banco
25:14
duas vezes, sendo que não precisa. Pô, é óbvio, o cash ele é muito mais rápido
25:18
que o banco. Por que que eu vou bater no banco duas vezes se eu posso bater no
25:21
cash? É, é óbvio, né? Pelo menos para mim era óbvio, mas não era bem assim. A
25:27
gente foi ver através de traces do Drace e foi analisar a nossa request e a gente
25:33
entendeu que esse fluxo, o gargalo, o ponto mais alto de latência, e era uma
25:39
latência de microssegundos, mas era a latência mais alta era do cash que era
25:44
um redis. Então, se a gente tirasse o redis do meio e deixasse o banco de
25:48
dados absorver essa request e a chave única dele barrasse se fosse igual, era
25:53
mais performático do que deixar um cash no meio. E foi isso que a gente fez. E
25:58
para otimizar, a gente fez um cash em memória, porque ele não iria no redis,
26:02
né? Ele não bate no redis, ele faz um cash local ali em memória durante 5 a 10
26:07
minutos e bate somente no banco. Então isso para nós foi contrainttuitivo no
26:13
começo, porque, pô, a gente sempre ouve falar e é meio errôneo a gente só
26:17
aceitar isso como verdade, que bota um cash que resolve, mas no nosso caso não
26:20
era o cash exatamente que resolveu, sabe? A nossa aplicação precisaria deais
26:25
porque o nosso maior gargalo foi a latência de rede do redis. A gente o que
26:29
que fez? Cortou a latência de rede do redis. Botamos um cash memória,
26:33
aumentamos ali 100 M de memória do podió a mais do pod e deixamos ali o cash
26:39
memória e o database resolver essa questão para nós formar esse
26:42
performático que funcionou. Então cada cenário é um cenário. Então nunca pode,
26:46
a gente nunca po deve, né, pegar, pô, fulano, aquele time fez de tal jeito, eu
26:51
vou usar desse jeito, porque é assim que eles usaram. Não é assim que funciona.
26:54
Cada projeto tem seu escopo, tem seu contexto e cada um vai ter seu caso de
26:58
uso. Então, vale a pena a gente mensurar. Eu tô aqui só compartilhando o
27:00
que resolveu para nós e talvez tenha algum insite aí e um e algum de vocês
27:04
que pode resolver também. A velocidade inimiga da replicação, né?
27:10
Lá no começo da sentinela a gente tinha dois bancos, o de escrita e o de
27:13
leitura. Então às vezes as coisas é óbvio, né? Então, pô, a gente quer um
27:18
banco de alta performance. Vamos fazer aqui uma instância que só recebe escrita
27:22
e a outra que só devolve a leitura. Assim a gente consegue separar a nossa
27:26
carga de rede aqui e o as as réplicas ali da WS ficam replicando esses dados
27:33
de um pro outro, né? Só que quando a gente colocou o Sentinela em produção, a
27:37
gente viu que isso não foi viável, porque o banco, o Sentinela, ele ele
27:42
cadastrava tanta, tantos eventos em tão pouco tempo, a massa, o volume de dados
27:48
era tão alto que o nosso banco aqui de leitura ele tinha leg. Então a gente
27:53
cadastrava algo aqui num um microssegundo depois chegava outra
27:58
request aqui ou já tava em memória no pod e ele batia aqui em leitura porque
28:03
era um select, por exemplo, né? Então chegava o insert e depois chegava o
28:06
select. Esse select que chegava aqui, logo depois desse aqui, ele já não
28:11
existia o dado aqui, porque não deu tempo da WS replicar esse dado. E a
28:15
gente esse problema e aí a gente teve esse problema
28:20
e cara, como é que a gente resolve isso, né? Pô, o banco de dados tá com
28:24
legitura. A gente vai ter que atrasar a aplicação, a gente vai ter que bater no
28:28
banco de escrita. Pô, e na primeira medida paliativa a gente batia aqui. Se
28:33
não existia aqui, a gente batia aqui, ia direto no descrita. Mas a gente tava
28:37
fazendo duas request, né? O que era para ser uma requestira duas, porque a
28:40
maioria eh dos dados que a gente consultava ainda não tava no de escrito,
28:44
tava só de leitura. Daí o que que a gente fez? Tiramos, a gente dobrou nossa
28:48
máquina de escrita, né? Então ela era uma máquina lá, se eu não me engano, 2x.
28:53
A gente botou ela para 4x e tiramos a réplica de de leitura. Ou seja, uma
28:58
máquina valendo o dobro para nós foi melhor que duas máquinas ã pela metade
29:04
ali, né, daquele dobro. Então, pro nosso contexto, funcionou e funciona assim até
29:09
hoje. A gente usa somente um banco de escrita porque tendo um de leitura
29:13
gerava leg para nós. Então, foi mais performático aumentar uma instância e
29:17
deixar só uma do que ter as duas. Então, esse foi algo contrainttuitivo que a
29:22
gente se deparou com sentinela também. Backups para que quero, né? Então, um
29:27
dos desafios que a gente tinha era backup, porque
29:31
é muitos dados, né? a gente recebe muitos teras e terabytes ali por ao
29:35
longo do ciclo de vida do sentinela e isso tem custo, né? Então, todo dia ali
29:39
fazia backup ali e isso tudo gera custo para nós. Só que a gente entrou a fundo
29:44
dentro do do negócio do Sentinela, né, das regras de negócio de Sentinela e a
29:50
gente viu que toda a inconsistência que a gente lançava, a gente gerava um
29:54
evento que entrava lá no databaks e no single store. Esse evento dizia se era
30:00
uma inconsistência ou não aquele problema. Então o backup ele já não
30:04
fazia tanto sentido para nós, porque dificilmente a gente teria que restar um
30:07
backup, porque o sentinel ele valida daqui paraa frente, né? O que tá
30:11
acontecendo agora paraa frente ele vai validar. Daqui para trás já foi
30:15
validado. E se já foi validado, já virou evento. Se já virou evento, tá no datab.
30:20
Se tá no databs, eu não preciso fazer backup de dados antigos. Então a gente
30:24
meio que chegou ã nessa nesse insite e o que que a gente fez? Tiramos backup, né?
30:29
Então é menos um custo para nós e a gente não precisa necessariamente desse
30:34
backup, sendo que se a gente apagar todos os dados agora, já tá no databak
30:38
salva as validações. A gente não olha muito para validações antigas, a gente
30:41
valida daqui pra frente. Então foi algo que a gente olhou também e vale a pena a
30:45
gente talvez olhar pro nosso negócio e entender se vale a pena ou não aqueles
30:49
sistemas que a gente tá gerindo, ter um backup ou não, se é crítico ou não, se
30:52
aquela retenção é é válida, né? Pô, 30 dias é válido, 15 já não resolve, 7 dias
30:57
já não resolve. Então, cada sistema tem seu contexto e cada contexto tem um
31:02
porquê, sabe? É legal a gente não assumir o padrão para tudo, porque a
31:05
gente acaba nesse padrão para tudo perdendo dinheiro ou perdendo
31:09
oportunidades de otimização, né? Então, vale a pena a gente rever esse lado
31:13
também. Ã, labirinto dos locks também é um
31:17
problema, né? Se a gente tem uma tabela que tem muitos pods lendo e várias delas
31:22
abrem transactions, a gente tem um problema, porque uma transaction vai
31:26
locar aquela tabela durante um tempo para fazer o que ela tem que fazer.
31:29
Então, pô, evitar fazer chamada HTP dentro de transactions, ã, evitar fazer
31:34
qualquer regra de negócio dentro de transactions, a transaction ela serve
31:37
para salvar o dado no banco. Então, faça tudo que tu tem que fazer, ã, faça todas
31:42
as requests possíveis, tem que fazer. tem o tom, tem os dados corretos para
31:46
salvar no banco, abre a transaction, salva nas tabelas e fecha a transaction.
31:50
Não faça regra de negócio dentro da transaction, porque isso vai virar um
31:52
problema, porque quanto mais a transaction ficar aberta, mais problemas
31:56
vocês vão ter com outras consultas ou outros inserts que vão estar tentando
31:59
atualizar essa tabela. Então é um problema também abrir transactions e
32:03
hoje, se eu não me engano, o Sentinela tem uma transaction só, que é que é de
32:07
um fluxo específico. Nos outros a gente conseguiu eliminar totalmente todas as
32:10
transactions. É tudo request direto no banco. Isso otimiza muito mais a
32:14
performance, porque a transaction ela dá lock em algumas requests. Então é algo
32:18
de se otimizar também caso vocês consigam.
32:22
E teoria nem sempre é prática, é um pouco do que eu falei aqui. Muitos
32:25
desses conceitos que eu falei, a gente tinha na literatura ou tinha exemplos de
32:29
outros projetos. Só que quando a gente foi fazer na prática, ouviu problemas na
32:33
prática, seja de replicações, backups, transactions, a gente viu que não era
32:38
bem assim e teve que mudar a rota e tá tudo bem. A gente é engenheiro de
32:41
software, a gente resolve problemas e a ideia é essa mesmo. A ideia é não se
32:44
fixar ã em algo que tá dando errado, sabe? Pô, ã, minha replicação tá dando
32:49
errado, eu tô fazendo o que de errado? Sabe? Eu não, todo mundo usa réplica de
32:52
leitura, eu tenho que usar. Não é bem assim. Às vezes o teu cenário não é para
32:56
usar mesmo. É legal entender isso, chamar um DBA, ir mais a fundo para
32:59
banco de dados e entender o que tá acontecendo.
33:03
Pô, tem 15 minutos. Vou tentar. Tá muito chato também. Só me avisa, tá?
33:09
Não sei como é que tá tá o Kquin. Tranquilo, tá ótimo. Qualquer coisa a
33:12
gente marca a parte dois. Boa. E aí, cara, a gente teve um volume
33:16
exponencial porque é muito dado, né? Se a gente tá
33:20
inserindo ali 3.000 request por segundo e fazendo as validações dessa request
33:26
que surgem em outras tabelas, o inimigo agora é outro. Então o inimigo agora
33:29
para um pouco de ser performance e passa a ser outras coisas que é o tamanho das
33:34
tabelas, que as tabelas têm terab. Pô, como é que tu faz uma consulta otimizada
33:38
em terabaix de dados? Sabe como é que tu faz backup disso se precisar? Ã, como é
33:42
que tu faz o espurgo disso para dados que tu não usa mais? Porque quanto maior
33:46
a tabela, mais problema tu vai ter em consulta. Mais problema tu vai ter
33:49
inserts, mais problema tu vai ter nos index, né? Pô, se a tua tabela tem 10
33:53
TB, teu index também tem uma quantidade razoável de tamanho. E se tu tem 10
33:58
index numa tabela de 10 TB, olha o efeito, né, exponencial que tem isso,
34:03
né, os problemas que causa. Então, é algo que a gente começa a ver também
34:07
quando a gente começa a trabalhar com grandes volumes de dados. E o nosso
34:10
curso de storage, ele foi reflexo disso. Então, todo mês aumentava 300. Era
34:15
certinho, cara. A gente podia tá ali em junho, a gente prevê quanto ia dar em
34:20
setembro e dava ali o curso de setembro. Todo mês aumentava o nosso curso de
34:23
storage, porque todo mês esses dados estavam entrando. E se continuar assim,
34:27
a gente vai pagar $1.000 num banco de dados, sabe? É infinito, porque a WS ela
34:31
tem armazenamento lá da Cupal, porque ela vai botando R HDs um do lado do
34:35
outro e vai dar e e vai dar conta, mas pra gente fica inviável esse custo, né?
34:39
E aí a gente começou a pensar em como a gente consegue reduzir o custo de
34:42
storage ou como é que a gente consegue reduzir essa quantidade de dados
34:46
armazenados, já que a gente viu que não precisa nem de backup, né? Pô, como é
34:49
que a gente faz isso, né? Como é que a gente otimiza, não só pelo custo, mas
34:52
questão de índice, pesquisa, inserts dessas tabelas monstruosas gigantescas.
35:01
A gente entra no espurgo de dados, né? O espurgo ele é uma técnica, né? Ele é uma
35:06
estratégia de remoção de dados antigos. Então, pô, tem uma tabela lá com terab
35:10
de dados, mas tu só precisa de dados os últimos dois meses. Então, são
35:13
estratégias, tu consegue fazer tanto de deletar os dados de fato e nunca mais
35:17
usar eles ou pegar esses dados, guardar em outro lugar, em uma outra tabela ou
35:23
em outro banco de dados e poder acessar depois via aplicação, via, via alguma
35:27
outra ferramenta. Então, tem diversas formas de fazer purgo, tem diversas
35:31
técnicas, né? eh, deletando por completo, fazendo backup, cada contexto
35:36
tem seu contexto, mas purga um caminho, né? A gente viu que, pô, a gente tem que
35:39
eliminar pelo menos esses dados antigos que tem aqui. E depois o
35:42
particionamento, que foi algo que nos ajudou a fazer o espurgo.
35:45
Particionamento já é uma estratégia que tu pega teus dados e particiona eles em
35:50
tabelas ã por algum range. Pode ser range por ID, pode ser range por algum
35:55
status. No nosso caso, for range por data, data de criação da transação.
35:59
Então, todas as transações nossas que a gente valida em janeiro de 2026 estão
36:03
numa tabela chamada ã eh validations, janeiro 2026, né? Então, a gente tá
36:09
validando todos os registros que entram em janeiro, só estão naquela tabela de
36:12
janeiro. Isso facilita com que todo mês tem uma tabela vazia pro pra aplicação
36:17
usar. uma tabela vazia, é um index vazio, eh é uma tabela muito leve ali
36:23
para fazer para fazer joins, para fazer consultas, para filtrar, porque é uma
36:26
tabela que acabou de começar e ela tem sempre somente um mês de uso. Raramente
36:30
a gente precisa buscar dados para trás, então isso facilita bastante particionar
36:34
uma tabela mensal, né? Porque a gente consegue ter esses dados limpos todo mês
36:38
e a aplicação fica performática e a gente tem um espurgo mais eficiente,
36:42
porque a gente pode deletar meses antigos. Pô, eu vou deletar julho do ano
36:46
passado, eu vou deletar agora agosto do ano passado, eu deleto a tabela inteira,
36:50
não deleto somente um registro. Então é muito mais eficiente o espurgo com o
36:53
banco particionado. Eles não necessariamente precisam um do outro,
36:57
mas eles andam bem juntos. E foi uma forma que a gente encontrou de fazer o
37:01
espurgo desses dados e melhorar a performance. É particionando o banco.
37:05
E como tudo na vida tem tradeoffice, né? O particionamento ele traz tradeoffice,
37:10
né? Ele traz benefícios ali de performance de leitura. Ele organiza ali
37:13
os registros ali, ã, em uma ordem temporal ali, no nosso caso, por data,
37:18
ele reduz ali o IO, porque pensa que eu não tô mais consultando numa tabela de
37:22
terabytes, eu tô consultando numa tabela que tem somente um mês de registro, eu
37:27
consigo paralelizar. Então, se for uma tabela que eu tenho que buscar em vários
37:30
meses, não é uma consulta que vai varrer os 20 TB, é as consultas vai varrer a
37:35
tabela de janeiro e a tabela de dezembro. Então é muito mais
37:38
performático a paralelização dessas consultas, né? Eu isolo isso e eu tenho
37:41
um controle melhor de retenção, mas eu tenho as limitações, como tudo na vida,
37:45
nada é bala de prata. Então, pô, eu tenho impacto nos meus inserts, eu tenho
37:49
que cuidar muito bem como é que eu vou fazer os meus selects. Eu tenho uma
37:53
limitação ali de unicidade global, porque é minha unique que acaba sendo
37:57
por tabela e não mais no banco inteiro, né? Pô, se eu tenho um registro que tem
38:02
um ID um na tabela de janeiro, eu posso ter o ID um na tabela de fevereiro.
38:07
Então eu tenho que usar outras estratégias para tentar com que meu
38:10
banco não fique com dados duplicados ali. Então isso dificulta também trouble
38:14
shooting e debug. Então tem uma série de limitações e custos que o time tem que
38:18
levar em conta, mas eh em certos cenários é o melhor eh faz sentido nesse
38:24
nível de performance ou de quantidade de dados que a gente tá colocando para
38:28
dentro. Então vale a pena. O calcanhar de Aquiles do parcelamento
38:32
de dados é o selects, porque se tu não tiver um filtro para saber aonde, no
38:38
caso, em qual tabela aquele registro tá, todas as vezes que tu fazer um select,
38:42
ele vai varrer todas as tabelas. Então, pô, um exemplo aqui básico, eu tenho um
38:46
select tudo vendas e eu quero pegar as vendas do usuário número um. Pô, eu vou
38:51
ter que bater em janeiro, fevereiro, março, junho, julho, dezembro para pegar
38:55
essas vendas. Se eu tenho aqui a data, então, pô, eu guardei junto com esse
39:00
usuário a data que ele fez a compra, ou seja, eu só vou na partição correta que
39:04
tá esses dados. Então eu tô otimizando muito mais a minha consulta do que
39:08
antes, né? Então isso é algo ã que tem que ser bem planejado no sistema, porque
39:13
nem sempre tu tem a referência da tabela. Então no nosso caso, pô, todo
39:17
registro adjacente à nossas tabelas guarda o registro da partição que ela tá
39:22
em outra, porque assim a gente consegue fazer joins muito mais otimizados. Então
39:26
tem que tem que levar em conta as estratégias, porque se a gente não
39:29
cuidar, não fazer o chamado partition pruning, né, que é isso aqui de a gente
39:34
pro nada, a gente pegar somente a tabela necessária, a gente vai piorar a nossa
39:40
aplicação, porque ao invés de bater numa tabela com 20 TB, ela vai bater em todas
39:44
as tabelas ã juntas para tentar achar esse registro. Isso é muito ruim. Então
39:50
é o concrito de Aquiles. Eu já vi projetos eh voltarem, darem rollback em
39:54
particionamento porque não fizeram partition pring direito. E é algo que a
39:57
gente tem que cuidar quando for fazer o particionamento, porque pode degradar e
40:01
vai degradar o banco se não tiver a chave correta ali. Então é mais um
40:04
cuidado que a gente tem que ter. Com isso. A gente teve dados agrupados e
40:08
controlados durante o tempo, né? a gente tem ali dados mensais, a gente consegue
40:11
expurgar corretamente, nossas consultas batem somente numa tabela e a gente tem
40:15
tudo bem organizado ali dentro do sentinela, mesmo ali tendo terabyte de
40:19
dados ali e inseridos ali mensalmente dentro do sistema.
40:25
Boa, tô acabando último capítulo. E aí os ensinamentos de 75 bilhões. 75
40:30
bilhões foi a quantidade de registros que a gente inseriu em um ano do
40:35
sentinela. Então, em um ano a gente inseriu 75 bilhões de registros. eh, em
40:39
todas as tabelas somadas ali, não me lembro se emi todas as principais agora,
40:43
mas é mais ou menos a média que a gente inseriu em um ano ali de registros. E
40:47
além de tudo isso que eu falei, trouxe outros aprendizados, como problemas do
40:51
UID 4, né? A maioria dos sistemas hoje gera o UID na versão 4 e eles são
40:56
identificadores bons porque eles são aleatórios, é difícil ter uma colisão
41:00
entre eles, porém a maioria que usa esse tipo de abordagem também coloca o ID
41:05
como índice da tabela. Só que o ID por não ser ordenado, o índice ele fica
41:11
muito fragmentado, né? Tu não consegue, tu não tem um índice muito eficiente ali
41:16
quando quiser fazer um order buy, por exemplo, ou qualquer outro tipo de
41:20
pesquisa ali em algum determinado tempo específico. Já com o ID V7, a gente
41:25
consegue ter o IDs ordenados, né? Os primeiros cinco ou sete caracteres dele
41:31
é um carimbo da data e o resto final é o aleatório. Isso passo com que a gente
41:36
ainda contenha os ids seguros e aleatórios ali contra a colisão e muito
41:41
mais eficientes para terem chaves primárias para terem índex em cima
41:45
deles. Então isso fez com que a gente fizesse um estudo lá atrás sobre isso.
41:49
Tá documentado também esse cara. Ah, esse estudo gerou, fez com que outros
41:54
projetos, outras pessoas aqui dentro do PicPay lessem eles e levassem isso para
41:58
os seus projetos. Foi algo bem bacana. Então, tem projetos hoje que só geram o
42:02
ID V7 e outros que querem já começar a gerar. Eh, justamente por causa dessas
42:07
vantagens. É super tranquilo. Tu vai lá na tua biblioteca que gera o ID e coloca
42:11
o sete. Ela gera o sete. É compatível com quatro, é o mesmo padrão e funciona
42:15
normalmente, sabe? É uma é uma implementação muito simples ali
42:20
que tem um ganho bem grande ali, principalmente para sistemas novos que
42:23
vão usar esses campos como chave primária.
42:27
Ah, insert only, né? Então, quando a gente tem alto fluxo de dados, updates
42:31
podem ser um problema. Então, a gente trabalhar com tabelas que somente e
42:35
insiram dados e não atualizem pode ser um caminho, porque o update ele pode
42:40
criar ali o chamado tuplas mortas, que é um registro sem uso que o banco vai ter
42:44
que limpar no futuro. E limpar isso é o famoso vacum. Isso pode trazer
42:50
degradação à performance dependendo do cenário. Então, se puder trabalhar com
42:54
insert, ele pode ser melhor pra aplicação, porque tu não vai depender de
42:57
update, o que vai deixar mais performático.
43:00
Ã, custo de múltiplos index, falei lá atrás, né, da quantidade de index pode
43:04
afetar aí a exigência de CPU e IO. E por fim, a gente poderia ter escalado
43:12
via dinheiros, né? Então, pô, cara, eu falei demais, falei um monte de coisa,
43:16
mas era só pegar a última máquina da WS, fazer o charge, que é separar o banco em
43:21
múltiplas máquinas e torrar dinheiro e a aplicação vai est escalável também. Não
43:27
sei se tu vai ter teu emprego durante muito tempo, mas funcionaria, pelo menos
43:31
na de propósito de funcionar, sabe? Mas isso não é viável ao longo tempo, porque
43:36
tu vai tá gastando muito dinheiro e uma hora alguém vai chegar para te falar:
43:39
"Cara, esse banco aí não tá custando muito?" Porque o time de lá faz muito
43:44
mais request, processa muito mais coisa com 1/3 do valor que tu gasta no teu
43:49
banco. Não tem algo que a gente pode melhorar aí. Então vai vir esses
43:52
questionamentos no futuro. Então a gente poderia sim escalar via dinheiro. No
43:56
futuro, talvez é a solução em algum cenário, pô, vai ter que escalar a
43:59
máquina agora. Beleza, a gente tem o por escalar a máquina. Não é escalar a
44:04
máquina só por escalar. A gente já fez particionamento, já fez espurgo, a gente
44:08
já fez otimização de index, a gente já tem tipos corretos, a gente já tem
44:11
eficiência de partition pruning e o que nos resta é escalar máquina. Faz
44:15
sentido. Agora não é tenho problema escala máquina, tem o problema escala
44:19
máquina, sabe? Isso não é uma maneira bem eficiente de eh lidar com os
44:23
problemas que a gente tem somente na base do dinheiro. Então, no futuro,
44:27
obviamente, a gente vai ter que escalar a máquina, mas a gente já tem noção das
44:30
otimizações que a gente pode fazer e já fez para isso se justificar lá na
44:34
frente. E ao infinito e além, né? O banco de
44:37
dados é um mundo à parte. Eu falei aqui 1%, poderia ter falado mais, poderia ter
44:41
dado exemplos. Então, se vocês gostam, eu gosto bastante, entrem a fundo nisso
44:45
que com certeza vai melhorar a eficiência do sistema de vocês. E tem o
44:49
meu QR code aí, vou deixar também o link aqui nos comentários do meu link tree. A
44:54
gente não ganha nada para tá aqui, né? Tudo amor à comunidade. Então, sempre
44:57
quem puder me seguir em pelo menos uma rede social aí já ajuda, já dá aquele
45:01
ânimo para continuar escrevendo e compartilhando e compartilhando
45:04
conteúdo. E caramba, foi na hora. Isso aí. Muito obrigado, pessoal.
45:09
Respira, Dog. Deu. Bom.
45:16
Boa. Galera, alguém tem alguma pergunta? Parabéns demais, viu, a apresentação.
45:23
Valeu. Muito economiza. Dá um É muito bom
45:27
quando você consegue dar uma resumida em várias coisas, porque assim, se todo
45:31
mundo for estudar todos esses assuntos de forma separada, vai levar um tempo
45:36
muito maior. Você já trouxe o conteúdo super filtradinho assim.
45:40
Uhum. É bom demais essa ideia. Foi foi difícil fazer, tá?
45:45
Pô, mas eu sinto que eu fui mais rápido. A primeira vez eu demorei mais para
45:49
falar, mas é que é muita coisa mesmo, é bem densa, mas é um assunto super legal
45:52
assim que tem muito pano assim pra manga.
45:59
Aí ó, o pessoal entendeu tudo, pô. Sem dúvida.
46:02
D você falou, primeiro, parabéns e muito
46:07
obrigada pela apresentação. Foi uma [ __ ] de uma aula. Mas você falou durante o a
46:11
sua apresentação sobre várias documentações que tem ali explicando os
46:16
estudos que vocês fizeram para nos dentinela e tudo. E tem um link pra
46:21
gente trabalhar? agora que eu fiquei curiosa.
46:39
Pode mandar o É bem a pergunta não, mas também é. Eh,
46:46
pô, primeiro lugar, parabéns. Acho que é uma apresentação bem bem maneira. Eu
46:51
acho que eu participei de algumas coisas dessas que a gente viu ali,
46:54
certeza. E foi muito maneiro, assim, a gente
46:57
aprendeu isso tudo e tudo mais. E acho que sempre fica na cabeça do resto da
47:00
galera assim, como que esses caras conseguem trabalhar e fazer isso tudo e
47:06
não ser mandado embora. E tenta dar uma palinha pro pessoal assim, qual que é
47:11
esse segredo aí que esse time faz? Que mágica é essa?
47:15
Como assim, mano? Poder estudar. É, exatamente. Acho que muito, muita
47:20
gente fica assim, pô, eu queria fazer isso no meu time, eu queria ter
47:22
implementado essas coisas, mas não tem tempo, não consigo, meu chefe não quer.
47:27
Como é que como é que a galera consegue fazer isso em integridade assim? Acho
47:31
que agora para t de fora, né? Acho que eu posso perguntar com mais propriedade
47:34
assim, como é que como é que se desenvolve isso assim? Aqui você
47:37
acredita o fato de vocês conseguirem fazer isso, fazer essas entregas, mas
47:43
também conseguirem criar essas, por exemplo, tu falou que tu testou um
47:46
banco, aí tu mudou a quantidade de instâncias, né? De onde que vem esse
47:51
insite? Por que que vocês testam isso? Que
47:53
que que que dá vazão para vocês conseguirem fazer esse tipo de coisa?
47:57
Bom, acho que não tem resposta certa, né? Acho que tem mais gente do time aqui
48:00
quiser contribuir é muito bem-vindo. Mas a minha visão, acho que é uma dos pontos
48:04
principais é a gestão. Eu acho que a gestão tem que ter, tem que ver valor
48:08
nisso, porque se é uma gestão que tá sempre em cima do cara, tem que
48:11
entregar, tem que entregar, tem que entregar, tem que entregar, pô, como é
48:13
que tu vai dedicar tempo para estudar a performance de um sistema para melhorar
48:16
o custo, melhorar o desempenho, se a gestão não vai olhar bem para aquilo
48:20
ali, sabe? você só tem que entregar tarefa no final do dia. Então eu acho
48:23
que vai muito isso da gestão de ter esse olhar. Obviamente a gente não pode ficar
48:27
mês e meio estudando algo e não entregar nada. Então é um tradeoff do time. Então
48:31
geralmente que o que eu vejo aqui é, pô, tem demandas aqui que tem que entregar
48:34
tarefa. Essas pessoas já estão ali meio que focada nelas. Já tem outra demanda
48:38
que tem que estudar uma parada que tá dando um problema. Então, essa pessoa já
48:41
tem um tempo para estudar aquilo, porque outras pessoas do time estão atuando
48:44
nessas demandas mais urgentes. Então eu acho que é ter esse equilíbrio no time
48:47
de não pode todo mundo estudar tudo e não pode todo mundo só atuar em tarefa.
48:52
Então tem que ser essa troca. Pô, eu estudei aqui parcionamento, o Pedrão no
48:56
começo lá estudou espurgo, sabe? Então bá, o outro cara lá estudou não sei o
49:00
quê. Então vai ter momentos que cada um vai estudar alguma coisa. Então tem que
49:04
ter esse equilíbrio entre o time e a gestão tem que apoiar isso. Eu acho que
49:07
a diferença ali é que a nossa gestão ela vê bastante valor nisso que a gente
49:10
traz, muito por causa dos números e da forma que a gente apresenta essas
49:13
coisas, né? Mas também se a gestão não vê, cara, eu acho que tu tem que fazer
49:17
tua parte de tentar mostrar isso, sabe? Pô, ó, a gente tá com esse problema aqui
49:20
no banco. A alternativa é dobrar a instância gastando $. 000 a mais ou
49:25
dedicar 15 dias, duas semanas, uma sprint para tentar entender como
49:30
melhorar a performance do sistema sem aumentar esse custo. O que que prefere?
49:34
Ah, eu quero aumentar aqui, [ __ ] os .000, beleza, tu tem o aval, mas não,
49:38
vamos olhar ali com calma. Então, talvez a ideia é como a gente leva isso pra
49:42
frente também, sabe? Como é que a gente apresenta essas soluções, como é que a
49:44
gente apresenta essas ideias e e é isso. Não sei mais o se o time quer contribuir
49:49
aí, mas eu acho que é muito disso, sabe? respondiu. Eu ficou muito ruim.
50:03
Não respondeu. Acho que é isso aí. Não tem uma resposta certa, né? E às vezes
50:07
eu vejo o pessoal falar: "Ah, não tem tempo para isso, não tem tempo para
50:10
aquilo, né? Eu já tinha escutado, por exemplo, que não que era impossível
50:13
atualizar o Hero Dex. As meninos não sabiam que era impossível, foram lá e
50:17
fizeram. Então acho que eh é difícil assim cravar o que que é possível, que
50:23
que não é impossível. Acho que vai depender ali desse jogo de cintura que
50:26
você falou no final, tipo, ó, tem essa e essa opção, tem essas duas pílulas, né?
50:30
E tem essa sabedoria de entregar as pílulas para as pessoas que tem que
50:34
definir. Acho que é esse que é o pulo do gato, talvez.
50:37
É. E conforme tu vai fazendo isso, tu vai ganhando mais skills de comunicação,
50:42
né? Na primeira vez à vezes tu vai falar tudo errado e não vou acatar e é normal.
50:45
Mas conforme tu vai exercitando isso, teu poder de diálogo, teu poder de
50:49
negociação, vai melhorando isso, sabe? Tu conseguir mostrar ali os ganhos do
50:53
que tu tá sugerindo, sabe? E vai ganhando confiança da galera também. Eu
50:57
acho que se da primeira vez que eu tivesse entrado no time, eu tivesse
50:59
sugerido alguma coisa dessa, eu não ia ter aval, mas conforme eu fui sugerindo
51:03
coisas que deram certos e estudos e leituras, eu fui ganhando mais ã mais
51:10
credibilidade, né? Isso acaba gerando confiança ali entre o time, entre a
51:14
gestão, entre as pessoas, né? E é faz parte do trabalho, tá? Não sei
51:19
se todo mundo tem essa noção, mas estudar, testar faz parte de ser um
51:24
engenheiro de software. Não é só entregar a tarefa ali, codar no VS Code
51:28
ou entregar para um agente da IA ali e fazer o teste unitário. A gente estudar
51:31
algo que tá impactando, que tá tendo um problema, aprender coisas novas, fazer
51:35
um estudo, uma po, um benchmark, faz parte da nossa entrega de qualidade, né?
51:40
Então, pô, vou usar um array ou vou usar uma collection? A collection vai ser em
51:44
memória ou a collection vai ser via ponteiro? Qual é a melhor? Testa, faz o
51:50
benchmark, testa as duas soluções, leva o melhor pro time, sabe? Faz parte da
51:54
qualidade do que a gente entrega. Então, faz parte do serviço.
52:05
Boa, galera. Estouramos aqui nosso timing aqui, mas valeu a pena. Éí, é
52:11
isso. Obrigada, D. Temos um weekly e até a semana que vem.
52:17
Boa. Valeu, pessoal. Muito obrigado.
