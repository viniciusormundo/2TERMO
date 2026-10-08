-- Active: 187485081260127.0.10@3306@smartcoffee_dml_bruno
-- DQL - DATA QUERY LANGUAGE (LINGUAGEM DE CONSULTA DE DADOS)
-- ANTES DE INICIAR
USE SMARTCOFFE_DML_VINICIUS;
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Ana Flávia', 'ana@email.com', '199984512456', 'Campinas', TRUE);

-- EX 1: SELECT SIMPLES OU CONSULTA SIMPLES
-- ESTRUTURA SELECT COMO EXEMPLO
-- SELECT coluna
-- FROM tabela;

SELECT *
FROM cliente;

-- CONSULTAR TODAS AS COLUNAS

SELECT nome, telefone
FROM cliente;


SELECT nome, preco
FROM produto
WHERE ativo = TRUE;

-- CONSULTA STATUS DE CLIENTES SE ESTÁ ATIVO OU INATIVO

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;

-- CONSULTA PEDIDOS ACIMA DE DETERMINADO VALOR

-- EX 5: USO DO AND, OR E NOT
-- AND TODAS AS CONDIÇÕES VERDADEIRAS

SELECT nome, preco
FROM produto
WHERE preco >= 8.00 AND preco <= 25.00;

-- OR PELO MENOS UMA CONDIÇÃO VERDADEIRA
SELECT nome, cidade FROM cliente
WHERE cidade = 'limeira' OR cidade = 'piracicaba';

-- NOT NAO IRA BUSCAR OU CONSULTAR O VALOR DESEJADO;
SELECT nome, cliente FROM cliente
WHERE NOT cidade = 'limeira';

-- EXTRA - UTILIZAR AND E OR JUNTOS, SEPARAR POR ()

SELECT nome,cidade, ativo
FROM cliente

