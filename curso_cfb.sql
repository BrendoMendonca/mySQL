/*
create schema cfbcursos;
create table cliente(
	i_cliente_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    s_nomeCliente_cliente VARCHAR(50) NOT NULL,
    s_cpf_cliente VARCHAR(11) NOT NULL,
    d_nasc_cliente DATETIME
);
alter table cliente add i_tipo_cliente INT NOT NULL;
*/

/*drop schema cfbcursos; - apaga o banco de dados*/
/*drop table cliente; - apaga a tabela*/

/*ALTER TABLE cliente MODIFY COLUMN s_nomeCliente_cliente VARCHAR(30); - modifica uma coluna já existente*/
/*alter table cliente add i_tipo_cliente INT NOT NULL; - insere uma coluna a um banco de dados existente*/
/*alter table cliente drop column i_tipo_cliente; - remove uma coluna de um banoc de dados existente*/


/*
create table tipocliente(
	i_tipocliente_tipocliente INT PRIMARY KEY AUTO_INCREMENT,
    s_dsctipocliente_tipocliente VARCHAR(100) NOT NULL
);
*/
/* alter table <tabela_origem> add constraint <nome_restrição> foreign key (<campo_tabela_origem>) references <tabela_destino> (<campo_tabela_destino>);*/

/*relaciona uma tabela com outra através de chave estrangeira*/
/*alter table cliente add constraint fk_tipocliente foreign key (i_tipo_cliente) references tipocliente (i_tipocliente_tipocliente);*/

/*DQL - INSERT - SELECT*/

/*INSERE DADOS MANUALMENTE*/
/*insert into (<colunas>) <nome_tabela> values (<valor_cada_coluna>);*/
/*
insert into tipocliente values (01, 'Pessoa Física');
insert into tipocliente values (02, 'Pessoa Jurídica');
insert into tipocliente values (03, 'Cliente Especial');

insert into cliente values (01, 'Brendo', '12163054470', '1999-02-13', 01);
insert into cliente values (02, 'Sandra', '12345678910', '1968-08-07', 02);
insert into cliente values (03, 'Neto', '54987413201', '1977-03-16', 02);
insert into cliente values (04, 'Eduarda', '13216549841', '2001-12-18', 03);
*/

/*select <coluna> from <tabela>;*/
/*
select * from tipocliente;
select * from cliente;
*/

/*INSERE DADOS ATRAVÉS DO RETORNO DO SELECT*/

/*
insert into cliente_aux
	(i_cliente_cliente, s_nomeCliente_cliente, s_cpf_cliente, d_nasc_cliente, i_tipo_cliente)
    select
		i_cliente_cliente,
        s_nomeCliente_cliente,
        s_cpf_cliente,
        d_nasc_cliente,
        i_tipo_cliente
	from cliente;
    
select * from cliente_aux
*/

/*UPDATE*/

/*update <tabela> set <coluna=valor_alterado> where <condição_alteração>;*/

/*
update cliente set s_nomeCliente_cliente='Brendo Mendonça' where i_cliente_cliente = 1;

update cliente set i_tipo_cliente=1 where i_cliente_cliente>0;
select * from cliente;

delete from cliente where i_cliente_cliente>0;
insert into cliente select * from cliente_aux;
*/

/*DELETE*/
/*delete from <tabela> where <condição>*/
/*
delete from cliente where i_cliente_cliente=1;
select * from cliente;
*/

/*clausulas do SELECT
	select
    from - indica a tabela que será utilizada na consulta
    where - determina filtros/restrições à consulta
    group by - agrupa linhas por meio de valores de colunas
    having - filtro de grupos indesejáveis
    order by - indica a ordenação dos registros
    distinct - remove as duplicidadas da consulta
*/

/*Apelidando nomes das colunas (ALIAS) com o SELECT:*/

/*select
	*,
	i_cliente_cliente as idCliente,
    s_nomeCliente_cliente as Nome
from
	cliente;*/
    
