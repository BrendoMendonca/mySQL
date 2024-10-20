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

CREATE VIEW view_detalhes_vendas AS
SELECT 
    c.id AS id_venda, 
    a.nome AS aluno, 
    p.nome AS personal, 
    pr.nome AS produto, 
    cp.quantidade, 
    pr.preco, 
    cp.valor_total,
    /*(cp.quantidade * pr.preco) AS valor_total, */
    c.data_compra, 
    c.forma_pagamento
FROM compras c
JOIN alunos a ON c.aluno_id = a.id
JOIN personais p ON c.personal_id = p.id
JOIN compras_produtos cp ON c.id = cp.compra_id
JOIN produtos pr ON cp.produto_id = pr.id;

DELIMITER $$

CREATE PROCEDURE registrar_venda(
    IN aluno_matricula VARCHAR(15),
    IN personal_cref VARCHAR(10),
    IN produto_id INT,
    IN quantidade INT,
    IN forma_pagamento VARCHAR(20)
)
BEGIN
    DECLARE aluno_id INT;
    DECLARE personal_id INT;
    DECLARE preco DECIMAL(10, 2);
    DECLARE estoque_atual INT;
    DECLARE valor_total DECIMAL(10, 2);

    -- Obtém o ID do aluno
    SELECT id INTO aluno_id FROM alunos WHERE matricula = aluno_matricula;
    
    -- Obtém o ID do personal
    SELECT id INTO personal_id FROM personais WHERE cref = personal_cref;

    -- Verifica o estoque disponível e o preço do produto
    SELECT estoque, preco INTO estoque_atual, preco FROM produtos WHERE id = produto_id;

    -- Calcula o valor total da venda
    SET valor_total = quantidade * preco;

    -- Certifica-se de que o valor total foi corretamente calculado
    IF valor_total IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: valor total não pode ser NULL';
    END IF;

    IF estoque_atual >= quantidade THEN
        -- Insere a venda na tabela compras
        INSERT INTO compras (aluno_id, personal_id, data_compra, forma_pagamento)
        VALUES (aluno_id, personal_id, NOW(), forma_pagamento);

        -- Obtém o ID da compra recém-inserida
        SET @compra_id = LAST_INSERT_ID();

        -- Insere os produtos na tabela compras_produtos
        INSERT INTO compras_produtos (compra_id, produto_id, quantidade, valor_total)
        VALUES (@compra_id, produto_id, quantidade, valor_total);

        -- Atualiza o estoque
        UPDATE produtos SET estoque = estoque - quantidade WHERE id = produto_id;

    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estoque insuficiente';
    END IF;
END$$

DELIMITER ;

DELETE FROM compras_produtos;
DELETE FROM compras;
DELETE FROM produtos;
DELETE FROM progresso;
DELETE FROM treinos;
DELETE FROM alunos;
DELETE FROM personais;

TRUNCATE TABLE compras_produtos;
TRUNCATE TABLE compras;
TRUNCATE TABLE produtos;
TRUNCATE TABLE progresso;
TRUNCATE TABLE treinos;
TRUNCATE TABLE alunos;
TRUNCATE TABLE personais;

-- Desativar verificações de chaves estrangeiras
SET FOREIGN_KEY_CHECKS = 0;

-- Limpar os registros das tabelas (ou truncar)
DELETE FROM compras_produtos;
DELETE FROM compras;
DELETE FROM produtos;
DELETE FROM progresso;
DELETE FROM treinos;
DELETE FROM alunos;
DELETE FROM personais;

-- Reativar verificações de chaves estrangeiras
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE compras_produtos AUTO_INCREMENT = 1;

select * from personais;
select * from alunos;
select * from treinos;
select * from produtos;
select * from compras;
select * from compras_produtos;

UPDATE produtos
SET cidade_fabricacao = 'Campina Grande'  -- A nova quantidade de estoque
WHERE id = 4;  -- O ID do produto que você deseja atualizar
