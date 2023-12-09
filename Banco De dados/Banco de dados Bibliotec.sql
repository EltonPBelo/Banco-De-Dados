
CREATE TABLE Autor (
    id_autor SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(11),
	email VARCHAR(255),
	cnpj VARCHAR(14)
);


CREATE TABLE Editora (
    id_editora SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    localizacao VARCHAR(255),
	ano_publicacao VARCHAR(4),
	email VARCHAR(255),
	telefone VARCHAR(11),
	site VARCHAR(255)
);

CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(255),
    telefone VARCHAR(11)
);

CREATE TABLE Livro (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(200),
	genero VARCHAR(50),
	preco NUMERIC(5,2),
	idioma VARCHAR(50),
	num_pagina INT,
	isbn VARCHAR(13),
	edicao_livro INT,
    id_autor INT REFERENCES Autor(id_autor),
    id_editora INT REFERENCES Editora(id_editora),
    ano_publicacao INT
	
);

CREATE TABLE Emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    id_livro INT REFERENCES Livro(id_livro),
    id_usuario INT REFERENCES Usuario(id_usuario),
    data_emprestimo DATE NOT NULL DEFAULT CURRENT_DATE
	
);

CREATE TABLE Avaliacao (
	id_avaliacao SERIAL PRIMARY KEY,
	nota INT,
	nome_usuario VARCHAR(50),
	email VARCHAR(255),
    id_livro INT REFERENCES Livro(id_livro),
    id_usuario INT REFERENCES Usuario(id_usuario)
    
);

CREATE TABLE Devolucao (
    id_devolucao SERIAL PRIMARY KEY,
    id_emprestimo INT REFERENCES Emprestimo(id_emprestimo),
    data_devolucao DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE Reserva (
    id_reserva SERIAL PRIMARY KEY,
    id_livro INT REFERENCES Livro(id_livro),
    id_usuario INT REFERENCES Usuario(id_usuario),
    data_reserva DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE Funcionario (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
	salario NUMERIC(5,2)
);

CREATE TABLE Biblioteca (
    id_biblioteca SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200),
	telefone VARCHAR(11),
	email VARCHAR(255),
	site VARCHAR(255),
    id_funcionario_responsavel INT REFERENCES Funcionario(id_funcionario)
);

-- Inserindo dados na tabela Autor
INSERT INTO Autor (nome, telefone, email, cnpj) VALUES
    ('João Silva', '12345678901', 'joao.silva@email.com', '12345678901234'),
    ('Maria Santos', '98765432101', 'maria.santos@email.com', '98765432109876');

-- Inserindo dados na tabela Editora
INSERT INTO Editora (nome, localizacao, ano_publicacao, email, telefone, site) VALUES
    ('Editora A', 'Cidade A', '2000', 'contato@editoraA.com', '11111111111', 'www.editoraA.com'),
    ('Editora B', 'Cidade B', '2010', 'contato@editoraB.com', '22222222222', 'www.editoraB.com');

-- Inserindo dados na tabela Usuario
INSERT INTO Usuario (nome, email, telefone) VALUES
    ('Carlos Oliveira', 'carlos@email.com', '33333333333'),
    ('Ana Souza', 'ana@email.com', '44444444444');

-- Inserindo dados na tabela Livro
INSERT INTO Livro (titulo, genero, preco, idioma, num_pagina, isbn, edicao_livro, id_autor, id_editora, ano_publicacao) VALUES
    ('Livro 1', 'Ficção', 30.50, 'Português', 200, '1234567890123', 1, 1, 2005),
    ('Livro 2', 'Não Ficção', 25.75, 'Inglês', 150, '9876543210987', 2, 2, 2012);

-- Inserindo dados na tabela Emprestimo
INSERT INTO Emprestimo (id_livro, id_usuario, data_emprestimo) VALUES
    (1, 1, '2023-01-01'),
    (2, 2, '2023-02-01');

-- Inserindo dados na tabela Avaliacao
INSERT INTO Avaliacao (nota, nome_usuario, email, id_livro, id_usuario) VALUES
    (4, 'Carlos Oliveira', 'carlos@email.com', 1, 1),
    (5, 'Ana Souza', 'ana@email.com', 2, 2);

-- Inserindo dados na tabela Devolucao
INSERT INTO Devolucao (id_emprestimo, data_devolucao) VALUES
    (1, '2023-02-15'),
    (2, '2023-03-01');

-- Inserindo dados na tabela Reserva
INSERT INTO Reserva (id_livro, id_usuario, data_reserva) VALUES
    (2, 1, '2023-02-20'),
    (1, 2, '2023-03-05');

-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (nome, cargo, salario) VALUES
    ('Fernanda Lima', 'Bibliotecário', 4000.00),
    ('Ricardo Santos', 'Atendente', 2500.00);

-- Inserindo dados na tabela Biblioteca
INSERT INTO Biblioteca (nome, endereco, telefone, email, site, id_funcionario_responsavel) VALUES
    ('Biblioteca Central', 'Rua Principal, 123', '55555555555', 'contato@biblioteca.com', 'www.biblioteca.com', 1);





































