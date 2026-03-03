CREATE TABLE city (
  city_id INTEGER,
  city_name TEXT,
  state TEXT,
  population INTEGER,
  area REAL,
  PRIMARY KEY (city_id)
);

CREATE TABLE customer (
  cust_id INTEGER,
  cust_name TEXT,
  annual_revenue INTEGER,
  cust_type TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  zip REAL,
  phone TEXT,
  PRIMARY KEY (cust_id)
);

CREATE TABLE driver (
  driver_id INTEGER,
  first_name TEXT,
  last_name TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  zip_code INTEGER,
  phone TEXT,
  PRIMARY KEY (driver_id)
);

CREATE TABLE truck (
  truck_id INTEGER,
  make TEXT,
  model_year INTEGER,
  PRIMARY KEY (truck_id)
);

CREATE TABLE shipment (
  ship_id INTEGER,
  cust_id INTEGER,
  weight REAL,
  truck_id INTEGER,
  driver_id INTEGER,
  city_id INTEGER,
  ship_date TEXT,
  PRIMARY KEY (ship_id),
  FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
  FOREIGN KEY (truck_id) REFERENCES truck(truck_id),
  FOREIGN KEY (driver_id) REFERENCES driver(driver_id),
  FOREIGN KEY (city_id) REFERENCES city(city_id)
);
