CREATE TABLE state (
  StateCode TEXT,
  State TEXT,
  Region TEXT,
  PRIMARY KEY (StateCode)
);

CREATE TABLE callcenterlogs (
  "Date received" TEXT,
  "Complaint ID" TEXT,
  "rand client" TEXT,
  phonefinal TEXT,
  vru+line TEXT,
  call_id INTEGER,
  priority INTEGER,
  type TEXT,
  outcome TEXT,
  server TEXT,
  ser_start TEXT,
  ser_exit TEXT,
  ser_time TEXT,
  PRIMARY KEY ("Complaint ID"),
  FOREIGN KEY ("rand client") REFERENCES client(client_id)
);

CREATE TABLE client (
  client_id TEXT,
  sex TEXT,
  day INTEGER,
  month INTEGER,
  year INTEGER,
  age INTEGER,
  social TEXT,
  first TEXT,
  middle TEXT,
  last TEXT,
  phone TEXT,
  email TEXT,
  address_1 TEXT,
  address_2 TEXT,
  city TEXT,
  state TEXT,
  zipcode INTEGER,
  district_id INTEGER,
  PRIMARY KEY (client_id),
  FOREIGN KEY (district_id) REFERENCES district(district_id)
);

CREATE TABLE district (
  district_id INTEGER,
  city TEXT,
  state_abbrev TEXT,
  division TEXT,
  PRIMARY KEY (district_id),
  FOREIGN KEY (state_abbrev) REFERENCES state(StateCode)
);

CREATE TABLE events (
  "Date received" TEXT,
  Product TEXT,
  "Sub-product" TEXT,
  Issue TEXT,
  "Sub-issue" TEXT,
  "Consumer complaint narrative" TEXT,
  Tags TEXT,
  "Consumer consent provided?" TEXT,
  "Submitted via" TEXT,
  "Date sent to company" TEXT,
  "Company response to consumer" TEXT,
  "Timely response?" TEXT,
  "Consumer disputed?" TEXT,
  "Complaint ID" TEXT,
  Client_ID TEXT,
  FOREIGN KEY ("Complaint ID") REFERENCES callcenterlogs("Complaint ID"),
  FOREIGN KEY (Client_ID) REFERENCES client(client_id)
);

CREATE TABLE reviews (
  Date TEXT,
  Stars INTEGER,
  Reviews TEXT,
  Product TEXT,
  district_id INTEGER,
  PRIMARY KEY (Date),
  FOREIGN KEY (district_id) REFERENCES district(district_id)
);
