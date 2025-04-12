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
update atleta set fkPaís = 4 where idAtleta = 4;
update atleta set fkPaís = 7 where idAtleta in (7, 10);
update atleta set fkPaís = 10 where idAtleta = 8;
-- exibindo os atletas e seus respectivos paises comprovando a id primary key e id foreing key na tabela para poder verificarlo
select a.idAtleta as 'ID ATLETA', a.nome as 'NOME DO ATLETA', a.modalidade as 'MODALIDE DO ATLETA', a.qtdMedalha as 'QUANTIDADE DE MEDALHAS', a.fkPaís as 'ID ESTRANGEIRA',
		p.idPaís as 'ID PAÍS', p.nome as 'NOME DO PAÍS', p.capital as 'NOME DA CAPITAL'
			from atleta as a join país as p on a.fkPaís = p.idPaís;
-- fazendo o mesmo select mas sem os apelidos, não tinha pensado nisso antes mas deu certo
select a.*, p.* from atleta as a join país as p on a.fkPaís = p.idPaís;
-- exibindo apenas o nome do atleta e o respectivo país
select a.nome as 'NOME DO ATLETA', 
		p.nome as 'NOME DO PAÍS'
			from atleta as a join país as p on a.fkPaís = p.idPaís;
-- exibindo os dados dos atletas, seus respectivos paises, de uma determinada capital
select a.idAtleta as 'ID ATLETA', a.nome as 'NOME DO ATLETA', a.modalidade as 'MODALIDE DO ATLETA', a.qtdMedalha as 'QUANTIDADE DE MEDALHAS',
		p.nome as 'NOME DO PAÍS'
			from atleta as a join país as p on a.fkPaís = p.idPaís where p.capital = 'Brasília';

-- EXERCICIO 2
-- utilizando o banco de dados spint2
use sprint2;
-- Criar a tabela chamada Musica
create table musica (
	idMusica int primary key auto_increment, 
	titulo varchar(40), 
	artista varchar(40), 
	genero varchar(40)
);
-- inserindo dados procurando colocar um gênero de música que tenha mais de uma música, e um artista, que tenha mais de uma música cadastrada. 
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
-- criar a tabela chamada album
create table album (
	idAlbum int primary key auto_increment, 
    nome varchar(40), 
    tipo varchar(30), 
    dtLancamento date, 
    constraint ckTipo check (tipo in ('digital', 'fisico'))
);
-- Inserindo albuns
insert into album (nome, tipo, dtLancamento) values
	('Mix Para Llorar en Tu Cuarto', 'digital', '2018-12-28'),
	('Cigarettes After Sex', 'digital', '2017-06-09'),
	('Ultraviolence', 'fisico', '2014-06-13'),
	('Hasta La Muerte', 'digital', '2022-09-15'),
	('Pablo Honey', 'fisico', '1993-02-22'),
	('Nevermind', 'fisico', '1991-09-24');
/*• Fazer a modelagem lógica conforme a regra de negócio:
• 1 album pode ter 1 ou muitas músicas;
• 1 música é de 1 e somente 1 album;*/
-- conforme a regra de negocio a foreing key irá estar na tabela musica para que na tabela album as ids de um album não se repitam
-- a) Exibir todos os dados das tabelas separadamente;
select * from musica;
select * from album;
-- b) Criar a chave estrangeira na tabela de acordo com a regra de negócio;
alter table musica add column fkAlbum int,
	add constraint fkAlbumMusica foreign key (fkAlbum)
		references album(idAlbum);
-- c) Atualizar os álbuns de cada música;
update musica set fkAlbum = 1 where idMusica in (1, 6);
update musica set fkAlbum = 2 where idMusica in (2, 9 );
update musica set fkAlbum = 3 where idMusica = 3;
update musica set fkAlbum = 4 where idMusica in (4, 10);
update musica set fkAlbum = 5 where idMusica = 8;
update musica set fkAlbum = 6 where idMusica in (5, 7);
-- d) Exibir as músicas e seus respectivos álbuns;
select m.*, a.* from musica as m join album as a on m.fkAlbum = a.idAlbum;
-- e) Exibir somente o título da música e o nome do seu respectivo álbum;
select m.titulo as 'TITULO DA MUSICA', a.nome as 'NOME DO ALBÚM' 
		from musica as m join album as a on m.fkAlbum = a.idAlbum;
