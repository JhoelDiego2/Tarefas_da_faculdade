create database sprint1;
use sprint1;
-- EXERCICIO 1
create table Atleta(
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int 
);
-- Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
insert into Atleta ( idAtleta, nome, modalidade, qtdMedalha ) values
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
select * from Atleta;
--  Exibir apenas os nomes e quantidade de medalhas dos atletas.
select nome, qtdMedalha from Atleta;
-- Exibir apenas os dados dos atletas de uma determinada modalidade.
select * from Atleta where modalidade = 'Basquete';
-- Exibir os dados da tabela ordenados pela modalidade.
select * from Atleta order by modalidade;
--  Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.
select * from Atleta order by qtdMedalha desc;
-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
select * from Atleta where nome like '%s%';
--  Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
select * from Atleta where nome like 'L%';
--  Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
select * from Atleta where nome like '%_o';
-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
select * from Atleta where nome like '%r_';
--  Eliminar a tabela.
drop table Atleta;

-- EXERCICIO 2 
use sprint1;
create table Musica (
idMusica int primary key, 
titulo varchar(40), 
artista varchar(40), 
genero varchar(40)
);
insert into Musica (idMusica, titulo, artista, genero) values
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
select * from Musica;
-- b) Exibir apenas os títulos e os artistas das músicas.
select titulo, artista from Musica;
-- c) Exibir apenas os dados das músicas de um determinado gênero.
select * from Musica where genero = 'Folk';
-- d) Exibir apenas os dados das músicas de um determinado artista.
select * from Musica where artista = 'Ed Maverick';
-- e) Exibir os dados da tabela ordenados pelo título da música.
select * from Musica order by titulo;
-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
select * from Musica order by artista desc;
-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
select * from Musica where titulo like'S%';
-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
select * from Musica where artista like '%x';
-- i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
select * from Musica where genero like '_n%';
-- j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
select * from Musica where titulo like '%e_';
-- k) Elimine a tabela.
drop table Musica;

-- Exercicio 3 

use sprint1;
create table Filme (
idFilme int primary key,
titulo varchar(50), 
genero varchar(40),
diretor varchar(40)
);
insert into Filme (idFilme, titulo, genero, diretor) values 
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
select * from Filme;
--  Exibir apenas os títulos e os diretores dos filmes.
select titulo, diretor from Filme; 
-- Exibir apenas os dados dos filmes de um determinado gênero.
select * from Filme where genero = 'Ficção Científica';
--  Exibir apenas os dados dos filmes de um determinado diretor.
select * from Filme where diretor = 'Chistopher Nolan';
--  Exibir os dados da tabela ordenados pelo título do filme.
select * from Filme order by titulo; 
--  Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
select * from Filme order by diretor desc;
--  Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
select * from Filme where titulo like 'P%';
--  Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
select * from Filme where diretor like '%n';
--  Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
select * from Filme where genero like '_r%';
-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
select * from Filme where titulo like '%m_';
-- Elimine a tabela.
drop table Filme;

-- EXERCICIO 4 

use sprint1;
create table Professor (
idProfessor int primary key,
nome varchar(50),
especialidade varchar(40),
dtNasc char(10)
);
--  data: ‘AAAA-MM-DD’ 
insert into Professor (idProfessor, nome, especialidade, dtNasc) values
	(1, 'Vivian', 'Banco de dados', '1990-06-30'),
    (2, 'Frezza', 'Algoritmo', '1980-08-22'),
    (3, 'Fernanda', 'Projeto & Pesquisa', '1990-01-28'),
    (4, 'Rosim', 'Banco de dados', '1985-04-31'),
    (5, 'Jp', 'Algoritmo', '2000-07-23'), 
    (6, 'Vivian', 'Introdução a SO', '1990-06-30'), 
    (7, 'Thiago', 'Socio Emocional', '1986-04-24'), 
    (8, 'Leo', 'Socio Emocional', '1980-02-21'),
    (9, 'Manoel', 'Algoritmo', '1991-10-10'), 
    (10, 'Marise', 'Calculo Computacional', '1998-05-22');
