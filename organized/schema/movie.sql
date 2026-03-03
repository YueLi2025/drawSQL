CREATE TABLE actor (
  ActorID INTEGER,
  Name TEXT,
  "Date of Birth" TEXT,
  "Birth City" TEXT,
  "Birth Country" TEXT,
  "Height (Inches)" INTEGER,
  Biography TEXT,
  Gender TEXT,
  Ethnicity TEXT,
  NetWorth TEXT,
  PRIMARY KEY (ActorID)
);

CREATE TABLE movie (
  MovieID INTEGER,
  Title TEXT,
  "MPAA Rating" TEXT,
  Budget INTEGER,
  Gross INTEGER,
  "Release Date" TEXT,
  Genre TEXT,
  Runtime INTEGER,
  Rating REAL,
  "Rating Count" INTEGER,
  Summary TEXT,
  PRIMARY KEY (MovieID)
);

CREATE TABLE characters (
  MovieID INTEGER,
  ActorID INTEGER,
  "Character Name" TEXT,
  creditOrder INTEGER,
  pay TEXT,
  screentime TEXT,
  FOREIGN KEY (MovieID) REFERENCES movie(MovieID),
  FOREIGN KEY (ActorID) REFERENCES actor(ActorID)
);