-- f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.
select m.idMusica as 'ID MÚSICA', m.titulo as 'TÍTULO DA MÚSICA', m.genero as 'GÊNERO', 
		a.nome as 'NOME DO ÁLBUM'
			from musica as m join album as a on m.fkAlbum = a.idAlbum 
				where a.tipo = 'digital';   
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
-- EXERCICIO 3
-- usando o bamco de dados sprint2
use sprint2;
-- criando as tabelas pessoa e reserva seguindo os campos da modelagem no moodle
create table pessoa(
	idPessoa int primary key auto_increment, 
    nome varchar(45), 
    cpf char(11) unique 
    );
    
alter table pessoa modify column cpf char(11) unique;

create table reserva(
	idReserva int primary key auto_increment, 
    dtReserva datetime, 
    dtRetirada datetime, 
    dtDevolucao datetime 
    );
--    constraint fkReservaPessoa foreign key (fkPessoa)
	-- 	references pessoa(IdPessoa)
    
-- - Inserindo 5 registros nas duas tabelas
insert into pessoa (nome, cpf) values
	('Jhoel Diego Mamani Mita', '10020030010'), 
	('Cristian Rodrigo da Silva', '20030040010'), 
	('Elora Adami Soeiro', '30040050010'), 
	('Alexander Lima da Costa', '40050060010'), 
	('Emilly Luiza Tavares Sorati', '50060070010');
insert into reserva values
	(default, '2025-03-22 10:00:00', '2025-03-23 09:00:00', '2025-03-25 17:00:00'),
	(default, '2025-03-20 14:30:00', '2025-03-21 08:00:00', '2025-03-23 18:30:00'),
	(default, '2025-03-21 16:45:00', '2025-03-22 10:30:00', '2025-03-24 12:00:00'),
	(default, '2025-03-19 11:15:00', '2025-03-20 09:00:00', '2025-03-22 15:30:00'),
	(default, '2025-03-23 13:00:00', '2025-03-24 10:00:00', '2025-03-26 14:00:00');
-- configurando a chave estrangeira na tabela reserva

alter table reserva add column fkPessoa int, 
	add constraint fkPessoaReserva foreign key (fkPessoa) 
		references pessoa(idPessoa);
        
-- prenchendo a nova columna
update reserva set fkPessoa = 1 where idReserva = 4; 
update reserva set fkPessoa = 2 where idReserva = 3; 
update reserva set fkPessoa = 3 where idReserva in (1,5);
update reserva set fkPessoa = 3, fkPessoa = 4 where idReserva = 1;
select * from reserva;
update reserva set fkPessoa = 5 where idReserva = 2;
 
 -- exibindo todos os dados 
 select p.*, r.* from pessoa as p join reserva as r on p.idPessoa = r.idPessoa;
 
 -- exibindo dados com as, 
 
 select r.idReserva as 'ID RESERVA', r.dtReserva as 'DATA E HORA DA RESERVA', r.dtRetirada as 'DATA E HORA DA RETIRADA', r.dtDevolucao as 'DATA E HORA DA DEVOLUÇÃO', 
	p.nome as 'NOME DO CLIENTE  QUE FEZ A RESERVA', p.cpf as 'CPF DDO CLIENTE '
		from reserva as r join pessoa as p on r.fkPessoa = p.idPessoa;
        
-- usado os apelidos e procurado as reservas de um especifico cliente
select r.idReserva as 'ID RESERVA', p.nome as 'NOME DO CLIENTE', p.cpf as 'CPF DO CLIENTE', 
	 r.dtReserva as 'DATA E HORA DA RESERVA', r.dtRetirada as 'DATA E HORA DA RETIRADA', r.dtDevolucao as 'DATA E HORA DA DEVOLUÇÃO'
    from pessoa as p join reserva as r on p.idPessoa = r.fkPessoa where p.nome like 'Elora%';
    
-- usando os apelido e procurando as reservas que foram concluidas hoje
select r.idReserva as 'ID RESERVA', r.dtReserva as 'DATA E HORA DA RESERVA', r.dtRetirada as 'DATA E HORA DA RETIRADA', r.dtDevolucao as 'DATA E HORA DA DEVOLUÇÃO', 
	p.nome as 'NOME DO CLIENTE  QUE FEZ A RESERVA', p.cpf as 'CPF DO CLIENTE ' 
    from reserva as r join pessoa as p on r.fkPessoa = p.idPessoa
		where r.dtDevolucao like '2025-03-22%';
        
