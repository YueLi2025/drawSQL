CREATE TABLE geographic (
  city TEXT,
  county TEXT,
  region TEXT,
  PRIMARY KEY (city)
);

CREATE TABLE generalinfo (
  id_restaurant INTEGER,
  label TEXT,
  food_type TEXT,
  city TEXT,
  review REAL,
  PRIMARY KEY (id_restaurant),
  FOREIGN KEY (city) REFERENCES geographic(city)
);

CREATE TABLE location (
  id_restaurant INTEGER,
  street_num INTEGER,
  street_name TEXT,
  city TEXT,
  PRIMARY KEY (id_restaurant),
  FOREIGN KEY (id_restaurant) REFERENCES generalinfo(id_restaurant),
  FOREIGN KEY (city) REFERENCES geographic(city)
);
