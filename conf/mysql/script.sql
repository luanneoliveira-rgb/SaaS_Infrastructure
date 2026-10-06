-- Innovation Lab - SaaS Infrastructure (MySQL)
SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS saas_infrastructure
    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'saas'@'localhost' IDENTIFIED BY 'saas';
GRANT ALL PRIVILEGES ON saas_infrastructure.* TO 'saas'@'localhost';
FLUSH PRIVILEGES;

USE saas_infrastructure;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(50) NOT NULL,
    descricao    VARCHAR(150)
);

CREATE TABLE produtos (
    id_produto   INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(100)  NOT NULL,
    id_categoria INT           NOT NULL,
    preco_custo  DECIMAL(10,2) NOT NULL,
    preco_venda  DECIMAL(10,2) NOT NULL,
    descricao    VARCHAR(255),
    ativo        BOOLEAN       NOT NULL DEFAULT TRUE,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE tamanhos (
    id_tamanho INT AUTO_INCREMENT PRIMARY KEY,
    nome       VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE cores (
    id_cor INT AUTO_INCREMENT PRIMARY KEY,
    nome   VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_tamanho INT NOT NULL,
    id_cor     INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    UNIQUE (id_produto, id_tamanho, id_cor),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_tamanho) REFERENCES tamanhos(id_tamanho),
    FOREIGN KEY (id_cor)     REFERENCES cores(id_cor)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome       VARCHAR(100) NOT NULL,
    cpf        VARCHAR(14)  NOT NULL UNIQUE,
    telefone   VARCHAR(20),
    email      VARCHAR(150)
);

CREATE TABLE vendas (
    id_venda        INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente      INT           NOT NULL,
    data_venda      DATE          NOT NULL,
    valor_total     DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(30)   NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_venda (
    id_item        INT AUTO_INCREMENT PRIMARY KEY,
    id_venda       INT           NOT NULL,
    id_produto     INT           NOT NULL,
    id_tamanho     INT           NOT NULL,
    id_cor         INT           NOT NULL,
    quantidade     INT           NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal       DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda)   REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_tamanho) REFERENCES tamanhos(id_tamanho),
    FOREIGN KEY (id_cor)     REFERENCES cores(id_cor)
);

INSERT INTO categorias (nome, descricao) VALUES
    ('Conjunto', 'Conjuntos femininos'),
    ('Vestido', 'Vestidos femininos'),
    ('Calça', 'Calças femininas'),
    ('Tênis', 'Tênis'),
    ('Sapatilha', 'Sapatilhas');

INSERT INTO produtos (nome, id_categoria, preco_custo, preco_venda, descricao, ativo) VALUES
    ('Conjunto Alfaiataria', 1,  80.00, 159.90, 'Conjunto de alfaiataria', TRUE),
    ('Vestido Floral',       2,  60.00, 129.90, 'Vestido floral',          TRUE),
    ('Calça Wide Leg',       3,  55.00, 119.90, 'Calça wide leg',          TRUE),
    ('Tênis Casual',         4, 100.00, 199.90, 'Tênis casual',            TRUE),
    ('Sapatilha Bico Fino',  5,  40.00,  89.90, 'Sapatilha bico fino',     TRUE);

INSERT INTO tamanhos (nome) VALUES
    ('PP'), ('P'), ('M'), ('G'), ('GG'),
    ('34'), ('35'), ('36'), ('37'), ('38'), ('39'), ('40');

INSERT INTO cores (nome) VALUES
    ('Preto'), ('Branco'), ('Vermelho'), ('Azul'), ('Rosa'), ('Bege');

INSERT INTO estoque (id_produto, id_tamanho, id_cor, quantidade) VALUES
    (1, 3, 6, 10),
    (2, 3, 3,  8),
    (3, 8, 1, 15),
    (4, 9, 2,  6),
    (5, 8, 1, 12);

INSERT INTO clientes (nome, cpf, telefone, email) VALUES
    ('Maria Silva', '000.000.000-00', '(11) 98888-8888', 'maria@email.com');

INSERT INTO vendas (id_cliente, data_venda, valor_total, forma_pagamento) VALUES
    (1, '2026-09-28', 259.80, 'PIX');

INSERT INTO itens_venda (id_venda, id_produto, id_tamanho, id_cor, quantidade, preco_unitario, subtotal) VALUES
    (1, 2, 3, 3, 2, 129.90, 259.80);
