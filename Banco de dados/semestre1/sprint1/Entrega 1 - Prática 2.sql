	-- EXERCICIO 1 
-- utilizando o banco de dados ‘sprint1’
use sprint1;
-- Criar a tabela chamada Atleta
create table Atleta(
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int 
);
-- inserindo dados na tabela 
insert into Atleta  values
	(1, 'Lucas Silva', 'Atletismo', 2),
    (2, 'Mariana Da Souza', 'Judô', 3),
    (3, 'João Ferreira', 'Basquete', 1),
    (4, 'Camila Carvalho', 'Basquete', 2),
    (5, 'Pedro Adami', 'Natação', 4),
    (6, 'Larissa Flores', 'Atletismo', 3),
    (7, 'Sara Da silva', 'Basquete', 2),
    (8, 'Ana Cordero', 'Natação', 1),
    (9, 'Eliana Calle', 'Atletismo', 3), 
    (10, 'Elora Soeiro', 'Judô', 1);
-- Exibir todos os dados da tabela. 
select * from atleta; 
--  Atualizar a quantidade de medalhas do atleta com id=1
update atleta set qtdMedalha = 4 where idAtleta = 1; 
-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3
-- atualizando o id= 2 de 3 para 4  e id=3 de 1 para 3
update atleta set qtdMedalha = 3 where idAtleta = 2; 
update atleta set qtdMedalha = 3 where idAtleta = 3; 
-- Atualizar o nome do atleta com o id=4
update atleta set nome = 'Emily Isabel' where idAtleta = 4; 
--  Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date
alter table atleta add column dtNasc date; 
--  Atualizar a data de nascimento de todos os atleta
update atleta set dtNasc = '2000-10-24' where idAtleta = 1;
update atleta set dtNasc = '2005-08-21' where idAtleta = 2;
update atleta set dtNasc = '2000-02-22' where idAtleta = 3; 
update atleta set dtNasc = '2004-08-23' where idAtleta = 4;
update atleta set dtNasc = '2001-06-10' where idAtleta = 5;
update atleta set dtNasc = '2004-10-10' where idAtleta = 6;
update atleta set dtNasc = '2004-10-15' where idAtleta = 7;
update atleta set dtNasc = '2001-10-24' where idAtleta = 8;
update atleta set dtNasc = '2003-10-27' where idAtleta = 9;
update atleta set dtNasc = '2004-10-08' where idAtleta = 10;

--  Excluir o atleta com o id=5
delete from atleta where idAtleta = 5; 
--  Exibir os atletas onde a modalidade é diferente de natação
select * from atleta where modalidade <> 'Natação';
-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
select * from atleta where qtdMedalha >= 3;
--  Modificar o campo modalidade do tamanho 40 para o tamanho 60;
alter table atleta modify column modalidade varchar(60);
--  Descrever os campos da tabela mostrando a atualização do campo modalidade;
describe atleta; 
--  Limpar os dados da tabela;
truncate atleta; 

	-- EXERCICIO 2
-- utilizando o banco de dados ‘sprint1’
use sprint1; 
-- Criar a tabela chamada Musica
create table Musica (
idMusica int primary key, 
titulo varchar(40), 
artista varchar(40), 
genero varchar(40)
);
-- inserindo dados 
insert into Musica  values
	(1, 'La nube en el jardin', 'Ed Maverick', 'Folk'),
    (2, 'Cry', 'Cigarettees After Sex', 'Indie Pop'), 
    (3, 'West Coast', 'Lana Del Rey', 'Pop'),
    (4, 'San Lucas', 'Kevin Karl', 'Folk'), 
    (5, 'Crep', 'Radiohead', 'Rock'),
    (6, 'Fuentes de Ortiz', 'Ed Maverick', 'Folk'),
    (7, 'Smells Like Teen Spirit', 'Nirvana', 'Rock'),
    (8, 'Niño', 'Ed Maverick', 'Folk'),
    (9, 'Apocalypse', 'Cigarettees After Sex', 'Indie Pop'),
    (10, 'Vamonos a Marte', 'Kevin Karl', 'Folk');
