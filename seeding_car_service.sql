USE six_plus_service;

INSERT INTO users
	VALUES 
(NULL, "Stiliyan Nikolov", "121222040", "0884943923", "stinikolov@tu-sofia.bg", "0262042244", "2002-12-04"),
(NULL, "Peter Gerdjikov", "121522124", "0884949543", "petgerdjikov@tu-sofia.bg", "0212442347", "2003-06-29"),
(NULL, "Gabiriel Penchev", "125212547", "0886985973", "gabpenchev@tu-sofia.bg", "0264072849", "2002-06-30");

INSERT INTO roles
	VALUES 
(NULL, "Client", 1),
(NULL, "Diagnostician", 2),
(NULL, "Mechanic", 3);

INSERT INTO repairs
	VALUES 
(NULL, "2024-09-03", NULL, NULL),
(NULL, "2024-08-04", NULL, NULL),
(NULL, "2023-06-02", NULL, NULL);

INSERT INTO cars
	VALUES 
(NULL, "Mazda", "CX5", "CO2451BG", "2015-09-06", 1, 1),
(NULL, "Nissan", "Murano", "CO5324BG", "2007-03-05", 1, 2);

INSERT INTO employees_cars
	VALUES
(2, 1),
(3, 2);

INSERT INTO services 
	VALUES
(NULL, "Oil change", 20, "Engine oil change"),
(NULL, "Sensor change", 50, "Sensor change depending on wich place");

INSERT INTO repairs_services
	VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

INSERT INTO car_services
	VALUES
(NULL, "6+", "0884963606");

INSERT INTO car_service_locations
	VALUES
(NULL, "Lulin ul. Ivan Vazov 23", 1, 1),
(NULL, "Mladost ul. Akademic Ivan Geshov 54", 1, 2);

SELECT
	services.name,
    services.price,
    repairs.date_of_entry,
    repairs.day_of_pick_up
FROM services
JOIN repairs_services
ON repairs_services.service_id = services.id
JOIN repairs
ON repairs.id = repairs_services.repair_id;

SELECT
	cars.brand,
    cars.model,
    users.name,
    roles.role_name
FROM cars
JOIN employees_cars 
ON employees_cars.car_id = cars.id
JOIN users
ON users.id = employees_cars.employee_id
JOIN roles
ON roles.user_id = users.id;

SELECT 
	users.name,
    users.phone_number,
    cars.brand,
    cars.model,
    cars.reg_number
FROM users
JOIN cars
ON cars.owner_Id = users.id;

SELECT 
	* 
FROM users
JOIN roles
ON roles.user_id = users.id;

SELECT * FROM repairs;
