CREATE TABLE offices (
  officeCode TEXT,
  city TEXT,
  phone TEXT,
  addressLine1 TEXT,
  addressLine2 TEXT,
  state TEXT,
  country TEXT,
  postalCode TEXT,
  territory TEXT,
  PRIMARY KEY (officeCode)
);

CREATE TABLE employees (
  employeeNumber INTEGER,
  lastName TEXT,
  firstName TEXT,
  extension TEXT,
  email TEXT,
  officeCode TEXT,
  reportsTo INTEGER,
  jobTitle TEXT,
  PRIMARY KEY (employeeNumber),
  FOREIGN KEY (officeCode) REFERENCES offices(officeCode),
  FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber)
);

CREATE TABLE customers (
  customerNumber INTEGER,
  customerName TEXT,
  contactLastName TEXT,
  contactFirstName TEXT,
  phone TEXT,
  addressLine1 TEXT,
  addressLine2 TEXT,
  city TEXT,
  state TEXT,
  postalCode TEXT,
  country TEXT,
  salesRepEmployeeNumber INTEGER,
  creditLimit REAL,
  PRIMARY KEY (customerNumber),
  FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber)
);

CREATE TABLE orders (
  orderNumber INTEGER,
  orderDate TEXT,
  requiredDate TEXT,
  shippedDate TEXT,
  status TEXT,
  comments TEXT,
  customerNumber INTEGER,
  PRIMARY KEY (orderNumber),
  FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

CREATE TABLE payments (
  customerNumber INTEGER,
  checkNumber TEXT,
  paymentDate TEXT,
  amount REAL,
  FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

CREATE TABLE productlines (
  productLine TEXT,
  textDescription TEXT,
  htmlDescription TEXT,
  image TEXT,
  PRIMARY KEY (productLine)
);

CREATE TABLE products (
  productCode TEXT,
  productName TEXT,
  productLine TEXT,
  productScale TEXT,
  productVendor TEXT,
  productDescription TEXT,
  quantityInStock INTEGER,
  buyPrice REAL,
  MSRP REAL,
  PRIMARY KEY (productCode),
  FOREIGN KEY (productLine) REFERENCES productlines(productLine)
);

CREATE TABLE orderdetails (
  orderNumber INTEGER,
  productCode TEXT,
  quantityOrdered INTEGER,
  priceEach REAL,
  orderLineNumber INTEGER
);
