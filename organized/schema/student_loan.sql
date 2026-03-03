CREATE TABLE bool (
  name TEXT,
  PRIMARY KEY (name)
);

CREATE TABLE person (
  name TEXT,
  PRIMARY KEY (name)
);

CREATE TABLE disabled (
  name TEXT,
  PRIMARY KEY (name),
  FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE enlist (
  name TEXT,
  organ TEXT,
  FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE filed_for_bankrupcy (
  name TEXT,
  PRIMARY KEY (name),
  FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE longest_absense_from_school (
  name TEXT,
  month INTEGER,
  PRIMARY KEY (name),
  FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE male (
  name TEXT,
  PRIMARY KEY (name),
  FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE no_payment_due (
  name TEXT,
  bool TEXT,
  PRIMARY KEY (name),
  FOREIGN KEY (name) REFERENCES person(name),
  FOREIGN KEY (bool) REFERENCES bool(name)
);

CREATE TABLE unemployed (
  name TEXT,
  PRIMARY KEY (name),
  FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE enrolled (
  name TEXT,
  school TEXT,
  month INTEGER,
  FOREIGN KEY (name) REFERENCES person(name)
);
