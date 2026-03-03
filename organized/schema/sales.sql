CREATE TABLE Customers (
  CustomerID INTEGER,
  FirstName TEXT,
  MiddleInitial TEXT,
  LastName TEXT,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Employees (
  EmployeeID INTEGER,
  FirstName TEXT,
  MiddleInitial TEXT,
  LastName TEXT,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE Products (
  ProductID INTEGER,
  Name TEXT,
  Price REAL,
  PRIMARY KEY (ProductID)
);

CREATE TABLE Sales (
  SalesID INTEGER,
  SalesPersonID INTEGER,
  CustomerID INTEGER,
  ProductID INTEGER,
  Quantity INTEGER,
  PRIMARY KEY (SalesID),
  FOREIGN KEY (SalesPersonID) REFERENCES Employees(EmployeeID),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
