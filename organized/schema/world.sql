CREATE TABLE City (
  ID INTEGER,
  Name TEXT,
  CountryCode TEXT,
  District TEXT,
  Population INTEGER,
  PRIMARY KEY (ID),
  FOREIGN KEY (CountryCode) REFERENCES Country(Code)
);

CREATE TABLE Country (
  Code TEXT,
  Name TEXT,
  Continent TEXT,
  Region TEXT,
  SurfaceArea REAL,
  IndepYear INTEGER,
  Population INTEGER,
  LifeExpectancy REAL,
  GNP REAL,
  GNPOld REAL,
  LocalName TEXT,
  GovernmentForm TEXT,
  HeadOfState TEXT,
  Capital INTEGER,
  Code2 TEXT,
  PRIMARY KEY (Code)
);

CREATE TABLE CountryLanguage (
  CountryCode TEXT,
  Language TEXT,
  IsOfficial TEXT,
  Percentage REAL,
  FOREIGN KEY (CountryCode) REFERENCES Country(Code)
);
