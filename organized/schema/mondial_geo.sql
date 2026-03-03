CREATE TABLE borders (
  Country1 TEXT,
  Country2 TEXT,
  Length REAL
);

CREATE TABLE city (
  Name TEXT,
  Country TEXT,
  Province TEXT,
  Population INTEGER,
  Longitude REAL,
  Latitude REAL
);

CREATE TABLE continent (
  Name TEXT,
  Area REAL,
  PRIMARY KEY (Name)
);

CREATE TABLE country (
  Name TEXT,
  Code TEXT,
  Capital TEXT,
  Province TEXT,
  Area REAL,
  Population INTEGER,
  PRIMARY KEY (Code)
);

CREATE TABLE desert (
  Name TEXT,
  Area REAL,
  Longitude REAL,
  Latitude REAL,
  PRIMARY KEY (Name)
);

CREATE TABLE economy (
  Country TEXT,
  GDP REAL,
  Agriculture REAL,
  Service REAL,
  Industry REAL,
  Inflation REAL,
  PRIMARY KEY (Country)
);

CREATE TABLE encompasses (
  Country TEXT,
  Continent TEXT,
  Percentage REAL
);

CREATE TABLE ethnicGroup (
  Country TEXT,
  Name TEXT,
  Percentage REAL
);

CREATE TABLE geo_desert (
  Desert TEXT,
  Country TEXT,
  Province TEXT
);

CREATE TABLE geo_estuary (
  River TEXT,
  Country TEXT,
  Province TEXT
);

CREATE TABLE geo_island (
  Island TEXT,
  Country TEXT,
  Province TEXT
);

CREATE TABLE geo_lake (
  Lake TEXT,
  Country TEXT,
  Province TEXT
);

CREATE TABLE geo_mountain (
  Mountain TEXT,
  Country TEXT,
  Province TEXT
);

CREATE TABLE geo_river (
  River TEXT,
  Country TEXT,
  Province TEXT
);

CREATE TABLE geo_sea (
  Sea TEXT,
  Country TEXT,
  Province TEXT
);

CREATE TABLE geo_source (
  River TEXT,
  Country TEXT,
  Province TEXT
);

CREATE TABLE island (
  Name TEXT,
  Islands TEXT,
  Area REAL,
  Height REAL,
  Type TEXT,
  Longitude REAL,
  Latitude REAL,
  PRIMARY KEY (Name)
);

CREATE TABLE islandIn (
  Island TEXT,
  Sea TEXT,
  Lake TEXT,
  River TEXT
);

CREATE TABLE isMember (
  Country TEXT,
  Organization TEXT,
  Type TEXT
);

CREATE TABLE lake (
  Name TEXT,
  Area REAL,
  Depth REAL,
  Altitude REAL,
  Type TEXT,
  River TEXT,
  Longitude REAL,
  Latitude REAL,
  PRIMARY KEY (Name)
);

CREATE TABLE language (
  Country TEXT,
  Name TEXT,
  Percentage REAL
);

CREATE TABLE located (
  City TEXT,
  Province TEXT,
  Country TEXT,
  River TEXT,
  Lake TEXT,
  Sea TEXT
);

CREATE TABLE locatedOn (
  City TEXT,
  Province TEXT,
  Country TEXT,
  Island TEXT
);

CREATE TABLE mergesWith (
  Sea1 TEXT,
  Sea2 TEXT
);

CREATE TABLE mountain (
  Name TEXT,
  Mountains TEXT,
  Height REAL,
  Type TEXT,
  Longitude REAL,
  Latitude REAL,
  PRIMARY KEY (Name)
);

CREATE TABLE mountainOnIsland (
  Mountain TEXT,
  Island TEXT
);

CREATE TABLE organization (
  Abbreviation TEXT,
  Name TEXT,
  City TEXT,
  Country TEXT,
  Province TEXT,
  Established TEXT,
  PRIMARY KEY (Abbreviation)
);

CREATE TABLE politics (
  Country TEXT,
  Independence TEXT,
  Dependent TEXT,
  Government TEXT,
  PRIMARY KEY (Country)
);

CREATE TABLE population (
  Country TEXT,
  Population_Growth REAL,
  Infant_Mortality REAL,
  PRIMARY KEY (Country)
);

CREATE TABLE province (
  Name TEXT,
  Country TEXT,
  Population INTEGER,
  Area REAL,
  Capital TEXT,
  CapProv TEXT
);

CREATE TABLE religion (
  Country TEXT,
  Name TEXT,
  Percentage REAL
);

CREATE TABLE river (
  Name TEXT,
  River TEXT,
  Lake TEXT,
  Sea TEXT,
  Length REAL,
  SourceLongitude REAL,
  SourceLatitude REAL,
  Mountains TEXT,
  SourceAltitude REAL,
  EstuaryLongitude REAL,
  EstuaryLatitude REAL,
  PRIMARY KEY (Name)
);

CREATE TABLE sea (
  Name TEXT,
  Depth REAL,
  PRIMARY KEY (Name)
);

CREATE TABLE target (
  Country TEXT,
  Target TEXT,
  PRIMARY KEY (Country)
);
