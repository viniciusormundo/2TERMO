-- DQL DATA QUERY LANGUAGE (LINGUAGEM DE CONSULTA DE DADOS)
USE SMARTCOFFE_DML_VINICIUS;
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Ana Flávia', 'anaf@email.com', '199984512456', 'Campinas', TRUE);

-- EX SELECT SIMPLES OU CONSULTA SIMPLES
-- ESTRUTURA SELECT COMO EXEMPLO
-- SELECT COLUNA
-- FROM TABELA

SELECT *
FROM cliente;


-- CONSULTAR TODAS AS COLUNAS
SELECT nome, telefone
FROM cliente;

-- CONSULTAR COLUNAS ESPECÍFICAS

-- EX: AS COMO APELIDO OU UM NOVO NOME PARA COLUNAS

SELECT nome AS Nome_Cliente
FROM cliente;

SELECT email AS Email_Cliente, telefone AS Zap
FROM cliente;

-- EX 3: DISTINCT - ELIMINANDO REPETIÇÕES

SELECT DISTINCT cidade
FROM cliente;

-- SEM DISTINCT O RESULTADO IRÁ SE REPETIR MAIS VEZES.
-- COM DISTINCT O RESULTADO IRÁ APARECER UMA VEZ.
-- EX 4: WHERE - FILTRO POR REGISTROS
-- IREMOS DEFINIR CONDIÇÕES
-- = IGUAL
-- <> OU != DIFERENTE
-- >= MAIOR OU IGUAL
-- < MENOR QUE
-- <= MENOR OU IGUAL


SELECT nome, preco
FROM produto
WHERE preco > 10.00;

-- CONSULTA PARA VALORES ACIMA DE 10.00 REAIS

SELECT nome, preco, ativo AS Status
FROM produto
WHERE ativo = TRUE;


-- CONSULTA STATUS DE CLIENTES SE ESTÁ ATIVO OU INATIVO


SELECT id_pedido, data_pedido, valor_pedido
FROM pedido
WHERE valor_total >= 25.00;


-- CONSULTA PEDIDOS ACIMA DE DETERMINADO VALOR

-- EX 5: USO DO AND, OR E NOT

-- AND: TODAS AS CONDIÇÕES VERDADEIRAS

SELECT nome, preco
FROM produto
WHERE preco >= 8.00 AND preco <= 25.00;


-- OR: PELO MENOS UMA CONDIÇÃO VERDADEIRA
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Piracicaba';


-- NOT: NÃO IRÁ BUSCAR OU CONSULTAR O VALOR DESEJADO

SELECT nome, cidade
FROM cliente
WHERE NOT cidade = 'Limeira';


-- EXTRA - UTILIZANDO AND E OR JUNTOS, SEPARAR POR ()

SELECT nome, cidade, ativo
FROM cliente
WHERE ativo = TRUE
AND (cidade = 'Limeira' OR cidade = 'Piracicaba');


-- EX 6: BETWEEN - ENTRE DOIS VALORES

-- LIMITE INICIAL E FINAL

SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;


-- CONSULTA POR VALORES ENTRE 8 E 15


SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:59:59';


-- CONSULTA POR INTERVALO DE DATAS


-- EX 7: IN - VÁRIAS POSSIBILIDADES

SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Campinas', 'Americana', 'Piracicaba');


-- CONSULTA COM VÁRIAS CONDIÇÕES E DIMINUINDO O USO DE OR


SELECT nome, cidade
FROM cliente
WHERE cidade NOT IN ('Limeira', 'Piracicaba');


-- EX 8: LIKE - PESQUISAR POR TEXTOS
-- CORINGAS
-- % VÁRIOS CARACTERES
-- _ EXATAMENTE UM CARACTER

SELECT nome
FROM produto
WHERE nome LIKE 'café%';

-- CONSULTA TODOS OS PRODUTOS QUE COMEÇAM COM A PALAVRA DESEJADA

