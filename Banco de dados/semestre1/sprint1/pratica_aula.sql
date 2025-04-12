create database pratica_auto;
use pratica_auto;
-- drop database pratica_auto;
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

-- select de todos os funcionarios da empresa

select f.nome, f.cpf, f.supervisor, a.area, a.cargo
	from funcionario as f join areaAtuacao as a on 
			

    