	-- EXERCICIO 1 
-- criando o banco de dados sprint2
create database Sprint2;
-- utilizando o banco de dados ‘sprint1’
use sprint2;
-- Criar a tabela chamada Atleta
create table atleta(
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int 
);
-- inserindo dados na tabela 
insert into Atleta  values
	(default, 'Ana Souza', 'Natação', 5),
	(default, 'Carlos Mendes', 'Atletismo', 3),
	(default, 'Beatriz Lima', 'Ginástica', 7),
	(default, 'Diego Rocha', 'Judô', 4),
	(default, 'Fernanda Alves', 'Vôlei', 2),
	(default, 'Gabriel Santos', 'Basquete', 1),
	(default, 'Juliana Pereira', 'Handebol', 6),
	(default, 'Lucas Oliveira', 'Ciclismo', 3),
	(default, 'Mariana Costa', 'Tênis', 5),
	(default, 'Ricardo Martins', 'Futebol', 2);
-- criando a tabela pais
create table país (
	idPaís int primary key auto_increment, 
    nome varchar(30), 
    capital varchar(40));
-- inserindo dados na tabela
insert into país (nome, capital) values
	('Brasil', 'Brasília'),
	('Argentina', 'Buenos Aires'),
	('Estados Unidos', 'Washington, D.C.'),
	('França', 'Paris'),
	('Alemanha', 'Berlim'),
	('Japão', 'Tóquio'),
	('Canadá', 'Ottawa'),
	('Austrália', 'Camberra'),
	('Itália', 'Roma'),
	('Espanha', 'Madri');
/*Fazer a modelagem lógica conforme a regra de negócio:
• 1 país tem 1 ou muitos atletas;
• 1 atleta é de 1 e somente 1 país; neste caso a foreing key estara na tabela atleta
*/
alter table atleta add column fkPaís int, add constraint fkPaisAtleta 
	foreign key (fkPaís) references país(idPaís);
select * from atleta;
update atleta set fkPaís = 1 where idAtleta in(1,3,5);
update atleta set fkPaís = 2 where idAtleta = 2;
update atleta set fkPaís = 9 where idAtleta in (6,9);
update atleta set fkPaís = 4, 