update reserva set dtDevolucao = null where idReserva in (3,4,5);
        
select
    p.nome as 'Cliente', r.dtReserva as 'Data Reserva', r.dtRetirada as 'Data Retirada',r.dtDevolucao as 'Data Devolução',
    case 
        when r.dtDevolucao is null then  'Em Aberto'
        else 'Finalizado'
   end as Status_Reserva
from pessoa p join reserva r on p.idPessoa = r.fkPessoa;

        
/*select r.*, p.*, 
	case 
		when datediff(r.dtDevolucao, r.dtRetirada) <= 1  
			then 'Tempo de estadia menor ou igual a um dia'
				else concat(datediff(r.dtDevolucao,  r.dtRetirada ), ' dias de estadia')
					end as TempoEstadia
						from reserva as r join pessoa as p on r.fkPessoa = p.idPessoa; */-- UTILIZANDO O DATEDIFF DEU CERTO
               
-- fazenos updates para que mais na frente ao fazer a media fique um numero mais legal
update reserva set dtDevolucao = '2025-03-30 17:00:00' where idReserva in (2,4); 
update reserva set dtDevolucao = '2025-03-30 15:30:00' where idReserva in (3,5); 
update reserva set dtDevolucao = '2025-03-24 15:30:00' where idReserva = 1;

-- case para ver tempo de estadia e a media de um usuario
-- a seguir o select deu errado ao apresentar media de 1.0000 e de 6.0000 para arrumar pesquisei como fazer a media aritmetica e apareceu a função AVG 
select r.*, p.*,
	case 
		when datediff(r.dtDevolucao, r.dtRetirada) <= 0 
			then 'Reserva cancelada'
				else concat(datediff(r.dtDevolucao,  r.dtRetirada ), ' dias de estadia')
					end as TempoEstadia
	from reserva as r join pessoa as p on r.fkPessoa = p.idPessoa
						where r.fkPessoa = 3;
        
-- a seguir o mesmo select mas com cpfs nao informados
update pessoa set cpf = null where idPessoa in (1,2,5);
select r.idReserva as 'ID RESERVA', r.dtReserva as 'DATA E HORA DA RESERVA', r.dtRetirada as 'DATA E HORA DA RETIRADA', ifnull(r.dtDevolucao, 'Reserva em andamento') as 'DATA E HORA OU STATUS DA DEVOLUÇÃO', 
	p.nome as 'NOME DO CLIENTE QUE FEZ A RESERVA', ifnull(p.cpf, 'CPF não informado') as 'CPF DO CLIENTE'
		from reserva as r join pessoa as p on r.fkPessoa = p.idPessoa;
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
-- EXERCICIO 4 
-- criando as duas tabelas seguindo a modelagem disponivel no modle
create table pessoa1 (
	idPessoa1 int primary key auto_increment, 
    nome varchar(45), 
    dtNascimento date
    );
create table pessoa2 (
	idPessoa2 int primary key auto_increment, 
    nome varchar(45), 
    dtNascimento date, 
    fkpessoa1 int unique
    );
-- inserindo 5 registros nas duas tabelas
insert into pessoa1 (nome, dtNascimento) values
('Bruno Santos', '1985-11-30'),
('Daniel Oliveira', '1988-01-10'),
('Eduardo Lima', '1995-07-20'),
('Lucas Almeida', '1991-07-30'),
('Gustavo Rocha', '1987-09-25');
insert into pessoa2 (nome, dtNascimento, fkpessoa1) values
('Alice Silva', '1990-05-15', null),
('Carla Costa', '1992-08-22', 4),
('Fernanda Lima', '1993-04-12', 2),
('Isabela Martins', '1995-12-05', 3),
('Mariana Souza', '1989-03-18', NULL);
 -- na modelagem só tinha o nome das tabelas e uma maneira de relacionarlos por mim foi a ideia de casamento na qual o uso de unique faz mais sentido, já que em teoria só pode estar casado com um
 -- pensava fazer com familia mas existem mais de um familiar talvez relacionar filhos com as mães poderia ter sido bom também
