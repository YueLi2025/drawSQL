CREATE TABLE country (
  id INTEGER,
  country_name TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE ranking_system (
  id INTEGER,
  system_name TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE ranking_criteria (
  id INTEGER,
  ranking_system_id INTEGER,
  criteria_name TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (ranking_system_id) REFERENCES ranking_system(id)
);

CREATE TABLE university (
  id INTEGER,
  country_id INTEGER,
  university_name TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE university_ranking_year (
  university_id INTEGER,
  ranking_criteria_id INTEGER,
  year INTEGER,
  score INTEGER,
  FOREIGN KEY (university_id) REFERENCES university(id),
  FOREIGN KEY (ranking_criteria_id) REFERENCES ranking_criteria(id)
);

CREATE TABLE university_year (
  university_id INTEGER,
  year INTEGER,
  num_students INTEGER,
  student_staff_ratio REAL,
  pct_international_students INTEGER,
  pct_female_students INTEGER,
  FOREIGN KEY (university_id) REFERENCES university(id)
);
