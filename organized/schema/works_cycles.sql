CREATE TABLE CountryRegion (
  CountryRegionCode TEXT,
  Name TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (CountryRegionCode)
);

CREATE TABLE Culture (
  CultureID TEXT,
  Name TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (CultureID)
);

CREATE TABLE Currency (
  CurrencyCode TEXT,
  Name TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (CurrencyCode)
);

CREATE TABLE CountryRegionCurrency (
  CountryRegionCode TEXT,
  CurrencyCode TEXT,
  ModifiedDate TEXT,
  FOREIGN KEY (CountryRegionCode) REFERENCES CountryRegion(CountryRegionCode),
  FOREIGN KEY (CurrencyCode) REFERENCES Currency(CurrencyCode)
);

CREATE TABLE Person (
  BusinessEntityID INTEGER,
  PersonType TEXT,
  NameStyle INTEGER,
  Title TEXT,
  FirstName TEXT,
  MiddleName TEXT,
  LastName TEXT,
  Suffix TEXT,
  EmailPromotion INTEGER,
  AdditionalContactInfo TEXT,
  Demographics TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (BusinessEntityID),
  FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity(BusinessEntityID)
);

CREATE TABLE BusinessEntityContact (
  BusinessEntityID INTEGER,
  PersonID INTEGER,
  ContactTypeID INTEGER,
  rowguid TEXT,
  ModifiedDate TEXT,
  FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity(BusinessEntityID),
  FOREIGN KEY (PersonID) REFERENCES Person(BusinessEntityID),
  FOREIGN KEY (ContactTypeID) REFERENCES ContactType(ContactTypeID)
);

CREATE TABLE EmailAddress (
  BusinessEntityID INTEGER,
  EmailAddressID INTEGER,
  EmailAddress TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  FOREIGN KEY (BusinessEntityID) REFERENCES Person(BusinessEntityID)
);

CREATE TABLE Employee (
  BusinessEntityID INTEGER,
  NationalIDNumber TEXT,
  LoginID TEXT,
  OrganizationNode TEXT,
  OrganizationLevel INTEGER,
  JobTitle TEXT,
  BirthDate TEXT,
  MaritalStatus TEXT,
  Gender TEXT,
  HireDate TEXT,
  SalariedFlag INTEGER,
  VacationHours INTEGER,
  SickLeaveHours INTEGER,
  CurrentFlag INTEGER,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (BusinessEntityID),
  FOREIGN KEY (BusinessEntityID) REFERENCES Person(BusinessEntityID)
);

CREATE TABLE Password (
  BusinessEntityID INTEGER,
  PasswordHash TEXT,
  PasswordSalt TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (BusinessEntityID),
  FOREIGN KEY (BusinessEntityID) REFERENCES Person(BusinessEntityID)
);

CREATE TABLE PersonCreditCard (
  BusinessEntityID INTEGER,
  CreditCardID INTEGER,
  ModifiedDate TEXT,
  FOREIGN KEY (BusinessEntityID) REFERENCES Person(BusinessEntityID),
  FOREIGN KEY (CreditCardID) REFERENCES CreditCard(CreditCardID)
);

CREATE TABLE ProductCategory (
  ProductCategoryID INTEGER,
  Name TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ProductCategoryID)
);

CREATE TABLE ProductDescription (
  ProductDescriptionID INTEGER,
  Description TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ProductDescriptionID)
);

CREATE TABLE ProductModel (
  ProductModelID INTEGER,
  Name TEXT,
  CatalogDescription TEXT,
  Instructions TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ProductModelID)
);

CREATE TABLE ProductModelProductDescriptionCulture (
  ProductModelID INTEGER,
  ProductDescriptionID INTEGER,
  CultureID TEXT,
  ModifiedDate TEXT,
  FOREIGN KEY (ProductModelID) REFERENCES ProductModel(ProductModelID),
  FOREIGN KEY (ProductDescriptionID) REFERENCES ProductDescription(ProductDescriptionID),
  FOREIGN KEY (CultureID) REFERENCES Culture(CultureID)
);

CREATE TABLE ProductPhoto (
  ProductPhotoID INTEGER,
  ThumbNailPhoto TEXT,
  ThumbnailPhotoFileName TEXT,
  LargePhoto TEXT,
  LargePhotoFileName TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ProductPhotoID)
);

