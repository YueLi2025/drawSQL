CREATE TABLE Movie (
    index INTEGER,
    MID TEXT,
    title TEXT,
    year TEXT,
    rating REAL,
    num_votes INTEGER
);

CREATE TABLE Genre (
    index INTEGER,
    Name TEXT,
    GID INTEGER
);

CREATE TABLE Language (
    index INTEGER,
    Name TEXT,
    LAID INTEGER
);

CREATE TABLE Country (
    index INTEGER,
    Name TEXT,
    CID INTEGER
);

CREATE TABLE Location (
    index INTEGER,
    Name TEXT,
    LID INTEGER
);

CREATE TABLE M_Location (
    index INTEGER,
    MID TEXT,
    LID REAL,
    ID INTEGER
);

CREATE TABLE M_Country (
    index INTEGER,
    MID TEXT,
    CID REAL,
    ID INTEGER
);

CREATE TABLE M_Language (
    index INTEGER,
    MID TEXT,
    LAID INTEGER,
    ID INTEGER
);

CREATE TABLE M_Genre (
    index INTEGER,
    MID TEXT,
    GID INTEGER,
    ID INTEGER
);

CREATE TABLE Person (
    index INTEGER,
    PID TEXT,
    Name TEXT,
    Gender TEXT
);

CREATE TABLE M_Producer (
    index INTEGER,
    MID TEXT,
    PID TEXT,
    ID INTEGER
);

CREATE TABLE M_Director (
    index INTEGER,
    MID TEXT,
    PID TEXT,
    ID INTEGER
);

CREATE TABLE M_Cast (
    index INTEGER,
    MID TEXT,
    PID TEXT,
    ID INTEGER
);