alter table pessoa2 add constraint fkPessoa2Pessoa1 foreign key (fkpessoa1) 
	references pessoa1(idPessoa1);
-- exibindo todos os dados
select u.*, d.* from pessoa1 as u join pessoa2 as d on d.fkPessoa1 = u.idPessoa1;
-- exibindo os dados com as selecionando as pessoas casadas
select u.idPessoa1 as 'ID MARIDO', u.nome as 'NOME DO MARIDO', u.dtNascimento as 'DATA DE NASCIMENTO', 
	d.idPessoa2 as 'ID MULHER', d.nome as 'NOME DA MULHER',  d.dtNascimento as 	'DATA DE NASCIMENTO'
		from pessoa1 as u join pessoa2 as d on u.idPessoa1 = d.fkPessoa1; 
-- exibindo os dados com case 
-- exibindo a diferença de idade dos casais
select u.idPessoa1 as 'ID MARIDO', u.nome as 'NOME DO MARIDO', u.dtNascimento as 'DATA DE NASCIMENTO', 
	d.idPessoa2 as 'ID MULHER', d.nome as 'NOME DA MULHER',  d.dtNascimento as 	'DATA DE NASCIMENTO', 
    case
		when datediff(u.dtNascimento, d.dtNascimento) >1 
			then concat((datediff(u.dtNascimento, d.dtNascimento)/365), 'anos') -- utilização da divisão de 365 uma vez que a funçãp datediff tras a difernça em dias e assim converter de dias para anos [x dias * (1/365dias) = y anos]
		when (datediff(u.dtNascimento, d.dtNascimento) / 365) = 1
        	then '1 ano'
		when (datediff(u.dtNascimento, d.dtNascimento) / 365) = 0
			then 'Ambos tem a mesma idade'
		when (datediff(u.dtNascimento, d.dtNascimento) /365) < 0
			then concat((datediff(d.dtNascimento, u.dtNascimento) / 365), 'anos') -- se a difernça é menor que cero então a mulher é mais velha que o homen portanto basta inverter os valores
	end as DifemcaIdade
		from pessoa1 as u join pessoa2 as d on u.idPessoa1 = d.fkPessoa1;
        
/*exibindo os dados com ifnull
select u.*, d.idPessoa2, d.nome, d.dtNascimento, ifnull(d.fkPessoa1, 'Nenhum homem associado') as fkPessoa1 , d.dtNascimento 
	from pessoa1 as u join pessoa2 as d; AQUI ELE REPETIU A ID DE CADA UMA 5 VEZES OU SEJA TODAS AS COMBINAÇÕES POSSIVEIS IREI DEIXAR NULO OUTRO*/
select idpessoa2, nome, dtnascimento, ifnull(fkpessoa1, 'Nenhum homem associado') as homemAssociado 
	from pessoa2;
--  deixando os seguintes campo em nulo para utilizar o join 
update  pessoa1 set dtNascimento = null where idPessoa1 in(2,4);
update pessoa2 set dtNascimento = null where idPessoa2 = 4;

select u.idPessoa1, u.nome, ifnull(u.dtNascimento, 'Data de nascimento não informado') as dtNascimento,
		d.idPessoa2, u.nome, ifnull(d.dtNascimento, 'Data de nascimento não informado') as dtNascimento, d.fkPessoa1
        from pessoa1 as u join pessoa2 as d on u.idPessoa1 = d.fkPessoa1;

-- EXERCICIO 5
-- criando as tabelas seguindo minha interpretação dos dados 
-- Referente a regra de negócio acima, cria a modelagem utilizando um relacionamento 1:1
create table candidato (
	idCandidato int primary key auto_increment, 
    nome varchar(45), 
    email varchar(45) unique,  
    cpf varchar(45), 
    dtNascimento date, 
    telefone  varchar(11) unique
);
-- implementação do relacionamento 1:1 na tabela habilitação na qual uso a primary key da tabela candidato, já que a habilitação é unica utilizo o unique
--  aqui eu queria trazer a pk de solicitacao mas como pode ter duas solicitacao a id da habilitação não pode ser duplicada.
create table habilitacao(
	idHabilitacao int primary key auto_increment, 
    categoria varchar (20), 
    statusHabilitacao varchar(20), 
	acc varchar(20),
    dtEmissao date, 
    dtValidade date, 
    fkCandidato int unique,
    constraint ckCategoria check (categoria in ('A', 'B', 'A e B', null)),  -- pode ser nulo se somente será acc
    constraint ckStatusCategoria check (statusHabilitacao in ('Válida', 'Suspensa', 'Cassada', 'Vencida', null)),  -- pode ser nulo se somente será acc
    constraint ckAcc check(acc in('Sim', 'Não', 'Em solicitação')),
    constraint ckDtValidade check(dtValidade = (dtEmissao + 365)) -- intentei agregar esta constraint mas não deu certo  error code 3819
);
-- eliminando a constraint de cima
alter table habilitacao drop constraint ckDtValidade;

