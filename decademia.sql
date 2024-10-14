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

select * from personais;
select * from alunos;
select * from treinos;