USE SMARTCOFFE_DML_VINICIUS;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT
SELECT * FROM  cliente;
-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome, email, telefone, cidade, ativo)
VALUES
    ('Neymar', 'Neymar@email.com', '1999999900', 'Santos', TRUE),
    ('Mavie', 'Mavie@email.com', '1988888888', 'São paulo', TRUE);

-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome)
VALUES ('Especiais da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
-- Em todo começo de ativadade usar o SET para quando eu colocar o @ eu dar um nome ao campo, ou se for mais facil um apelido, e depois apenas chamalo com o 
SET @categoria_especial = (SELECT id_categoria FROM categoria WHERE nome = 'Especiais da Casa');
INSERT INTO produto (nome, preco, id_categoria, ativo)
VALUES
    ('Ratatouille', 45.00, @categoria_especial, TRUE),
    ('Hamburguer de siri', 55.50, @categoria_especial, TRUE),
    ('bolinhos da Tiana', 22.00, @categoria_especial, TRUE);

-- UTILIZAR O SET ANTES DA TAREFA AJUDA A ARMAZENAR O VALOR
-- DE UM ID ATRIBUÍDO E PODE SER REUTILIZADO DEPOIS.
INSERT INTO produto (nome, preco, ativo, id_categoria)
VALUES ('Sorvete Fit', 8.00, TRUE, @categoria_especial);

-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome, email, telefone, cidade, ativo)
VALUES ('vinicius ', 'vinicius@email.com', NULL, 'Chicago', TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados.
SET @cliente_especial = (SELECT nome FROM cliente WHERE email = 'Neymar@email.com');
INSERT INTO pedido (data_pedido, status, valor_total, id_cliente)
VALUES (NOW(), 'ABERTO', 0.00, @cliente_ativado);

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
SET @pedido_atividade = LAST_INSERT_ID();
INSERT INTO item_pedido (id_pedido, id_produto, quantidadade, preco_unitario)
VALUES (@pedid_atividade, 4, 1, 13.00), (@pedido_atividade,9 ,2 ,9.00);

-- PARTE B - UPDATE
-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
SELECT * FROM cliente WHERE email = 'Neymar@email.com';
-- UPDATE:
UPDATE cliente
SET telefone = '19996696021'
WHERE id_cliente = 14;
-- SELECT final:
SELECT * FROM cliente WHERE email = 'Neymar@email.com';

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
UPDATE cliente
SET telefone = '19996696021',
    cidade = 'Itatinga'
WHERE id_cliente = 14;

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
UPDATE produto
SET preco = preco * 1.08
WHERE id_categoria = @categoria_especial;

-- 10. Altere o status do pedido criado para 'PREPARANDO'.
UPDATE pedido
SET status_pedido = 'PREPARANDO'
WHERE id_pedido = @pedido_atividade;

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).

-- 1ª VERSÃO
-- SUM vem de soma
-- o AS cria uma coluna nova (nesse caso o total) e mostra oque foi atribuido no SUM e ralizado dentro dele
-- SELECT SUM(quantidade * preco_unitario) AS total
-- FROM item_pedido
-- WHERE id_pedido = @pedido_atividade;

-- UPDATE item_pedido
-- SET valor_total = (
--     SELECT SUM(preco * preco_unitario)
--     FROM pedido
--     WHERE id_pedido = @pedido_atividade);

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).
SELECT * FROM produto WHERE nome = 'Hamburguer de siri';
UPDATE produto SET ativo=FALSE WHERE nome = 'Hamburguer de siri';
SELECT * FROM produto WHERE nome = 'Hamburguer de siri';

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.
INSERT INTO cliente (nome, email, cidade)
VALUES ('Cliente Temporário', 'temporario.a0@email.com', 'Limeira');
SELECT * FROM cliente
WHERE email = 'temporario.a0@email.com';
DELETE FROM cliente
WHERE email = 'temporario.a0@email.com';
SELECT * FROM cliente
WHERE email = 'temporario.a0@email.com';

-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:
DELETE FROM clientes WHERE id_clientes = @clientes_atividade;
-- O erro foi que ao deletar não foi possivel pois a chave estrangeira depende de um vinculo de relaçao com oura tabela

-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:
-- Pois possui dependencias em outra tabela e possui dados com informações

-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
INSERT INTO categoria (nome) VALUES ('Excluir depois');
DELETE FROM categoria
WHERE nome = 'Excluir Depois';
