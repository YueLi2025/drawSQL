CREATE TABLE sales_in_weather (
  date TEXT,
  store_nbr INTEGER,
  item_nbr INTEGER,
  units INTEGER
);

CREATE TABLE weather (
  station_nbr INTEGER,
  date TEXT,
  tmax INTEGER,
  tmin INTEGER,
  tavg INTEGER,
  depart INTEGER,
  dewpoint INTEGER,
  wetbulb INTEGER,
  heat INTEGER,
  cool INTEGER,
  sunrise TEXT,
  sunset TEXT,
  codesum TEXT,
  snowfall REAL,
  preciptotal REAL,
  stnpressure REAL,
  sealevel REAL,
  resultspeed REAL,
  resultdir INTEGER,
  avgspeed REAL
);

CREATE TABLE relation (
  store_nbr INTEGER,
  station_nbr INTEGER,
  PRIMARY KEY (store_nbr),
  FOREIGN KEY (store_nbr) REFERENCES sales_in_weather(store_nbr),
  FOREIGN KEY (station_nbr) REFERENCES weather(station_nbr)
);
