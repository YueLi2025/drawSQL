CREATE TABLE incidents (
  case_number TEXT,
  date TEXT,
  location TEXT,
  subject_statuses TEXT,
  subject_weapon TEXT,
  subjects TEXT,
  subject_count INTEGER,
  officers TEXT,
  PRIMARY KEY (case_number)
);

CREATE TABLE officers (
  case_number TEXT,
  race TEXT,
  gender TEXT,
  last_name TEXT,
  first_name TEXT,
  full_name TEXT,
  FOREIGN KEY (case_number) REFERENCES incidents(case_number)
);

CREATE TABLE subjects (
  case_number TEXT,
  race TEXT,
  gender TEXT,
  last_name TEXT,
  first_name TEXT,
  full_name TEXT,
  FOREIGN KEY (case_number) REFERENCES incidents(case_number)
);
