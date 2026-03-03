CREATE TABLE characters (
  movie_title TEXT,
  release_date TEXT,
  hero TEXT,
  villian TEXT,
  song TEXT,
  PRIMARY KEY (movie_title),
  FOREIGN KEY (hero) REFERENCES "voice-actors"(character)
);

CREATE TABLE director (
  name TEXT,
  director TEXT,
  PRIMARY KEY (name),
  FOREIGN KEY (name) REFERENCES characters(movie_title)
);

CREATE TABLE movies_total_gross (
  movie_title TEXT,
  release_date TEXT,
  genre TEXT,
  MPAA_rating TEXT,
  total_gross TEXT,
  inflation_adjusted_gross TEXT,
  FOREIGN KEY (movie_title) REFERENCES characters(movie_title)
);

CREATE TABLE revenue (
  Year INTEGER,
  "Studio Entertainment[NI 1]" REAL,
  "Disney Consumer Products[NI 2]" REAL,
  "Disney Interactive[NI 3][Rev 1]" INTEGER,
  "Walt Disney Parks and Resorts" REAL,
  "Disney Media Networks" TEXT,
  Total INTEGER,
  PRIMARY KEY (Year)
);

CREATE TABLE "voice-actors" (
  character TEXT,
  "voice-actor" TEXT,
  movie TEXT,
  PRIMARY KEY (character),
  FOREIGN KEY (movie) REFERENCES characters(movie_title)
);
