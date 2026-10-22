-- Active: 1788435101647@@127.0.0.1@3306@biblioteca_som2_vinicius
DROP DATABASE IF EXISTS biblioteca_som2_vinicius;
CREATE DATABASE IF NOT EXISTS biblioteca_som2_vinicius;
USE biblioteca_som2_vinicius;

-- FASE 1 — DDL: CRIAÇÃO E ESTRUTURA
-- 1
CREATE TABLE USUARIO (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE
);
-- 2
CREATE TABLE LIVRO (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(20) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponivel INT DEFAULT 0,
    CHECK (quantidade_disponivel >= 0)
);
-- 3
CREATE TABLE EMPRESTIMO (
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo ENUM('ABERTO', 'ENTREGUE') DEFAULT 'ABERTO',
    CONSTRAINT USUARIO FOREIGN KEY (id_usuario) REFERENCES USUARIO (id_usuario),
    CONSTRAINT LIVRO FOREIGN KEY (id_livro) REFERENCES LIVRO (id_livro)
);

-- 4


-- 5
ALTER TABLE LIVRO 
ADD COLUMN editora VARCHAR(100) NULL;

-- FASE 2 — DML: MANIPULAÇÃO DE DADOS
-- 6
INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('vinicus', 'vinicius@email.com',NULL, TRUE),
('Ana', 'Ana@email.com',19999999991, TRUE),
('maria', 'maria@email.com',19999999992, TRUE),
('emanuele', 'emanuele@email.com',19999999993, TRUE);

-- 7
INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel)VALUES
('o corpo fala','Pierre Weil', '978-2084',1986, '10'),
('Romeu e Julieta',' William Shakespeare', '978-0404', 1597 , '3'),
('Frankstein','Mary Shelley', '978-8114', 1818, '7'),
('pequeno principe','Antoine de Saint-Exupéry', '978-1512', 1899, '12');

-- 8
INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, status_emprestimo )VALUES
(2, 13,NOW(),NOW(),NOW(), 'ABERTO'),
(3, 14, NOW(),NOW(),NOW(), 'ABERTO'),
(4, 15, NOW(),NOW(),NOW(), 'ABERTO');

-- 9
SELECT * FROM usuario;
UPDATE usuario
SET telefone = '1988880001'
WHERE id_usuario = 1;

-- 10
INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel)VALUES('Café com Deus Pai', 'Junior Rostirola', ' 999-9668',2025, '6' );

UPDATE LIVRO 
SET quantidade_disponivel = quantidade_disponivel + 2 
WHERE ano_publicacao >= 2020;

SELECT * FROM livro;

-- 11
INSERT INTO USUARIO (nome, email, telefone) VALUES ('gustavo lima', 'gustavo.lima@email.com', '1999125003');
DELETE FROM USUARIO WHERE email = 'gustavo.lima@email.com';

DELETE FROM USUARIO WHERE id_usuario = 3;
-- Ele proibe a exclusão do usuario que ja foi criado, pelo fato de estar como int primary key, onde ele ja tem registro, com o constraint

-- FASE 3 - DQL:CONSULTA E ANALISE
-- 12
SELECT titulo, autor, quantidade_disponivel FROM LIVRO;

-- 13
SELECT * FROM LIVRO WHERE quantidade_disponivel > 2 ORDER BY quantidade_disponivel DESC;

-- 14
SELECT * FROM LIVRO WHERE titulo LIKE '%pequeno%';

-- 15
SELECT * FROM LIVRO WHERE ano_publicacao BETWEEN 2015 AND 2025;

-- 16
SELECT
    COUNT(*) AS livros_disponiveis,
    SUM(quantidade_disponivel) AS total_livros,
    AVG(quantidade_disponivel) AS media_livros,
    MIN(quantidade_disponivel) AS menor_estoque,
    MAX(quantidade_disponivel) AS maior_estoque
FROM LIVRO;

-- 17
SELECT id_emprestimo, id_usuario, id_livro, data_emprestimo FROM emprestimo;

-- 18
SELECT * FROM emprestimo WHERE status_emprestimo LIKE 'ABERTO';

-- 19
SELECT 
    U.nome,
    COUNT(E.id_emprestimo) AS qtde_emprestimo
FROM USUARIO U
INNER JOIN EMPRESTIMO E ON U.id_usuario = E.id_usuario
GROUP BY U.id_usuario, U.nome
ORDER BY qtde_emprestimo DESC;

-- 20.
SELECT 
    U.nome,
    COUNT(E.id_emprestimo) AS qtde_emprestimo
FROM USUARIO U
LEFT JOIN EMPRESTIMO E ON U.id_usuario = E.id_usuario
GROUP BY U.id_usuario, U.nome
ORDER BY qtde_emprestimo DESC;