CREATE TABLE address_status (
  status_id INTEGER,
  address_status TEXT,
  PRIMARY KEY (status_id)
);

CREATE TABLE author (
  author_id INTEGER,
  author_name TEXT,
  PRIMARY KEY (author_id)
);

CREATE TABLE book_language (
  language_id INTEGER,
  language_code TEXT,
  language_name TEXT,
  PRIMARY KEY (language_id)
);

CREATE TABLE country (
  country_id INTEGER,
  country_name TEXT,
  PRIMARY KEY (country_id)
);

CREATE TABLE address (
  address_id INTEGER,
  street_number TEXT,
  street_name TEXT,
  city TEXT,
  country_id INTEGER,
  PRIMARY KEY (address_id),
  FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE customer (
  customer_id INTEGER,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  PRIMARY KEY (customer_id)
);

CREATE TABLE customer_address (
  customer_id INTEGER,
  address_id INTEGER,
  status_id INTEGER,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE order_status (
  status_id INTEGER,
  status_value TEXT,
  PRIMARY KEY (status_id)
);

CREATE TABLE publisher (
  publisher_id INTEGER,
  publisher_name TEXT,
  PRIMARY KEY (publisher_id)
);

CREATE TABLE book (
  book_id INTEGER,
  title TEXT,
  isbn13 TEXT,
  language_id INTEGER,
  num_pages INTEGER,
  publication_date TEXT,
  publisher_id INTEGER,
  PRIMARY KEY (book_id),
  FOREIGN KEY (language_id) REFERENCES book_language(language_id),
  FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

CREATE TABLE book_author (
  book_id INTEGER,
  author_id INTEGER,
  FOREIGN KEY (book_id) REFERENCES book(book_id),
  FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE shipping_method (
  method_id INTEGER,
  method_name TEXT,
  cost REAL,
  PRIMARY KEY (method_id)
);

CREATE TABLE cust_order (
  order_id INTEGER,
  order_date TEXT,
  customer_id INTEGER,
  shipping_method_id INTEGER,
  dest_address_id INTEGER,
  PRIMARY KEY (order_id)
);

CREATE TABLE order_history (
  history_id INTEGER,
  order_id INTEGER,
  status_id INTEGER,
  status_date TEXT,
  PRIMARY KEY (history_id)
);

CREATE TABLE order_line (
  line_id INTEGER,
  order_id INTEGER,
  book_id INTEGER,
  price REAL,
  PRIMARY KEY (line_id)
);
