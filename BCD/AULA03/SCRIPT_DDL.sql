-- comando para criar banco de dados
-- 1
create database academia_do_ney;
-- verificar banco e criar 
create database if not exists academia_do_ney;

-- ativar banco de dados 
-- 2
use academia_do_ney;

-- tabelas 
-- 2
-- INT → número
-- VARCHAR → texto
-- NOT NULL → obrigatório
-- UNIQUE → não pode repetir
-- PRIMARY KEY → identificador do registro
-- AUTO_INCREMENT → número automático
-- ENUM → opções limitadas
-- DEFAULT → valor padrão
-- TIMESTAMP → data e hora
-- CURRENT_TIMESTAMP → agoracadastro
-- CREATE TABLE → criar tabela
-- IF NOT EXISTS → se ainda não existir

-- 3
create table if not exists alunos (
id_cadastro int auto_increment primary key,
nome varchar(60) not null,
cpf varchar(14) not null unique,
telefone varchar(15),
convenio enum ('sim','não') default 'sim',
data_cadastro timestamp default current_timestamp

);

create table if not exists servicos(
id_servico int primary key,
nome_servico varchar(60) not null,
tipo_servico enum('serviço quarto', 'frigobar', 'manutençao', 'limpeza') default 'serviço quarto',
preco decimal(5,2) default 0.00
);

-- 4
-- vizualizar tabelas 
show tables;

-- 5
-- apagar banco de dados
drop database academia_do_ney;
-- apagar tabelas
drop tables Cadastro;

-- 6
-- inserir campos novos, caso ouver ncessidade de adicionar algo na tabelas
alter table Cadastro add email varchar(100);

-- alterar tipos de dados
alter table Cadastro modify telefone int;

-- apagar coluna ou atributos
alter table aluno drop column telefone;

-- renomar tabelas
rename table Cadastro to alunos;

-- apagar dados de uma tabela
truncate table alunos;

-- inserir dados na tabela
insert into servicos (id_servico,nome_servico, tipo_servico, preco) 
values (1,'limpeza','frigobar',35.00), (2,'manutenção','limpeza',45.00);

insert into servicos (id_servico, nome_servico, tipo_servico, preco) 
values (3,'limpeza','frigobar',35.00), (4,'manutenção','limpeza',45.00);

insert into servicos (id_servico, nome_servico, tipo_servico, preco) 
values(5 ,'limpeza' , default, 50.00);



-- consultar dados de uma tabela
select * from servicos;

create table if not exists estacionamento(
id_vagas int auto_increment primary key,
veiculos ENUM ('carro', 'moto', 'bike', 'patinete_eletrico') default 'carro',
quantidade_vagas int not null,
vagas_preferenciais enum('sim' , 'nao') default 'nao',
placas varchar(9) not null unique 
);

insert into estacionamnto(id_vagas, veiculos, quantidade_vagas,vagas_preferenciais,placas)
values(1,'carro',50, 'nao' , 'varchar' ), (2, 'moto', 20, 'nao', 'varchar');

insert into estacionamnto(id_vagas, veiculos, quantidade_vagas,vagas_preferenciais,placas)
values(3,'bike', 7, 'nao' , 'varchar' ), (4, 'patinete_eletrico', 5, 'nao', 'varchar');


insert into estacionamnto(id_vagas, veiculos, quantidade_vagas,vagas_preferenciais,placas)
values(1,'carro', 50, 'nao' , 'varchar' );




