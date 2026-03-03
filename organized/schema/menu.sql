CREATE TABLE Dish (
  id INTEGER,
  name TEXT,
  description TEXT,
  menus_appeared INTEGER,
  times_appeared INTEGER,
  first_appeared INTEGER,
  last_appeared INTEGER,
  lowest_price REAL,
  highest_price REAL,
  PRIMARY KEY (id)
);

CREATE TABLE Menu (
  id INTEGER,
  name TEXT,
  sponsor TEXT,
  event TEXT,
  venue TEXT,
  place TEXT,
  physical_description TEXT,
  occasion TEXT,
  notes TEXT,
  call_number TEXT,
  keywords TEXT,
  language TEXT,
  date TEXT,
  location TEXT,
  location_type TEXT,
  currency TEXT,
  currency_symbol TEXT,
  status TEXT,
  page_count INTEGER,
  dish_count INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE MenuPage (
  id INTEGER,
  menu_id INTEGER,
  page_number INTEGER,
  image_id REAL,
  full_height INTEGER,
  full_width INTEGER,
  uuid TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_id) REFERENCES Menu(id)
);

CREATE TABLE MenuItem (
  id INTEGER,
  menu_page_id INTEGER,
  price REAL,
  high_price REAL,
  dish_id INTEGER,
  created_at TEXT,
  updated_at TEXT,
  xpos REAL,
  ypos REAL,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_page_id) REFERENCES MenuPage(id),
  FOREIGN KEY (dish_id) REFERENCES Dish(id)
);
