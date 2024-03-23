CREATE TABLE Patients(
	id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    egn VARCHAR(10) NOT NULL,
    phone_number VARCHAR(20)
);

CREATE TABLE Doctors (
	id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    cabinet VARCHAR(10) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    is_health_fund BOOLEAN NOT NULL
);

CREATE TABLE Specializations (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Specialization_Doctor (
	doctor_id INT NOT NULl,
	CONSTRAINT FOREIGN KEY (doctor_id) REFERENCES Doctors(Id),
    specialization_id INT NOT NULl,
	CONSTRAINT FOREIGN KEY (specialization_id) REFERENCES Specializations(Id)
);

CREATE TABLE Medicines (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Treatment (
	id INT AUTO_INCREMENT PRIMARY KEY,
    diagnose VARCHAR(20) NOT NULL,
    doctor_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (doctor_id) REFERENCES Doctors(id),
    patient_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (patient_id) REFERENCES Patients(id),
    start_period DATETIME NOT NULL,
    end_peroid DATETIME
);

CREATE TABLE Medicine_Treatment (
	medicine_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (medicine_id) REFERENCES Medicines(id),
    treatment_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (treatment_id) REFERENCES Treatment(id)
);

