CREATE DATABASE pastelaria_do_Vidu;
USE pastelaria_do_Vidu;

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
casa INT, 
bairro VARCHAR(30),
cidade VARCHAR(45)
);

CREATE TABLE pastel (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
categoria VARCHAR(45),
tamanho VARCHAR(15),
preco DECIMAL(10,2), 
ingredientes TEXT
);

CREATE TABLE recheios (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
ingredientes TEXT,
preco DECIMAL(10,2)
);

CREATE TABLE pastel_recheio (
id_pastel INT,
id_recheio INT,
FOREIGN KEY (id_pastel) REFERENCES pastel(id),
FOREIGN KEY (id_recheio) REFERENCES recheios(id),
PRIMARY KEY (id_pastel, id_recheio)
);

CREATE TABLE Pedidos (
id INT PRIMARY KEY AUTO_INCREMENT,
id_cliente INT,
data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
forma_pagamento VARCHAR(50),
FOREIGN KEY (id_cliente) REFERENCES clientes_pastelaria(id)
);

CREATE TABLE Precos_Pasteis (
id INT PRIMARY KEY AUTO_INCREMENT,
id_pastel INT,
id_recheio INT,
tamanho VARCHAR(20),
preco DECIMAL(10,2),
FOREIGN KEY (id_pastel) REFERENCES pastel(id),
FOREIGN KEY (id_recheio) REFERENCES recheios(id)
);

CREATE TABLE Pedido_Pastel (
id_pedido INT,
id_pastel INT,
quantidade INT,
FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
FOREIGN KEY (id_pastel) REFERENCES pastel(id),
PRIMARY KEY (id_pedido, id_pastel)
);

INSERT INTO clientes_pastelaria (nome, apelido, data_nascimento, telefone, cpf, email, cep, rua, casa, bairro, cidade) 
VALUES ('MARIA', 'MARI', '18/04/1999', '(75)982569387', '896-555-600.32', 'MARIA36@GMAIL.COM','44050-898','RUA POJUCA', 1520, 'PEDROCA', 'FEIRA DE SANTANA'),
       ('JOANA', 'ANA', '09/07/2004', '(75)986594289', '963-584-521.87', 'JOANA98@GMAIL.COM', '44086-978', 'RUA DA PALMA', 5, 'BARAUNA', 'FEIRA DE SANTANA'),
       ('MARCOS', 'CABEÇA', '17/06/2008', '(75)982642590', '864-900-666.89', 'MARCOS25@GMAIL.COM', '44058-963', 'RUA VARGAS', 70, 'TOMBA', 'FEIRA DE SANTANA'),
       ('EDVALDO', 'BABALU', '17/08/2006', '(75)982569984', '898-500-444.48', 'EDVALDO96@GMAIL.COM', '44075-854', 'RUA GUSTA', 54, 'MANGABEIRA', 'FEIRA DE SANTANA'),
       ('ANTONIO', 'TONINHO', '18/08/2007', '(75)982546752', '869-444-569-85', 'ANTONIO@GMAIL.COM', '44058-963', 'RUA SANTOS', 10, 'BARAUNA', 'FEIRA DE SANTANA'),
       ('LISANDRA', 'LIS', '19/12/2000', '(75)986495276', '896-555-874.86', 'LIS89@GMAIL.COM', '44089-987', 'RUA SOUSA', 935, 'FERREIRRA', 'FEIRA DE SANTANA'),
       ('MARCOS FILIPE', 'MARCOS', '09/07/2004', '(75)986596245', '963-584-521.12', 'MARCOS98@GMAIL.COM', '44086-978', 'RUA DA PALMA',562, 'BARAUNA', 'FEIRA DE SANTANA'),
       ('JOÃO PAULO', 'PAULO', '17/06/2008', '(75)982649861', '864-900-666.62', 'JOÃO25@GMAIL.COM', '44058-963', 'RUA VARGAS', 110, 'TOMBA', 'FEIRA DE SANTANA'),
       ('LUISA SOUSA', 'SOUSA', '17/08/2006', '(75)982566241', '898-500-444.36', 'LUISA96@GMAIL.COM', '44075-854', 'RUA GUSTA', 95, 'MANGABEIRA', 'FEIRA DE SANTANA'),
       ('JUNIOR ', 'JUNINHO', '18/08/2007', '(75)982548974', '869-444-569-69', 'JUNIOR@GMAIL.COM', '44058-963', 'RUA SANTOS', 30, 'BARAUNA', 'FEIRA DE SANTANA'),
       ('JOSEVAL', 'JOSE', '19/12/2000', '(75)98649675', '896-555-874.74', 'JOSE89@GMAIL.COM', '44089-987', 'RUA SOUSA', 58, 'FERREIRRA', 'FEIRA DE SANTANA');
       
       
