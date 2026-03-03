CREATE TABLE station (
  id INTEGER,
  name TEXT,
  lat REAL,
  long REAL,
  dock_count INTEGER,
  city TEXT,
  installation_date TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE status (
  station_id INTEGER,
  bikes_available INTEGER,
  docks_available INTEGER,
  time TEXT
);

CREATE TABLE trip (
  id INTEGER,
  duration INTEGER,
  start_date TEXT,
  start_station_name TEXT,
  start_station_id INTEGER,
  end_date TEXT,
  end_station_name TEXT,
  end_station_id INTEGER,
  bike_id INTEGER,
  subscription_type TEXT,
  zip_code INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE weather (
  date TEXT,
  max_temperature_f INTEGER,
  mean_temperature_f INTEGER,
  min_temperature_f INTEGER,
  max_dew_point_f INTEGER,
  mean_dew_point_f INTEGER,
  min_dew_point_f INTEGER,
  max_humidity INTEGER,
  mean_humidity INTEGER,
  min_humidity INTEGER,
  max_sea_level_pressure_inches REAL,
  mean_sea_level_pressure_inches REAL,
  min_sea_level_pressure_inches REAL,
  max_visibility_miles INTEGER,
  mean_visibility_miles INTEGER,
  min_visibility_miles INTEGER,
  max_wind_Speed_mph INTEGER,
  mean_wind_speed_mph INTEGER,
  max_gust_speed_mph INTEGER,
  precipitation_inches TEXT,
  cloud_cover INTEGER,
  events TEXT,
  wind_dir_degrees INTEGER,
  zip_code TEXT
);
