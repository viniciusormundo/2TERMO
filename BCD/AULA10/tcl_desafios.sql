-- ATIVIDADE PRATICA - AULA 10
-- Aluno(a): _________________________________________________
-- Regra: valide sempre antes de COMMIT.

-- 01. Consulte produto 2 e seu preço.
select * from produto where id_produto = 2;
-- 02. START TRANSACTION e aumente produto 2 em R$3,00.
start transaction;
update produto set preco = preco + 3.00 where id_produto = 2;
-- 03. Consulte dentro da transação.
select * from produto where id_produto = 2;
-- 04. ROLLBACK.
ROLLBACK;
-- 05. Consulte e comprove retorno.
select * from produto where id_produto = 2;
-- 06. Repita a alteração e finalize com COMMIT.
start transaction;
update produto set preco = preco + 3.00 where id_produto = 2;
commit;
select * from produto where id_produto = 2;
-- 07. START TRANSACTION e aumente produto 3 em 10%.
select * from produto where id_produto = 3;
start transaction;
update produto set preco = preco * 1.10 where id_produto = 3;
select * from produto where id_produto = 3;
-- 08. SAVEPOINT ajuste_produto3.
SAVEPOINT ajuste_produto3;
-- 09. Aumente produto 4 em 50%.
update produto set preco = preco * 1.50 where id_produto = 4;
select * from produto where id_produto = 4;
-- 10. Consulte os dois.
SELECT * FROM produto WHERE id_produto in  (3, 4);
-- 11. ROLLBACK TO SAVEPOINT ajuste_produto3.
ROLLBACK to SAVEPOINT ajuste_produto3;
-- 12. COMMIT e explique em comentário qual alteração permaneceu.
COMMIT
-- explicação, o valor do produto 3 permaneceu, pois foi feito um save point, ja o do produto 4 foi desfeito com o rollback

-- 13. START TRANSACTION.
START TRANSACTION;
-- 14. Crie pedido para cliente 1 e salve o id em @novo_pedido.
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) 
VALUES (NOW(), 'ABERTO', 21.00, 1);

SET @novo_pedido = LAST_INSERT_ID();
-- 15. Insira dois itens válidos.
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES (@novo_pedido, 1, 2, 7.50),(@novo_pedido, 2, 1, 15.00);  
-- 16. Registre pagamento válido.
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) 
VALUES (@novo_pedido, 1, 30.00, NOW());
-- 17. Consulte pedido, itens e pagamento.
SELECT * FROM pedido WHERE id_pedido = @novo_pedido;
SELECT * FROM item_pedido WHERE id_pedido = @novo_pedido;
SELECT * FROM pagamento WHERE id_pedido = @novo_pedido;
-- 18. COMMIT.
COMMIT;
-- 19. START TRANSACTION e crie pedido para cliente 2.
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) 
VALUES (NOW(), 'ABERTO', 3.00, 2);
-- 20. Salve o id em @pedido_com_erro.
SET @pedido_com_erro = LAST_INSERT_ID();
-- 21. Tente inserir item com id_produto inexistente.

-- 22. Após observar a FK, ROLLBACK.

-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.

-- 24. Tente excluir uma categoria que possui produtos.
-- Explique em comentário por que foi bloqueado.

-- 25. Crie em uma transação um pedido temporário com dois itens,
-- exclua o pedido e observe ON DELETE CASCADE.
-- Finalize com ROLLBACK para preservar a base.