INSERT INTO pastel (nome, categoria, tamanho, preco, ingredientes)
VALUES ('POPEYE', 'VEGANO', 'GRANDE', 9.00, 'Espinafre, tofu'),
       ('POPEYE', 'VEGANO', 'MEDIO', 7.00, 'Espinafre, tofu'),
       ('POPEYE', 'VEGANO', 'PEQUENO', 5.00, 'Espinafre, tofu'),
       ('BEMVEG', 'VEGANO', 'GRANDE', 7.50, 'Berinjela, cogumelos'),
       ('BEMVEG', 'VEGANO', 'MEDIO', 6.00, 'Berinjela, cogumelos'),
       ('BEMVEG', 'VEGANO', 'PEQUENO', 4.50, 'Berinjela, cogumelos'),
       ('ITATIAIA', 'VERGETARIANO', 'GRANDE', 8.50, 'Palmito, milho'),
       ('ITATIAIA', 'VERGETARIANO', 'MEDIO', 7.00, 'Palmito, milho'),
       ('ITATIAIA', 'VERGETARIANO', 'PEQUENO', 5.50, 'Palmito, milho'),
       ('ROSTI', 'VERGETARIANO', 'GRANDE', 5.00, 'Batata, queijo muçarela'),
       ('ROSTI', 'VERGETARIANO', 'MEDIO', 4.50, 'Batata, queijo muçarela'),
       ('ROSTI', 'VERGETARIANO', 'PEQUENO', 4.00, 'Batata, queijo muçarela'),
       ('PATISSERIE', 'SEMLACTOSE', 'GRANDE', 8.00, 'Frutas, creme vegetal'),
       ('PATISSERIE', 'SEMLACTOSE', 'MEDIO', 7.00, 'Frutas, creme vegetal'),
       ('PATISSERIE', 'SEMLACTOSE', 'PEQUENO', 6.00, 'Frutas, creme vegetal'),
       ('QUENELLE', 'SEMLACTOSE', 'GRANDE', 9.00, 'Chocolate, creme de amêndoas'),
       ('QUENELLE', 'SEMLACTOSE', 'MEDIO', 8.00, 'Chocolate, creme de amêndoas'),
       ('QUENELLE', 'SEMLACTOSE', 'PEQUENO', 6.00, 'Chocolate, creme de amêndoas');
       
       
       
INSERT INTO recheios (nome, ingredientes, preco)
VALUES 
    ('Queijo', 'Queijo muçarela, queijo prato', 3.50),
    ('Frango com Catupiry', 'Frango desfiado, catupiry', 4.00),
    ('Calabresa', 'Calabresa fatiada, cebola, tomate', 3.00),
    ('Palmito', 'Palmito, cebola, azeitona', 4.50),
    ('Carne', 'Carne moída, cebola, pimentão', 3.50),
    ('Pizza', 'Molho de tomate, queijo, presunto, tomate, orégano', 4.50),
    ('Chocolate', 'Chocolate ao leite, chocolate branco', 4.00),
    ('Misto', 'Queijo muçarela, presunto', 3.50),
    ('Romeu e Julieta', 'Goiabada, queijo minas', 4.00),
    ('Brócolis com Queijo', 'Brócolis cozido, queijo muçarela', 3.50),
    ('Chocolate com Morango', 'Chocolate ao leite, morangos frescos', 4.50),
    ('Atum com Cebola', 'Atum em lata, cebola picada', 3.50),
    ('Frango com Milho', 'Frango desfiado, milho verde', 4.00),
    ('Camaronês', 'Camarão refogado, queijo cremoso', 5.00),
    ('Cheddar e Bacon', 'Queijo cheddar, bacon', 4.50),
    ('Espinafre e Tofu', 'Espinafre refogado, tofu', 4.00),
    ('Cogumelos e Cebola', 'Cogumelos frescos, cebola picada', 4.50),
    ('Abobrinha e Pimentão', 'Abobrinha fatiada, pimentão vermelho picado', 4.00),
    ('Feijão Preto e Milho', 'Feijão preto cozido, milho verde', 3.50),
    ('Berinjela e Tomate', 'Berinjela grelhada, tomate em cubos', 4.00),
    ('Brócolis e Queijo', 'Brócolis cozido, queijo muçarela', 4.00),
    ('Palmito e Milho', 'Palmito picado, milho verde', 4.50),
    ('Ervilha e Cenoura', 'Ervilha cozida, cenoura ralada', 4.00),
    ('Abobrinha e Tomate Seco', 'Abobrinha grelhada, tomate seco picado', 3.50),
    ('Espinafre e Ricota', 'Espinafre refogado, ricota esfarelada', 4.50);

       
