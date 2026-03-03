CREATE TABLE city (
  id INTEGER,
  city_name TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE games (
  id INTEGER,
  games_year INTEGER,
  games_name TEXT,
  season TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE games_city (
  games_id INTEGER,
  city_id INTEGER,
  FOREIGN KEY (games_id) REFERENCES games(id),
  FOREIGN KEY (city_id) REFERENCES city(id)
);

CREATE TABLE medal (
  id INTEGER,
  medal_name TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE noc_region (
  id INTEGER,
  noc TEXT,
  region_name TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE person (
  id INTEGER,
  full_name TEXT,
  gender TEXT,
  height INTEGER,
  weight INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE games_competitor (
  id INTEGER,
  games_id INTEGER,
  person_id INTEGER,
  age INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (games_id) REFERENCES games(id),
  FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE person_region (
  person_id INTEGER,
  region_id INTEGER,
  FOREIGN KEY (person_id) REFERENCES person(id),
  FOREIGN KEY (region_id) REFERENCES noc_region(id)
);

CREATE TABLE sport (
  id INTEGER,
  sport_name TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE event (
  id INTEGER,
  sport_id INTEGER,
  event_name TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (sport_id) REFERENCES sport(id)
);

CREATE TABLE competitor_event (
  event_id INTEGER,
  competitor_id INTEGER,
  medal_id INTEGER,
  FOREIGN KEY (event_id) REFERENCES event(id),
  FOREIGN KEY (competitor_id) REFERENCES games_competitor(id),
  FOREIGN KEY (medal_id) REFERENCES medal(id)
);