-- a) Exibir todos os dados da tabela.
select * from musica;
-- b) Adicionar o campo curtidas do tipo int na tabela;
alter table musica add column curtidas int;
-- c) Atualizar o campo curtidas de todas as músicas inseridas
update musica set curtidas = 120212 where idMusica = 1;
update musica set curtidas = 654646 where idMusica = 2;
update musica set curtidas = 4654654 where idMusica = 3;
update musica set curtidas = 6454654 where idMusica = 4;
update musica set curtidas = 1645468 where idMusica = 5;
update musica set curtidas = 6454564 where idMusica = 6;
update musica set curtidas = 123156 where idMusica = 7;
update musica set curtidas = 25464648 where idMusica = 8;
update musica set curtidas = 32165486 where idMusica = 9;
update musica set curtidas = 32132516 where idMusica = 10;

-- d) Modificar o campo artista do tamanho 40 para o tamanho 80
alter table musica modify column artista varchar(80);
-- e) Atualizar a quantidade de curtidas da música com id=1
update musica set curtidas = 205515 where idMusica = 1; 
-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3
update musica set curtidas = 7154265 where idMusica = 2; 
update musica set curtidas = 2564568 where idMusica = 3; 
-- g) Atualizar o nome da música com o id=5;
update musica set titulo = 'No surprises' where idMusica = 5;
-- h) Excluir a música com o id=4
delete from musica where idMusica = 4;
-- i) Exibir as músicas onde o gênero é diferente de funk
	-- alterando o genero de uma musica para funk 
update musica set genero = 'funk' where idMusica = 3; 
select * from musica where genero <> 'funk';
-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
select * from musica where curtidas >= 20; 
-- k) Descrever os campos da tabela mostrando a atualização do campo artista;
desc musica; 
truncate musica; 

-- EXERCICIO 3 
--  utilizando o banco de dados ‘sprint1’
use sprint1; 
-- Criar a tabela chamada Filme 
create table Filme (
idFilme int primary key,
titulo varchar(50), 
genero varchar(40),
diretor varchar(40)
);
-- inserindo dados =
insert into Filme values 
	(1, 'Oppenheimer', 'Drama', 'Chistopher Nolan'),
    (2, 'Coringa', 'Drama', 'Todd Phillips'), 
    (3, 'Interestelar', 'Ficção Científica', 'Chistopher Nolan'),
    (4, 'Duna', 'Ficção Científica', 'Denis Villaeneuve'), 
    (5, 'Pantera Negra', 'Ação', 'Ryan Coogler'), 
    (6, 'Pulp Fiction', 'Crime', 'Lana Wachoski'), 
    (7, 'Blade Runner 2049', 'Ficção Científica', 'Lana Wachowski & Lilly Wachowski'), 
    (8, 'O Iluminado', 'Terror', 'Stanley Kubrick'),
    (9, 'Toy Story', 'Animação', 'John Lasseter'), 
    (10, 'Procurando a Nemo', 'Animação', 'Andrew Stanton');
-- Exibir todos os dados da tabela.
select * from filme; 
-- Adicionar o campo protagonista do tipo varchar(50) na tabela;
alter table filme add column protagonista varchar (50); 
-- Atualizar o campo protagonista de todas os filmes inseridos
update filme set protagonista = 'Cillian Murphy' where idFilme = 1; 
update filme set protagonista = 'Joaquin Phoenix' where idFilme = 2;
update filme set protagonista = 'Matthew McConaughey' where idFilme = 3;
update filme set protagonista = 'Timothée Chalamet'  where idFilme = 4; 
update filme set protagonista = 'Chadwick Boseman'  where idFilme = 5; 
update filme set protagonista = 'John Travolta'  where idFilme = 6; 
update filme set protagonista = 'Ryan Gosling '  where idFilme = 7; 
update filme set protagonista = 'Jack Nicholson'  where idFilme = 8; 
update filme set protagonista = 'Tom Hanks'  where idFilme = 9; 
update filme set protagonista = 'Albert Brooks'  where idFilme = 10; 
--  Modificar o campo diretor do tamanho 40 para o tamanho 150
alter table filme modify column diretor varchar(150); 
-- Atualizar o diretor do filme com id=5;
update filme set diretor = 'Ana Carolina' where idFilme = 5; 
-- Atualizar o diretor dos filmes com id=2 e com o id=7
update filme set diretor = 'Jhoel Diego' where idfilme = 2;
update filme set diretor = 'Mimi' where idfilme = 7;
-- Atualizar o título do filme com o id=6
update filme set titulo = 'As aventuras de brocoli' where idfilme = 6; 
-- Excluir o filme com o id=3;
delete from filme where idfilme = 3; 
--  Exibir os filmes em que o gênero é diferente de drama
select * from filme where genero <> 'Drama'; 
--  Exibir os dados dos filmes que o gênero é igual ‘suspense’
	-- modificando o genero de um filme 
