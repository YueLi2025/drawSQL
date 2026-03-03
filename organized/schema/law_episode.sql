CREATE TABLE Episode (
  episode_id TEXT,
  series TEXT,
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

CREATE TABLE Keyword (
  episode_id TEXT,
  keyword TEXT,
  FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);

CREATE TABLE Person (
  person_id TEXT,
  name TEXT,
  birthdate TEXT,
  birth_name TEXT,
  birth_place TEXT,
  birth_region TEXT,
  birth_country TEXT,
  height_meters REAL,
  nickname TEXT,
  PRIMARY KEY (person_id)
);

CREATE TABLE Award (
  award_id INTEGER,
  organization TEXT,
  year INTEGER,
  award_category TEXT,
  award TEXT,
  series TEXT,
  episode_id TEXT,
  person_id TEXT,
  role TEXT,
  result TEXT,
  PRIMARY KEY (award_id),
  FOREIGN KEY (episode_id) REFERENCES Episode(episode_id),
  FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE Credit (
  episode_id TEXT,
  person_id TEXT,
  category TEXT,
  role TEXT,
  credited TEXT,
  FOREIGN KEY (episode_id) REFERENCES Episode(episode_id),
  FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE Vote (
  episode_id TEXT,
  stars INTEGER,
  votes INTEGER,
  percent REAL,
  FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);