/*DISTINCT*/
/*
insert into venda values(1,1,'2020-12-12',123.5);
insert into venda values(2,2,'2020-12-01',535.2);
insert into venda values(3,3,'2020-11-10',50.49);
insert into venda values(4,2,'2020-10-15',1584.25);
insert into venda values(5,1,'2020-11-20',327.80);
insert into venda values(6,3,'2020-09-08',15);
insert into venda values(7,3,'2020-09-07',12.99);
insert into venda values(8,3,'2020-11-22',59.90);
select * from venda;

select
	i_cliente_cliente
from venda;

select
	distinct i_cliente_cliente
from 
	venda;
*/	

/*

insert into cliente values(
	(select max(c.i_cliente_cliente)+1 as idCliente from cliente c),
    'Gabriel',
    '13246598741',
    '2004-01-21',
    1
);

select * from cliente;
*/

/*from - serve para informa a base de dados para o select*/
/*O primeiro select exibe o retorno do segundo select*/
/*
select
	*
    from
		(select i_cliente_cliente, s_nomeCliente_cliente from cliente) c;
*/

/*view - é uma tabela virtual, os dados não ficam armazenados na view*/
/*
create view nomescli as
select i_cliente_cliente, s_nomeCliente_cliente from cliente;
select * from nomescli;

create view niver as
select 
	i_cliente_cliente,
    s_nomeCliente_cliente,
    day(d_nasc_cliente) as 'Dia aniversário'
    
    from cliente
    where
		month(d_nasc_cliente) in (8,12);

select * from niver;
*/

/*WHERE - filtra as consultas do select*/

/*
select * from cliente
	where
    i_tipo_cliente in (2,3) And
    (month(d_nasc_cliente) >= 3 And month(d_nasc_cliente) <= 12 );
*/

/*inner join*/

/*select <colunas_tabela_principal> from <tabela_principal> inner join <outra_tabela> on <coluna_tabela_principal> = <coluna_segunda_tabela>*/
/*select
	v.i_venda_venda,
    c.s_nomeCliente_cliente,
    c.s_cpf_cliente,
    v.d_data_venda,
    v.f_valor_venda,
    tc.s_dsctipocliente_tipocliente    
    from venda v
    inner join cliente c on v.i_cliente_cliente = c.i_cliente_cliente
    inner join tipocliente tc on c.i_cliente_cliente = i_tipocliente_tipocliente;
    */
 /*   
insert into cliente values (15, 'Valkisneide','11223344556',null,1);
insert into cliente values (16,'Alcinclésio','65544332211',null,2);
insert into cliente values (17,'Nestisgerson','74125896300',null,3);
insert into cliente values (18,'Mordonório','36925814799',null,1);
insert into cliente values (19,'Mordonório','36925814799',null,2);
insert into cliente values (20,'Salomildo','98765432147',null,3);
 */
 
 /*IS NULL e IS NOT NULL*/
/*
select * from cliente
where d_nasc_cliente IS NOT NULL;
 
select * from cliente
 where d_nasc_cliente IS NULL;
 */
 
 /*tipos de join*/
 /*inner join - retorna a relação entre as tabelas*/
 /*
 select c.i_cliente_cliente, c.s_nomeCliente_cliente, v.i_venda_venda
 from cliente c
 inner join venda v on c.i_cliente_cliente = v.i_cliente_cliente;
 */
 /*left join - retorna os valores da relação entre as tabelas e todo o conteúdo da tabela principal*/
 
 /*select c.i_cliente_cliente, c.s_nomeCliente_cliente, v.i_cliente_cliente
 from cliente c
 left join venda v on c.i_cliente_cliente = v.i_cliente_cliente;
 */
 
 /*right join - retorna os valores da relação entre as tabelas e todo conteúdo da segunda tabela*/
 /*
 select c.i_cliente_cliente, c.s_nomeCliente_cliente, v.i_venda_venda
 from cliente c	
 right join venda v on c.i_cliente_cliente = v.i_cliente_cliente;
 */
 
 /*self join*/
 /*
 select *
 from cliente c1, cliente c2
 where 
	c1.i_tipo_cliente = c2.i_tipo_cliente
    order by c1.i_cliente_cliente;
*/

 