-- implementação do relacionamento 1:1 na tabela solicitação com a primary key da tabela habilitacao, uma vez que um candidato pode fazer mais de uma solicitação ex primeiro da hanilitacao a e b e depois para a ACC
-- porem nao sei se pode colocar mais de uma foreing key eu queria colocar a do candidato mas decidi nao arriscar
create table solicitacao (
	idSolicitacao int primary key auto_increment,
    categoriaSolicitada varchar (20), 
    statusSolicitacao varchar(20), 
    accSolicitacao varchar(20), 
    statusSolicitacaoAcc varchar (20),
    fkHabilitacao int unique, 
    constraint ckCategoriaSolicitada check (categoriaSolicitada in ('A', 'B', 'A e B', null)), -- pode ser nulo se somente será acc
    constraint ckStatusSolicitacao check (statusSolicitacao in ('Pendente', 'Aprovada', 'Recusada', null)), -- pode ser nulo se somente será acc
    constraint ckAccSolicitacao check (accSolicitacao in ('Sim', 'Não', 'Em andamento', 'cassada')),
    constraint ckStatusSolicitacaoAcc check(statusSolicitacaoAcc in ('Pendente', 'Aprovada', 'Recusada', null)) -- pode ser nulo se ele nao inicou o processo para acc
);
-- inserindo 5 registros nas 3 tabelas
insert into candidato (nome, email, cpf, dtNascimento, telefone) values
('João Silva', 'joao.silva@email.com', '123.456.789-01', '1990-05-15', '11987654321'),
('Maria Oliveira', 'maria.oliveira@email.com', '987.654.321-02', '1985-08-20', '11987654322'),
('Carlos Santos', 'carlos.santos@email.com', '456.789.123-03', '1993-12-10', '11987654323'),
('Fernanda Costa', 'fernanda.costa@email.com', '741.852.963-04', '1997-03-25', '11987654324'),
('Ricardo Lima', 'ricardo.lima@email.com', '369.258.147-05', '2000-09-30', '11987654325');

insert into habilitacao (categoria, statusHabilitacao, acc, dtEmissao, dtValidade, fkCandidato) values
('A', 'Válida', 'Não', '2024-01-10', '2025-01-10', 1),         -- Habilitação com ACC solicitada ('Sim', 'Pendente')
('B', 'Suspensa', 'Em solicitação', '2023-05-20', '2024-05-20', 2),       -- ACC em andamento
('A e B', 'Cassada', 'Sim', '2022-07-15', '2023-07-15', 3),     -- ACC não solicitada, mas categoria recusada
('B', 'Válida', 'Sim', '2023-09-05', '2024-09-05', 4),           -- Sem ACC, categoria aprovada
('A', 'Vencida', 'Em solicitação', '2022-11-20', '2023-11-20', 5);          -- Habilitação vencida, solicitação pendente


insert into solicitacao (categoriaSolicitada, statusSolicitacao, accSolicitacao, statusSolicitacaoAcc, fkHabilitacao) values
('A e B', 'Aprovada', 'Sim', 'Pendente', 1),
(null, null, 'Sim', 'Em andamento', 2),
('B', 'Recusada', 'Sim', 'Aprovada', 3),
('A', 'Aprovada', 'Sim', 'Aprovada', 4),
('A e B', 'Pendente', 'Sim', 'Pendente', 5);

-- configurando a chave estrangeira nas tabelas
alter table habilitacao add constraint fkCandidatoHabilitacao foreign key (fkCandidato)
	references candidato(idCandidato); 