SELECT nome
FROM produto
WHERE nome LIKE '%chocolate';


-- CONSULTA TODOS OS PRODUTOS QUE POSSUAM A PALAVRA DESEJADA

SELECT nome
FROM cliente
WHERE nome LIKE '%Silva';

-- CONSULTA TODOS OS CLIENTES QUE TERMINAM COM A PALAVRA DESEJADA


SELECT nome
FROM cliente
WHERE nome LIKE '%Si_va';


-- CONSULTA ESPECIFICAMENTE O CARACTER QUE NÃO SE LEMBRA


-- EX 9: NULL - AUSÊNCIA DE VALORES

SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;


-- CONSULTA CAMPOS QUE POSSUEM O NULL


SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;


-- CONSULTA CAMPOS QUE NÃO SÃO NULL


-- EX 10: ORDER BY - ORDENANDO RESULTADOS

-- ASC: CRESCENTE

-- DESC: DECRESCENTE


SELECT nome, preco
FROM produto
ORDER BY preco ASC;


-- CONSULTAR DADOS DE FORMA DECRESCENTE


SELECT cidade, nome
FROM cliente
ORDER BY cidade ASC, nome DESC;


-- CONSULTA POR MAIS DE UMA COLUNA


-- EX 11: LIMIT - LIMITAR QUANTIDADE DE LINHAS

SELECT nome, preco
FROM produto
ORDER BY preco DESC LIMIT 5;

-- CONSULTAR APENAS UMA QUANTIDADE ESPECÍFICA DE LINHAS

SELECT nome, preco
FROM produto
ORDER BY nome
LIMIT 5 OFFSET 5;
-- CONSULTAR COM LIMITE DE VALORES E LINHAS

-- EX 12: CÁLCULO DE COLUNAS
SELECT nome, preco, preco - (preco * 2) AS preco_ajustado
FROM produto;
SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS sub_total
FROM item_pedido;

-- EX 13: FUNÇÕES PARA CONSULTAS
-- TEXTOS
SELECT UPPER(nome) AS Nome_cliente, LOWER(email) AS Email_cliente
FROM cliente;

SELECT CONCAT(nome, '---', cidade) AS cidade_clientes
FROM cliente;
-- CONCAT: CONCATENAÇÃO DE VALORES

-- NÚMEROS
SELECT nome, preco, ROUND(preco * 0.90, 2) AS Preco_Desconto
FROM produto;

-- DATAS
SELECT id_pedido, data_pedido,
       DATE(data_pedido) AS datas,
       MONTH(data_pedido) AS mês,
       YEAR(data_pedido) AS ano,
       DAY(data_pedido) AS dia,
       TIME(data_pedido) AS horário
FROM pedido;

-- COALESCE - SUBSTITUIR A INFORMAÇÃO QUE DEIXAMOS EM NULL OU NÃO DEIXAMOS
SELECT nome, COALESCE(telefone, 'Não Informado') AS telefone
FROM cliente;

-- EX 14: FUNÇÕES DE AGRUPAMENTO
-- COUNT
-- SUM
-- AVG
-- MIN
-- MAX

-- EX 15 GROUP BY - AGRUPAR DADOS
SELECT cidade, COUNT (*) AS Quantidade_clientes
FROM cliente
GROUP BY cidade;

SELECT id_categoria, COUNT (*) AS Quantidade_produtos
FROM produto
GROUP BY id_categoria;

-- EX 16 HAVING - FILTRO POR GRUPOS
-- WHERE - FILTRA LINHAS ANTES DO GROUP BY
-- HAVING - FLITRA LINHAS DEPOIS DO GROUP BY

SELECT cidade, COUNT(*) AS QTDE_CLIENTES
FROM cliente
GROUP BY cidade
HAVING COUNT (*) >= 2;

-- CIDADE COM PLEO MENOS DOIS CIENTES

