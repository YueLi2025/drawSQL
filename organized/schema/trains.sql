CREATE TABLE cars (
  id INTEGER,
  train_id INTEGER,
  position INTEGER,
  shape TEXT,
  len TEXT,
  sides TEXT,
  roof TEXT,
  wheels INTEGER,
  load_shape TEXT,
  load_num INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (train_id) REFERENCES trains(id)
);

CREATE TABLE trains (
  id INTEGER,
  direction TEXT,
  PRIMARY KEY (id)
);
