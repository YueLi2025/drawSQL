CREATE TABLE Customers (
  CustomerID INTEGER,
  "Customer Names" TEXT,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Products (
  ProductID INTEGER,
  "Product Name" TEXT,
  PRIMARY KEY (ProductID)
);

CREATE TABLE Regions (
  StateCode TEXT,
  State TEXT,
  Region TEXT,
  PRIMARY KEY (StateCode)
);

CREATE TABLE "Sales Team" (
  SalesTeamID INTEGER,
  "Sales Team" TEXT,
  Region TEXT,
  PRIMARY KEY (SalesTeamID)
);

CREATE TABLE "Store Locations" (
  StoreID INTEGER,
  "City Name" TEXT,
  County TEXT,
  StateCode TEXT,
  State TEXT,
  Type TEXT,
  Latitude REAL,
  Longitude REAL,
  AreaCode INTEGER,
  Population INTEGER,
  "Household Income" INTEGER,
  "Median Income" INTEGER,
  "Land Area" INTEGER,
  "Water Area" INTEGER,
  "Time Zone" TEXT,
  PRIMARY KEY (StoreID),
  FOREIGN KEY (StateCode) REFERENCES Regions(StateCode)
);

CREATE TABLE "Sales Orders" (
  OrderNumber TEXT,
  "Sales Channel" TEXT,
  WarehouseCode TEXT,
  ProcuredDate TEXT,
  OrderDate TEXT,
  ShipDate TEXT,
  DeliveryDate TEXT,
  CurrencyCode TEXT,
  _SalesTeamID INTEGER,
  _CustomerID INTEGER,
  _StoreID INTEGER,
  _ProductID INTEGER,
  "Order Quantity" INTEGER,
  "Discount Applied" REAL,
  "Unit Price" TEXT,
  "Unit Cost" TEXT,
  PRIMARY KEY (OrderNumber),
  FOREIGN KEY (_SalesTeamID) REFERENCES "Sales Team"(SalesTeamID),
  FOREIGN KEY (_CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (_StoreID) REFERENCES "Store Locations"(StoreID),
  FOREIGN KEY (_ProductID) REFERENCES Products(ProductID)
);