-- a) Exibir todos os dados da tabela.
select * from Professor;
-- b) Exibir apenas as especialidades dos professores.
select especialidade from Professor;
-- c) Exibir apenas os dados dos professores de uma determinada especialidade.
select * from Professor where especialidade = 'Banco de Dados';
-- d) Exibir os dados da tabela ordenados pelo nome do professor.
select * from Professor order by nome;
-- e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
select * from Professor order by dtNasc desc;
-- f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
select * from Professor where nome like 'L%';
-- g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
select * from Professor where nome like '%e';
-- h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
select * from Professor where nome like '_r%'; 
-- i) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
select * from Professor where nome like '%a_';
-- j) Elimine a tabela.
drop table Professor; 


-- Exercico 5 

use sprint1;
create table Jogo (
idJogo int primary key,
nome varchar(50),
comentario varchar(200), 
ranking int 
);
insert into Jogo (idJogo, nome, comentario, ranking) values 
	(1, 'Genshin Impact', 'Genshin Impact é um jogo eletrônico RPG gratuito que tem um mundo enorme e cheio de segredos, personagens, e diferentes formas de combinar os poderes dos personagens', 5),
    (2, 'Free Fire', 'Free Fire é um jogo de tiros para dispositivos moveis, tem diferentes formas de jogar mas o mais famoso é o "Battle Royale", jogo bom pela facilidade de jogar em diferentes dispositivos', 2), 
    (3, 'Multiversus', 'Multiversus é um jogo de luta gratuito disponivel na steam, onde o diferencial é a quantidade de personagens iconicos jogaveis como Batman, Tom e Jerry, Superman, Bugs Bunny', 3), 
    (4, 'Clash Royale', 'Clash Royale é um jogo de estratégia em tempo real disponível na Play Store, onde tem varios eventos e formas de jogar, a mais famosa é a de 1 vs 1', 4), 
    (5, 'Brawl Stars', 'Brawl Stars é um jogo e ação multijogador online da Supercell, onde equipes competem em diferentes modalidades, a minha favorita é a de futeball, sendo partidas curtas e divertidas', 6), 
    (6, 'Pou', 'Pou é um jogo mobile onde é possivel cuidar do nosso pou através de jogos, alimentos, banhos entre outros, é um jogo relativamente velho bastante famoso', 7),
    (7, 'Among Us', 'Among Us é um jogo de dedução social que se tornou famosa no meio da pandemia, onde varios stremers o jogaram, basicamente o jogo trata de encontrar a pessoa impostora', 9), 
    (8, 'Minecraft', 'Minecraft é um jogo bem popular, tem diferentes formas de jogar mas o mais famoso é o de supervivência, onde você tem liberdade de fazer varias coisas criativas', 1);
-- a) Exibir todos os dados da tabela.
select * from Jogo;
-- b) Exibir apenas os nomes dos jogos.
select nome from Jogo;
-- c) Exibir apenas o comentário de um determinado jogo.
select comentario from Jogo where nome = 'Brawl Stars';
-- d) Exibir os dados da tabela ordenados pelo nome do jogo.
select * from Jogo order by nome;
-- e) Exibir os dados da tabela ordenados pelo ranking em ordem decrescente.
select * from Jogo order by ranking desc;
-- f) Exibir os dados da tabela, dos jogos cujo nome comece com uma determinada letra.
select * from Jogo where nome like 'M%';
-- g) Exibir os dados da tabela, dos jogos cujo nome termine com uma determinada letra.
select * from Jogo where nome like '%s';
-- h) Exibir os dados da tabela, dos jogos cujo nome tenha como segunda letra uma determinada letra.
select * from Jogo where nome like '_r%';
-- i) Exibir os dados da tabela, dos jogos cujo nome tenha como penúltima letra uma determinada letra.
select * from Jogo where nome like '%u_';
-- j) Exibir os dados da tabela, dos jogos cujo nome seja diferente de Minecraft.
select * from Jogo where nome <> 'Minecraft';
-- k) Elimine a tabela.
drop table Jogo;