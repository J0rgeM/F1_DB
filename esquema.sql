CREATE TYPE TIPOEQUIPA AS ENUM ('Principal', 'Satelite');

CREATE TABLE Equipa(
    nome          VARCHAR(50),
    morada        VARCHAR(50),
    contacto      INTEGER,
    tipo          TIPOEQUIPA,
    PRIMARY KEY (nome)
);

CREATE TABLE Marca(
    nome          VARCHAR(50),
    paisOrigem    VARCHAR(25),
    morada        VARCHAR(50),
    contacto      INTEGER,
    PRIMARY KEY (nome)
);

CREATE TABLE Construtor(
    nome          VARCHAR(50),
    PRIMARY KEY (nome),
    FOREIGN KEY (nome) REFERENCES Marca(nome)
);

CREATE TABLE Patrocinador(
    nome           VARCHAR(50),
    PRIMARY KEY (nome),
    FOREIGN KEY (nome) REFERENCES Marca(nome)
);

CREATE TYPE TPILOTO AS ENUM ('Principal', 'Reserva');

CREATE TABLE Piloto(
    nPiloto        INTEGER,
    nome           VARCHAR(50),
    dataNasc       DATE,
    contacto       INTEGER,
    morada         VARCHAR(50),
    tipo           TPILOTO,
    PRIMARY KEY (nPiloto)
);

CREATE TABLE Campeonato(
    temporada      INTEGER,
    dataInicio     DATE,
    dataFim        DATE,
    PRIMARY KEY (temporada)
);

CREATE TABLE OrigemCircuito(
    nome           VARCHAR(50),
    pais           VARCHAR(50),
    PRIMARY KEY (nome)
);

CREATE TABLE Circuito(
    nomeCircuito        VARCHAR(50),
    dataCircuito        DATE,
    horario             TIME,
    temporadaCampeonato INTEGER,
    PRIMARY KEY (nomeCircuito,dataCircuito,temporadaCampeonato),
    FOREIGN KEY (temporadaCampeonato) REFERENCES Campeonato(temporada),
    FOREIGN KEY (nomeCircuito) REFERENCES OrigemCircuito(nome)
);

CREATE TABLE EquipaTem(
    nomeEquipa      VARCHAR(50),
    nPiloto         INTEGER,
    PRIMARY KEY (nomeEquipa,nPiloto),
    FOREIGN KEY (nomeEquipa) REFERENCES Equipa(nome),
    FOREIGN KEY (nPiloto) REFERENCES Piloto(nPiloto)
);

CREATE TABLE EquipaParticipa(
    nomeEquipa          VARCHAR(50),
    temporadaCampeonato INTEGER,
    PRIMARY KEY (nomeEquipa,temporadaCampeonato),
    FOREIGN KEY (nomeEquipa) REFERENCES Equipa(nome),
    FOREIGN KEY (temporadaCampeonato) REFERENCES Campeonato(temporada)
);

CREATE TABLE ConstrutorPossui(
    nomeConstrutor   VARCHAR(50),
    nomeEquipa       VARCHAR(50),
    PRIMARY KEY (nomeConstrutor,nomeEquipa),
    FOREIGN KEY (nomeConstrutor) REFERENCES Construtor(nome),
    FOREIGN KEY (nomeEquipa) REFERENCES Equipa(nome)
);

CREATE TABLE PatrocinadorPatrocina(
    nomePatrocinador    VARCHAR(50),
    nomeEquipa          VARCHAR(50),
    PRIMARY KEY (nomePatrocinador,nomeEquipa),
    FOREIGN KEY (nomePatrocinador) REFERENCES Patrocinador(nome),
    FOREIGN KEY (nomeEquipa) REFERENCES Equipa(nome)
);

CREATE TABLE Transferencias(
    dataTransf          DATE,
    valorTransf         FLOAT,
    nomeEquipaOrigem    VARCHAR(50),
    nomeEquipaDestino   VARCHAR(50),
    nPiloto             INTEGER,
    PRIMARY KEY (dataTransf,nomeEquipaOrigem,nomeEquipaDestino,nPiloto),
    FOREIGN KEY (nomeEquipaOrigem) REFERENCES Equipa(nome),
    FOREIGN KEY (nomeEquipaDestino) REFERENCES Equipa(nome),
    FOREIGN KEY (nPiloto) REFERENCES Piloto(nPiloto)
);