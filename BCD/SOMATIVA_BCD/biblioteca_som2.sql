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
('Pierre Weil','o corpo fala', '978-2084',1986, '10'),
('Romeu e Julieta',' William Shakespeare', '978-0404', 1597 , '3'),
('Frankstein','Mary Shelley', '978-8114', 1818, '7'),
('pequeno principe','Antoine de Saint-Exupéry', '978-1512', 1899, '12');

-- 8
INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, status_emprestimo )VALUES
(2, 13,NOW(),NOW(),NOW(), 'ABERTO'),
(3, 14, NOW(),NOW(),NOW(), 'ABERTO'),
(4, 15, NOW(),NOW(),NOW(), 'ABERTO');

-- 9
SELECT * FROM livro;
UPDATE usuario
SET telefone = '1988880001'
WHERE id_usuario = 1;

-- 10
