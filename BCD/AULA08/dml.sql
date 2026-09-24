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
    id_produto INT NOT NULL,
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
('Refri', 8.00, TRUE, 3),
('Tortas de limao', 9.50, TRUE, 4),
('Coxinha', 10.00, TRUE, 5),
('Salgado + coxinha + Refri', 21.90, TRUE, 6);

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00,1),
('2026-10-02 08:30:00','FINALIZADO', 0.00,1),
(NOW(),'ABERTO',0.00,1);


INSERT INTO item_pedido (id_pedido, id_prduto, quantidade, preco_unitario, observacao) VALUES 
(1, 1, 2, 5.00, 'Sem açúcar'),
(1, 5, 1, 10.00, 'Bem quente'),
(2, 6, 1, 21.90, 'Para viagem'),
(3, 2, 2, 6.50, 'Com canela extra');

INSERT INTO forma_pagamento (descricao) VALUES -- nao necessita de ID, pois não acompanha essa tabela INSERT--
('Debito'),
('Credito'),
('Pix'),
('Dinheiro');

INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES 
(1, 1, 15.00, NOW()),
(2, 4, 21.90, NOW()),
(3, 2, 11.50, '2026-09-24 10:30:00');

--------------------------------------------------
-- EXEMPLO NOVO DE INSERÇÃO DE DADOS PORÉM COM RECUPERAÇÃO DO ÚLTIMO ID
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) 
VALUES (NOW(), 'ABERTO', '0.00', 1);
SET @pedido = LAST_INSERT_ID();
SELECT @pedido;

-- EX 2
UPDATE produto
SET preco = 1.00;
-- ⚠️⚠️ NUNCA REALIZAR UM UPDATE SEM WHERE ⚠️⚠️ --

-- EX 3
UPDATE cliente
SET telefone = '19998888802',
    cidade = "Valinhos"
WHERE id_cliente = 9;   

-- EX 4 ajuste de valores
UPDATE produto
SET preco = preco * 1.05
WHERE id_categoria = 1;

-- EX 5: Ajustes de atualizações condicionais
UPDATE produto
SET preco = CASE
    WHEN preco <= 20 THEN preco * 1.20
    ELSE preco * 1.05
END
WHERE ativo = TRUE;

-- EX 1: Apagar um cliente específico
DELETE FROM cliente
WHERE id_cliente = 11;

-- EX 2 : Apagar todos os clientes inativos
DELETE FROM cliente
WHERE ativo = FALSE;

-- EX 3 : Apagar todos os clientes de uma cidade específica
DELETE FROM cliente
WHERE cidade = 'Chicago';

-- EX 4: Exclusão lógica
UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 10;

SELECT * FROM produto;