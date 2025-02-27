-- crie o banco de dados "game_store".
create database game_store;
use game_store;
create table jogo (
id int primary key auto_increment, 
nome varchar(30), 
diretor varchar(30),
genero varchar(30),
lancamento date, 
nota int, 
quantidade int
);
-- Insira pelo menos 5 registros para a tabela.
insert into jogo values
	(default, 'The Legend of Zelda', 'Hidemaro Fujibayashi', 'Aventura', '2017-03-03',10 ,0),
    (default, 'Red Dead Redemption 2', 'Dan Houser', 'Aventura', '2018-10-26',9 ,40),
    (default, 'The Witcher 3: Wild Hunt', 'Konrad Tomaszkiewicz', 'RPG', '2014-05-19',10 ,25 ),
    (default, 'Dark Souls III', 'Hidetaka Miyazaki', 'RPG', '2016-03-24',9 ,0 ), 
    (default, 'God of War (2018)', 'Cory Barlog', 'Ação', '2018-04-20', 10,60 );
/*Altere a tabela para inserir uma coluna que represente o tipo de mídia que 
deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”*/
alter table jogo add column tipo_midia varchar(10);
alter table jogo add constraint chktipo check (tipo_midia in ('física', 'digital'));
-- Atualize os registros dos jogos inseridos anteriormente.
update jogo set tipo_midia = 'física' where id = 1;
update jogo set tipo_midia = 'física' where id = 2;
update jogo set tipo_midia = 'digital' where id = 3;
update jogo set tipo_midia = 'física' where id = 4;
update jogo set tipo_midia = 'digital' where id = 5;
-- Exiba apenas os jogos com data de lançamento a partir de 2015
select * from jogo where lancamento >= '2015-01-01';
-- Exiba os jogos que tenham a letra “a” em seu nome e são de mídia física.
select * from jogo where nome like '%a%' and tipo_midia = 'física';
-- Exiba os jogos onde o nome do diretor não contenha a letra “e”. 
select * from jogo where diretor not like '%e%';
-- Altere a tabela para criar uma checagem na inserção da nota, onde o valor 
-- não pode ser menor que 0 e nem maior que 10.
alter table jogo add constraint chknota check (nota>=0 and nota<=10);
/*ou poderia ser assim mas não seria pratico 
alter table jogo add constraint prueba check (nota in(0,1,2,3,4,5,6,7,8,9,10));*/
-- Exiba os jogos de um determinado gênero e que ainda esteja em estoque.
select * from jogo where quantidade > 0;
--  Exclua os jogos que não têm mais unidades disponíveis em estoque. 
delete from jogo where id = 1;
delete from jogo where id = 3;
-- Renomeie a coluna “diretor” para “criador” e exiba como ficou a estrutura da 
-- tabela.
select diretor as 'criador' from jogo;

-- EXERCICIO2 

-- crie o banco de dados "olimpiadas". 
create database olimpiadas;
use olimpiadas; 
create table esporte (
id int primary key auto_increment, 
nome varchar(40),
categoria varchar(20), 
num_jogadores int, 
estreia date, 
pais_origem varchar(30), 
constraint chkcategoria check(categoria in('Individual', 'Coletivo'))
);
-- Insira pelo menos 5 registros na tabela
insert into esporte values 
	(default, 'Futebol', 'Coletivo', 11, '1900-10-01', 'Inglaterra'),
	(default, 'Basquete', 'Coletivo', 5, '1936-08-07', 'EUA'),
	(default, 'Tênis', 'Individual', 1, '1896-01-01', 'França'),
	(default, 'Vôlei', 'Coletivo', 6, '1964-10-23', 'EUA'),
	(default, 'Judô', 'Individual', 1, '2001-10-20', 'Japão');
