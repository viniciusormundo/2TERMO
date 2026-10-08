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

SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

-- CONSULTA POR VALORES ENTRE 8 E 15

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-01-01 00:00:00' AND '2026-12-30 23:59:59';

-- CONSULTA POR INTERVALO DE DATAS

-- EX 7: EM VÁRIAS POSSIBILIDADES

SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Campinas', 'Americana', 'Piracicaba');

-- CONSULTA COM VÁRIAS CONDIÇÕES E DIMINUINDO O USO DE OR

SELECT nome, cidade
FROM cliente
WHERE cidade NOT IN ('Limeira','Piracicaba');
-- CONSULTAR COM EXESSÃO DOS VALORES ESPECIFICADOS

-- EX 8: LIKE PESQUISAR POR TEXTOS
--  CORINGAS
-- % VARIOS CARACTERES