alter table solicitacao add constraint fkHabilitacaoSolicitacao foreign key (fkHabilitacao)
	references habilitacao(idHabilitacao);
-- exibindo os dados de cada tabela 
select * from candidato;
select * from habilitacao;
select * from solicitacao;
-- exibindo os dados com as
select 	c.idCandidato as 'ID DO CANDIDATO', c.nome as 'NOME DO CANDIDATO', c.cpf as 'CPF DO CANDIDATO', c.dtNascimento as 'DATA DE NASCIMENTO DO CANDIDATO',
			h.idHabilitacao as 'ID DA HABILITAÇÃO', h.categoria as 'CATEGORIA DA HABILITAÇÃO', h.statusHabilitacao as 'STATUS DA HABILITAÇÃO', h.acc as 'AUTORIZAÇÃO PARA CONDIZIR CICLOMOTO', h.dtEmissao as 'DATA DA EMISSÃO DA HABILITAÇÃO', h.dtValidade as 'DATA DE VALIDADE DA HABILITAÇÃO', 
				s.idSolicitacao as 'ID DA SOLICITAÇÃO', s.categoriaSolicitada as 'CATEGORIA DA SOLICITAÇÃO', s.statusSolicitacao as 'STATUS DA SOLICITAÇÃO', s.accSolicitacao as 'SOLICITAÇÃO DA ACC', s.statusSolicitacaoAcc as'STATUS DA SOLICITAÇÃO DA ACC' 
		from candidato as c join habilitacao as h on c.idCandidato = h.fkCandidato
					join solicitacao as s on h.idHabilitacao = s.fkHabilitacao; -- select feito em base ao apresentado na aula, apareceu as informaçpes dos 5 candidatos já que em pelo menos um join eles estao relacionados com as outras tabelas
 select  c.nome as 'NOME DO CANDIDATO',  c.cpf as 'CPF DO CANDIDATO', 
			h.categoria as 'CATEGORIA DA HABILITAÇÃO', h.statusHabilitacao as 'STATUS DA HABILITAÇÃO', h.acc as 'AUTORIZAÇÃO PARA CONDIZIR CICLOMOTO'
		from candidato as c join habilitacao as h on c.idCandidato = h.fkCandidato;

-- exibindo os dados com case 
-- mostrando o status da habilitacao de forma mais detalhada 
select c.nome, 
			h.idHabilitacao, h.categoria,h.statusHabilitacao,
	case when h.statusHabilitacao = 'Válida' 
			then 'Habilitação ativa'
		when h.statusHabilitacao = 'Suspensa' 
			then 'Habilitação temporareamente inativa'
		when h.statusHabilitacao = 'Cassada' 
			then 'Habilitação permanentemente inativa'
		when h.statusHabilitacao = 'Vencida'
			then 'Habilitação vencida' 
		else 'O candidato não possui uma habilitação'
	end as StatusHabilitacaoMensagem
	from candidato as c join habilitacao as h on c.idCandidato = h.fkCandidato;
    
-- exibindo os dados com ifnull 
-- tirando campos precnhidos para que a consulta com o ifnull fiquem melhor 

update candidato set email = null where idCandidato in (1,4,5);
update candidato set telefone = null where idCandidato in (2,3);
update candidato set cpf = null where idCandidato in (1,5);
update habilitacao set categoria = null where idHabilitacao in (3, 4 );
update habilitacao set statusHabilitacao = null where idHabilitacao in (3, 4 );

select 	c.idCandidato, c.nome , ifnull(c.email, 'Email não cadastrado') as email,  ifnull(c.cpf, 'CPF não cadastrado') as cpf , c.dtNascimento , ifnull(c.telefone, 'Telefone não cadastrado') as telefone, 
			h.idHabilitacao , ifnull(h.categoria, 'Candidato não possui uma categoria') as categoria, ifnull(h.statusHabilitacao, 'Candidato não possui nenhuma categoria') as statusHabilitacao, h.acc , h.dtEmissao , h.dtValidade , 
				s.idSolicitacao , ifnull(s.categoriaSolicitada, 'Nenhuma categoria solicitada') as categoriaSolicitada , ifnull(s.statusSolicitacao, 'Nenhum status informado') as statusSolicitacao, s.accSolicitacao , s.statusSolicitacaoAcc
	from candidato as c join habilitacao as h on c.idCandidato = h.fkCandidato
					join solicitacao as s on h.idHabilitacao = s.fkHabilitacao;
