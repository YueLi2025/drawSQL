CREATE TABLE actor (
    actor_id numeric,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    last_update TIMESTAMP
);

CREATE TABLE country (
    country_id SMALLINT,
    country VARCHAR(50),
    last_update TIMESTAMP
);

CREATE TABLE city (
    city_id INT,
    city VARCHAR(50),
    country_id SMALLINT,
    last_update TIMESTAMP
);

CREATE TABLE address (
    address_id INT,
    address VARCHAR(50),
    address2 VARCHAR(50),
    district VARCHAR(20),
    city_id INT,
    postal_code VARCHAR(10),
    phone VARCHAR(20),
    last_update TIMESTAMP
);

CREATE TABLE language (
    language_id SMALLINT,
    name CHAR(20),
    last_update TIMESTAMP
);

CREATE TABLE category (
    category_id SMALLINT,
    name VARCHAR(25),
    last_update TIMESTAMP
);

CREATE TABLE customer (
    customer_id INT,
    store_id INT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    email VARCHAR(50),
    address_id INT,
    active CHAR(1),
    create_date TIMESTAMP,
    last_update TIMESTAMP
);

CREATE TABLE film (
    film_id INT,
    title VARCHAR(255),
    description BLOB SUB_TYPE TEXT,
    release_year VARCHAR(4),
    language_id SMALLINT,
    original_language_id SMALLINT,
    rental_duration SMALLINT,
    rental_rate DECIMAL(4,2),
    length SMALLINT,
    replacement_cost DECIMAL(5,2),
    rating VARCHAR(10),
    special_features VARCHAR(100),
    last_update TIMESTAMP
);

CREATE TABLE film_actor (
    actor_id INT,
    film_id INT,
    last_update TIMESTAMP
);

CREATE TABLE film_category (
    film_id INT,
    category_id SMALLINT,
    last_update TIMESTAMP
);

CREATE TABLE film_text (
    film_id SMALLINT,
    title VARCHAR(255),
    description BLOB SUB_TYPE TEXT
);

CREATE TABLE inventory (
    inventory_id INT,
    film_id INT,
    store_id INT,
    last_update TIMESTAMP
);

CREATE TABLE staff (
    staff_id SMALLINT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    address_id INT,
    picture BLOB,
    email VARCHAR(50),
    store_id INT,
    active SMALLINT,
    username VARCHAR(16),
    password VARCHAR(40),
    last_update TIMESTAMP
);

CREATE TABLE store (
    store_id INT,
    manager_staff_id SMALLINT,
    address_id INT,
    last_update TIMESTAMP
);

CREATE TABLE payment (
    payment_id INT,
    customer_id INT,
    staff_id SMALLINT,
    rental_id INT,
    amount DECIMAL(5,2),
    payment_date TIMESTAMP,
    last_update TIMESTAMP
);

CREATE TABLE rental (
    rental_id INT,
    rental_date TIMESTAMP,
    inventory_id INT,
    customer_id INT,
    return_date TIMESTAMP,
    staff_id SMALLINT,
    last_update TIMESTAMP
);

CREATE TABLE customer_list (
    ID INT,
    name ,
    address VARCHAR(50),
    zip_code VARCHAR(10),
    phone VARCHAR(20),
    city VARCHAR(50),
    country VARCHAR(50),
    notes ,
    SID INT
);

CREATE TABLE film_list (
    FID INT,
    title VARCHAR(255),
    description BLOB SUB_TYPE TEXT,
    category VARCHAR(25),
    price DECIMAL(4,2),
    length SMALLINT,
    rating VARCHAR(10),
    actors 
);

CREATE TABLE staff_list (
    ID SMALLINT,
    name ,
    address VARCHAR(50),
    zip_code VARCHAR(10),
    phone VARCHAR(20),
    city VARCHAR(50),
    country VARCHAR(50),
    SID INT
);

CREATE TABLE sales_by_store (
    store_id INT,
    store ,
    manager ,
    total_sales 
);

CREATE TABLE sales_by_film_category (
    category VARCHAR(25),
    total_sales 
);