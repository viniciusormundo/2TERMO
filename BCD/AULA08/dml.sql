DROP DATABASE IF EXISTS SMARTCOFFE_DML_VINICIUS;
CREATE DATABASE IF NOT EXISTS SMARTCOFFE_DML_VINICIUS;
USE SMARTCOFFE_DML_VINICIUS;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(15),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_prdutos_categoria FOREIGN KEY (id_categoria)
    REFERENCES categoria (id_categoria)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status_pedido ENUM ('ABERTO', 'PREPARANDO','FINALIZADO','CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);
CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_prduto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL (10,2),
    observacao VARCHAR(150),
    CONSTRAINT fk_item FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);
CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido),
    CONSTRAINT fk_pagamento_forma_pagamento FOREIGN KEY
    (id_forma_pagamento) REFERENCES forma_pagamento
    (id_forma_pagamento)
);

SELECT * FROM produto;

INSERT INTO cliente (nome, email, telefone, cidade, ativo)VALUES
('Luis felipe','luis@gmail.com', '1999999901', 'Limeira', TRUE),
('Maria Eduarda','maria@gmail.com', '1999999902', 'Limeira', TRUE),
('Mateus Silva','mateus@gmail.com', '1999999903', 'Limeira', TRUE),
('Mateus Orocoli','matheusc@gmail.com', '1999999904', 'Limeira', TRUE),
('Nicolas Felipe','nicolas@gmail.com', '1999999905', 'Limeira', TRUE),
('Otavio Correa','otavio@gmail.com', '1999999906', 'Conchal', TRUE),
('Pedro Miranda','pedro@gmail.com', '1999999907', 'Limeira', TRUE),
('Rafael Vieira','rafeal@gmail.com', NULL, 'Limeira', TRUE),
('Rebecca','rebecca@gmail.com', '1999999909', 'Limeira', TRUE),
('Rennan','rennan@gmail.com', '1999999910', 'Limeira', TRUE),
('Samira EMily','samira@gmail.com', NULL, 'Xique-Xique', FALSE),
('Sophia','sophia@gmail.com', '1999999912', 'Taubaté', TRUE),
('Vanessa Queiroz','vanessa@gmail.com', '1999999913', 'Limeira', TRUE),
('Vinicius Henrique','vinciush@gmail.com', '1999999914', 'Limeira', TRUE),
('Vinicius Oliveira','vinciuso@gmail.com', '1999999915', 'Chicago', TRUE)

INSERT INTO categoria (nome) VALUES
('Coffe'), 
('Bebidas quentes'), 
('Bebidas geladas'), 
('Doces'),
('Salgados'),
('Combos');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café expresso', 5.00, TRUE, 1),
('Capuccino', 6.50, TRUE, 2),
('Bebidas geladas', 8.00, TRUE, 3),
('Doces', 9.50, TRUE, 4),
('Salgados', 10.00, TRUE, 5),
('Combos', 21.90, TRUE, 6);

INSERT pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00,1),
('2026-10-02 08:30:00','FINALIZADO', 0.00,1),
(NOW(),'ABERTO',0.00,1),


