PRAGMA foreign_keys = ON;
CREATE TABLE `Products` (
`product_id` INTEGER PRIMARY KEY,
`product_type_code` VARCHAR(15),
`product_name` VARCHAR(80),
`product_price` DOUBLE NULL
);
CREATE TABLE `Addresses` (
`address_id` INTEGER PRIMARY KEY,
`address_details` VARCHAR(255)
);
CREATE TABLE `Customers` (
`customer_id` INTEGER PRIMARY KEY,
`address_id` INTEGER NOT NULL,
`payment_method_code` VARCHAR(15),
`customer_number` VARCHAR(20),
`customer_name` VARCHAR(80),
`customer_address` VARCHAR(255),
`customer_phone` VARCHAR(80),
`customer_email` VARCHAR(80)
);
CREATE TABLE `Customer_Orders` (
`order_id` INTEGER PRIMARY KEY,
`customer_id` INTEGER NOT NULL,
`order_date` DATETIME NOT NULL,
`order_status_code` VARCHAR(15),
FOREIGN KEY (`customer_id` ) REFERENCES `Customers`(`customer_id` )
);
CREATE TABLE `Order_Items` (
`order_item_id` INTEGER NOT NULL ,
`order_id` INTEGER NOT NULL,
`product_id` INTEGER NOT NULL,
`order_quantity` VARCHAR(80),
FOREIGN KEY (`order_id` ) REFERENCES `Customer_Orders`(`order_id` ),
FOREIGN KEY (`product_id` ) REFERENCES `Products`(`product_id` )
);
Rueckerborough, NV 78430-4096');
West Kali, UT 16070-1379');
Landenshire, ND 45637');
Schusterfort, WY 34067-3366');
Schillerfurt, WI 60335-2125');
New Baronview, AR 57984');
Jaleelstad, IL 16333-3222');
South Domenicamouth, NM 36408-2902');
Wymanside, PA 69696-5826');
North Timothyberg, OK 88659');
Lillianaborough, NE 46012-9033');
North Kara, CA 25470-9357');
Cyrusberg, MN 88459-2009');
East Lura, AZ 62151-8685');
Port Buddymouth, MA 08157-7414');
