CREATE TABLE film_text (
  film_id INTEGER,
  title TEXT,
  description TEXT,
  PRIMARY KEY (film_id)
);

CREATE TABLE actor (
  actor_id INTEGER,
  first_name TEXT,
  last_name TEXT,
  last_update TEXT,
  PRIMARY KEY (actor_id)
);

CREATE TABLE address (
  address_id INTEGER,
  address TEXT,
  address2 TEXT,
  district TEXT,
  city_id INTEGER,
  postal_code TEXT,
  phone TEXT,
  last_update TEXT,
  PRIMARY KEY (address_id)
);

CREATE TABLE category (
  category_id INTEGER,
  name TEXT,
  last_update TEXT,
  PRIMARY KEY (category_id)
);

CREATE TABLE city (
  city_id INTEGER,
  city TEXT,
  country_id INTEGER,
  last_update TEXT,
  PRIMARY KEY (city_id)
);

CREATE TABLE country (
  country_id INTEGER,
  country TEXT,
  last_update TEXT,
  PRIMARY KEY (country_id)
);

CREATE TABLE customer (
  customer_id INTEGER,
  store_id INTEGER,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  address_id INTEGER,
  active INTEGER,
  create_date TEXT,
  last_update TEXT,
  PRIMARY KEY (customer_id)
);

CREATE TABLE film (
  film_id INTEGER,
  title TEXT,
  description TEXT,
  release_year TEXT,
  language_id INTEGER,
  original_language_id INTEGER,
  rental_duration INTEGER,
  rental_rate REAL,
  length INTEGER,
  replacement_cost REAL,
  rating TEXT,
  special_features TEXT,
  last_update TEXT,
  PRIMARY KEY (film_id)
);

CREATE TABLE film_actor (
  actor_id INTEGER,
  film_id INTEGER,
  last_update TEXT
);

CREATE TABLE film_category (
  film_id INTEGER,
  category_id INTEGER,
  last_update TEXT
);

CREATE TABLE inventory (
  inventory_id INTEGER,
  film_id INTEGER,
  store_id INTEGER,
  last_update TEXT,
  PRIMARY KEY (inventory_id)
);

CREATE TABLE language (
  language_id INTEGER,
  name TEXT,
  last_update TEXT,
  PRIMARY KEY (language_id)
);

CREATE TABLE payment (
  payment_id INTEGER,
  customer_id INTEGER,
  staff_id INTEGER,
  rental_id INTEGER,
  amount REAL,
  payment_date TEXT,
  last_update TEXT,
  PRIMARY KEY (payment_id)
);

CREATE TABLE rental (
  rental_id INTEGER,
  rental_date TEXT,
  inventory_id INTEGER,
  customer_id INTEGER,
  return_date TEXT,
  staff_id INTEGER,
  last_update TEXT,
  PRIMARY KEY (rental_id)
);

CREATE TABLE staff (
  staff_id INTEGER,
  first_name TEXT,
  last_name TEXT,
  address_id INTEGER,
  picture TEXT,
  email TEXT,
  store_id INTEGER,
  active INTEGER,
  username TEXT,
  password TEXT,
  last_update TEXT,
  PRIMARY KEY (staff_id)
);

CREATE TABLE store (
  store_id INTEGER,
  manager_staff_id INTEGER,
  address_id INTEGER,
  last_update TEXT,
  PRIMARY KEY (store_id)
);
