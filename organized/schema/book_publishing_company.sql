CREATE TABLE authors (
  au_id TEXT,
  au_lname TEXT,
  au_fname TEXT,
  phone TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  zip TEXT,
  contract TEXT,
  PRIMARY KEY (au_id)
);

CREATE TABLE jobs (
  job_id INTEGER,
  job_desc TEXT,
  min_lvl INTEGER,
  max_lvl INTEGER,
  PRIMARY KEY (job_id)
);

CREATE TABLE publishers (
  pub_id TEXT,
  pub_name TEXT,
  city TEXT,
  state TEXT,
  country TEXT,
  PRIMARY KEY (pub_id)
);

CREATE TABLE employee (
  emp_id TEXT,
  fname TEXT,
  minit TEXT,
  lname TEXT,
  job_id INTEGER,
  job_lvl INTEGER,
  pub_id TEXT,
  hire_date TEXT,
  PRIMARY KEY (emp_id),
  FOREIGN KEY (job_id) REFERENCES jobs(job_id),
  FOREIGN KEY (pub_id) REFERENCES publishers(pub_id)
);

CREATE TABLE pub_info (
  pub_id TEXT,
  logo TEXT,
  pr_info TEXT,
  PRIMARY KEY (pub_id),
  FOREIGN KEY (pub_id) REFERENCES publishers(pub_id)
);

CREATE TABLE stores (
  stor_id TEXT,
  stor_name TEXT,
  stor_address TEXT,
  city TEXT,
  state TEXT,
  zip TEXT,
  PRIMARY KEY (stor_id)
);

CREATE TABLE discounts (
  discounttype TEXT,
  stor_id TEXT,
  lowqty INTEGER,
  highqty INTEGER,
  discount REAL,
  FOREIGN KEY (stor_id) REFERENCES stores(stor_id)
);

CREATE TABLE titles (
  title_id TEXT,
  title TEXT,
  type TEXT,
  pub_id TEXT,
  price REAL,
  advance REAL,
  royalty INTEGER,
  ytd_sales INTEGER,
  notes TEXT,
  pubdate TEXT,
  PRIMARY KEY (title_id),
  FOREIGN KEY (pub_id) REFERENCES publishers(pub_id)
);

CREATE TABLE roysched (
  title_id TEXT,
  lorange INTEGER,
  hirange INTEGER,
  royalty INTEGER,
  FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

CREATE TABLE sales (
  stor_id TEXT,
  ord_num TEXT,
  ord_date TEXT,
  qty INTEGER,
  payterms TEXT,
  title_id TEXT,
  FOREIGN KEY (stor_id) REFERENCES stores(stor_id),
  FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

CREATE TABLE titleauthor (
  au_id TEXT,
  title_id TEXT,
  au_ord INTEGER,
  royaltyper INTEGER,
  FOREIGN KEY (au_id) REFERENCES authors(au_id),
  FOREIGN KEY (title_id) REFERENCES titles(title_id)
);