CREATE TABLE ProductSubcategory (
  ProductSubcategoryID INTEGER,
  ProductCategoryID INTEGER,
  Name TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ProductSubcategoryID),
  FOREIGN KEY (ProductCategoryID) REFERENCES ProductCategory(ProductCategoryID)
);

CREATE TABLE SalesReason (
  SalesReasonID INTEGER,
  Name TEXT,
  ReasonType TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (SalesReasonID)
);

CREATE TABLE SalesTerritory (
  TerritoryID INTEGER,
  Name TEXT,
  CountryRegionCode TEXT,
  "Group" TEXT,
  SalesYTD REAL,
  SalesLastYear REAL,
  CostYTD REAL,
  CostLastYear REAL,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (TerritoryID),
  FOREIGN KEY (CountryRegionCode) REFERENCES CountryRegion(CountryRegionCode)
);

CREATE TABLE SalesPerson (
  BusinessEntityID INTEGER,
  TerritoryID INTEGER,
  SalesQuota REAL,
  Bonus REAL,
  CommissionPct REAL,
  SalesYTD REAL,
  SalesLastYear REAL,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (BusinessEntityID),
  FOREIGN KEY (BusinessEntityID) REFERENCES Employee(BusinessEntityID),
  FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory(TerritoryID)
);

CREATE TABLE SalesPersonQuotaHistory (
  BusinessEntityID INTEGER,
  QuotaDate TEXT,
  SalesQuota REAL,
  rowguid TEXT,
  ModifiedDate TEXT,
  FOREIGN KEY (BusinessEntityID) REFERENCES SalesPerson(BusinessEntityID)
);

CREATE TABLE SalesTerritoryHistory (
  BusinessEntityID INTEGER,
  TerritoryID INTEGER,
  StartDate TEXT,
  EndDate TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  FOREIGN KEY (BusinessEntityID) REFERENCES SalesPerson(BusinessEntityID),
  FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory(TerritoryID)
);

CREATE TABLE ScrapReason (
  ScrapReasonID INTEGER,
  Name TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ScrapReasonID)
);

CREATE TABLE Shift (
  ShiftID INTEGER,
  Name TEXT,
  StartTime TEXT,
  EndTime TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ShiftID)
);

CREATE TABLE ShipMethod (
  ShipMethodID INTEGER,
  Name TEXT,
  ShipBase REAL,
  ShipRate REAL,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ShipMethodID)
);

CREATE TABLE SpecialOffer (
  SpecialOfferID INTEGER,
  Description TEXT,
  DiscountPct REAL,
  Type TEXT,
  Category TEXT,
  StartDate TEXT,
  EndDate TEXT,
  MinQty INTEGER,
  MaxQty INTEGER,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (SpecialOfferID)
);

CREATE TABLE BusinessEntityAddress (
  BusinessEntityID INTEGER,
  AddressID INTEGER,
  AddressTypeID INTEGER,
  rowguid TEXT,
  ModifiedDate TEXT,
  FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity(BusinessEntityID),
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
  FOREIGN KEY (AddressTypeID) REFERENCES AddressType(AddressTypeID)
);

CREATE TABLE SalesTaxRate (
  SalesTaxRateID INTEGER,
  StateProvinceID INTEGER,
  TaxType INTEGER,
  TaxRate REAL,
  Name TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (SalesTaxRateID),
  FOREIGN KEY (StateProvinceID) REFERENCES StateProvince(StateProvinceID)
);

CREATE TABLE Store (
  BusinessEntityID INTEGER,
  Name TEXT,
  SalesPersonID INTEGER,
  Demographics TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (BusinessEntityID),
  FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity(BusinessEntityID),
  FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(BusinessEntityID)
);

CREATE TABLE SalesOrderHeaderSalesReason (
  SalesOrderID INTEGER,
  SalesReasonID INTEGER,
  ModifiedDate TEXT,
  FOREIGN KEY (SalesOrderID) REFERENCES SalesOrderHeader(SalesOrderID),
  FOREIGN KEY (SalesReasonID) REFERENCES SalesReason(SalesReasonID)
);

