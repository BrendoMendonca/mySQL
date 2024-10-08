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

CREATE TABLE progresso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    data DATE NOT NULL,
    peso FLOAT NOT NULL,
    imc FLOAT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE
);*/

select * from personais;
select * from alunos;
select * from treinos;