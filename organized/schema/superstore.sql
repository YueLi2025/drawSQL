CREATE TABLE people (
  "Customer ID" TEXT,
  "Customer Name" TEXT,
  Segment TEXT,
  Country TEXT,
  City TEXT,
  State TEXT,
  "Postal Code" INTEGER,
  Region TEXT
);

CREATE TABLE product (
  "Product ID" TEXT,
  "Product Name" TEXT,
  Category TEXT,
  "Sub-Category" TEXT,
  Region TEXT
);

CREATE TABLE central_superstore (
  "Row ID" INTEGER,
  "Order ID" TEXT,
  "Order Date" TEXT,
  "Ship Date" TEXT,
  "Ship Mode" TEXT,
  "Customer ID" TEXT,
  Region TEXT,
  "Product ID" TEXT,
  Sales REAL,
  Quantity INTEGER,
  Discount REAL,
  Profit REAL,
  PRIMARY KEY ("Row ID"),
  FOREIGN KEY ("Customer ID") REFERENCES people("Customer ID"),
  FOREIGN KEY (Region) REFERENCES people(Region),
  FOREIGN KEY ("Product ID") REFERENCES product("Product ID")
);

CREATE TABLE east_superstore (
  "Row ID" INTEGER,
  "Order ID" TEXT,
  "Order Date" TEXT,
  "Ship Date" TEXT,
  "Ship Mode" TEXT,
  "Customer ID" TEXT,
  Region TEXT,
  "Product ID" TEXT,
  Sales REAL,
  Quantity INTEGER,
  Discount REAL,
  Profit REAL,
  PRIMARY KEY ("Row ID"),
  FOREIGN KEY ("Customer ID") REFERENCES people("Customer ID"),
  FOREIGN KEY (Region) REFERENCES people(Region),
  FOREIGN KEY ("Product ID") REFERENCES product("Product ID")
);

CREATE TABLE south_superstore (
  "Row ID" INTEGER,
  "Order ID" TEXT,
  "Order Date" TEXT,
  "Ship Date" TEXT,
  "Ship Mode" TEXT,
  "Customer ID" TEXT,
  Region TEXT,
  "Product ID" TEXT,
  Sales REAL,
  Quantity INTEGER,
  Discount REAL,
  Profit REAL,
  PRIMARY KEY ("Row ID"),
  FOREIGN KEY ("Customer ID") REFERENCES people("Customer ID"),
  FOREIGN KEY (Region) REFERENCES people(Region),
  FOREIGN KEY ("Product ID") REFERENCES product("Product ID")
);

CREATE TABLE west_superstore (
  "Row ID" INTEGER,
  "Order ID" TEXT,
  "Order Date" TEXT,
  "Ship Date" TEXT,
  "Ship Mode" TEXT,
  "Customer ID" TEXT,
  Region TEXT,
  "Product ID" TEXT,
  Sales REAL,
  Quantity INTEGER,
  Discount REAL,
  Profit REAL,
  PRIMARY KEY ("Row ID"),
  FOREIGN KEY ("Customer ID") REFERENCES people("Customer ID"),
  FOREIGN KEY (Region) REFERENCES people(Region),
  FOREIGN KEY ("Product ID") REFERENCES product("Product ID")
);
