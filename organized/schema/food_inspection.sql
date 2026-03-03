CREATE TABLE businesses (
  business_id INTEGER,
  name TEXT,
  address TEXT,
  city TEXT,
  postal_code TEXT,
  latitude REAL,
  longitude REAL,
  phone_number INTEGER,
  tax_code TEXT,
  business_certificate INTEGER,
  application_date TEXT,
  owner_name TEXT,
  owner_address TEXT,
  owner_city TEXT,
  owner_state TEXT,
  owner_zip TEXT,
  PRIMARY KEY (business_id)
);

CREATE TABLE inspections (
  business_id INTEGER,
  score INTEGER,
  date TEXT,
  type TEXT,
  FOREIGN KEY (business_id) REFERENCES businesses(business_id)
);

CREATE TABLE violations (
  business_id INTEGER,
  date TEXT,
  violation_type_id TEXT,
  risk_category TEXT,
  description TEXT,
  FOREIGN KEY (business_id) REFERENCES businesses(business_id)
);
