-- aula de hoje bd, conceito de foreign key em uma mesma tabela e left join 
create database aula9;
use aula9;
create table pet(
idpet int primary key auto_increment, 
nome varchar(45),
raca varchar(45),
fkPai int, 
fkMae int, 
constraint fkPaiFilho foreign key (fkPai)
	references pet(idPet), 
constraint fkMaeFilho foreign key (fkMae)
	references pet(idPet)
);

-- inserindo a mae 
insert into pet (nome, raca) values
	('Perdita', 'Dálmata');
-- inserindo o pai 
insert into pet (nome, raca) values
	('Roliço', 'Dálmata');
-- insendo o filho 
insert into pet (nome, raca) values
	('Pomgo', 'Dálmata');
update pet set fkPai = 2 where idpet = 3;
update pet set fkMae = 1 where idpet = 3;

select * from pet;

select f.nome as petFilho, 
	p.nome as petPai, 
    m.nome as petMae
    from pet as f left join pet as p 
		on f.fkPai = p.idpet
	left join pet as m 
		on f.fkMae = m.idpet;
insert into pet(nome, raca) values
	('João','Dálmata');
insert into pet(nome, raca) values
	('Maria','Dálmata');
update pet set fkPai = 4 where idpet = 1;
update pet set fkMae = 5 where idpet = 1;

select f.nome as Filho, p.nome as Pai, m.nome as Mae, a.nome as Avo, v.nome as Vovo
	from pet as f 
    join pet as p on f.fkPai = p.idpet 
    join pet as m on f.fkMae = m.idpet
	join pet as a on m.fkMae = a.idpet
    join pet as v on m.fkPai = v.idpet;

select f.nome as Filho, p.nome as Pai, m.nome as Mae, a.nome as Avo, v.nome as Vovo,
	ifnull(v.fkPai, 'Sou avô') as Parentesco,
	case when a.raca <> 'Dálmata' then 'Vira Lata'
    else a.raca end as raca
	from pet as f 
    join pet as p on f.fkPai = p.idpet 
    join pet as m on f.fkMae = m.idpet
	join pet as a on m.fkMae = a.idpet
    join pet as v on m.fkPai = v.idpet;
    

    