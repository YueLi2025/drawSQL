CREATE TABLE hardware_dim_customer (
    customer_code INTEGER,
    customer TEXT,
    platform TEXT,
    channel TEXT,
    market TEXT,
    sub_zone TEXT,
    region TEXT
);

CREATE TABLE hardware_fact_pre_invoice_deductions (
    customer_code INTEGER,
    fiscal_year INTEGER,
    pre_invoice_discount_pct REAL
);

CREATE TABLE web_sales_reps (
    id INTEGER,
    name TEXT,
    region_id INTEGER
);

CREATE TABLE hardware_dim_product (
    product_code TEXT,
    division TEXT,
    segment TEXT,
    category TEXT,
    product TEXT,
    variant TEXT
);

CREATE TABLE web_orders (
    id INTEGER,
    account_id INTEGER,
    occurred_at TEXT,
    standard_qty INTEGER,
    gloss_qty INTEGER,
    poster_qty INTEGER,
    total INTEGER,
    standard_amt_usd REAL,
    gloss_amt_usd REAL,
    poster_amt_usd REAL,
    total_amt_usd REAL
);

CREATE TABLE StaffHours (
    StaffMember TEXT,
    EventDate TEXT,
    EventTime TEXT,
    EventType TEXT
);

CREATE TABLE university_enrollment (
    OfferNo INTEGER,
    StdNo INTEGER,
    EnrGrade REAL
);

CREATE TABLE university_faculty (
    FacNo INTEGER,
    FacFirstName TEXT,
    FacLastName TEXT,
    FacCity TEXT,
    FacState TEXT,
    FacDept TEXT,
    FacRank TEXT,
    FacSalary INTEGER,
    FacSupervisor REAL,
    FacHireDate TEXT,
    FacZipCode TEXT
);

CREATE TABLE university_student (
    StdNo INTEGER,
    StdFirstName TEXT,
    StdLastName TEXT,
    StdCity TEXT,
    StdState TEXT,
    StdZip TEXT,
    StdMajor TEXT,
    StdClass TEXT,
    StdGPA REAL
);

CREATE TABLE university_offering (
    OfferNo INTEGER,
    CourseNo TEXT,
    OffTerm TEXT,
    OffYear INTEGER,
    OffLocation TEXT,
    OffTime TEXT,
    FacNo REAL,
    OffDays TEXT
);

CREATE TABLE web_accounts (
    id INTEGER,
    name TEXT,
    website TEXT,
    lat REAL,
    long REAL,
    primary_poc TEXT,
    sales_rep_id INTEGER
);

CREATE TABLE web_events (
    id INTEGER,
    account_id INTEGER,
    occurred_at TEXT,
    channel TEXT
);

CREATE TABLE SalaryDataset (
    index INTEGER,
    CompanyName TEXT,
    JobTitle TEXT,
    SalariesReported REAL,
    Location TEXT,
    Salary TEXT
);

CREATE TABLE web_region (
    id INTEGER,
    name TEXT
);

CREATE TABLE hardware_fact_gross_price (
    product_code TEXT,
    fiscal_year INTEGER,
    gross_price REAL
);

CREATE TABLE hardware_fact_manufacturing_cost (
    product_code TEXT,
    cost_year INTEGER,
    manufacturing_cost REAL
);

CREATE TABLE university_course (
    CourseNo TEXT,
    CrsDesc TEXT,
    CrsUnits INTEGER
);

CREATE TABLE hardware_fact_sales_monthly (
    date TEXT,
    product_code TEXT,
    customer_code INTEGER,
    sold_quantity INTEGER,
    fiscal_year INTEGER
);