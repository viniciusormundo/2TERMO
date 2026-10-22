-- Active: 1788435101647@@127.0.0.1@3306@smartcoffe_dml_vinicius
-- TCL - TRANSAÇOES E INTEGRIDADE

-- ESTRUTURA DE TRANSAÇÃO
BEGIN TRANSACTION;
-- COMANDO SQL

COMMIT; -- CONFIRMA A TRANSAÇÃO

ROLLBACK;  -- DESFAZ A TRANSAÇÃO

-- PROCESSO INCIAL
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES ('Cristiano Ronaldo', 'CRonaldo@email.com','19981901773','Funchal', TRUE);

SELECT nome FROM cliente;

-- EX 2  ROLLBACK
-- DESFAZ A TRANSAÇÃO
START TRANSACTION;

UPDATE produto
SET preco = 8.50
WHERE id_produto = 1;

SELECT * FROM produto WHERE id_produto = 1;

ROLLBACK;

-- EX 3 SAVEPOINT
-- CRIAR UM PONTO DENTRO DA TRANSAÇÃO
START TRANSACTION;

UPDATE produto
SET preco = preco * 1.50
WHERE id_categoria = 1;

SAVEPOINT reajuste_cafes;

UPDATE produto
SET preco = preco * 2.00
WHERE id_categoria = 4;

ROLLBACK SAVEPOINT reajuste_cafes;

COMMIT;

-- EX 4: REALESE SAVEPOINT
-- REMOVE O SAVEPOINT DA TRANSAÇÃO

RELEASE SAVEPOINT reajuste_cafes;

-- EX 5 AUTOCOMMIT

SELECT @@autocommit;
-- ATIVO POR PADRÃO DO MYSQL 
START TRANSACTION;
-- DMLS RELACIONADAS
COMMIT;

-- EX 6 TRANSAÇOES NÃO SUBSTITUI CONSTRAINT
-- CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria) ON DELETE CASCADE ON UPDATE CASCADE;

-- CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente); ON DELETE CASCADE ON UPDATE CASCADE;

-- CREATE TABLE cliente (
--     id_cliente INT PRIMARY KEY,
--     nome VARCHAR(60),
--     telefone VARCHAR (60),
--     cidade VARCHAR (60),
--     ativo BOOLEAN DEFAULT TRUE
--     CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- SEMPRE CHECAR A QUANTIDADE E SE ABAIXO DE 0 OU IGUAL QUE 0 SINALIZAR
CONSTRAINT ck_estoque_quantidade CHECK (quantidade >= 0);

SELECT * FROM cliente;

CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    -- RESTRICOES
    
    -- CHAVE PRIMARIA
    CONSTRAINT pk_estoque PRIMARY KEY (id_estoque),
    -- CHAVE UNIQUE OU UNICA
    CONSTRAINT uq_estoque_produto UNIQUE (id_produto),
    -- CHECAR OU VALIDAR UMA OPERAÇÃO DE QUANTIDADE
    CONSTRAINT ck_estoque_quantidade CHECK (quantidade >= 0),
    -- CHAVE ESTRANGEIRA
    CONSTRAINT fk_estoque_produto FOREIGN KEY (id_produto)
    REFERENCES produto (id_produto) ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO estoque (id_estoque, quantidade) VALUES (1,50), (2,40), (3,30);
SELECT * FROM estoque;

-- EX 7: FLUXO SEGURO PARA UPDATE/DELETE
-- EXCLUSÃO FÍSICA

DELETE FROM produto
WHERE id_produto = 11;

-- EXCLUSÃO LÓGICA

UPDATE produto
SET ativo = FALSE
WHERE id_produto = 10;

SELECT * FROM produto WHERE id_produto = 3;

START TRANSACTION;

UPDATE produto
SET preco = 15.50
WHERE id_produto = 3;

SELECT * FROM produto WHERE id_produto = 3;
START TRANSACTION;

UPDATE produto
SET preco = 15.50
WHERE id_produto = 3;

SELECT * FROM produto WHERE id_produto = 3;

COMMIT;
-- ROLLBACK;

-- EX 8 PEDIDO COMPLETO COM TRANSAÇAO

START TRANSACTION;

SELECT * FROM pedido ;

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES ( NOW(), 'ABERTO',0.00, 35);

SET @pedido = LAST_INSERT_ID();

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES (@pedido, 1,2, 7.50), (@pedido, 1,2, 8.50);

INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) 
VALUES (@pedido, 2, 23.00, NOW());
COMMIT;

-- EX 9: PEDIDO COMPLETO COM TRANSAÇÃO E ROLLBACK

START TRANSACTION;

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente)
VALUES (NOW(), 'ABERTO', 0.00, 23);

SET @pedido = LAST_INSERT_ID();

-- PRODUTO INEXISTENTE

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES (@pedido, 1, 999, 9.00), (@pedido, 1, 999, 11.00);

ROLLBACK;