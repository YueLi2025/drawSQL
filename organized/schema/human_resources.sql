CREATE TABLE location (
  locationID INTEGER,
  locationcity TEXT,
  address TEXT,
  state TEXT,
  zipcode INTEGER,
  officephone TEXT,
  PRIMARY KEY (locationID)
);

CREATE TABLE position (
  positionID INTEGER,
  positiontitle TEXT,
  educationrequired TEXT,
  minsalary TEXT,
  maxsalary TEXT,
  PRIMARY KEY (positionID)
);

CREATE TABLE employee (
  ssn TEXT,
  lastname TEXT,
  firstname TEXT,
  hiredate TEXT,
  salary TEXT,
  gender TEXT,
  performance TEXT,
  positionID INTEGER,
  locationID INTEGER,
  PRIMARY KEY (ssn),
  FOREIGN KEY (positionID) REFERENCES position(positionID),
  FOREIGN KEY (locationID) REFERENCES location(locationID)
);
