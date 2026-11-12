
DROP DATABASE retrogame_recuperacao_vinicius;
CREATE DATABASE retrogame_recuperacao_vinicius;
USE retrogame_recuperacao_vinicius;

CREATE TABLE PLATAFORMA (
    id_plataforma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20) NULL,
    ativo BOOLEAN DEFAULT TRUE,
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);


CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE JOGOS (
    id_jogo INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    codigo VARCHAR(15) NOT NULL UNIQUE,
    ano_lancamento INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0),
    id_plataforma INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_plataforma)REFERENCES PLATAFORMA(id_plataforma)
);

CREATE TABLE LOCACAO (
    id_locacao INT PRIMARY KEY AUTO_INCREMENT,
    data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    status_locacao VARCHAR(20) DEFAULT 'ABERTA' CHECK (status_locacao IN ('ABERTA', 'DEVOLVIDA', 'ATRASADA')),
    id_cliente INT NOT NULL,
    id_jogo INT NOT NULL
);

ALTER TABLE JOGOS
ADD desenvolvedora VARCHAR(100);

INSERT INTO cliente (nome, email, telefone, ativo) VALUES
('Vinicius', 'vinicius@email.com', '11999999999', TRUE),
('Otavio', 'otavio@email.com', '11888888888', TRUE),
('Bruno','bruno@email.com', null, TRUE),
('Neymar', 'neymar2gmail.com', '11777777777', TRUE);
select * from cliente;
INSERT INTO PLATAFORMA (nome)
VALUES ('PlayStation'), ('Nintendo');

INSERT INTO categoria (descricao)
VALUES ('ação e aventura terceira pessoa'), (' Terror')

INSERT INTO JOGOS
(titulo, codigo, ano_lancamento, quantidade_disponivel,
id_plataforma, id_categoria)
VALUES
('Crash Bandicoot', 'JG001', 1996, 10, 1, 1),
('Mario Kart 64', 'JG002', 1996, 8, 2, 2),
('GTA San Andreas', 'JG003', 2004, 12, 1, 1),
('Uncharted 4', 'JG004', 2016, 7, 1, 2),
('Super Mario Word', 'JG005', 2007, 9, 2, 1),
('God of War 2', 'JG006', 2005, 6, 1, 1);


INSERT INTO LOCACAO
(data_prevista, status_locacao, id_cliente, id_jogo)
VALUES
('2026-11-20', 'ABERTA', 1, 1),
('2026-11-21', 'ABERTA', 2, 2),
('2026-11-22', 'ABERTA', 3, 3);

UPDATE jogos
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_jogo IN (1, 2, 3)
AND quantidade_disponivel > 0;

select * from locacao;

SELECT *
FROM CLIENTE
WHERE id_cliente = 1;

UPDATE CLIENTE
SET telefone = '11966665555'
WHERE id_cliente = 1;

UPDATE jogos
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_lancamento >= 2000;

INSERT INTO CLIENTE (nome, email, telefone)
VALUES
('Carla', 'carla@gmail.com', NULL);
DELETE FROM CLIENTE
WHERE email = 'carla@gmail.com';

DELETE FROM CLIENTE
WHERE id_cliente = 1;

-- o cliente nao foi excluido com a locação, pois é uma Pk, e não é possivel modificar

SELECT titulo, ano_lancamento,quantidade_disponivel FROM jogos

SELECT *
FROM jogos
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel DESC;


SELECT *
FROM jogos
WHERE titulo LIKE '%Mario%';

