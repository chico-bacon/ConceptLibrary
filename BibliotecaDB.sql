DROP TABLE leitores CASCADE;

--Criando Tabelas da Base da Biblioteca
CREATE TABLE generos (
id SERIAL PRIMARY KEY,
nome VARCHAR(100)
);

CREATE TABLE autores (
id SERIAL PRIMARY KEY,
nome VARCHAR(100)
);

CREATE TABLE editoras (
id SERIAL PRIMARY KEY,
nome VARCHAR(100)
);

CREATE TABLE idiomas (
id SERIAL PRIMARY KEY,
nome VARCHAR(45)
);

CREATE TABLE livros (
id SERIAL PRIMARY KEY,
titulo VARCHAR(100),
id_genero INTEGER REFERENCES generos(id),
id_editora INTEGER REFERENCES editoras(id),
data_lancamento DATE,
paginas INTEGER
);

CREATE TABLE livros_tem_autores(
id SERIAL PRIMARY KEY,
id_livro INTEGER REFERENCES livros(id),
id_autor INTEGER REFERENCES autores(id) 
);

CREATE TABLE livros_tem_idiomas(
id SERIAL PRIMARY KEY,
id_livro INTEGER REFERENCES livros(id),
id_idioma INTEGER REFERENCES idiomas(id) 
);

CREATE TABLE leitores (
id SERIAL PRIMARY KEY,
nome VARCHAR(100),
num_documento VARCHAR(11),
email VARCHAR(100),
telefone VARCHAR(11),
senha VARCHAR(100)
);

CREATE TABLE leituras (
id SERIAL PRIMARY KEY,
id_leitores INTEGER REFERENCES leitores (id),
id_livro INTEGER REFERENCES livros (id),
data_inicio DATE,
data_termino DATE,
status CHAR(1)
);

CREATE TABLE leitores_amam_generos (
id SERIAL PRIMARY KEY, 
id_leitores INTEGER REFERENCES leitores (id),
id_genero INTEGER REFERENCES generos (id)
);

CREATE TABLE leitores_tem_leituras (
id SERIAL PRIMARY KEY,
id_leitores INTEGER REFERENCES leitores (id),
id_leitura INTEGER REFERENCES leituras (id)
);

--Criando Procedures
CREATE PROCEDURE inserir_editora(nome VARCHAR(60))
LANGUAGE plpgsql
BEGIN ATOMIC
	INSERT INTO editoras VALUES (nome)
END;


CREATE PROCEDURE inserir_idioma(nome VARCHAR(60))
BEGIN
	INSERT INTO idiomas (nome) VALUES (nome);
END

CREATE PROCEDURE inserir_genero(nome VARCHAR(60))
BEGIN
	INSERT INTO generos (nome) VALUES (nome);
END

CREATE PROCEDURE inserir_autor(nome VARCHAR(100))
BEGIN
	INSERT INTO autores (nome) VALUES (nome);
END

CREATE PROCEDURE inserir_leitor(nome VARCHAR(100), num_documento VARCHAR(11), email VARCHAR(100), telefone(11), senha VARCHAR(100))
BEGIN
	INSERT INTO leitores (nome, num_documento, email, telefone, senha) VALUES (nome, num_documento, email, telefone, senha);
END

CREATE PROCEDURE inserir_livro(titulo VARCHAR(100), id_genero INTEGER, id_editora INTEGER, data_lancamento DATE, paginas INTEGER)
BEGIN
	INSERT INTO livros (titulo, id_genero, id_editora, data_lancamento, paginas) VALUES (titulo, id_genero, id_editora, data_lancamento, paginas);
END


