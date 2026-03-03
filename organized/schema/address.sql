CREATE TABLE CBSA (
  CBSA INTEGER,
  CBSA_name TEXT,
  CBSA_type TEXT,
  PRIMARY KEY (CBSA)
);

CREATE TABLE state (
  abbreviation TEXT,
  name TEXT,
  PRIMARY KEY (abbreviation)
);

CREATE TABLE congress (
  cognress_rep_id TEXT,
  first_name TEXT,
  last_name TEXT,
  CID TEXT,
  party TEXT,
  state TEXT,
  abbreviation TEXT,
  House TEXT,
  District INTEGER,
  land_area REAL,
  PRIMARY KEY (cognress_rep_id),
  FOREIGN KEY (abbreviation) REFERENCES state(abbreviation)
);

CREATE TABLE zip_data (
  zip_code INTEGER,
  city TEXT,
  state TEXT,
  multi_county TEXT,
  type TEXT,
  organization TEXT,
  time_zone TEXT,
  daylight_savings TEXT,
  latitude REAL,
  longitude REAL,
  elevation INTEGER,
  state_fips INTEGER,
  county_fips INTEGER,
  region TEXT,
  division TEXT,
  population_2020 INTEGER,
  population_2010 INTEGER,
  households INTEGER,
  avg_house_value INTEGER,
  avg_income_per_household INTEGER,
  persons_per_household REAL,
  white_population INTEGER,
  black_population INTEGER,
  hispanic_population INTEGER,
  asian_population INTEGER,
  american_indian_population INTEGER,
  hawaiian_population INTEGER,
  other_population INTEGER,
  male_population INTEGER,
  female_population INTEGER,
  median_age REAL,
  male_median_age REAL,
  female_median_age REAL,
  residential_mailboxes INTEGER,
  business_mailboxes INTEGER,
  total_delivery_receptacles INTEGER,
  businesses INTEGER,
  1st_quarter_payroll INTEGER,
  annual_payroll INTEGER,
  employees INTEGER,
  water_area REAL,
  land_area REAL,
  single_family_delivery_units INTEGER,
  multi_family_delivery_units INTEGER,
  total_beneficiaries INTEGER,
  retired_workers INTEGER,
  disabled_workers INTEGER,
  parents_and_widowed INTEGER,
  spouses INTEGER,
  children INTEGER,
  over_65 INTEGER,
  monthly_benefits_all INTEGER,
  monthly_benefits_retired_workers INTEGER,
  monthly_benefits_widowed INTEGER,
  CBSA INTEGER,
  PRIMARY KEY (zip_code),
  FOREIGN KEY (state) REFERENCES state(abbreviation),
  FOREIGN KEY (CBSA) REFERENCES CBSA(CBSA)
);

CREATE TABLE alias (
  zip_code INTEGER,
  alias TEXT,
  PRIMARY KEY (zip_code),
  FOREIGN KEY (zip_code) REFERENCES zip_data(zip_code)
);

CREATE TABLE area_code (
  zip_code INTEGER,
  area_code INTEGER,
  FOREIGN KEY (zip_code) REFERENCES zip_data(zip_code)
);

CREATE TABLE avoid (
  zip_code INTEGER,
  bad_alias TEXT,
  FOREIGN KEY (zip_code) REFERENCES zip_data(zip_code)
);

CREATE TABLE country (
  zip_code INTEGER,
  county TEXT,
  state TEXT,
  FOREIGN KEY (zip_code) REFERENCES zip_data(zip_code),
  FOREIGN KEY (state) REFERENCES state(abbreviation)
);

CREATE TABLE zip_congress (
  zip_code INTEGER,
  district TEXT,
  FOREIGN KEY (zip_code) REFERENCES zip_data(zip_code),
  FOREIGN KEY (district) REFERENCES congress(cognress_rep_id)
);
