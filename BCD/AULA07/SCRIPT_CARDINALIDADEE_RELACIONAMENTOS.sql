-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
nome_cliente varchar(60) not null,
id_cliente int auto_increment primary key PRIMARY KEY
);

CREATE TABLE Pedido (
data_pedido datetime not null,
id_pedido int auto_increment primary key PRIMARY KEY,
id_cliente int nott null
FOREIGN Key (id_cliente) References Clientes (id_cliente)
);

CREATE TABLE Produto+Estoque (
Nome_produto varchar(100) not null,
id_produto int auto_increment primary key,
Quantidade int not null,
Primary KEY(id_produto,id_estoque)
);

CREATE TABLE Estoque(
id_estoque int Primary key Unique,
id_produto int not null Unique,
Quantidade int not null,
FOREIGN Key (id_produto) References Clientes (id_produto)
)
