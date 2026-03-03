CREATE TABLE Categories (
  CategoryID INTEGER,
  CategoryName TEXT,
  Description TEXT,
  PRIMARY KEY (CategoryID)
);

CREATE TABLE Customers (
  CustomerID INTEGER,
  CustomerName TEXT,
  ContactName TEXT,
  Address TEXT,
  City TEXT,
  PostalCode TEXT,
  Country TEXT,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Employees (
  EmployeeID INTEGER,
  LastName TEXT,
  FirstName TEXT,
  BirthDate TEXT,
  Photo TEXT,
  Notes TEXT,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE Shippers (
  ShipperID INTEGER,
  ShipperName TEXT,
  Phone TEXT,
  PRIMARY KEY (ShipperID)
);

CREATE TABLE Suppliers (
  SupplierID INTEGER,
  SupplierName TEXT,
  ContactName TEXT,
  Address TEXT,
  City TEXT,
  PostalCode TEXT,
  Country TEXT,
  Phone TEXT,
  PRIMARY KEY (SupplierID)
);

CREATE TABLE Products (
  ProductID INTEGER,
  ProductName TEXT,
  SupplierID INTEGER,
  CategoryID INTEGER,
  Unit TEXT,
  Price REAL,
  PRIMARY KEY (ProductID),
  FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
  FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
  OrderID INTEGER,
  CustomerID INTEGER,
  EmployeeID INTEGER,
  OrderDate TEXT,
  ShipperID INTEGER,
  PRIMARY KEY (OrderID),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
  FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);

CREATE TABLE OrderDetails (
  OrderDetailID INTEGER,
  OrderID INTEGER,
  ProductID INTEGER,
  Quantity INTEGER,
  PRIMARY KEY (OrderDetailID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
