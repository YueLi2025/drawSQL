CREATE TABLE Attributes (
  attribute_id INTEGER,
  attribute_name TEXT,
  PRIMARY KEY (attribute_id)
);

CREATE TABLE Categories (
  category_id INTEGER,
  category_name TEXT,
  PRIMARY KEY (category_id)
);

CREATE TABLE Compliments (
  compliment_id INTEGER,
  compliment_type TEXT,
  PRIMARY KEY (compliment_id)
);

CREATE TABLE Days (
  day_id INTEGER,
  day_of_week TEXT,
  PRIMARY KEY (day_id)
);

CREATE TABLE Years (
  year_id INTEGER,
  actual_year INTEGER,
  PRIMARY KEY (year_id)
);

CREATE TABLE Business_Attributes (
  attribute_id INTEGER,
  business_id INTEGER,
  attribute_value TEXT
);

CREATE TABLE Business_Categories (
  business_id INTEGER,
  category_id INTEGER
);

CREATE TABLE Business_Hours (
  business_id INTEGER,
  day_id INTEGER,
  opening_time TEXT,
  closing_time TEXT
);

CREATE TABLE Checkins (
  business_id INTEGER,
  day_id INTEGER,
  label_time_0 TEXT,
  label_time_1 TEXT,
  label_time_2 TEXT,
  label_time_3 TEXT,
  label_time_4 TEXT,
  label_time_5 TEXT,
  label_time_6 TEXT,
  label_time_7 TEXT,
  label_time_8 TEXT,
  label_time_9 TEXT,
  label_time_10 TEXT,
  label_time_11 TEXT,
  label_time_12 TEXT,
  label_time_13 TEXT,
  label_time_14 TEXT,
  label_time_15 TEXT,
  label_time_16 TEXT,
  label_time_17 TEXT,
  label_time_18 TEXT,
  label_time_19 TEXT,
  label_time_20 TEXT,
  label_time_21 TEXT,
  label_time_22 TEXT,
  label_time_23 TEXT
);

CREATE TABLE Elite (
  user_id INTEGER,
  year_id INTEGER
);

CREATE TABLE Reviews (
  business_id INTEGER,
  user_id INTEGER,
  review_stars INTEGER,
  review_votes_funny TEXT,
  review_votes_useful TEXT,
  review_votes_cool TEXT,
  review_length TEXT
);

CREATE TABLE Tips (
  business_id INTEGER,
  user_id INTEGER,
  likes INTEGER,
  tip_length TEXT
);

CREATE TABLE Users_Compliments (
  compliment_id INTEGER,
  user_id INTEGER,
  number_of_compliments TEXT
);

CREATE TABLE Business (
  business_id INTEGER,
  active TEXT,
  city TEXT,
  state TEXT,
  stars REAL,
  review_count TEXT,
  PRIMARY KEY (business_id)
);

CREATE TABLE Users (
  user_id INTEGER,
  user_yelping_since_year INTEGER,
  user_average_stars TEXT,
  user_votes_funny TEXT,
  user_votes_useful TEXT,
  user_votes_cool TEXT,
  user_review_count TEXT,
  user_fans TEXT,
  PRIMARY KEY (user_id)
);
