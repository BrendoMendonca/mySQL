/*create database decademia;
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(15),
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    matricula VARCHAR(15) UNIQUE NOT NULL,
    altura FLOAT NOT NULL,
    idade INT NOT NULL,
    peso FLOAT NOT NULL
);

ALTER TABLE alunos 
ADD torcedor VARCHAR(50) DEFAULT 'nenhum',
ADD assiste VARCHAR(50) DEFAULT 'nenhum',
ADD sousa BOOLEAN DEFAULT FALSE;


CREATE TABLE personais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(15),
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    cref VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE treinos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    nome VARCHAR(50) NOT NULL,
    grupo_muscular VARCHAR(20) NOT NULL,
    dificuldade VARCHAR(15),
    qnt_exercicios INT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE
);

/*alter table cliente drop column i_tipo_cliente;
alter table treinos drop column pagamento;
alter table treinos drop column cref_responsavel;
alter table treinos drop column valor;
alter table treinos add valor VARCHAR(8);
alter table treinos add cref_responsavel VARCHAR(10);
alter table treinos add pagamento VARCHAR(15);
alter table treinos
	drop column estoque,
    drop column categoria;
CREATE TABLE progresso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    data DATE NOT NULL,
    peso FLOAT NOT NULL,
    imc FLOAT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE
);*/
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    categoria ENUM('garrafa', 'camisa') NOT NULL,
    cidade_fabricacao VARCHAR(50),
    estoque INT DEFAULT 0
);

/*INSERT INTO produtos (nome, preco, categoria, cidade_fabricacao, estoque) 
VALUES 
('GARRAFA TÉRMICA', 29.90, 'garrafa', 'São Paulo', 10),
('CAMISETA ESPORTIVA', 39.90, 'camisa', 'Rio de Janeiro', 10),
('GARRAFA COMUM', 19.90, 'garrafa', 'Belo Horizonte', 10),
('CAMISETA DE ALGODÃO', 49.90, 'camisa', 'Porto Alegre', 10);
*/

CREATE TABLE compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    personal_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    data_compra DATE NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE,
    FOREIGN KEY (personal_id) REFERENCES personais(id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
);
ALTER TABLE compras
ADD forma_pagamento VARCHAR(20) NOT NULL;

select * from personais;
select * from alunos;
select * from treinos;
select * from produtos;
select * from compras;