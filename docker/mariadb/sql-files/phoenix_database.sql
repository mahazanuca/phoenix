CREATE DATABASE IF NOT EXISTS phoenix_api;
USE phoenix_api;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(32) NOT NULL,
    verified BOOLEAN NOT NULL DEFAULT 0,
    phone VARCHAR(20) NOT NULL,
    location INTEGER references(locations), 
    address varchar(255)
);

CREATE TABLE locations (
    id INTEGER PRIMARY KEY,
    city TEXT,
    country TEXT,
    postal_code TEXT
);