
create table funcionario(
	Codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    PrimeiroNome VARCHAR(15) NOT NULL,
    SegundoNome VARCHAR(15) NOT NULL,
    UltimoNome VARCHAR(15) NOT NULL,
    DataNasci DATE NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    RG VARCHAR(9),
    Endereco VARCHAR(30),
    CEP varchar(8),
    Cidade varchar(10),
    Fone varchar(11),
    CodigoDepartamento INT NOT NULL,
    Funcao varchar(15) NOT NULL,
    Salario float NOT NULL    
);
create table departamento(
	Codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    Nome VARCHAR(15) NOT NULL, 
    Localizacao VARCHAR(10) NOT NULL, 
    CodigoFuncionarioGerente INT NOT NULL
    );
    
alter table departamento modify column Localizacao VARCHAR(20);
alter table funcionario modify column Cidade VARCHAR(20);
    
insert into departamento (Nome, Localizacao, CodigoFuncionarioGerente)
values
('RH', 'São Paulo', 1),
('TI', 'Rio de Janeiro', 2),
('Financeiro', 'Belo Horizonte', 3),
('Marketing', 'Curitiba', 4);

insert into funcionario(PrimeiroNome, SegundoNome, UltimoNome, DataNasci, CPF, RG, Endereco, CEP, Cidade, Fone, CodigoDepartamento, Funcao, Salario) 
VALUES
('João', 'Pedro', 'Silva', '1990-05-12', '12345678901', '123456789', 'Rua A, 123', '12345678', 'São Paulo', '11999999999', 1, 'Analista', 4500.00),
('Maria', 'Fernanda', 'Costa', '1985-09-22', '98765432100', '987654321', 'Rua B, 456', '87654321', 'Rio de Janeiro', '21988888888', 2, 'Desenvolvedora', 6000.00),
('Carlos', 'Alberto', 'Pereira', '1975-11-30', '19283746509', '192837465', 'Rua C, 789', '76543210', 'Belo Horizonte', '31977777777', 3, 'Contador', 7000.00),
('Ana', 'Luiza', 'Oliveira', '1992-03-15', '10987654321', '109876543', 'Rua D, 101', '65432109', 'Curitiba', '41966666666', 4, 'Marketing', 5000.00);

/*update <tabela> set <coluna=valor_alterado> where <condição_alteração>;*/
update funcionario set Funcao='Digulvadora' where CPF='10987654321';
select * from funcionario;

/*1 - lista nome e sobrenome ordenado por sobrenome*/
select
	PrimeiroNome,
    SegundoNome
    from
    funcionario
    order by SegundoNome;

/*2 - lista todos os campos de funcionario ordenados por cidade*/
select *
	from funcionario
    order by Cidade;

insert into funcionario (PrimeiroNome, SegundoNome, UltimoNome, DataNasci, CPF, RG, Endereco, CEP, Cidade, Fone, CodigoDepartamento, Funcao, Salario) 
values
('Lucas', 'Gabriel', 'Santos', '2002-08-10', '10293847566', '102938475', 'Rua E, 202', '54321098', 'São Paulo', '11955555555', 1, 'Estagiário', 950.00);

/*3 - lista os funcionários que têm sala´rio superior a 1000,00 ordenados pelo nome completo*/
select *
	from funcionario
    where Salario>1000
    order by PrimeiroNome, SegundoNome, UltimoNome;

/*lista a data de nascimento e o priomeiro nome dos funciona´rios ordenados do mais novo par ao mais velho*/
select
	PrimeiroNome,
    DataNasci
    from funcionario
    order by DataNasci desc;  
    

/*5 - lista o nome, nome do departamento e a função de todos os funcionários*/
/* alter table <tabela_origem> add constraint <nome_restrição> foreign key (<campo_tabela_origem>) references <tabela_destino> (<campo_tabela_destino>);*/
alter table funcionario add constraint fk_CodDep foreign key (CodigoDepartamento) references departamento (Codigo);

/*select <colunas_tabela_principal> from <tabela_principal> inner join <outra_tabela> on <coluna_tabela_principal> = <coluna_segunda_tabela>*/
select
	f.PrimeiroNome,
    d.Nome as NomeDepartamento,
    f.Funcao
    from funcionario f
    inner join departamento d on d.Codigo = f.CodigoDepartamento;
    
	
    