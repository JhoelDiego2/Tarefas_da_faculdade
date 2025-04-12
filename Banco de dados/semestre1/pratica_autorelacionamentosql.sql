create database pratica_auto;
use pratica_auto;
create table areaAtuacao(
	idArea int primary key auto_increment, 
    area varchar(45), 
    cargo varchar(45)
);
create table funcionario(
	idFuncionario int primary key auto_increment, 
    Nome varchar(45), 
    cpf char (11), 
    supervisor varchar (10),
    fkSupervisor int, 
    fkAreaAtuacao int , 
    constraint ckSupervisor check (supervisor in ('sim', 'não', null)),
    constraint fkSuperFuncionario foreign key (fkSupervisor)
		references funcionario(idFuncionario), 
	constraint fkAreaFuncionario foreign key (fkAreaAtuacao)
		references areaAtuacao(idArea)
);
-- inserido dados 

INSERT INTO areaAtuacao (area, cargo) VALUES 
-- TI
('TI', 'Desenvolvedor'),        -- ID 1
('TI', 'Analista de Suporte'),  -- ID 2
('TI', 'Gerente de Projetos'),  -- ID 3
('TI', 'Engenheiro de Software'), -- ID 4
('TI', 'Analista de Segurança da Informação'), -- ID 5

-- Marketing
('Marketing', 'Designer'),       -- ID 6
('Marketing', 'Gerente de Marketing'), -- ID 7
('Marketing', 'Copywriter'),     -- ID 8
('Marketing', 'Especialista em SEO'), -- ID 9
('Marketing', 'Coordenador de Marketing'); -- ID 10

-- Inserindo o dono da empresa (sem supervisor)
INSERT INTO funcionario (nome, cpf) VALUES 
('Jhoel Mita', '00000000000' );

-- Inserindo supervisores (respondem ao dono)
INSERT INTO funcionario (nome, cpf, supervisor, fkSupervisor, fkAreaAtuacao) VALUES 
('Carlos Silva', '12345678901', 'sim', 1, 3),  -- ID 2 - Gerente de Projetos (TI)
('Ana Souza', '23456789012', 'sim', 1, 10);     -- ID 3 - Gerente de Marketing (Marketing)

-- Inserindo 6 funcionários de TI (supervisionados por Carlos Silva - ID 2)
INSERT INTO funcionario (nome, cpf, supervisor, fkSupervisor, fkAreaAtuacao) VALUES 
('Mariana Costa', '45678901234', 'não', 2, 1),  -- ID 4 - Desenvolvedor
('Pedro Santos', '56789012345', 'não', 2, 1),   -- ID 5 - Desenvolvedor
('Juliana Lima', '67890123456', 'não', 2, 2),   -- ID 6 - Analista de Suporte
('Lucas Martins', '78901234567', 'não', 2, 4),  -- ID 7 - Engenheiro de Software
('Guilherme Souza', '90123456789', 'não', 2, 5); -- ID 9 - Analista de Segurança da Informação

-- Inserindo 6 funcionários de Marketing (supervisionados por Ana Souza - ID 3)
INSERT INTO funcionario (nome, cpf, supervisor, fkSupervisor, fkAreaAtuacao) VALUES 
('Laura Mendes', '11223344556', 'não', 3, 6),  -- ID 10 - Designer
('Thiago Rocha', '22334455667', 'não', 3, 6),  -- ID 11 - Designer
('Bianca Alves', '44556677889', 'não', 3, 8), -- ID 13 - Copywriter
('Rodrigo Mendes', '55667788990', 'não', 3, 9), -- ID 14 - Especialista em SEO
('Paula Ferreira', '66778899001', 'não', 3, 10); -- ID 15 - Coordenadora de Marketing


select * from areaAtuacao;
select * from funcionario;
update funcionario set nome = 'Vivian' where idFuncionario = 1;
-- select de todos os funcionarios da empresa e seu respectivo supervisor e a area de atuação, juntanto as tres tabelas e usando ifnull
select f.nome as NOME, f.cpf as CPF,  ifnull(f.supervisor,'Gerente Geral') as SUPERVISOR , 
		ifnull(a.area, 'Gerencia') as ÁREA, ifnull(a.cargo, 'Gerenciar todas as areas') as 'FUNÇÃO', 
		ifnull(s.nome, 'Não tem supervisor') as 'NOME DO SUPERVISOR'
	from funcionario as f left join areaAtuacao as a on f.fkAreaAtuacao = a.idArea
    left join funcionario as s  on f.fkSupervisor = s.idFuncionario;

