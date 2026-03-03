CREATE TABLE Author (
  Id INTEGER,
  Name TEXT,
  Affiliation TEXT,
  PRIMARY KEY (Id)
);

CREATE TABLE Conference (
  Id INTEGER,
  ShortName TEXT,
  FullName TEXT,
  HomePage TEXT,
  PRIMARY KEY (Id)
);

CREATE TABLE Journal (
  Id INTEGER,
  ShortName TEXT,
  FullName TEXT,
  HomePage TEXT,
  PRIMARY KEY (Id)
);

CREATE TABLE Paper (
  Id INTEGER,
  Title TEXT,
  Year INTEGER,
  ConferenceId INTEGER,
  JournalId INTEGER,
  Keyword TEXT,
  PRIMARY KEY (Id),
  FOREIGN KEY (ConferenceId) REFERENCES Conference(Id),
  FOREIGN KEY (JournalId) REFERENCES Journal(Id)
);

CREATE TABLE PaperAuthor (
  PaperId INTEGER,
  AuthorId INTEGER,
  Name TEXT,
  Affiliation TEXT,
  FOREIGN KEY (PaperId) REFERENCES Paper(Id),
  FOREIGN KEY (AuthorId) REFERENCES Author(Id)
);
