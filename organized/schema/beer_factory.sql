CREATE TABLE customers (
  CustomerID INTEGER,
  First TEXT,
  Last TEXT,
  StreetAddress TEXT,
  City TEXT,
  State TEXT,
  ZipCode INTEGER,
  Email TEXT,
  PhoneNumber TEXT,
  FirstPurchaseDate TEXT,
  SubscribedToEmailList TEXT,
  Gender TEXT,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE geolocation (
  LocationID INTEGER,
  Latitude REAL,
  Longitude REAL,
  PRIMARY KEY (LocationID),
  FOREIGN KEY (LocationID) REFERENCES location(LocationID)
);

CREATE TABLE location (
  LocationID INTEGER,
  LocationName TEXT,
  StreetAddress TEXT,
  City TEXT,
  State TEXT,
  ZipCode INTEGER,
  PRIMARY KEY (LocationID),
  FOREIGN KEY (LocationID) REFERENCES geolocation(LocationID)
);

CREATE TABLE rootbeerbrand (
  BrandID INTEGER,
  BrandName TEXT,
  FirstBrewedYear INTEGER,
  BreweryName TEXT,
  City TEXT,
  State TEXT,
  Country TEXT,
  Description TEXT,
  CaneSugar TEXT,
  CornSyrup TEXT,
  Honey TEXT,
  ArtificialSweetener TEXT,
  Caffeinated TEXT,
  Alcoholic TEXT,
  AvailableInCans TEXT,
  AvailableInBottles TEXT,
  AvailableInKegs TEXT,
  Website TEXT,
  FacebookPage TEXT,
  Twitter TEXT,
  WholesaleCost REAL,
  CurrentRetailPrice REAL,
  PRIMARY KEY (BrandID)
);

CREATE TABLE rootbeer (
  RootBeerID INTEGER,
  BrandID INTEGER,
  ContainerType TEXT,
  LocationID INTEGER,
  PurchaseDate TEXT,
  PRIMARY KEY (RootBeerID),
  FOREIGN KEY (BrandID) REFERENCES rootbeerbrand(BrandID),
  FOREIGN KEY (LocationID) REFERENCES geolocation(LocationID)
);

CREATE TABLE rootbeerreview (
  CustomerID INTEGER,
  BrandID INTEGER,
  StarRating INTEGER,
  ReviewDate TEXT,
  Review TEXT,
  FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
  FOREIGN KEY (BrandID) REFERENCES rootbeerbrand(BrandID)
);

CREATE TABLE transaction (
  TransactionID INTEGER,
  CreditCardNumber INTEGER,
  CustomerID INTEGER,
  TransactionDate TEXT,
  CreditCardType TEXT,
  LocationID INTEGER,
  RootBeerID INTEGER,
  PurchasePrice REAL,
  PRIMARY KEY (TransactionID),
  FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
  FOREIGN KEY (LocationID) REFERENCES location(LocationID),
  FOREIGN KEY (RootBeerID) REFERENCES rootbeer(RootBeerID)
);