update filme set genero = 'suspense' where idfilme = 7; 
select * from filme where genero = 'suspense'; 
-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor
describe filme;
truncate filme;
-- EXERCICIO 4 
-- utilizando o banco de dados ‘sprint1’
use sprint1;
-- Criar a tabela chamada Professor 
create table Professor (
idProfessor int primary key,
nome varchar(50),
especialidade varchar(40),
dtNasc date
);
-- inserindo dados
INSERT INTO Professor (idProfessor, nome, especialidade, dtNasc) VALUES
(1, 'Maria Betânia Gonçalves', 'Português', '1988-05-20'),
(2, 'José Carlos Nascimento', 'Ciências Humanas', '1993-02-15'),
(3, 'João Albert Ribeiro de Araújo', 'Física', '2001-07-31'),
(4, 'Carla Beatriz de Albuquerque', 'Biologia', '2000-06-22'),
(5, 'João Marcos Brezolim', 'Geografia', '1988-04-08'),
(6, 'Camilla de Oliveira Damasceno', 'Projeto de Vida', '1999-11-14');
-- a) Exibir todos os dados da tabela.
select * from professor;
-- b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’,‘assistente’ ou ‘titular’;
alter table professor add column funcao varchar(50),
add constraint funcao_check check (funcao in('monitor','assistente', 'titular'));
-- c) Atualizar os professores inseridos e suas respectivas funções
update professor set funcao = 'monitor' where idProfessor = 1; 
update professor set funcao = 'assistente' where idProfessor = 2; 
update professor set funcao = 'titular' where idProfessor = 3; 
update professor set funcao = 'titular' where idProfessor = 4; 
update professor set funcao = 'monitor' where idProfessor = 5; 
update professor set funcao = 'assistente' where idProfessor = 6; 
-- d) Inserir um novo professor;
insert into professor values 
	(7, 'Freza', 'Algoritmo', '1980-08-22', 'titular');
-- e) Excluir o professor onde o idProfessor é igual a 5
delete from professor where idprofessor = 5;
-- f) Exibir apenas os nomes dos professores titulares;
select * from professor where funcao = 'titular';
-- g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores
select especialidade, dtnasc from professor where funcao = 'monitor';
-- h) Atualizar a data de nascimento do idProfessor igual a 3
update professor set dtnasc = '2000-02-20' where idprofessor = 3;
-- i) Limpar a tabela Professor
truncate professor; 
-- EXERCICIO 5 
-- Utilizando o banco de dados ‘sprint1’
use sprint1;
-- Criar a tabela chamada Curso
create table Curso (
idCurso int primary key,
nome varchar(50),
sigla char(3),
cordenador varchar(50)
);
-- Inserir dados na tabela, procure inserir pelo menos 3 cursos.
insert into curso values
	(1, 'Sistemas da informação', 'SIS', 'Alex Barreira'),
	(2, 'Ciêmcia da computação', 'CCO', 'Marise Miranda'),
    (3, 'Analise e desenvolvimento de sistemas', 'ADS', 'Gerson Santos'), 
    (4, 'Engenharia de softwere', 'ESO', 'Freza'), 
    (5, 'Engenharia da computação', 'ECO', 'Leo');
