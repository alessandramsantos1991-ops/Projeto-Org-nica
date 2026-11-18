CREATE DATABASE  banco_organica

USE banco_organica;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria ENUM('Frutas', 'Verduras', 'Legumes') NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    imagem VARCHAR(255) DEFAULT '',
    ativo TINYINT(1) DEFAULT 1
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    tamanho_cesta VARCHAR(20) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) DEFAULT 'Recebido',
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE pedido_itens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE mensagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL,
    mensagem TEXT NOT NULL,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO produtos (nome, categoria, preco, imagem) VALUES
('Maçã', 'Frutas', 4.50, ''),
('Banana', 'Frutas', 3.50, ''),
('Laranja', 'Frutas', 3.00, ''),
('Mamão', 'Frutas', 5.50, ''),
('Alface', 'Verduras', 3.00, ''),
('Couve', 'Verduras', 3.50, ''),
('Espinafre', 'Verduras', 4.00, ''),
('Coentro', 'Verduras', 2.50, ''),
('Cenoura', 'Legumes', 4.00, ''),
('Batata', 'Legumes', 5.00, ''),
('Tomate', 'Legumes', 6.00, ''),
('Abobrinha', 'Legumes', 4.50, '');
