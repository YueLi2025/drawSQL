CREATE TABLE users (
  userid INTEGER,
  age TEXT,
  u_gender TEXT,
  occupation TEXT,
  PRIMARY KEY (userid)
);

CREATE TABLE directors (
  directorid INTEGER,
  d_quality INTEGER,
  avg_revenue INTEGER,
  PRIMARY KEY (directorid)
);

CREATE TABLE actors (
  actorid INTEGER,
  a_gender TEXT,
  a_quality INTEGER,
  PRIMARY KEY (actorid)
);

CREATE TABLE movies (
  movieid INTEGER,
  year INTEGER,
  isEnglish TEXT,
  country TEXT,
  runningtime INTEGER,
  PRIMARY KEY (movieid)
);

CREATE TABLE movies2actors (
  movieid INTEGER,
  actorid INTEGER,
  cast_num INTEGER
);

CREATE TABLE movies2directors (
  movieid INTEGER,
  directorid INTEGER,
  genre TEXT
);

CREATE TABLE u2base (
  userid INTEGER,
  movieid INTEGER,
  rating TEXT
);
