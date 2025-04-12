CREATE DATABASE sisa2;

USE sisa2;

CREATE TABLE aluno (
ra char(8) primary key,
nome varchar(45),
fkEmpresa int);

CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
nome varchar(45));

ALTER TABLE aluno ADD CONSTRAINT fkAlunoEmpresa
	FOREIGN KEY (fkEmpresa) references empresa(idEmpresa);

INSERT INTO empresa VALUES
	(default, 'C6Bank'),
	(default, 'Safra');
    
INSERT INTO aluno VALUES
	('03251100', 'Joaquim', 1),
	('03251101', 'Joaquina', 1),
	('03251102', 'Joaca', 2);
    
SELECT * FROM aluno;

-- NOSSO PRIMEIRO JOIN
-- JOIN = INNER JOIN
SELECT * FROM aluno JOIN empresa
	ON idEmpresa = fkEmpresa;
    
SELECT aluno.nome as 'Nome Aluno',
	empresa.nome as NomeEmpresa
    FROM aluno JOIN empresa
		ON idEmpresa = fkEmpresa;
        
CREATE TABLE responsavel (
idResponsavel int primary key auto_increment,
nome varchar(45)
) auto_increment = 1000;

INSERT INTO responsavel VALUES
	(default, 'Andresa'),
	(default, 'André');

-- ADICIONANDO O CAMPO E A CONSTRAINT NO MESMO COMANDO
ALTER TABLE empresa ADD COLUMN fkResponsavel int unique,
	ADD CONSTRAINT fkEmpresaResponsa
		FOREIGN KEY (fkResponsavel)
			references responsavel(idResponsavel);
            
SELECT * FROM empresa;

UPDATE empresa SET fkResponsavel = 1000
	WHERE idEmpresa = 1;

UPDATE empresa SET fkResponsavel = 1001
	WHERE idEmpresa = 2;
        
SELECT * FROM responsavel JOIN empresa
		ON idResponsavel = fkResponsavel;
        
SELECT a.nome as 'Nome Aluno',        
	e.nome as 'Nome Empresa',
    r.nome as 'Responsável'
    FROM aluno as a JOIN empresa as e
		ON a.fkEmpresa = e.idEmpresa
	JOIN responsavel as r
		ON e.fkResponsavel = r.idResponsavel;
        
SELECT a.nome as 'Nome Aluno',        
	e.nome as 'Nome Empresa',
    r.nome as 'Responsável'
    FROM aluno as a JOIN empresa as e
		ON a.fkEmpresa = e.idEmpresa
	JOIN responsavel as r
		ON e.fkResponsavel = r.idResponsavel
        WHERE a.nome = 'Joaca';
        
        