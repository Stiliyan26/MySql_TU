CREATE DATABASE autoserviz;

USE autoserviz;

CREATE TABLE clients (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(9) NOT NULL
);

CREATE TABLE employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	age INT NULL
);

CREATE TABLE repairCar (
	id INT AUTO_INCREMENT PRIMARY KEY,
	Date_of_accepting DATETIME NOT NULL,
	Date_of_fixing DATETIME NULL,
    employee_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE cars (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    reg_number VARCHAR(8) NOT NULL,
    repairCar_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (repairCar_id) REFERENCES repairCar(id),
    client_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (client_id) REFERENCES clients(id)
);


CREATE TABLE services (	
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    cost VARCHAR(50) NOT NULL,
	service_Type VARCHAR(50) NOT NULL,
    repairCar_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (repairCar_id) REFERENCES repairCar(id)
);






