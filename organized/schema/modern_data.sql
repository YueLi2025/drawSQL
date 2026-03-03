CREATE TABLE pizza_names (
    pizza_id INTEGER,
    pizza_name TEXT
);

CREATE TABLE companies_funding (
    company_id INTEGER,
    valuation INTEGER,
    funding INTEGER,
    select_investors TEXT
);

CREATE TABLE pizza_customer_orders (
    order_id INTEGER,
    customer_id INTEGER,
    pizza_id INTEGER,
    exclusions TEXT,
    extras TEXT,
    order_time TEXT
);

CREATE TABLE pizza_toppings (
    topping_id INTEGER,
    topping_name TEXT
);

CREATE TABLE trees (
    idx INTEGER,
    tree_id INTEGER,
    tree_dbh INTEGER,
    stump_diam INTEGER,
    status TEXT,
    health TEXT,
    spc_latin TEXT,
    spc_common TEXT,
    address TEXT,
    zipcode INTEGER,
    borocode INTEGER,
    boroname TEXT,
    nta_name TEXT,
    state TEXT,
    latitude REAL,
    longitude REAL
);

CREATE TABLE pizza_recipes (
    pizza_id INTEGER,
    toppings TEXT
);

CREATE TABLE statistics (
    date TEXT,
    state TEXT,
    total_cases INTEGER,
    total_deaths INTEGER
);

CREATE TABLE income_trees (
    zipcode INTEGER,
    Estimate_Total INTEGER,
    Margin_of_Error_Total INTEGER,
    Estimate_Median_income INTEGER,
    Margin_of_Error_Median_income INTEGER,
    Estimate_Mean_income INTEGER,
    Margin_of_Error_Mean_income INTEGER
);

CREATE TABLE pizza_clean_runner_orders (
    order_id INTEGER,
    runner_id INTEGER,
    pickup_time TEXT,
    distance REAL,
    duration REAL,
    cancellation TEXT
);

CREATE TABLE pizza_runner_orders (
    order_id INTEGER,
    runner_id INTEGER,
    pickup_time TEXT,
    distance TEXT,
    duration TEXT,
    cancellation TEXT
);

CREATE TABLE word_list (
    words TEXT
);

CREATE TABLE companies_dates (
    company_id INTEGER,
    date_joined TEXT,
    year_founded INTEGER
);

CREATE TABLE pizza_get_extras (
    row_id INTEGER,
    order_id INTEGER,
    extras INTEGER,
    extras_count INTEGER
);

CREATE TABLE pizza_get_exclusions (
    row_id INTEGER,
    order_id INTEGER,
    exclusions INTEGER,
    total_exclusions INTEGER
);

CREATE TABLE pizza_clean_customer_orders (
    order_id INTEGER,
    customer_id INTEGER,
    pizza_id INTEGER,
    exclusions TEXT,
    extras TEXT,
    order_time TEXT
);

CREATE TABLE companies_industries (
    company_id INTEGER,
    industry TEXT
);

CREATE TABLE pizza_runners (
    runner_id INTEGER,
    registration_date TEXT
);