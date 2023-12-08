CREATE TABLE Autor (
    id_autor SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    nacionalidade VARCHAR(50)
);

CREATE TABLE Editora (
    id_editora SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Livro (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(200),
    id_autor INT REFERENCES Autor(id_autor),
    id_editora INT REFERENCES Editora(id_editora),
    ano_publicacao INT
);

CREATE TABLE Emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    id_livro INT REFERENCES Livro(id_livro),
    id_usuario INT REFERENCES Usuario(id_usuario),
    data_emprestimo DATE
);

CREATE TABLE Avaliacao (
    id_avaliacao SERIAL PRIMARY KEY,
    id_livro INT REFERENCES Livro(id_livro),
    id_usuario INT REFERENCES Usuario(id_usuario),
    nota INT
);

CREATE TABLE Devolucao (
    id_devolucao SERIAL PRIMARY KEY,
    id_emprestimo INT REFERENCES Emprestimo(id_emprestimo),
    data_devolucao DATE
);

CREATE TABLE Reserva (
    id_reserva SERIAL PRIMARY KEY,
    id_livro INT REFERENCES Livro(id_livro),
    id_usuario INT REFERENCES Usuario(id_usuario),
    data_reserva DATE
);

CREATE TABLE Categoria (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE Funcionario (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50)
);

CREATE TABLE Biblioteca (
    id_biblioteca SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200),
    id_funcionario_responsavel INT REFERENCES Funcionario(id_funcionario)
);

-- Povoamento de Tabelas (exemplo com algumas tuplas)

INSERT INTO Autor (nome, nacionalidade) VALUES
('Autor 1', 'Nacionalidade 1'),
('Autor 2', 'Nacionalidade 2');

INSERT INTO Editora (nome, cidade) VALUES
('Editora 1', 'Cidade 1'),
('Editora 2', 'Cidade 2');

-- (Preencher as demais tabelas de maneira semelhante)

-- Consultas (exemplo de algumas consultas)

-- Consulta com Junção
SELECT Livro.titulo, Autor.nome AS autor
FROM Livro
INNER JOIN Autor ON Livro.id_autor = Autor.id_autor;

-- Consulta usando LIKE
SELECT nome, email
FROM Usuario
WHERE email LIKE '%@dominio.com%';

-- Consulta com Ordenação
SELECT titulo, ano_publicacao
FROM Livro
ORDER BY ano_publicacao DESC;

-- Consulta com Funções Agregadas
SELECT id_usuario, COUNT(id_emprestimo) AS total_emprestimos
FROM Emprestimo
GROUP BY id_usuario;

-- Criação de Visões

CREATE VIEW LivrosAvaliados AS
SELECT Livro.titulo, Avaliacao.nota
FROM Livro
INNER JOIN Avaliacao ON Livro.id_livro = Avaliacao.id_livro;

CREATE VIEW TotalEmprestimosUsuario AS
SELECT id_usuario, COUNT(id_emprestimo) AS total_emprestimos
FROM Emprestimo
GROUP BY id_usuario;