-- EX 17 ONDE DE CRIAÇÃO DE UMA CONSULTA COMPLETA
SELECT colunas
FROM tabela
WHERE condicao
GROUP BY colunas_agrupar
HAVING condicao_agrupar
ORDER BY colunas
LIMIT quantidade;
-------------------------------------------------------------------------------------
-- PARTE II COM INNER JOIN, LEFT JOIN, RIGHT JOIN - CONSULTA DE ENIDADES RELACIONADOS

-- INNER JOIN - CONSULTA DE REGSITROS RELACIONADOS ENTRE DUAS TABELAS
-- RETORNA REGISTRO QUE POSSUEM CORRESPONDENCIA
-- EX 1 : PEDIDOS COM O NOME DO CLIENTE

select P.id_pedido, P.data_pedido, C.nome as cliente, P.valor_total
from pedido as P
inner join cliente as C
on C.id_cliente = P.id_cliente;

-- LEIA ON: CLIENET CUJO ID_CLIENTE É IGUAL AO ID_CLIENTE GRAVADO NO PEDIDO
-- P E C SÃO APELIDOS QUE DEIXAM CONSULTAS  MAS CURTAS E LEGIVEIS.

-- EX 2: LEFT JOIN MANTEM TODOS OS REGISTROS DA TABELA DA ESQUERDA MESMO QUANDO NAO EXISTE CORRESPONDENCIA NA TABELA DA DIREITA
-- TODOS OS CLIENTES, INCLUSIVE QUEM NUNCA COMPROU
select C.nome, P.id_pedido, P.data_pedido
from cliente as C 
LEFT join pedido as P 
on P.id_cliente = C.id_cliente
order by C.nome;

-- DESCOBRINDO CLIENTES SEM PEIDOS
SELECT C.id_cliente, C.nome 
from cliente as C
left join pedido as P 
on P.id_cliente = C.id_cliente
where P.id_pedido is null;

-- EX 3: JOIN COM TRES TABELAS
select p.id_pedido, PR.nome as produto, IP.quantidade, ip.preco_unitario, IP.quantidade * IP.preco_unitario as subtotal
from pedido as P 
inner join item_pedido as IP
on IP.id_produto = IP.id_produto
order by P.id_pedido;

-- EX 4 JOIN COM CATEGORIA
-- PRODUTO E NOME DE SUA CATEGORIA
select PR.nome as produto, C.nome as categoria, PR.preco 
from produto as PR 
inner join categoria as C 
on C.id_categoria = PR.id_categoria
order by C.nome, PR.nome;

-- EX 5: AGREGAÇÃO + JOIN 
-- QUANTIDADE DE PRODUTOS POR CATEGORIAS
SELECT C.nome AS CATEGORIA, COUNT(PR.id_produto) AS qtde_produtos
FROM CATEGORIA AS C
LEFT JOIN PRODUTO AS PR
ON PR.id_categoria = C.id_categoria
GROUP BY C.id_categoria, C.NOME
ORDER BY qtde_produtos DESC;


-- TOTAL COMPRADO POR CLIENTE
select C.nome as cliente, count(P.id_pedido) as qtde_pedidos,
sum(P.valor_total) as total_comprado
from cliente as C
inner join pedido as P
on P.id_cliente = C.id_cliente
where P.status_pedido = 'PREPARANDO'
group by C.id_cliente, C.nome
order by total_comprado desc;

-- EX 6 RALATORIO COMPLETO DO PEDIDO
SELECT P.id_pedido, DATE_FORMAT(P.data_pedido, '%d %m %y %h %i') as DATA, C.nome as cliente, PR.nome as produto, IP.quantidade, IP.preco_unitario, quantidade * preco_unitario as subtotal
from pedido as P
inner join item_pedido as IP 
on IP.id_pedido =p.id_pedido
inner join produto as PR 
on PR.id_produto = IP.id_produto
order by P.id_pedido, PR.nome;
