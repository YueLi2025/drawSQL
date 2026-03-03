CREATE TABLE country (
  origin INTEGER,
  country TEXT,
  PRIMARY KEY (origin)
);

CREATE TABLE price (
  ID INTEGER,
  price REAL,
  PRIMARY KEY (ID)
);

CREATE TABLE data (
  ID INTEGER,
  mpg REAL,
  cylinders INTEGER,
  displacement REAL,
  horsepower INTEGER,
  weight INTEGER,
  acceleration REAL,
  model INTEGER,
  car_name TEXT,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES price(ID)
);

CREATE TABLE production (
  ID INTEGER,
  model_year INTEGER,
  country INTEGER,
  FOREIGN KEY (ID) REFERENCES data(ID),
  FOREIGN KEY (country) REFERENCES country(origin)
);