/* Altere a tabela para adicionar uma coluna popularidade que armazene a 
popularidade do esporte como um valor decimal entre 0 e 10 e exiba como 
ficou a estrutura da tabela.*/
alter table esporte add column popularidade decimal(4,2);
desc esporte;
-- Atualize os registros para definir a popularidade dos esportes inseridos anteriormente.
update esporte set popularidade = 10.00 where id = 1; 
update esporte set popularidade = 4.00 where id = 2; 
update esporte set popularidade = 6.49 where id = 3; 
update esporte set popularidade = 7.87 where id = 4; 
update esporte set popularidade = 6.61 where id = 5; 
--  Exiba os esportes ordenados por popularidade em ordem crescente. 
select * from esporte order by popularidade;
-- Exiba apenas os esportes que estrearam nas Olimpíadas a partir do ano 2000
select * from esporte where estreia >= '2000-01-01';
-- Crie uma checagem para que não possa ser inserido valores dentro de 
-- estreia que seja menor que 06 de abril de 1896 e depois da data atual. 
-- antes de agregar a restrição eu devo de atualizar os dados da tabela que sejam inferiores à restrição a colocar senão aparecerá Error Code: 3819. Check constraint 'chkestreia' is violated.
update esporte set estreia = '1896-04-07' where id = 3;
alter table esporte add constraint chkestreia check (estreia > '1896-04-06');
-- ltere a tabela para excluir a regra de inserção de categoria, assim 
-- podendo colocar valores além de "Individual" ou "Coletivo". 
alter table esporte drop constraint chkcategoria;
-- Exiba apenas os esportes cujo nome do país de origem tenha "a" na 
-- segunda letra.
select * from esporte where pais_origem like '_a%';
-- Exiba os dados onde o número de jogadores por equipe esteja entre 4 e 11. 
select * from esporte where num_jogadores >=4 and num_jogadores <= 11;
--  Remova os registros onde id seja 1, 3 e 5.
delete from esporte where id = 1;
delete from esporte where id = 3;
delete from esporte where id = 5;

-- EXERCICIO 3
--  crie o banco de dados "desenho".
create database desenho; 
use desenho;
create table animados(
id int primary key  auto_increment,
titulo varchar(50), 
dtLançamento date, 
emissora varchar(50), 
clasificação varchar(30), 
desenhostatus varchar(15), 
nota int
constraint chknota check (nota in (1,2,3,4,5))
)auto_increment = 10;
insert into animados values
	(default, 'Bob Esponja', '1999-05-01', 'Nickelodeon', '10 anos', 'Exibindo', 5),
	(default, 'Os Simpsons', '1989-12-17', 'Fox', '12 anos', 'Exibindo', 5),
	(default, 'Dragon Ball Z', '1989-04-26', 'Fuji TV', '12 anos', 'Finalizado', 4),
	(default, 'Rick and Morty', '2013-12-02', 'Adult Swim', '16 anos', 'Exibindo', 5),
	(default, 'Tom e Jerry', '1940-02-10', 'MGM', '10 anos', 'Finalizado', 5), 
	(default, 'Hora de Aventura', '2025-02-22', 'Cartoon Network', '10 anos', 'Exibindo', 5),
	(default, 'Clarence', '2025-02-22', 'Cartoon Network', '10 anos', 'Cancelado', 4);

-- Exibir todos os dados da tabela
select * from animados; 
-- Exibir todos os desenhos com a classificação menor ou igual a 14 anos
select * from animados where clasificação <= 14;
--  Exibir todos os desenhos de uma mesma emissora original
select * from animados where emissora = 'Cartoon Network';
/*modificar o campo status, para que aceite apenas o status 'exibindo', 
'finalizado', 'cancelado', tente inserir algum outro valor para ver se a regra 
foi aplicada */
alter table animados add constraint chkstatus check (desenhostatus in ('exibindo', 
'finalizado', 'cancelado'));
insert into animados(desenhostatus)value
	('Ativo');
-- a restrição está funcionando
-- Modificar o status 'exibindo' para 'finalizado' de 2 desenhos pelo ID
update animados set desenhoStatus = 'finalizado' where id = 10;
update animados set desenhoStatus = 'finalizado' where id = 11;

-- Deletar a linha do desenho de ID 12
delete from animados where id = 12;
-- Exibir apenas os desenhos que comecem com uma determinada letra
select * from animados where titulo like 'C%';
-- Renomear a coluna classificacao para classificacaoIndicativa 
alter table animados rename column clasificação to classificacaoIndicativa;
-- Atualizar a nota e data de lançamento do desenho de ID 11 
update animados set nota = 4 where id = 11;
update animados set dtlançamento = '2025-02-22' where id = 11;
-- Limpe todos os dados da tabela 
truncate animados;
-- Remover a regra do status do desenho
alter table animados drop constraint chkstatus;

-- EXERCERCICIO 4 
-- No MySQL Workbench, crie o banco de dados "estoque".
create database estoque;
use estoque;
create table misteriossa(
	id int primary key auto_increment, 
    nome varchar(30),
    dtcompra date,
    preco float, 
    peso float, 
    dtRetirada date 
    );
