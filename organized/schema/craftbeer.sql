CREATE TABLE breweries (
  id INTEGER,
  name TEXT,
  city TEXT,
  state TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE beers (
  id INTEGER,
  brewery_id INTEGER,
  abv REAL,
  ibu REAL,
  name TEXT,
  style TEXT,
  ounces REAL,
  PRIMARY KEY (id)
);
