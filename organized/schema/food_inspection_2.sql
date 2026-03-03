CREATE TABLE employee (
  employee_id INTEGER,
  first_name TEXT,
  last_name TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  zip INTEGER,
  phone TEXT,
  title TEXT,
  salary INTEGER,
  supervisor INTEGER,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (supervisor) REFERENCES employee(employee_id)
);

CREATE TABLE establishment (
  license_no INTEGER,
  dba_name TEXT,
  aka_name TEXT,
  facility_type TEXT,
  risk_level INTEGER,
  address TEXT,
  city TEXT,
  state TEXT,
  zip INTEGER,
  latitude REAL,
  longitude REAL,
  ward INTEGER,
  PRIMARY KEY (license_no)
);

CREATE TABLE inspection (
  inspection_id INTEGER,
  inspection_date TEXT,
  inspection_type TEXT,
  results TEXT,
  employee_id INTEGER,
  license_no INTEGER,
  followup_to INTEGER,
  PRIMARY KEY (inspection_id),
  FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  FOREIGN KEY (license_no) REFERENCES establishment(license_no),
  FOREIGN KEY (followup_to) REFERENCES inspection(inspection_id)
);

CREATE TABLE inspection_point (
  point_id INTEGER,
  Description TEXT,
  category TEXT,
  code TEXT,
  fine INTEGER,
  point_level TEXT,
  PRIMARY KEY (point_id)
);

CREATE TABLE violation (
  inspection_id INTEGER,
  point_id INTEGER,
  fine INTEGER,
  inspector_comment TEXT,
  FOREIGN KEY (inspection_id) REFERENCES inspection(inspection_id),
  FOREIGN KEY (point_id) REFERENCES inspection_point(point_id)
);
