CREATE TABLE Episode (
  episode_id TEXT,
  season INTEGER,
  episode INTEGER,
  number_in_series INTEGER,
  title TEXT,
  summary TEXT,
  air_date TEXT,
  episode_image TEXT,
  rating REAL,
  votes INTEGER,
  PRIMARY KEY (episode_id)
);

CREATE TABLE Person (
  name TEXT,
  birthdate TEXT,
  birth_name TEXT,
  birth_place TEXT,
  birth_region TEXT,
  birth_country TEXT,
  height_meters REAL,
  nickname TEXT,
  PRIMARY KEY (name)
);

CREATE TABLE Award (
  award_id INTEGER,
  organization TEXT,
  year INTEGER,
  award_category TEXT,
  award TEXT,
  person TEXT,
  role TEXT,
  episode_id TEXT,
  season TEXT,
  song TEXT,
  result TEXT,
  PRIMARY KEY (award_id),
  FOREIGN KEY (person) REFERENCES Person(name),
  FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);

CREATE TABLE Character_Award (
  award_id INTEGER,
  character TEXT,
  FOREIGN KEY (award_id) REFERENCES Award(award_id)
);

CREATE TABLE Credit (
  episode_id TEXT,
  category TEXT,
  person TEXT,
  role TEXT,
  credited TEXT,
  FOREIGN KEY (episode_id) REFERENCES Episode(episode_id),
  FOREIGN KEY (person) REFERENCES Person(name)
);

CREATE TABLE Keyword (
  episode_id TEXT,
  keyword TEXT,
  FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);

CREATE TABLE Vote (
  episode_id TEXT,
  stars INTEGER,
  votes INTEGER,
  percent REAL,
  FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);
