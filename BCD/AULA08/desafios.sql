USE SMARTCOFFE_DML_VINICIUS;
-- 1
INSERT INTO cliente (nome, email, telefone, cidade, ativo) 
VALUES 
    ('Neymar', 'Neymar@email.com', '1999999900', 'Santos', TRUE),
    ('Mavie', 'Mavie@email.com', '1988888888', 'São paulo', TRUE);

-- 2
INSERT INTO categoria (nome) 
VALUES ('Especiais da Casa');

-- 3.
INSERT INTO produto (nome, preco, id_categoria, ativo) 
VALUES 
    ('Ratatouille 1', 45.00, LAST_INSERT_ID(), TRUE),
    ('Hamburguer de siri', 55.50, LAST_INSERT_ID(), TRUE),
    ('bolinhos da Tiana"', 22.00, LAST_INSERT_ID(), TRUE);

-- 4
INSERT INTO cliente (nome, email, telefone, cidade, ativo) 
VALUES ('Mariana ', 'mariana@email.com', NULL, 'Curitiba', TRUE);

-- 5
INSERT INTO pedido (id_cliente, data_pedido, valor_total) 
VALUES (1, NOW(), 100.50);
