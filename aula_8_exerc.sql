CREATE TABLE departamento(
	nome_depto varchar(15) not null,
    numero_depto int not null primary key unique
);

create table professor(
	nome varchar(20) NOT NULL,
    siape INT NOT NULL PRIMARY KEY UNIQUE,
    categoria varchar(15),
    salario float NOT NULL,
    cod_depto int NOT NULL,
    FOREIGN KEY (cod_depto) REFERENCES departamento(numero_depto) 
);

create table disciplina(
	nome varchar(20) NOT NULL UNIQUE,
    cod_disciplina int NOT NULL PRIMARY KEY UNIQUE,
    carga_horaria INT NOT NULL
);

create table ministra(
	siape_ministra int not null,
    cod_disciplina_ministra int not null,
    periodo varchar(10) not null,
    PRIMARY KEY(siape_ministra, cod_disciplina_ministra, periodo),
    FOREIGN KEY (siape_ministra) references professor(siape),
    FOREIGN KEY (cod_disciplina_ministra) references disciplina (cod_disciplina)    
);

insert into departamento (nome_depto, numero_depto) values
('Matemática', 1),
('Física', 2),
('Química', 3),
('Biologia', 4);

insert into professor (nome, siape, categoria, salario, cod_depto) values
('João Silva', 12345, 'Assistente', 5000.00, 1),
('Maria Santos', 23456, 'Associado', 7000.00, 2),
('Carlos Oliveira', 34567, 'Titular', 9000.00, 3),
('Ana Costa', 45678, 'Assistente', 5500.00, 4);

insert into disciplina (nome, cod_disciplina, carga_horaria) values
('Álgebra', 101, 60),
('Física Clássica', 102, 75),
('Química Orgânica', 103, 45),
('Biologia Celular', 104, 50);

INSERT INTO ministra (siape_ministra, cod_disciplina_ministra, periodo) VALUES
(12345, 101, '2023-1'),
(23456, 102, '2023-1'),
(34567, 103, '2023-2'),
(45678, 104, '2023-2');

select * from professor;

INSERT INTO professor (nome, siape, categoria, salario, cod_depto) VALUES
('Fernanda Lima', 56789, 'Assistente', 4800.00, 1),
('Rafael Mendes', 67890, 'Associado', 7200.00, 2),
('Tatiane Almeida', 78901, 'Titular', 9500.00, 3),
('Leonardo Pereira', 89012, 'Assistente', 5300.00, 4),
('Juliana Rocha', 90123, 'Associado', 7000.00, 1),
('Marcelo Teixeira', 01234, 'Titular', 8900.00, 2);

/*1 - retorna a média de salário dos professores de código de departamento 1*/
select 
	avg(salario)
from professor
where cod_depto = 1;

INSERT INTO disciplina (nome, cod_disciplina, carga_horaria) VALUES
('Geometria Analítica', 105, 60),
('Termodinâmica', 106, 75),
('Química Inorgânica', 107, 45),
('Genética', 108, 50),
('Cálculo I', 109, 80),
('Física Moderna', 110, 70);

/*2 - retorna a quantidade de disciplinas com carga horária mais que 60h*/
select 
	count(nome) as CH_mais60
    from disciplina
    where carga_horaria>60;
    
INSERT INTO ministra (siape_ministra, cod_disciplina_ministra, periodo) VALUES
(56789, 105, '2023-1'),
(67890, 106, '2023-1'),
(78901, 107, '2023-2'),
(89012, 108, '2023-2'),
(90123, 109, '2023-1'),
(01234, 110, '2023-2');

/*select <colunas_tabela_principal> from <tabela_principal> inner join <outra_tabela> on <coluna_tabela_principal> = <coluna_segunda_tabela>*/
/*3 - retorna o nome dos professores juntamente com o nome das disciplinas que eles ministraram em 2020-2*/
select
	p.nome,
    d.nome
	from professor p
    inner join ministra m on p.siape = m.siape_ministra
    inner join disciplina d on d.cod_disciplina = m.cod_disciplina_ministra
    where m.periodo = '2023-2';

select * from departamento;

INSERT INTO professor (nome, siape, categoria, salario, cod_depto) VALUES
('Fernando Souza', 11223, 'Assistente', 5200.00, 1),
('Sofia Martins', 22334, 'Associado', 6800.00, 2),
('Gustavo Mendes', 33445, 'Titular', 9500.00, 3),
('Camila Torres', 44556, 'Assistente', 5000.00, 4),
('Roberto Lima', 55667, 'Associado', 7100.00, 2),
('Patrícia Ribeiro', 66778, 'Titular', 9000.00, 1),
('Tiago Almeida', 77889, 'Assistente', 4800.00, 2),
('Mariana Freitas', 88990, 'Associado', 7400.00, 3);

/*4 - exibe o nome dos professores que não ministraram disciplinas*/
select
	p.nome
    from professor p
    left join ministra m on m.siape_ministra = p.siape
    where m.cod_disciplina_ministra IS NULL;
    
/*5 - */
select
	p.nome
    from professor p
    where not exists (select 1 from ministra m where m.siape_ministra = p.siape and m.periodo='2023-1');