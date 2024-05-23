CREATE DATABASE pastelaria_do_pedroca;
USE pastelaria_do_pedroca;

CREATE TABLE clientes_pastelaria(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    apelido VARCHAR(15),
    data_nascimento CHAR(8),
    telefone CHAR(15) NOT NULL UNIQUE,
    cpf CHAR(14) NOT NULL UNIQUE,
    email VARCHAR(40) UNIQUE,
    cep CHAR(8),
    rua VARCHAR(50) NOT NULL,
    casa VARCHAR(30), 
    bairro VARCHAR(30),
    cidade (30)
);

