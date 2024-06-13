-- Remover banco de dados se necessário
DROP DATABASE IF EXISTS UniGamesDB;

-- Criação do banco de dados
CREATE DATABASE UniGamesDB;
USE UniGamesDB;

-- Tabela de Clientes
CREATE TABLE cliente (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         nome VARCHAR(100) NOT NULL,
                         sexo ENUM('m', 'f', 'o') NOT NULL,
                         idade INT NOT NULL,
                         nascimento DATE NOT NULL
);

-- Tabela de Clientes Especiais
CREATE TABLE clienteespecial (
                                 id INT AUTO_INCREMENT PRIMARY KEY,
                                 id_cliente INT,
                                 cashback DECIMAL(10, 2),
                                 FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

-- Tabela de Funcionários
CREATE TABLE funcionario (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             nome VARCHAR(100) NOT NULL,
                             idade INT NOT NULL,
                             sexo ENUM('m', 'f', 'o') NOT NULL,
                             cargo ENUM('vendedor', 'gerente', 'supervisor', 'diretor', 'CEO') NOT NULL,
                             salario DECIMAL(10, 2) NOT NULL,
                             nascimento DATE NOT NULL
);

-- Tabela de Funcionários Especiais
CREATE TABLE funcionarioespecial (
                                     id INT AUTO_INCREMENT PRIMARY KEY,
                                     id_funcionario INT,
                                     bonus DECIMAL(10, 2),
                                     FOREIGN KEY (id_funcionario) REFERENCES funcionario(id)
);

-- Tabela de Produtos
CREATE TABLE produto (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         nome VARCHAR(100) NOT NULL,
                         quantidade INT NOT NULL,
                         descricao TEXT,
                         valor DECIMAL(10, 2) NOT NULL
);

-- Tabela de Vendas
CREATE TABLE venda (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       id_vendedor INT,
                       id_cliente INT,
                       id_produto INT,
                       quantidade INT NOT NULL,
                       data DATE NOT NULL,
                       FOREIGN KEY (id_vendedor) REFERENCES funcionario(id),
                       FOREIGN KEY (id_cliente) REFERENCES cliente(id),
                       FOREIGN KEY (id_produto) REFERENCES produto(id)
);

-- Tabela de Prêmios
CREATE TABLE premios (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         id_cliente INT,
                         valor DECIMAL(10, 2),
                         data DATE NOT NULL DEFAULT CURRENT_DATE,
                         FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

-- Inserir produtos reais
INSERT INTO produto (nome, quantidade, descricao, valor) VALUES
                                                             ('The Legend of Zelda: Breath of the Wild', 50, 'Ação-aventura no mundo aberto de Hyrule', 300.00),
                                                             ('Super Mario Odyssey', 30, 'Plataforma 3D com Mario em diversos mundos', 250.00),
                                                             ('Animal Crossing: New Horizons', 40, 'Simulação de vida em uma ilha deserta', 280.00),
                                                             ('Minecraft', 25, 'Jogo de construção em mundo aberto com blocos', 150.00),
                                                             ('The Witcher 3: Wild Hunt', 20, 'RPG de ação no mundo de fantasia de The Witcher', 200.00),
                                                             ('Cyberpunk 2077', 60, 'RPG de ação ambientado em um futuro distópico', 220.00),
                                                             ('Red Dead Redemption 2', 100, 'Ação-aventura no Velho Oeste', 290.00),
                                                             ('Grand Theft Auto V', 15, 'Ação-aventura em mundo aberto', 180.00),
                                                             ('FIFA 21', 35, 'Simulação de futebol com diversos modos de jogo', 200.00),
                                                             ('Call of Duty: Modern Warfare', 10, 'FPS com modos campanha e multiplayer', 220.00),
                                                             ('Fortnite', 25, 'Battle Royale com construção e sobrevivência', 0.00),
                                                             ('League of Legends', 80, 'MOBA competitivo com diversos campeões', 0.00),
                                                             ('Valorant', 50, 'FPS tático com habilidades especiais', 0.00),
                                                             ('Among Us', 20, 'Jogo multiplayer de dedução social', 15.00),
                                                             ('Genshin Impact', 40, 'RPG de ação em mundo aberto', 0.00),
                                                             ('Assassin\'s Creed Valhalla', 30, 'Ação-aventura na era dos Vikings', 270.00),
                                                             ('Hades', 60, 'Roguelike de ação baseado na mitologia grega', 90.00),
                                                             ('Doom Eternal', 15, 'FPS com combate intenso contra demônios', 180.00),
                                                             ('Final Fantasy VII Remake', 25, 'RPG de ação com gráficos modernizados', 250.00),
                                                             ('Ghost of Tsushima', 20, 'Ação-aventura no Japão feudal', 280.00);

-- Inserir funcionários
INSERT INTO funcionario (nome, idade, sexo, cargo, salario, nascimento) VALUES
                                                                            ('Abi-Albom', 30, 'm', 'vendedor', 3000.00, '1993-01-01'),
                                                                            ('Roosevelt Junior', 40, 'f', 'gerente', 5000.00, '1983-01-01'),
                                                                            ('Paulo Sérgio', 35, 'm', 'supervisor', 3200.00, '1988-01-01'),
                                                                            ('Maria Oliveira', 45, 'f', 'diretor', 10000.00, '1978-01-01'),
                                                                            ('João Santos', 28, 'm', 'CEO', 15000.00, '1995-01-01');

-- Inserir clientes
INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES
                                                        ('Ana Silva', 'f', 28, '1996-03-14'),
                                                        ('Bruno Oliveira', 'm', 34, '1990-07-22'),
                                                        ('Carlos Souza', 'm', 45, '1979-01-10'),
                                                        ('Daniela Costa', 'f', 22, '2002-05-25'),
                                                        ('Eduardo Pereira', 'm', 31, '1993-12-03'),
                                                        ('Fernanda Lima', 'f', 29, '1995-09-18'),
                                                        ('Gabriel Martins', 'm', 27, '1997-11-05'),
                                                        ('Helena Rodrigues', 'f', 36, '1988-04-09'),
                                                        ('Igor Alves', 'm', 24, '2000-08-30'),
                                                        ('Juliana Ferreira', 'f', 33, '1991-02-17'),
                                                        ('Kleber Araújo', 'm', 39, '1985-06-12'),
                                                        ('Larissa Mendes', 'f', 26, '1998-07-07'),
                                                        ('Marcos Antunes', 'm', 42, '1982-03-19'),
                                                        ('Natália Barros', 'f', 23, '2001-10-14'),
                                                        ('Otávio Pinto', 'm', 37, '1987-11-21'),
                                                        ('Patrícia Moraes', 'f', 31, '1993-01-02'),
                                                        ('Quintino Santos', 'm', 40, '1984-12-15'),
                                                        ('Raquel Teixeira', 'f', 27, '1997-04-11'),
                                                        ('Sérgio Reis', 'm', 35, '1989-06-23'),
                                                        ('Tatiane Ribeiro', 'f', 32, '1992-05-06'),
                                                        ('Ubirajara Nunes', 'm', 50, '1974-08-19'),
                                                        ('Vanessa Cardoso', 'f', 28, '1996-09-26'),
                                                        ('Wagner Matos', 'm', 29, '1995-02-28'),
                                                        ('Ximena Dias', 'f', 33, '1991-12-11'),
                                                        ('Yuri Farias', 'm', 26, '1998-03-05'),
                                                        ('Zélia Vasconcelos', 'f', 40, '1984-10-08'),
                                                        ('Aline Borges', 'f', 30, '1994-07-15'),
                                                        ('Bernardo Cunha', 'm', 38, '1986-02-22'),
                                                        ('Cíntia Andrade', 'f', 24, '2000-01-20'),
                                                        ('Diogo Campos', 'm', 35, '1989-09-30'),
                                                        ('Eliane Lopes', 'f', 41, '1983-06-27'),
                                                        ('Felipe Monteiro', 'm', 33, '1991-04-16'),
                                                        ('Gustavo Assis', 'm', 27, '1997-05-04'),
                                                        ('Heloísa Rocha', 'f', 36, '1988-02-14'),
                                                        ('Ícaro Vasconcelos', 'm', 22, '2002-11-09'),
                                                        ('Joana Dantas', 'f', 29, '1995-03-18'),
                                                        ('Leandro Batista', 'm', 34, '1990-12-06'),
                                                        ('Maria Eduarda Coelho', 'f', 25, '1999-08-21'),
                                                        ('Nicolas Sousa', 'm', 32, '1992-09-14'),
                                                        ('Olívia Fonseca', 'f', 30, '1994-10-19'),
                                                        ('Paulo Viana', 'm', 37, '1987-05-11'),
                                                        ('Quésia Freitas', 'f', 28, '1996-07-30'),
                                                        ('Renato Guerra', 'm', 31, '1993-11-25'),
                                                        ('Sandra Pires', 'f', 27, '1997-12-16'),
                                                        ('Thiago Marques', 'm', 33, '1991-06-08'),
                                                        ('Úrsula Guimarães', 'f', 38, '1986-01-13'),
                                                        ('Vinícius Rocha', 'm', 24, '2000-05-27'),
                                                        ('William Tavares', 'm', 40, '1984-04-22'),
                                                        ('Yasmin Figueiredo', 'f', 23, '2001-07-09'),
                                                        ('Zeca Andrade', 'm', 45, '1979-02-15'),
                                                        ('Alice Oliveira', 'f', 26, '1998-11-02'),
                                                        ('Bruno Machado', 'm', 30, '1994-01-28'),
                                                        ('Catarina Neves', 'f', 29, '1995-06-03'),
                                                        ('Diego Ferreira', 'm', 36, '1988-08-15'),
                                                        ('Estela Barbosa', 'f', 31, '1993-10-04'),
                                                        ('Fábio Menezes', 'm', 32, '1992-02-29'),
                                                        ('Gabriela Silva', 'f', 27, '1997-01-09'),
                                                        ('Heitor Lima', 'm', 39, '1985-12-17'),
                                                        ('Isabela Pinto', 'f', 24, '2000-04-05'),
                                                        ('Jorge Nascimento', 'm', 28, '1996-09-22'),
                                                        ('Kelly Souza', 'f', 35, '1989-03-30'),
                                                        ('Lucas Almeida', 'm', 30, '1994-12-25'),
                                                        ('Mariana Dias', 'f', 25, '1999-06-12'),
                                                        ('Natan Costa', 'm', 34, '1990-08-19'),
                                                        ('Olga Ramos', 'f', 28, '1996-05-10'),
                                                        ('Pedro Henrique Carvalho', 'm', 33, '1991-07-01'),
                                                        ('Quirino Lemos', 'm', 40, '1984-11-24'),
                                                        ('Rafaela Cruz', 'f', 27, '1997-02-11'),
                                                        ('Samuel Santos', 'm', 31, '1993-10-29'),
                                                        ('Tamara Azevedo', 'f', 22, '2002-12-08'),
                                                        ('Ulisses Gomes', 'm', 29, '1995-01-05'),
                                                        ('Verônica Martins', 'f', 30, '1994-11-16'),
                                                        ('Wesley Moreira', 'm', 32, '1992-06-18'),
                                                        ('Xavier Castro', 'm', 38, '1986-04-27'),
                                                        ('Yara Mendes', 'f', 26, '1998-08-03'),
                                                        ('Zélio Oliveira', 'm', 45, '1979-05-09'),
                                                        ('Amélia Campos', 'f', 33, '1991-11-12'),
                                                        ('Breno Gomes', 'm', 39, '1985-08-25'),
                                                        ('Clarice Ferreira', 'f', 29, '1995-07-06'),
                                                        ('Danilo Vieira', 'm', 31, '1993-09-03'),
                                                        ('Elisa Araújo', 'f', 26, '1998-04-13'),
                                                        ('Felipe Borges', 'm', 27, '1997-06-21'),
                                                        ('Gabrielle Santos', 'f', 35, '1989-12-20'),
                                                        ('Henrique Barros', 'm', 40, '1984-03-29'),
                                                        ('Ivone Batista', 'f', 30, '1994-02-08'),
                                                        ('José Matos', 'm', 32, '1992-01-26'),
                                                        ('Karla Fernandes', 'f', 28, '1996-10-23'),
                                                        ('Luan Souza', 'm', 34, '1990-05-17'),
                                                        ('Márcia Cardoso', 'f', 36, '1988-11-08'),
                                                        ('Nelson Rocha', 'm', 29, '1995-02-24'),
                                                        ('Otávia Gomes', 'f', 25, '1999-03-31'),
                                                        ('Paula Rodrigues', 'f', 28, '1996-07-20'),
                                                        ('Ricardo Sampaio', 'm', 37, '1987-11-30'),
                                                        ('Sabrina Lemos', 'f', 30, '1994-09-26'),
                                                        ('Tiago Oliveira', 'm', 32, '1992-06-04'),
                                                        ('Úrsula Cunha', 'f', 29, '1995-12-22'),
                                                        ('Vitor Menezes', 'm', 26, '1998-01-18');

-- Triggers
DELIMITER //
CREATE TRIGGER atualiza_funcionario_especial
    AFTER INSERT ON venda
    FOR EACH ROW
BEGIN
    DECLARE total_vendas DECIMAL(10, 2);
    DECLARE bonus DECIMAL(10, 2);

    SELECT SUM(p.valor * v.quantidade) INTO total_vendas
    FROM venda v
             JOIN produto p ON v.id_produto = p.id
    WHERE v.id_vendedor = NEW.id_vendedor;

    IF total_vendas > 1000.00 THEN
        SET bonus = total_vendas * 0.05;
        INSERT INTO funcionarioespecial (id_funcionario, bonus) VALUES (NEW.id_vendedor, bonus);
        SELECT CONCAT('Bônus total necessário: ', SUM(bonus)) INTO @message
        FROM funcionarioespecial;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER atualiza_cliente_especial
    AFTER INSERT ON venda
    FOR EACH ROW
BEGIN
    DECLARE total_compras DECIMAL(10, 2);
    DECLARE cashback DECIMAL(10, 2);

    SELECT SUM(p.valor * v.quantidade) INTO total_compras
    FROM venda v
             JOIN produto p ON v.id_produto = p.id
    WHERE v.id_cliente = NEW.id_cliente;

    IF total_compras > 500.00 THEN
        SET cashback = total_compras * 0.02;
        INSERT INTO clienteespecial (id_cliente, cashback) VALUES (NEW.id_cliente, cashback);
        SELECT CONCAT('Valor total de cashback necessário: ', SUM(cashback)) INTO @message
        FROM clienteespecial;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END;
//
DELIMITER //

DELIMITER //
CREATE TRIGGER remove_cliente_especial
    AFTER UPDATE ON clienteespecial
    FOR EACH ROW
BEGIN
    IF NEW.cashback = 0 THEN
        DELETE FROM clienteespecial WHERE id = NEW.id;
    END IF;
END;
//
DELIMITER //

-- Usuários
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpassword';
GRANT ALL PRIVILEGES ON UniGamesDB.* TO 'admin'@'localhost';

CREATE USER 'manager'@'localhost' IDENTIFIED BY 'managerpassword';
GRANT SELECT, DELETE, UPDATE ON UniGamesDB.* TO 'manager'@'localhost';

CREATE USER 'employee'@'localhost' IDENTIFIED BY 'employeepassword';
GRANT INSERT, SELECT ON UniGamesDB.* TO 'employee'@'localhost';

-- Views
CREATE VIEW produtos_mais_vendidos AS
SELECT p.nome, COUNT(v.id) AS total_vendas
FROM produto p
         JOIN venda v ON p.id = v.id_produto
GROUP BY p.nome
ORDER BY total_vendas DESC;

CREATE VIEW valor_ganho_produtos AS
SELECT p.nome, SUM(p.valor * v.quantidade) AS total_valor
FROM produto p
         JOIN venda v ON p.id = v.id_produto
GROUP BY p.nome;

CREATE VIEW clientes_ativos AS
SELECT c.id, c.nome, COUNT(v.id) AS total_compras
FROM cliente c
         JOIN venda v ON c.id = v.id_cliente
WHERE v.data >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY c.id
ORDER BY total_compras DESC;

-- Procedimentos
DELIMITER //
CREATE PROCEDURE realizar_venda(IN id_vendedor INT, IN id_cliente INT, IN id_produto INT, IN quantidade INT)
BEGIN
    DECLARE produto_quantidade INT;

    SELECT quantidade INTO produto_quantidade FROM produto WHERE id = id_produto;

    IF produto_quantidade >= quantidade THEN
        INSERT INTO venda (id_vendedor, id_cliente, id_produto, quantidade, data) VALUES (id_vendedor, id_cliente, id_produto, quantidade, CURDATE());
        UPDATE produto SET quantidade = quantidade - quantidade WHERE id = id_produto;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantidade insuficiente no estoque';
    END IF;
END //
DELIMITER //

DELIMITER //
CREATE PROCEDURE reajuste_salarial(IN percentual DECIMAL(5,2), IN categoria ENUM('vendedor', 'gerente', 'supervisor', 'diretor', 'CEO'))
BEGIN
    UPDATE funcionario
    SET salario = salario + (salario * (percentual / 100))
    WHERE cargo = categoria;
END //
DELIMITER //

DELIMITER //
CREATE PROCEDURE sorteio_premiacao()
BEGIN
    DECLARE cliente_id INT;
    DECLARE is_special BOOLEAN;
    DECLARE premio DECIMAL(10, 2);

    SET cliente_id = (SELECT id FROM cliente ORDER BY RAND() LIMIT 1);
    SET is_special = (SELECT COUNT(*) FROM clienteespecial WHERE id_cliente = cliente_id) > 0;

    IF is_special THEN
        SET premio = 200.00;
    ELSE
        SET premio = 100.00;
    END IF;

    INSERT INTO premios (id_cliente, valor) VALUES (cliente_id, premio);
END //
DELIMITER //

DELIMITER //
CREATE PROCEDURE estatisticas()
BEGIN
    -- Produto mais vendido
    SELECT p.nome AS 'Produto mais vendido'
    FROM produto p
             JOIN (
        SELECT id_produto, SUM(quantidade) AS total_vendido
        FROM venda
        GROUP BY id_produto
        ORDER BY total_vendido DESC
        LIMIT 1
    ) AS mais_vendido ON p.id = mais_vendido.id_produto;

    -- Vendedor associado ao produto mais vendido
    SELECT f.nome AS 'Vendedor associado ao produto mais vendido'
    FROM funcionario f
             JOIN (
        SELECT v.id_vendedor
        FROM venda v
                 JOIN (
            SELECT id_produto, SUM(quantidade) AS total_vendido
            FROM venda
            GROUP BY id_produto
            ORDER BY total_vendido DESC
            LIMIT 1
        ) AS mais_vendido ON v.id_produto = mais_vendido.id_produto
        GROUP BY v.id_vendedor
        ORDER BY SUM(v.quantidade) DESC
        LIMIT 1
    ) AS vendedor_mais_vendido ON f.id = vendedor_mais_vendido.id_vendedor;

    -- Produto menos vendido
    SELECT p.nome AS 'Produto menos vendido'
    FROM produto p
             JOIN (
        SELECT id_produto, SUM(quantidade) AS total_vendido
        FROM venda
        GROUP BY id_produto
        ORDER BY total_vendido ASC
        LIMIT 1
    ) AS menos_vendido ON p.id = menos_vendido.id_produto;

    -- Valor ganho com o produto mais vendido
    SELECT (mais_vendido.total_vendido * p.valor) AS 'Valor ganho com o produto mais vendido'
    FROM (
             SELECT id_produto, SUM(quantidade) AS total_vendido
             FROM venda
             GROUP BY id_produto
             ORDER BY total_vendido DESC
             LIMIT 1
         ) AS mais_vendido
             JOIN produto p ON mais_vendido.id_produto = p.id;

    -- Mês de maior vendas e mês de menor vendas do produto mais vendido
    SELECT YEAR(v.data) AS ano, MONTH(v.data) AS mes, SUM(v.quantidade) AS total_vendido
    FROM venda v
    WHERE v.id_produto = (
        SELECT id_produto
        FROM (
                 SELECT id_produto, SUM(quantidade) AS total_vendido
                 FROM venda
                 GROUP BY id_produto
                 ORDER BY total_vendido DESC
                 LIMIT 1
             ) AS mais_vendido
    )
    GROUP BY YEAR(v.data), MONTH(v.data)
    ORDER BY total_vendido DESC
    LIMIT 1;

    SELECT YEAR(v.data) AS ano, MONTH(v.data) AS mes, SUM(v.quantidade) AS total_vendido
    FROM venda v
    WHERE v.id_produto = (
        SELECT id_produto
        FROM (
                 SELECT id_produto, SUM(quantidade) AS total_vendido
                 FROM venda
                 GROUP BY id_produto
                 ORDER BY total_vendido DESC
                 LIMIT 1
             ) AS mais_vendido
    )
    GROUP BY YEAR(v.data), MONTH(v.data)
    ORDER BY total_vendido ASC
    LIMIT 1;

    -- Valor ganho com o produto menos vendido
    SELECT (menos_vendido.total_vendido * p.valor) AS 'Valor ganho com o produto menos vendido'
    FROM (
             SELECT id_produto, SUM(quantidade) AS total_vendido
             FROM venda
             GROUP BY id_produto
             ORDER BY total_vendido ASC
             LIMIT 1
         ) AS menos_vendido
             JOIN produto p ON menos_vendido.id_produto = p.id;

    -- Mês de maior vendas e mês de menor vendas do produto menos vendido
    SELECT YEAR(v.data) AS ano, MONTH(v.data) AS mes, SUM(v.quantidade) AS total_vendido
    FROM venda v
    WHERE v.id_produto = (
        SELECT id_produto
        FROM (
                 SELECT id_produto, SUM(quantidade) AS total_vendido
                 FROM venda
                 GROUP BY id_produto
                 ORDER BY total_vendido ASC
                 LIMIT 1
             ) AS menos_vendido
    )
    GROUP BY YEAR(v.data), MONTH(v.data)
    ORDER BY total_vendido DESC
    LIMIT 1;

    SELECT YEAR(v.data) AS ano, MONTH(v.data) AS mes, SUM(v.quantidade) AS total_vendido
    FROM venda v
    WHERE v.id_produto = (
        SELECT id_produto
        FROM (
                 SELECT id_produto, SUM(quantidade) AS total_vendido
                 FROM venda
                 GROUP BY id_produto
                 ORDER BY total_vendido ASC
                 LIMIT 1
             ) AS menos_vendido
    )
    GROUP BY YEAR(v.data), MONTH(v.data)
    ORDER BY total_vendido ASC
    LIMIT 1;

END //
DELIMITER //