-- Cria o banco de dados
CREATE DATABASE Finance;

-- Seleciona o banco de dados
USE Finance;

-- Criar a tabela User
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    birthday DATE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Criar a tabela Ticket
CREATE TABLE Ticket (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value DECIMAL(10, 2) NOT NULL,
    maturity DATE,
    issuer VARCHAR(50),
    user_id INT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id)
);

-- Criar a tabela Payment
CREATE TABLE Payment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value DECIMAL(10, 2) NOT NULL,
    pay_date DATE,
    ticket_id INT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ticket_id) REFERENCES Ticket(id)
);


-- Criar a tabela Bank
CREATE TABLE Bank (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account VARCHAR(20) NOT NULL,
    digit CHAR(1) NOT NULL,
    type ENUM('savings', 'checking') NOT NULL,
    sender VARCHAR(50),
    user_id INT,
    balance DECIMAL(10, 2) NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id)
);
