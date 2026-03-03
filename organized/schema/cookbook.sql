CREATE TABLE Ingredient (
  ingredient_id INTEGER,
  category TEXT,
  name TEXT,
  plural TEXT,
  PRIMARY KEY (ingredient_id)
);

CREATE TABLE Recipe (
  recipe_id INTEGER,
  title TEXT,
  subtitle TEXT,
  servings INTEGER,
  yield_unit TEXT,
  prep_min INTEGER,
  cook_min INTEGER,
  stnd_min INTEGER,
  source TEXT,
  intro TEXT,
  directions TEXT,
  PRIMARY KEY (recipe_id)
);

CREATE TABLE Nutrition (
  recipe_id INTEGER,
  protein REAL,
  carbo REAL,
  alcohol REAL,
  total_fat REAL,
  sat_fat REAL,
  cholestrl REAL,
  sodium REAL,
  iron REAL,
  vitamin_c REAL,
  vitamin_a REAL,
  fiber REAL,
  pcnt_cal_carb REAL,
  pcnt_cal_fat REAL,
  pcnt_cal_prot REAL,
  calories REAL,
  PRIMARY KEY (recipe_id),
  FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);

CREATE TABLE Quantity (
  quantity_id INTEGER,
  recipe_id INTEGER,
  ingredient_id INTEGER,
  max_qty REAL,
  min_qty REAL,
  unit TEXT,
  preparation TEXT,
  optional TEXT,
  PRIMARY KEY (quantity_id),
  FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id),
  FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);