-- Insira na tabela, no mínimo 5 compras de alimentos com datas diferentes. Por agora, não preencha a coluna referente a "data de retirada".    
insert into misteriossa ( id, nome, dtcompra, preco, peso) values
	(default, 'Pizza', '2024-08-27', '49.90', '1000'), 
    (default, 'Biscoitos Scooby', '2024-07-22', '100.00', '2000'), 
	(default, 'Sanduíches gigantes', '2024-08-28', '49.90', '500'), 
	(default, 'Donuts', '2024-08-20', '89.90', '200'), 
	(default, '“Cachorro-quente', '2024-08-19', '65.90', '100.8');
-- Verifique se os valores foram inseridos corretamente. 
select * from misteriossa;
-- Exiba os nomes, as datas de compra e retirada e o id dos alimentos ordenados a partir da data de compra mais antiga. 
select nome, dtcompra, dtretirada, id from misteriossa order by dtcompra asc;
-- Alguém comeu uma caixa de biscoitos, atualize a data de retirada da caixa de “Biscoitos Scooby” que foi comprada a mais tempo. 
update misteriossa set dtretirada = '2024-08-29' where id = 2;
-- Altere o nome da coluna id para idComida
alter table misteriossa rename column id to idcomida;
-- Altere o tipo do check para que os alimentos só possam ser “Biscoitos Scooby” ou “Cachorro-quente”.
alter table misteriossa add constraint chkcomida check (nome in ('Biscoitos Scooby', 'Cachorro-quente'));
-- Error Code: 3819. Check constraint 'chkcomida' is violated.	0.031 sec
-- esse erro deu porque primeirop para agregar uma constrait e check eu tenho que atulizar os dados inseridos anteriormentte 
update misteriossa set nome = 'Biscoitos Scooby' where idcomida = 1; 
update misteriossa set nome = 'Biscoitos Scooby' where idcomida = 4; 
update misteriossa set nome = 'Cachorro-quente' where idcomida = 3; 
-- agora dará certo 
alter table misteriossa add constraint chkcomida check (nome in ('Biscoitos Scooby', 'Cachorro-quente'));
-- Exiba os produtos onde o nome seja "Biscoitos Scooby" de forma que o 
-- nome das colunas dataCompra apareça como "data da compra" e 
-- dataRetirada apareça como "data da retirada". 
select nome, dtcompra as 'Data de compra', dtretirada as 'Data de retirada' from misteriossa where nome = 'Biscoitos Scooby';
-- Exiba os alimentos que foram comprados antes do dia 25 de julho de 2024.
-- Exericicio 5 
--  crie o banco de dados “vingadores”.
create database vingadores; 
use vingadores; 
-- Crie uma tabela chamada “heroi”
create table heroi (
id int primary key auto_increment, 
nome varchar(45), 
versao varchar(45),
habilidade varchar (30), 
altura int 
);
-- Insira 5 heróis para derrotar o vilão Doutor Destino.
insert into heroi values
	(default, 'Homem de Ferro', 'Mark 85', 'Armadura Tecnológica', 185),
	(default, 'Capitão América', 'Vingadores', 'Super Soldado', 188),
	(default, 'Thor', 'Deus do Trovão', 'Controle do Trovão', 198),
	(default, 'Hulk', 'Professor Hulk', 'Força Ilimitada', 240),
	(default, 'Viúva Negra', 'Agente da S.H.I.E.L.D.', 'Combate Corpo a Corpo', 170);
-- Exiba os dados inseridos na tabela 
select * from heroi;
-- Adicione um campo de regeneração, onde ele aceitará apenas os valores booleanos de TRUE ou FALSE.
alter table heroi add column regeneração boolean not null default false;
-- Modifique o campo versão para aceitar até 100 caracteres. 
alter table heroi modify column versao varchar(100);
-- Remova o herói de id 3 pois ele se morreu em batalha.
delete from heroi where id = 3; 
-- Chegou reforços, insira um novo herói para a equipe.
insert into heroi (id, nome, versao, habilidade, altura)values
	(default,'Homem-Aranha', 'Traje Avançado', 'Agilidade e Teias', 178);
--  Exiba todos os dados inseridos na tabela onde o nome do herói começa com “C” ou “H”.
select * from heroi where nome like 'H%';
-- exiba todos os dados inseridos na tabela onde o nome do herói não contém a letra “A” no campo nome. 
select * from heroi where nome not like '%A%';
--  Exiba apenas o nome do herói onde a altura for maior que 190. 
select nome from heroi where altura > 190;
-- Exiba todos os dados da tabela de forma decrescente pelo nome onde a altura do herói for maior que 180.
select * from heroi where altura > 180 order by nome desc;
-- Limpe os dados da tabela. 
truncate heroi