-- a) Exibir todos os dados da tabela.
select * from curso;
-- b) Exibir apenas os coordenadores dos cursos.
select cordenador from curso;
-- c) Exibir apenas os dados dos cursos de uma determinada sigla.
select * from curso where sigla = 'SIS';
-- eibir os dados da tabela ordenados pelo nome do curso.
select * from curso order by nome;
-- e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from curso order by cordenador desc;
-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from curso where nome like 'C%';
-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from curso where nome like '%o';
-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from curso where nome like '_i%';
-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from curso where nome like '%r_';
-- j) Elimine a tabela.
drop table curso;
-- EXERCICIO 6 
-- utilizando o banco de dados ‘sprint1’
use sprint1;
-- criando uma tabela para armazenagem de revistas
create table Revistas (
idRevista int primary key auto_increment,
nome varchar(40),
categoria varchar(30)
);
-- Inserir "4" registros na tabela, mas sem informar a categoria
insert into Revistas (idRevista, nome)values
	(default, 'Veja'),
    (default, 'Superinteressante'),
    (default, 'National Geographic'),
    (default, 'Forbes');
-- Exibir todos os dados da tabela.
select * from revistas;
-- Atualize os dados das categorias das "3" revistas inseridas. 
-- Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update revistas set categoria = 'Notícias e atualidades' where idrevista = 1;
update revistas set categoria = 'Ciência e cultura' where idrevista = 2;
update revistas set categoria = 'Meio ambiente e história' where idrevista = 3; 
select * from revistas;
--  Insira mais 3 registros completos
insert into revistas values
	(null, 'Época Negócios', ' Negócios e economia'),
    (null, 'Mundo Estranho', 'Curiosidades e cultura pop'),
    (null, 'Scientific American', 'Ciência e tecnologia');
-- Exibir novamente os dados da tabela.
select * from revistas;
-- Exibir a descrição da estrutura da tabela.
desc revistas;
-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table revistas modify column categoria varchar(40);
--  Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
desc revistas;
-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table revistas add column periodicidade varchar(15);
-- Exibir os dados da tabela.
select * from revistas;
--  Excluir a coluna periodicidade da tabela.
alter table revistas drop column periodicidade;
    
-- EXERCICIO 7 
-- utilizando o banco de dados ‘sprint1’
use sprint1;
--  Criar a tabela chamada Carro
-- Os valores de idCarro devem iniciar com o valor 1000 e ser incrementado automaticamente pelo sistema.
create table Carro (
idCarro int primary key auto_increment, 
nome varchar(40),
placa char(7)
);
--  Inserir 4 registros na tabela
insert into carro values 
	(1000, 'Toyota Corolla', 'JRD8X52'),
	(default, 'Honda Civic', 'BLP3Y97'),
	(default, 'Ford Mustang', 'TXM6Z24'),
	(default, 'Volkswagen Golf', 'CVQ1W85');
-- Exibir todos os dados da tabela.
select * from carro;
--  Insira mais 3 registros sem a placa dos carros
insert into carro(idCarro, nome) values
	(default, 'Chevrolet Onix'), 
	(default, 'Fiat Argo'), 
    (default, 'Renault Kwid');
--  Exibir novamente os dados da tabela.
select * from carro;
--  Exibir a descrição da estrutura da tabela.
describe carro;
-- Alterar a tabela para que a coluna nome possa ter no máximo 28 caracteres.
alter table carro modify column nome varchar(28);
 -- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna;
describe carro;
-- Acrescentar a coluna ano à tabela, que é char(4)
alter table carro add column ano char(4);
-- Atualizar todos os dados nulos da tabela;
update carro set placa = 'ZKT4M82' where idcarro =  1005;
update carro set placa = 'LRX9B37' where idcarro =  1006;
update carro set placa = 'MDP6Y14' where idcarro =  1007;
update carro set ano = '2022' where idcarro = 1;
update carro set ano = '2021' where idcarro = 2;
update carro set ano = '2020' where idcarro = 3;
update carro set ano = '2019' where idcarro = 4;
update carro set ano = '2023' where idcarro = 5;
update carro set ano = '2021' where idcarro = 6;
update carro set ano = '202' where idcarro = 7;
-- finish 