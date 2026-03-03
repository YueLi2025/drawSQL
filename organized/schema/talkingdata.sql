CREATE TABLE app_all (
  app_id INTEGER,
  PRIMARY KEY (app_id)
);

CREATE TABLE app_events (
  event_id INTEGER,
  app_id INTEGER,
  is_installed INTEGER,
  is_active INTEGER,
  FOREIGN KEY (event_id) REFERENCES events(event_id)
);

CREATE TABLE app_events_relevant (
  event_id INTEGER,
  app_id INTEGER,
  is_installed INTEGER,
  is_active INTEGER,
  FOREIGN KEY (event_id) REFERENCES events_relevant(event_id),
  FOREIGN KEY (app_id) REFERENCES app_all(app_id)
);

CREATE TABLE app_labels (
  app_id INTEGER,
  label_id INTEGER,
  FOREIGN KEY (app_id) REFERENCES app_all(app_id),
  FOREIGN KEY (label_id) REFERENCES label_categories(label_id)
);

CREATE TABLE events (
  event_id INTEGER,
  device_id INTEGER,
  timestamp TEXT,
  longitude REAL,
  latitude REAL,
  PRIMARY KEY (event_id)
);

CREATE TABLE events_relevant (
  event_id INTEGER,
  device_id INTEGER,
  timestamp TEXT,
  longitude REAL,
  latitude REAL,
  PRIMARY KEY (event_id),
  FOREIGN KEY (device_id) REFERENCES gender_age(device_id)
);

CREATE TABLE gender_age (
  device_id INTEGER,
  gender TEXT,
  age INTEGER,
  "group" TEXT,
  PRIMARY KEY (device_id),
  FOREIGN KEY (device_id) REFERENCES phone_brand_device_model2(device_id)
);

CREATE TABLE gender_age_test (
  device_id INTEGER,
  PRIMARY KEY (device_id)
);

CREATE TABLE gender_age_train (
  device_id INTEGER,
  gender TEXT,
  age INTEGER,
  "group" TEXT,
  PRIMARY KEY (device_id)
);

CREATE TABLE label_categories (
  label_id INTEGER,
  category TEXT,
  PRIMARY KEY (label_id)
);

CREATE TABLE phone_brand_device_model2 (
  device_id INTEGER,
  phone_brand TEXT,
  device_model TEXT
);

CREATE TABLE sample_submission (
  device_id INTEGER,
  "F23-" REAL,
  "F24-26" REAL,
  "F27-28" REAL,
  "F29-32" REAL,
  "F33-42" REAL,
  F43+ REAL,
  "M22-" REAL,
  "M23-26" REAL,
  "M27-28" REAL,
  "M29-31" REAL,
  "M32-38" REAL,
  M39+ REAL,
  PRIMARY KEY (device_id)
);
