-- Purpose: Stores core customer information.
-- Primary Key: customer_id
-- Relationships: One-to-many with customer_address
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20)
);


-- Purpose: Associates customers with addresses.
-- Primary Key: customer_address_id
-- Foreign Keys:
-- customer_id references Customer
-- address_id references Address
-- address_status_id references Address_Status
-- Relationships:
-- Many-to-one with Customer
-- Many-to-one with Address
-- Many-to-one with Address_Status
CREATE TABLE customer_address (
    customer_address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    address_id INT,
    address_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES Address_Status(address_status_id)
);

-- address_status
-- Purpose: Contains possible statuses for an address
-- Primary Key: address_status_id
CREATE TABLE Address_Status (
    address_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) UNIQUE
);

-- Purpose: Stores all address information.
-- Primary Key: address_id
-- Foreign Key: country_id references Country
-- Relationships:
-- Many-to-one with Country
-- One-to-many with customer_address
CREATE TABLE Address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- Purpose: Lists all countries.
-- Primary Key: country_id
CREATE TABLE Country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) UNIQUE
);