CREATE TABLE TransactionHistoryArchive (
  TransactionID INTEGER,
  ProductID INTEGER,
  ReferenceOrderID INTEGER,
  ReferenceOrderLineID INTEGER,
  TransactionDate TEXT,
  TransactionType TEXT,
  Quantity INTEGER,
  ActualCost REAL,
  ModifiedDate TEXT,
  PRIMARY KEY (TransactionID)
);

CREATE TABLE UnitMeasure (
  UnitMeasureCode TEXT,
  Name TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (UnitMeasureCode)
);

CREATE TABLE ProductCostHistory (
  ProductID INTEGER,
  StartDate TEXT,
  EndDate TEXT,
  StandardCost REAL,
  ModifiedDate TEXT,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ProductDocument (
  ProductID INTEGER,
  DocumentNode TEXT,
  ModifiedDate TEXT,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (DocumentNode) REFERENCES Document(DocumentNode)
);

CREATE TABLE ProductInventory (
  ProductID INTEGER,
  LocationID INTEGER,
  Shelf TEXT,
  Bin INTEGER,
  Quantity INTEGER,
  rowguid TEXT,
  ModifiedDate TEXT,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE ProductProductPhoto (
  ProductID INTEGER,
  ProductPhotoID INTEGER,
  Primary INTEGER,
  ModifiedDate TEXT,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (ProductPhotoID) REFERENCES ProductPhoto(ProductPhotoID)
);

CREATE TABLE ProductReview (
  ProductReviewID INTEGER,
  ProductID INTEGER,
  ReviewerName TEXT,
  ReviewDate TEXT,
  EmailAddress TEXT,
  Rating INTEGER,
  Comments TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ProductReviewID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ShoppingCartItem (
  ShoppingCartItemID INTEGER,
  ShoppingCartID TEXT,
  Quantity INTEGER,
  ProductID INTEGER,
  DateCreated TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ShoppingCartItemID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE SpecialOfferProduct (
  SpecialOfferID INTEGER,
  ProductID INTEGER,
  rowguid TEXT,
  ModifiedDate TEXT,
  FOREIGN KEY (SpecialOfferID) REFERENCES SpecialOffer(SpecialOfferID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE SalesOrderDetail (
  SalesOrderID INTEGER,
  SalesOrderDetailID INTEGER,
  CarrierTrackingNumber TEXT,
  OrderQty INTEGER,
  ProductID INTEGER,
  SpecialOfferID INTEGER,
  UnitPrice REAL,
  UnitPriceDiscount REAL,
  LineTotal REAL,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (SalesOrderDetailID),
  FOREIGN KEY (SalesOrderID) REFERENCES SalesOrderHeader(SalesOrderID),
  FOREIGN KEY (ProductID) REFERENCES SpecialOfferProduct(ProductID),
  FOREIGN KEY (SpecialOfferID) REFERENCES SpecialOfferProduct(SpecialOfferID)
);

CREATE TABLE TransactionHistory (
  TransactionID INTEGER,
  ProductID INTEGER,
  ReferenceOrderID INTEGER,
  ReferenceOrderLineID INTEGER,
  TransactionDate TEXT,
  TransactionType TEXT,
  Quantity INTEGER,
  ActualCost REAL,
  ModifiedDate TEXT,
  PRIMARY KEY (TransactionID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Vendor (
  BusinessEntityID INTEGER,
  AccountNumber TEXT,
  Name TEXT,
  CreditRating INTEGER,
  PreferredVendorStatus INTEGER,
  ActiveFlag INTEGER,
  PurchasingWebServiceURL TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (BusinessEntityID),
  FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity(BusinessEntityID)
);

CREATE TABLE ProductVendor (
  ProductID INTEGER,
  BusinessEntityID INTEGER,
  AverageLeadTime INTEGER,
  StandardPrice REAL,
  LastReceiptCost REAL,
  LastReceiptDate TEXT,
  MinOrderQty INTEGER,
  MaxOrderQty INTEGER,
  OnOrderQty INTEGER,
  UnitMeasureCode TEXT,
  ModifiedDate TEXT,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (BusinessEntityID) REFERENCES Vendor(BusinessEntityID),
  FOREIGN KEY (UnitMeasureCode) REFERENCES UnitMeasure(UnitMeasureCode)
);

CREATE TABLE PurchaseOrderHeader (
  PurchaseOrderID INTEGER,
  RevisionNumber INTEGER,
  Status INTEGER,
  EmployeeID INTEGER,
  VendorID INTEGER,
  ShipMethodID INTEGER,
  OrderDate TEXT,
  ShipDate TEXT,
  SubTotal REAL,
  TaxAmt REAL,
  Freight REAL,
  TotalDue REAL,
  ModifiedDate TEXT,
  PRIMARY KEY (PurchaseOrderID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(BusinessEntityID),
  FOREIGN KEY (VendorID) REFERENCES Vendor(BusinessEntityID),
  FOREIGN KEY (ShipMethodID) REFERENCES ShipMethod(ShipMethodID)
);

CREATE TABLE PurchaseOrderDetail (
  PurchaseOrderID INTEGER,
  PurchaseOrderDetailID INTEGER,
  DueDate TEXT,
  OrderQty INTEGER,
  ProductID INTEGER,
  UnitPrice REAL,
  LineTotal REAL,
  ReceivedQty REAL,
  RejectedQty REAL,
  StockedQty REAL,
  ModifiedDate TEXT,
  PRIMARY KEY (PurchaseOrderDetailID),
  FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrderHeader(PurchaseOrderID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE WorkOrder (
  WorkOrderID INTEGER,
  ProductID INTEGER,
  OrderQty INTEGER,
  StockedQty INTEGER,
  ScrappedQty INTEGER,
  StartDate TEXT,
  EndDate TEXT,
  DueDate TEXT,
  ScrapReasonID INTEGER,
  ModifiedDate TEXT,
  PRIMARY KEY (WorkOrderID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (ScrapReasonID) REFERENCES ScrapReason(ScrapReasonID)
);

CREATE TABLE WorkOrderRouting (
  WorkOrderID INTEGER,
  ProductID INTEGER,
  OperationSequence INTEGER,
  LocationID INTEGER,
  ScheduledStartDate TEXT,
  ScheduledEndDate TEXT,
  ActualStartDate TEXT,
  ActualEndDate TEXT,
  ActualResourceHrs REAL,
  PlannedCost REAL,
  ActualCost REAL,
  ModifiedDate TEXT,
  FOREIGN KEY (WorkOrderID) REFERENCES WorkOrder(WorkOrderID),
  FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Customer (
  CustomerID INTEGER,
  PersonID INTEGER,
  StoreID INTEGER,
  TerritoryID INTEGER,
  AccountNumber TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (CustomerID),
  FOREIGN KEY (PersonID) REFERENCES Person(BusinessEntityID),
  FOREIGN KEY (StoreID) REFERENCES Store(BusinessEntityID),
  FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory(TerritoryID)
);

CREATE TABLE ProductListPriceHistory (
  ProductID INTEGER,
  StartDate TEXT,
  EndDate TEXT,
  ListPrice REAL,
  ModifiedDate TEXT,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Address (
  AddressID INTEGER,
  AddressLine1 TEXT,
  AddressLine2 TEXT,
  City TEXT,
  StateProvinceID INTEGER,
  PostalCode TEXT,
  SpatialLocation TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (AddressID)
);

CREATE TABLE AddressType (
  AddressTypeID INTEGER,
  Name TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (AddressTypeID)
);

CREATE TABLE BillOfMaterials (
  BillOfMaterialsID INTEGER,
  ProductAssemblyID INTEGER,
  ComponentID INTEGER,
  StartDate TEXT,
  EndDate TEXT,
  UnitMeasureCode TEXT,
  BOMLevel INTEGER,
  PerAssemblyQty REAL,
  ModifiedDate TEXT,
  PRIMARY KEY (BillOfMaterialsID)
);

CREATE TABLE BusinessEntity (
  BusinessEntityID INTEGER,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (BusinessEntityID)
);

CREATE TABLE ContactType (
  ContactTypeID INTEGER,
  Name TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ContactTypeID)
);

CREATE TABLE CurrencyRate (
  CurrencyRateID INTEGER,
  CurrencyRateDate TEXT,
  FromCurrencyCode TEXT,
  ToCurrencyCode TEXT,
  AverageRate REAL,
  EndOfDayRate REAL,
  ModifiedDate TEXT,
  PRIMARY KEY (CurrencyRateID)
);

CREATE TABLE Department (
  DepartmentID INTEGER,
  Name TEXT,
  GroupName TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (DepartmentID)
);

CREATE TABLE EmployeeDepartmentHistory (
  BusinessEntityID INTEGER,
  DepartmentID INTEGER,
  ShiftID INTEGER,
  StartDate TEXT,
  EndDate TEXT,
  ModifiedDate TEXT
);

CREATE TABLE EmployeePayHistory (
  BusinessEntityID INTEGER,
  RateChangeDate TEXT,
  Rate REAL,
  PayFrequency INTEGER,
  ModifiedDate TEXT
);

CREATE TABLE JobCandidate (
  JobCandidateID INTEGER,
  BusinessEntityID INTEGER,
  Resume TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (JobCandidateID)
);

CREATE TABLE Location (
  LocationID INTEGER,
  Name TEXT,
  CostRate REAL,
  Availability REAL,
  ModifiedDate TEXT,
  PRIMARY KEY (LocationID)
);

CREATE TABLE PhoneNumberType (
  PhoneNumberTypeID INTEGER,
  Name TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (PhoneNumberTypeID)
);

CREATE TABLE Product (
  ProductID INTEGER,
  Name TEXT,
  ProductNumber TEXT,
  MakeFlag INTEGER,
  FinishedGoodsFlag INTEGER,
  Color TEXT,
  SafetyStockLevel INTEGER,
  ReorderPoint INTEGER,
  StandardCost REAL,
  ListPrice REAL,
  Size TEXT,
  SizeUnitMeasureCode TEXT,
  WeightUnitMeasureCode TEXT,
  Weight REAL,
  DaysToManufacture INTEGER,
  ProductLine TEXT,
  Class TEXT,
  Style TEXT,
  ProductSubcategoryID INTEGER,
  ProductModelID INTEGER,
  SellStartDate TEXT,
  SellEndDate TEXT,
  DiscontinuedDate TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (ProductID)
);

CREATE TABLE Document (
  DocumentNode TEXT,
  DocumentLevel INTEGER,
  Title TEXT,
  Owner INTEGER,
  FolderFlag INTEGER,
  FileName TEXT,
  FileExtension TEXT,
  Revision TEXT,
  ChangeNumber INTEGER,
  Status INTEGER,
  DocumentSummary TEXT,
  Document TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (DocumentNode)
);

CREATE TABLE StateProvince (
  StateProvinceID INTEGER,
  StateProvinceCode TEXT,
  CountryRegionCode TEXT,
  IsOnlyStateProvinceFlag INTEGER,
  Name TEXT,
  TerritoryID INTEGER,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (StateProvinceID)
);

CREATE TABLE CreditCard (
  CreditCardID INTEGER,
  CardType TEXT,
  CardNumber TEXT,
  ExpMonth INTEGER,
  ExpYear INTEGER,
  ModifiedDate TEXT,
  PRIMARY KEY (CreditCardID)
);

CREATE TABLE SalesOrderHeader (
  SalesOrderID INTEGER,
  RevisionNumber INTEGER,
  OrderDate TEXT,
  DueDate TEXT,
  ShipDate TEXT,
  Status INTEGER,
  OnlineOrderFlag INTEGER,
  SalesOrderNumber TEXT,
  PurchaseOrderNumber TEXT,
  AccountNumber TEXT,
  CustomerID INTEGER,
  SalesPersonID INTEGER,
  TerritoryID INTEGER,
  BillToAddressID INTEGER,
  ShipToAddressID INTEGER,
  ShipMethodID INTEGER,
  CreditCardID INTEGER,
  CreditCardApprovalCode TEXT,
  CurrencyRateID INTEGER,
  SubTotal REAL,
  TaxAmt REAL,
  Freight REAL,
  TotalDue REAL,
  Comment TEXT,
  rowguid TEXT,
  ModifiedDate TEXT,
  PRIMARY KEY (SalesOrderID)
);
