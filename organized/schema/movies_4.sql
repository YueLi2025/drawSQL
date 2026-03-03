CREATE TABLE country (
  country_id INTEGER,
  country_iso_code TEXT,
  country_name TEXT,
  PRIMARY KEY (country_id)
);

CREATE TABLE department (
  department_id INTEGER,
  department_name TEXT,
  PRIMARY KEY (department_id)
);

CREATE TABLE gender (
  gender_id INTEGER,
  gender TEXT,
  PRIMARY KEY (gender_id)
);

CREATE TABLE genre (
  genre_id INTEGER,
  genre_name TEXT,
  PRIMARY KEY (genre_id)
);

CREATE TABLE keyword (
  keyword_id INTEGER,
  keyword_name TEXT,
  PRIMARY KEY (keyword_id)
);

CREATE TABLE language (
  language_id INTEGER,
  language_code TEXT,
  language_name TEXT,
  PRIMARY KEY (language_id)
);

CREATE TABLE language_role (
  role_id INTEGER,
  language_role TEXT,
  PRIMARY KEY (role_id)
);

CREATE TABLE movie (
  movie_id INTEGER,
  title TEXT,
  budget INTEGER,
  homepage TEXT,
  overview TEXT,
  popularity REAL,
  release_date TEXT,
  revenue INTEGER,
  runtime INTEGER,
  movie_status TEXT,
  tagline TEXT,
  vote_average REAL,
  vote_count INTEGER,
  PRIMARY KEY (movie_id)
);

CREATE TABLE movie_genres (
  movie_id INTEGER,
  genre_id INTEGER,
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
  FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE movie_languages (
  movie_id INTEGER,
  language_id INTEGER,
  language_role_id INTEGER,
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
  FOREIGN KEY (language_id) REFERENCES language(language_id),
  FOREIGN KEY (language_role_id) REFERENCES language_role(role_id)
);

CREATE TABLE person (
  person_id INTEGER,
  person_name TEXT,
  PRIMARY KEY (person_id)
);

CREATE TABLE movie_crew (
  movie_id INTEGER,
  person_id INTEGER,
  department_id INTEGER,
  job TEXT,
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE production_company (
  company_id INTEGER,
  company_name TEXT,
  PRIMARY KEY (company_id)
);

CREATE TABLE production_country (
  movie_id INTEGER,
  country_id INTEGER,
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
  FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE movie_cast (
  movie_id INTEGER,
  person_id INTEGER,
  character_name TEXT,
  gender_id INTEGER,
  cast_order INTEGER,
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id),
  FOREIGN KEY (gender_id) REFERENCES gender(gender_id)
);

CREATE TABLE movie_keywords (
  movie_id INTEGER,
  keyword_id INTEGER
);

CREATE TABLE movie_company (
  movie_id INTEGER,
  company_id INTEGER
);