DELIMITER //

CREATE PROCEDURE ListarPasteisVeganosMais18Anos()
BEGIN
    SELECT pastel.nome AS pastel_nome
    FROM Pedidos 
    JOIN clientes_pastelaria ON Pedidos.id_cliente = clientes_pastelaria.id
    JOIN Pedido_Pastel ON Pedidos.id = Pedido_Pastel.id_pedido
    JOIN pastel ON Pedido_Pastel.id_pastel = pastel.id
    WHERE pastel.categoria = 'VEGANO'
    AND TIMESTAMPDIFF(YEAR, STR_TO_DATE(clientes_pastelaria.data_nascimento, '%d/%m/%Y'), CURDATE()) > 18;
END //



SELECT 
    YEAR(pedidos.data_pedido) AS ano,
    MONTH(pedidos.data_pedido) AS mes,
    clientes_pastelaria.nome AS nome_cliente,
    COUNT(pedidos.id) AS total_pedidos
FROM 
    Pedidos 
JOIN 
    clientes_pastelaria  ON p.id_cliente = clientes_pastelaria.id
GROUP BY 
    YEAR(pedidos.data_pedido),
    MONTH(pedidos.data_pedido),
    clientes_pastelaria.nome
ORDER BY 
    ano,
    mes,
    total_pedidos DESC;
    
SELECT DISTINCT pastel.nome AS nome_pastel
FROM pastel 
JOIN pastel_recheio  ON pastel.id = pastel_recheio.id_pastel
JOIN recheios  ON pastel_recheio.id_recheio = recheios.id
WHERE recheios.nome LIKE '%Bacon%' OR recheios.nome LIKE '%Queijo%';



DELIMITER //

CREATE PROCEDURE CalcularValorTotalVenda()
BEGIN
    SELECT SUM(preco) AS valor_total_venda
    FROM pastel;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ListarPedidosPastelBebida()
BEGIN
    SELECT DISTINCT pedidos.id AS id_pedido
    FROM Pedidos 
    JOIN Pedido_Pastel ON pedidos.id = Pedido_Pastel.id_pedido
    JOIN pastel ON Pedido_Pastel.id_pastel = pastel.id
    JOIN Pedido_Bebida ON pedidos.id = Pedido_Bebida.id_pedido;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE ListarPasteisMaisVendidos()
BEGIN
    SELECT 
        pastel.nome AS nome_pastel,
        COUNT(Pedido_Pastel.id_pastel) AS quantidade_vendas
    FROM 
        pastel
    LEFT JOIN 
        Pedido_Pastel ON pastel.id = Pedido_Pastel.id_pastel
    GROUP BY 
        pastel.nome
    ORDER BY 
        quantidade_vendas DESC;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER calcular_total_pedido AFTER INSERT ON Pedido_Pastel
FOR EACH ROW
BEGIN
    DECLARE total_pedido DECIMAL(10,2);
    SELECT SUM(preco) INTO total_pedido FROM Precos_Pasteis WHERE id_pastel = NEW.id_pastel;
    UPDATE Pedidos SET total = total_pedido WHERE id = NEW.id_pedido;
END;
//

DELIMITER ;


DELIMITER //

CREATE EVENT cancelar_pedidos_nao_pagos
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    UPDATE Pedidos
    SET status = 'Cancelado'
    WHERE status = 'Pendente' AND DATEDIFF(NOW(), data_pedido) > 3;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER atualizar_historico_vendas AFTER UPDATE ON Pedidos
FOR EACH ROW
BEGIN
    IF NEW.status = 'Concluído' THEN
        INSERT INTO Historico_Vendas (id_pedido, data_venda, valor_total)
        VALUES (NEW.id, NOW(), NEW.total);
    END IF;
END;
//

DELIMITER ;
DELIMITER //

CREATE TRIGGER atualizar_preco_total_remover AFTER DELETE ON Pedido_Pastel
FOR EACH ROW
BEGIN
    DECLARE total_pedido DECIMAL(10,2);
    
    SELECT SUM(preco) INTO total_pedido
    FROM pastel
    JOIN Pedido_Pastel ON pastel.id = Pedido_Pastel.id_pastel
    WHERE Pedido_Pastel.id_pedido = OLD.id_pedido;
    UPDATE Pedidos
    SET preco_total = total_pedido
    WHERE id = OLD.id_pedido;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER registrar_ultimo_preco_pastel BEFORE UPDATE ON pastel
FOR EACH ROW
BEGIN
    SET NEW.preco_anterior = OLD.preco;
END;
//

DELIMITER ;

