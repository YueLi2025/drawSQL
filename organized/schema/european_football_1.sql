CREATE TABLE divisions (
  division TEXT,
  name TEXT,
  country TEXT,
  PRIMARY KEY (division)
);

CREATE TABLE matchs (
  Div TEXT,
  Date TEXT,
  HomeTeam TEXT,
  AwayTeam TEXT,
  FTHG INTEGER,
  FTAG INTEGER,
  FTR TEXT,
  season INTEGER,
  FOREIGN KEY (Div) REFERENCES divisions(division)
);
