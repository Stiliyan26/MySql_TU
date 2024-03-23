DROP DATABASE IF EXISTS six_plus_service;

CREATE DATABASE six_plus_service;
USE six_plus_service;

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(15) NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    egn VARCHAR(10) UNIQUE NOT NULL,
    birth_date DATE NOT NULL
);

CREATE TABLE roles (
	id INT AUTO_INCREMENT PRIMARY KEY,
    role_name ENUM("Client", "Diagnostician", "Mechanic", "Electrician", "Admin"),
    user_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE repairs (
	id INT AUTO_INCREMENT PRIMARY KEY,
    date_of_entry DATE NOT NULL,
    day_of_pick_up DATE,
    total_price DECIMAL(7, 2)
);

CREATE TABLE cars (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    brand VARCHAR(50) NOT NULL, 
    model VARCHAR(50) NOT NULL,
    reg_number VARCHAR(8) UNIQUE NOT NULL,
    date_of_creation DATE NOT NULL,
    owner_Id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (owner_Id) REFERENCES users(id),
    rapair_id INT NOT NULL,#change
    CONSTRAINT FOREIGN KEY (rapair_id) REFERENCES repairs(id)
); 

CREATE TABLE employees_cars ( #repairs
	employee_id INT NOT NULL,
    car_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (employee_id) 
		REFERENCES users(id),
    CONSTRAINT FOREIGN KEY (car_id) 
		REFERENCES cars(id),
	PRIMARY KEY (employee_id, car_id)
);

CREATE TABLE services (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(7, 2) NOT NULL,
    note VARCHAR(255)
);

CREATE TABLE repairs_services (
	repair_id INT NOT NULL,
    service_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (repair_id) 
		REFERENCES repairs(id),
	CONSTRAINT FOREIGN KEY (service_id) 
		REFERENCES services(id),
    PRIMARY KEY (repair_id, service_id)
);

CREATE TABLE car_services (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE car_service_locations (
	id INT AUTO_INCREMENT PRIMARY KEY,
	address VARCHAR(50) NOT NULL,
    car_service_id INT NOT NULL,
    repair_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (repair_id) 
		REFERENCES repairs(id),
    CONSTRAINT FOREIGN KEY (car_service_id) REFERENCES car_services(id)
);