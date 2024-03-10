DROP DATABASE IF EXISTS X_Twitter;

CREATE DATABASE X_Twitter;
USE X_Twitter;

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(25),
    birth_date DATE NOT NULL,
    profile_picture LONGBLOB
);

CREATE TABLE channels (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
    
    
);