-- select utilizando join e where para peocurar os funcionarios da area de ti 
select f.nome as NOME, f.cpf as CPF, 
		a.area as ÁREA,  a.cargo AS CARGO
        from funcionario as f 
		join areaAtuacao as a on f.fkAreaAtuacao = a.idArea
			where a.area = 'TI';
            
--  select utilizando join e case para que caso ele seja supervisor, exista uma columna para isso utilizando o left join para que mostre o gerente geral também 

select f.nome as NOME, f.cpf as CPF, 
		ifnull(a.area, 'Gerencia') as ÁREA, ifnull(a.cargo, 'Gerenciar todas as áreas') as 'FUNÇÃO', 
        case when f.supervisor = 'sim' then 'Supervisor'
			when f.supervisor = 'não' then 'Funcionario'
            else 'Gerente geral' 
		end as TipoFuncionario
		from funcionario as f 
        left join areaAtuacao as a on f.fkAreaAtuacao = a.idArea;
        
        
        
-- EXERCICIO 2 

-- 
create table usuario (
idUsuario int primary key auto_increment,
nome varchar (45) ,
fKGerente int, 
constraint fkGerenteUsuario foreign key (fkGerente) references usuario(idUsuario)
);

create table email (
idEmail int primary key auto_increment , 
email varchar(45) unique,
fkUsuario int, 
constraint fkEmailUsuario foreign key (fkUsuario) references usuario (idUsuario), 
constraint ckEmailPessoa check (email <> ('') )
 ); 
 
 -- inserindo valores nas tabelas 7 por tablela
 
INSERT INTO usuario (nome) VALUES -- sem gerentes
('Fernanda Lima'),   -- ID 1
('Roberto Souza');   -- ID 2

INSERT INTO usuario (nome, fkGerente) VALUES -- com gerentes
('Amanda Torres', 1),   -- ID 3
('Carlos Eduardo', 1),  -- ID 4
('Juliana Castro', 2),  -- ID 5
('Felipe Mendes', 2),   -- ID 6
('Bruna Silva', 1);     -- ID 7

INSERT INTO email (email, fkUsuario) VALUES
('fernanda.lima@empresa.com', 1),
('roberto.souza@empresa.com', 2),
('amanda.torres@empresa.com', 3),
('carlos.eduardo@empresa.com', 4),
('juliana.castro@empresa.com', 5),
('felipe.mendes@empresa.com', 6),
('bruna.silva@empresa.com', 7);

select * from email;
select * from usuario;

-- select com join 
select u.nome as NOME, e.email as EMAIL, g.nome as 'Nome do gerente', eg.email as 'EMAIL DO GERENTE' 
		from usuario as u join email as e on u.idUsuario = e.fkUsuario 
			join usuario as g on u.fkGerente = g.idUsuario
				join email as eg on g.idUsuario = eg.fkUsuario;

-- select com join e where exibir o nome, gerente e usuario de um gerente em especifico (1)
select u.nome as NomeUsuario,
		g.nome as "Nome do Gerente do Usuário", 
			e.email as Email 
		from usuario as u
			join usuario as g on u.fkGerente = g.idUsuario
				join email as e on e.fkUsuario = u.idUsuario
		where u.fkGerente =1;

-- select com join e case exibir os usuários que estão sem gerente com gerente
select u.nome as NOME, e.email as EMAIL, g.nome as 'Nome do gerente', eg.email as 'EMAIL DO GERENTE', 
	case when u.fkGerente is null then 'Gerente'
		else 'Funcionario'
	end as 'Função'
		from usuario as u left join email as e on u.idUsuario = e.fkUsuario 
			left join usuario as g on u.fkGerente = g.idUsuario
				left join email as eg on g.idUsuario = eg.fkUsuario;



        