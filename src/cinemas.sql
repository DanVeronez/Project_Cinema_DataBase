CREATE TABLE EMPRESAS(
    nome varchar(50) not null,
    id integer not null PRIMARY KEY
);

CREATE TABLE CINEMAS (
    id integer not null primary key,
    fk_empresa integer not null,
    nome varchar2(50) not null, 
    endereco varchar2(50) not null,
    municipio varchar2(50) not null,
    estado varchar2(50) not null,
    capacidade integer not null,
    CONSTRAINT fk_empresa FOREIGN KEY (fk_empresa) REFERENCES EMPRESAS(id)
);

CREATE TABLE FILMES (
    id integer not null primary key,
    tituloOriginal varchar2(50) not null,
    tituloTraduzido varchar2(50),
    duracao integer not null, -- min
    classificacao integer not null,
    país varchar2(50) not null,
    fk_diretor integer not null,
    CONSTRAINT fk_diretor FOREIGN KEY (fk_diretor) REFERENCES ATORES(id)
);

CREATE TABLE ATORES(
    id integer not null primary key, 
    nome varchar2(50) not null,
    nacionalidade varchar2(50) not null,
    idade integer not null
);

CREATE TABLE ATOR_FILME (
    fk_filme integer not null, 
    fk_ator integer not null,
    CONSTRAINT fk_filme FOREIGN KEY (fk_filme) REFERENCES FILMES(id),
    CONSTRAINT fk_ator FOREIGN KEY (fk_ator) REFERENCES ATORES(id)
);

CREATE TABLE GENERO_FILME (
    fk_filme integer not null, 
    fk_genero integer not null,
    CONSTRAINT fk_filme FOREIGN KEY (fk_filme) REFERENCES FILMES(id),
    CONSTRAINT fk_genero FOREIGN KEY (fk_genero) REFERENCES GENERO(id)
);

CREATE TABLE SESSOES(
    horario TIMESTAMP not null,
    sala varchar2(1) not null PRIMARY KEY,
    fk_filme integer not null,
    CONSTRAINT fk_filme FOREIGN KEY (fk_filme) REFERENCES FILMES(id)
);

CREATE TABLE GENERO(
    id integer not null primary key,
    tipo varchar2(50) not null
);