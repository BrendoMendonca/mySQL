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