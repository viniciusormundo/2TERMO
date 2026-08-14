 -- COMANDO PARA CRIAR BANCO DE DADOS
 create database Hotel_Neymar;
 create database Hotel_Neymar2;
 
-- COMANDO PARA APAGAR BANCO DE DADOS
drop database hotel_neymar2;

-- COMANDO PARA ATIVAR BANCO DE DADOS
use Hotel_Neymar;

-- COMANDO PARA CRIAR TABELAS
create table Clientes ( 
ID_Hospede int auto_increment primary key, 
nome varchar(60) not null, 
cpf varchar(14) not null unique,
email varchar(60),
IDADE int not null, 
telefone varchar(14),
data_cadastro timestamp default current_timestamp);

CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    data_nascimento DATE,
    funcao VARCHAR(60),
    status_Cliente CHAR(10) not null default "ativo",
    salario DECIMAL(10,2)
);

CREATE TABLE Quartos (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero_do_quarto INT NOT NULL,
    suite_master BOOLEAN,
    cartao_quarto CHAR(10),
    suite_comum BOOLEAN,
    suite_premium BOOLEAN
);

CREATE TABLE Estacionamento (
    id_placa VARCHAR(10) PRIMARY KEY,
    modelo_carro VARCHAR(60),
    vaga_carro BOOLEAN,
    vaga_moto BOOLEAN,
    vaga_preferencial BOOLEAN,
    modelo_moto VARCHAR(60)
);

CREATE TABLE Servico_de_Quarto (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(3,2) NOT NULL,
    observacao VARCHAR(50),
    numero_quarto INT NOT NULL,
    tipo_servico VARCHAR(30),
    horario_servico TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
