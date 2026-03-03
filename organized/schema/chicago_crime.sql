CREATE TABLE Community_Area (
  community_area_no INTEGER,
  community_area_name TEXT,
  side TEXT,
  population TEXT,
  PRIMARY KEY (community_area_no)
);

CREATE TABLE District (
  district_no INTEGER,
  district_name TEXT,
  address TEXT,
  zip_code INTEGER,
  commander TEXT,
  email TEXT,
  phone TEXT,
  fax TEXT,
  tty TEXT,
  twitter TEXT,
  PRIMARY KEY (district_no)
);

CREATE TABLE FBI_Code (
  fbi_code_no TEXT,
  title TEXT,
  description TEXT,
  crime_against TEXT,
  PRIMARY KEY (fbi_code_no)
);

CREATE TABLE IUCR (
  iucr_no TEXT,
  primary_description TEXT,
  secondary_description TEXT,
  index_code TEXT,
  PRIMARY KEY (iucr_no)
);

CREATE TABLE Neighborhood (
  neighborhood_name TEXT,
  community_area_no INTEGER,
  PRIMARY KEY (neighborhood_name),
  FOREIGN KEY (community_area_no) REFERENCES Community_Area(community_area_no)
);

CREATE TABLE Ward (
  ward_no INTEGER,
  alderman_first_name TEXT,
  alderman_last_name TEXT,
  alderman_name_suffix TEXT,
  ward_office_address TEXT,
  ward_office_zip TEXT,
  ward_email TEXT,
  ward_office_phone TEXT,
  ward_office_fax TEXT,
  city_hall_office_room INTEGER,
  city_hall_office_phone TEXT,
  city_hall_office_fax TEXT,
  Population INTEGER,
  PRIMARY KEY (ward_no)
);

CREATE TABLE Crime (
  report_no INTEGER,
  case_number TEXT,
  date TEXT,
  block TEXT,
  iucr_no TEXT,
  location_description TEXT,
  arrest TEXT,
  domestic TEXT,
  beat INTEGER,
  district_no INTEGER,
  ward_no INTEGER,
  community_area_no INTEGER,
  fbi_code_no TEXT,
  latitude TEXT,
  longitude TEXT,
  PRIMARY KEY (report_no),
  FOREIGN KEY (iucr_no) REFERENCES IUCR(iucr_no),
  FOREIGN KEY (district_no) REFERENCES District(district_no),
  FOREIGN KEY (ward_no) REFERENCES Ward(ward_no),
  FOREIGN KEY (community_area_no) REFERENCES Community_Area(community_area_no),
  FOREIGN KEY (fbi_code_no) REFERENCES FBI_Code(fbi_code_no)
);
