create database avaliacao;
use avaliacao;

create table lojas (
loj_prod integer not null primary key,
desc_loj varchar(50) not null
);

create table produtos(
cod_prod integer not null primary key,
loj_prod integer not null,
desc_prod varchar(50) not null,
dt_inclu_prod date not null,
preco_prod decimal(8,3) not null,
foreign key(loj_prod) references lojas(loj_prod)
);

create table estoque(
cod_prod integer not null,
loj_prod integer not null,
qtd_prod decimal(15,3) not null,
foreign key(cod_prod) references produtos(cod_prod),
foreign key(loj_prod) references lojas(loj_prod)
);

insert into lojas(loj_prod, desc_loj) values (2, "loja a");
insert into produtos(cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod) values (170,2,"leite condesado mococa", now(), 45.40);
insert into estoque (cod_prod,loj_prod, qtd_prod) values (170, 2, 10);

update produtos set preco_prod = 95.40 where cod_prod = 170;

select * from produtos where loj_prod = 2 or loj_prod = 1;
select max(dt_inclu_prod) as maiordata, min(dt_inclu_prod) as menordata from produtos;
select count(*) as totalregistro from produtos;
select * from produtos where desc_prod like "L%";
select sum(preco_prod) as totalporloja, loj_prod from produtos group by loj_prod;
select loj_prod, sum(preco_prod) as total from produtos where preco_prod > 100000 group by loj_prod;

select l.loj_prod, l.desc_loj, p.cod_prod, p.desc_prod, p.preco_prod, e.qtd_prod from produtos p join estoque e on e.cod_prod = p.cod_prod 
join lojas l on l.loj_prod = p.loj_prod where l.loj_prod = 1; 

select * from produtos p left join estoque e on p.cod_prod = e.cod_prod where e.cod_prod is null;
select * from produtos p right join estoque e on p.cod_prod = e.cod_prod where e.cod_prod is null;