-- EXERCICIO 6
-- usando o banco de dados sprint2
use sprint2;

-- criando as tabelas seguindo minha interpretação dos dados 
-- Referente a regra de negócio acima, cria a modelagem utilizando um relacionamento 1:1 para as tres tabelas
create table farmacia (
    idFarmacia int primary key auto_increment,
    nome varchar(45) ,
    cnpj char(14) unique 
);

-- criando a tabela endereço
create table endereco (
    idEndereco int primary key auto_increment,
    logradouro varchar(45) ,
    numero varchar(10) ,
    cidade varchar(45) ,
    estado char(2),
    fkFarmacia int unique
);

-- criando a tabela farmacêutico
create table farmaceutico (
    idfarmaceutico int primary key auto_increment,
    nome varchar(45) ,
    cpf char(11) ,
    fkfarmacia int
);

-- inserindo dados na tabela farmácia
insert into farmacia (nome, cnpj) values
('Farmácia central', '12345678000101'),
('Farmácia popular', '23456789000102'),
('Farmácia saúde', '34567890000103'),
('Farmácia bem estar', '45678901000104'),
('Farmácia vida', '56789012000105');

-- inserindo dados na tabela endereço
insert into endereco (logradouro, numero, cidade, estado, fkfarmacia) values
('Rua das flores', '123', 'são paulo', 'sp', 1),
('Avenida brasil', '456', 'rio de janeiro', 'rj', 2),
('Rua das palmeiras', '789', 'belo horizonte', 'mg', 3),
('Avenida paulista', '1011', 'são paulo', 'sp', 4),
('Rua das acácias', '1213', 'curitiba', 'pr', 5);

-- inserindo dados na tabela farmacêutico
insert into farmaceutico (nome, cpf, fkfarmacia) values
('João Silva', '24567812420', 1),
('Maria Oliveira', '78564584532', 1),
('Carlos Santos', '46248642610', 2),
('Ana Costa', '35415620710', 3),
('Pedro Lima', '97426513870', 4),
('Fernanda Rocha', '24869701545', 5);

-- configurando as chaves estrangeiras
alter table endereco add constraint fkfarmaciaendereco foreign key (fkFarmacia) references farmacia(idFarmacia);
alter table farmaceutico add constraint fkfarmaciafarmaceutico foreign key (fkFarmacia) references farmacia(idfarmacia);
-- exibindo os dados das tabelas separadamente
select * from farmacia;
select * from endereco;
select * from farmaceutico;

-- exibindo os dados com as
select f.nome as nomefarmacia,f.cnpj as cnpj,
		e.logradouro as logradouro,e.numero as numero,e.cidade as cidade,e.estado as estado
	from farmacia f join endereco e on f.idfarmacia = e.fkfarmacia;

-- exibindo os dados com case
select f.nome as nomefarmacia,
		e.cidade as cidade,
    case 
        when e.estado = 'sp' 
			then 'são paulo'
        when e.estado = 'rj' 
			then 'rio de janeiro'
        when e.estado = 'mg' 
			then 'minas gerais'
        when e.estado = 'pr' 
			then 'paraná'
        else 'outro estado'
    end as estadodescricao
from farmacia f join endereco e on f.idfarmacia = e.fkfarmacia;

-- exibindo os dados com ifnull
-- atualizando alguns campos para null para que fique melhor
update farmacia set cnpj = null where idFarmacia = 3;
update endereco set numero = null where idEndereco in (1,5);
update farmaceutico set cpf = null where idFarmaceutico = 4; 
 
 select f.idFarmacia, f.nome, ifnull(f.cnpj, 'CNPJ não cadastrado') as cnpjSituacao, 
		e.logradouro, ifnull(e.numero, 'Número não cadastrado') as numeroSituacao, e.cidade, e.estado, 
        fa.nome, ifnull(fa.nome, 'CPF não cadastrado') as cpfSituacao
	from farmacia as f join endereco as e on  f.idFarmacia = e.fkFarmacia 
						join farmaceutico as fa on fa.fkfarmacia = f.idFarmacia;

