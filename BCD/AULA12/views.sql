-- Active: 1788435101647@@127.0.0.1@3306@smartcoffe_dml_vinicius
-- views ou visoes - transformar determinadas consultas em visoes reutilizaveis

-- como posso disponibilzar uma consulta como se ela fosse uma tabela?
-- resposta: views

-- ex 1: view - como xonsultar uma visao logica
CREATE VIEW vw_produtos_ativos AS SELECT id_produto, nome, preco
FROM produto
WHERE ativo = TRUE;

-- vizualizar a consulta criada atraves da view
SELECT * FROM vw_produtos_ativos;

-- OBS: views guarda a definiçao da consulta, em uma view comum os daods continuam pertencendo as tabelas de origem
-- porque utilizar?
-- por que desejo simplificar a minha consulta
-- reutilizar a logica onde a consulta ganha um nome 
-- padronizacao de relatorios
-- restricao de exposição da logica

-- resumo 1
-- uma consulta original ou inicial
SELECT id_produto, nome, preco 
FROM produto
WHERE ativo = TRUE;

-- transfromar em uma VIEW
CREATE VIEW vw_produtos_ativos AS SELECT id_produto, nome preco 
FROM produto
WHERE ativo = TRUE;

-- como uilizar
SELECT * FROM vw_produtos_ativos;

-- ex 2 utulizar filtros nas views
SELECT id_produto, nome, preco 
FROM produto
WHERE preco >= 10.00
ORDER BY preco DESC;

SELECT * FROM vw_produtos_ativos
WHERE preco >= 10.00
ORDER BY preco DESC;

-- obs: viws nao alimina a possibilidade de usar WHERE, ORDER BY e outras clausulas

-- ex 3 VIEW com JOINS - mostrar porduto e categoria
-- consulta original
SELECT p.id_produto, p.nome AS produto, ca.nome AS categoria, p.preco
FROM produto AS p
INNER JOIN categoria as ca 
ON ca.id_categoria = p.id_categoria;

-- criando em view 
CREATE VIEW vw_produtos_categorias AS
SELECT p.id_produto, p.nome AS produto, ca.nome as categoria, p.preco 
FROM produto AS p 
INNER JOIN categoria AS ca 
ON ca.id_categoria = p.id_categoria;

-- resultado visual por view 
SELECT * FROM vw_produtos_categorias
ORDER BY categoria, produto;

-- ex 4 VIEW com varias tabelas - relatorio de pedidos

CREATE VIEW vw_pedidos_clientes AS
SELECT p.id_pedido, p.data_pedido, p.status_pedido, c.id_cliente, c.nome AS cliente, pr.id_produto, pr.nome AS Produto
FROM pedido AS p
INNER JOIN cliente AS c
ON c.id_cliente = p.id_cliente
INNER JOIN produto AS pr
ON p.id_pedido = pr.id_produto;

-- Resultado
SELECT * FROM vw_pedidos_clientes
WHERE status_pedido = "aberto";

SELECT* FROM item_pedido;

-- ex 5 view para um relatorio completo
CREATE VIEW vw_itens_pedidos AS
SELECT pe.id_pedido, pe.data_pedido, c.nome AS Cliente, pr.nome AS Produto,ip.quantidade, ip.preco_unitario,ip.quantidade * ip.preco_unitario AS Subtotal
FROM pedido AS pe
INNER JOIN cliente AS c
ON c.id_cliente = pe.id_cliente
INNER JOIN item_pedido AS ip
ON ip.id_pedido = pe.id_pedido
INNER JOIN produto AS pr
ON pr.id_produto = ip.id_produto;

-- resultado
SELECT * FROM vw_itens_pedidos
WHERE id_pedido = 3;

-- ex 6 view com funcoes de agregação
CREATE VIEW vw_vendas_por_produto AS
SELECT pr.id_produto,pr.nome AS produto,SUM(ip.quantidade) AS Unidades_Vendidas,SUM(ip.quantidade * ip.preco_unitario) AS Faturamento
FROM produto AS pr
INNER JOIN item_pedido AS ip
ON ip.id_produto = pr.id_produto
INNER JOIN pedido AS pe
ON pe.id_pedido = ip.id_pedido
WHERE pe.status_pedido = 'ABERTO'
GROUP BY pr.id_produto, pr.nome;

-- resultado: consulta gerencial
SELECT * FROM vw_vendas_por_produto
ORDER BY Faturamento DESC;


-- EX 7: VIEW COM LEFT JOIN - QUEREMOS TODOS OS CLIENTES INCLUSIVE QUEM
-- NÃO REALIZOU PEDIDOS

CREATE VIEW vw_clientes_resumo AS
SELECT c.id_cliente, c.nome AS Cliente, COUNT(p.id_pedido) AS Quantidade_Pedidos
FROM cliente AS c
LEFT JOIN pedido AS p
ON p.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome;

-- Resultado
SELECT * FROM vw_clientes_resumo
WHERE Quantidade_Pedidos = 0;

-- ex 8 Nomeando views 
-- aliases tornam as views mais claras 

CREATE View vw_precos_produtos AS
SELECT id_produto, nome as produto, preco as preco_atual
FROM produto;

SELECT * FROM vw_precos_produtos;

-- ex 9 vizualizar as views existentes
-- vizualizar o resultado de todas as views existentes
SHOW FULL TABLES WHERE table_type = 'VIEW'

-- podemos consultar o catalogo
-- quer dizer todo o BD MYSQL 
SELECT TABLE_NAME FROM information_schema.VIEWS
WHERE TABLE_SCHEMA = DATABASE();


-- EX 10: vizualizando definições
SHOW CREATE VIEW vw_produtos_categorias;

-- EX 11: CREATE OR REPLACE VIEW
CREATE OR REPLACE VIEW vw_produto_ativos AS
SELECT id_produto, nome, preco, id_categoria
FROM produto
WHERE ativo = TRUE;
-- Obs: Irá substituir ou alterar uma view já criada com suas informações.

-- EX 12: VIEW ATUALIZAVEL
CREATE VIEW vw_clientes_ativos AS
SELECT id_cliente, nome, email, ativo
FROM cliente
WHERE ativo = TRUE;

-- atualizar a tabela cliente
UPDATE vw_clientes_ativos
SET nome = 'Elisa Matsunaga'
WHERE id_cliente = 2;


-- EX 13: VIEW NÃO ATUALIZÁVEL
UPDATE vw_vendas_por_produto
SET Faturamento = 1000
WHERE id_produto = 1

-- Obs: O campo é calculado. Simplesmente não é possível receber 1000.

-- EX 14: WITH CHECK OPTION - VIEW QUE MOSTRA APENAS PRODUTOS ATIVOS
CREATE OR REPLACE VIEW vw_produtos_ativos AS
SELECT id_produto, nome, preco, ativo, id_categoria
FROM produto
WHERE ativo = TRUE
WITH CHECK OPTION;

SELECT * FROM vw_produtos_ativos;

-- Obs: O With Check Option ajuda a impedir alterações realizadas pela view que fariam o registro.
-- Verificar se tudo o que eu pedi pra ele está OK se estiver ele confirma

-- EX 15: PADRÃO DEFINIÇÃO DE NOMENCLATURA
-- vw - views
-- nome - complementar a tabela ou consultar que deseja realizar.
-- vw_nome_desejo
-- vw_nome_da_finalidade
-- vw_produtos_ativos


-- apagar VIEW
DROP View vw_pordutos_ativos