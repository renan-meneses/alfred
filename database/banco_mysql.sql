-- Cria o banco de dados
CREATE DATABASE Finance;

-- Conecta ao banco de dados
\c Finance;

-- Criar a extensão para suportar UUIDs, se ainda não estiver ativada
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Criar a tabela user
CREATE TABLE "user" (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    birthday DATE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar a tabela Ticket
CREATE TABLE Ticket (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    value DECIMAL(10, 2) NOT NULL,
    maturity DATE,
    issuer VARCHAR(50),
    user_id UUID REFERENCES "user"(id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar a tabela Payment
CREATE TABLE Payment (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    value DECIMAL(10, 2) NOT NULL,
    pay_date DATE,
    ticket_id UUID REFERENCES Ticket(id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar a tabela Bank
CREATE TABLE Bank (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    account VARCHAR(20) NOT NULL,
    digit CHAR(1) NOT NULL,
    type VARCHAR(20) CHECK (type IN ('savings', 'checking')) NOT NULL,
    sender VARCHAR(50),
    user_id UUID REFERENCES "user"(id),
    balance DECIMAL(10, 2) NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
