CREATE TABLE genre (
  id INTEGER,
  genre_name TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE game (
  id INTEGER,
  genre_id INTEGER,
  game_name TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE TABLE platform (
  id INTEGER,
  platform_name TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE publisher (
  id INTEGER,
  publisher_name TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE game_publisher (
  id INTEGER,
  game_id INTEGER,
  publisher_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (game_id) REFERENCES game(id),
  FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE game_platform (
  id INTEGER,
  game_publisher_id INTEGER,
  platform_id INTEGER,
  release_year INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (game_publisher_id) REFERENCES game_publisher(id),
  FOREIGN KEY (platform_id) REFERENCES platform(id)
);

CREATE TABLE region (
  id INTEGER,
  region_name TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE region_sales (
  region_id INTEGER,
  game_platform_id INTEGER,
  num_sales REAL,
  FOREIGN KEY (region_id) REFERENCES region(id),
  FOREIGN KEY (game_platform_id) REFERENCES game_platform(id)
);
