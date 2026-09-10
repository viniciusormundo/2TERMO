
CREATE TABLE Pedido (
data_pedido datetime not null,
id_pedido int auto_increment primary key PRIMARY KEY,
id_cliente int auto_increment primary key
)

CREATE TABLE Produto+Estoque (
nome_produto varchar(100) not null,
id_produto int auto_increment primary key,
id_estoque int auto_increment primary key,
Quantidade int not null,
PRIMARY KEY(id_produto,id_estoque)
)

CREATE TABLE Cliente (
nome_cliente varchar(60) not null,
id_cliente int auto_increment primary key PRIMARY KEY
)

CREATE TABLE fornecedor (
razao_social varchar(60) int not null,
id_fornecedor int auto_increment primary key PRIMARY KEY
)

CREATE TABLE produto (
nome_pruduto varchar(100) not null,
id_produto int auto_increment primary key PRIMARY KEY
)


CREATE TABLE Relação_2+item_produto (
id_produto int not null,
id_fornecedor int not null,
id_item int auto_increment primary key PRIMARY KEY,
valor decimal(10,2)
)

ALTER TABLE Pedido ADD FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente)
