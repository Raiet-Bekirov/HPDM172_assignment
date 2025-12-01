CREATE DATABASE hospitals_db;

USE hospitals_db;

CREATE TABLE hospitals
(
hospital_id INT PRIMARY KEY,
hospital_name VARCHAR(150),
hospital_address VARCHAR(150),
no_of_beds INT,
hospital_type VARCHAR(20),
emergency_services VARCHAR(10),
accreditation_year INT
);

LOAD DATA LOCAL INFILE
'hospitals_table.txt'
INTO TABLE hospitals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE diseases
(
disease_id INT PRIMARY KEY,
disease_name VARCHAR(150)
);

LOAD DATA LOCAL INFILE
'diseases_table.txt'
INTO TABLE diseases
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE doctors
(
doctor_id INT PRIMARY KEY,
doctor_name VARCHAR(150),
doctor_dob DATE,
doctor_address VARCHAR(150),
hospital_id INT,
disease_id INT,
FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id),
FOREIGN KEY (disease_id) REFERENCES diseases(disease_id)
);

LOAD DATA LOCAL INFILE
'doctors_table.txt'
INTO TABLE doctors
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE patients
(
patient_id INT PRIMARY KEY,
patient_name VARCHAR(150),
patient_dob DATE,
patient_address VARCHAR(150),
doctor_id INT,
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

LOAD DATA LOCAL INFILE
'patients_table.txt'
INTO TABLE patients
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE medications
(
medication_id INT PRIMARY KEY,
medication_name VARCHAR(150),
disease_id INT,
FOREIGN KEY (disease_id) REFERENCES diseases(disease_id)
);

LOAD DATA LOCAL INFILE
'medications_table.txt'
INTO TABLE medications
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE prescriptions
(
prescription_id INT PRIMARY KEY,
prescription_date DATE,
medication_id INT,
patient_id INT,
doctor_id INT,
FOREIGN KEY (medication_id) REFERENCES medications(medication_id),
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

LOAD DATA LOCAL INFILE
'prescriptions_table.txt'
INTO TABLE prescriptions
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE appointments
(
appointment_id INT PRIMARY KEY,
appointment_date DATE,
patient_id INT,
doctor_id INT,
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

LOAD DATA LOCAL INFILE
'appointments_table.txt'
INTO TABLE appointments
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE lab_results
(
lab_result_id INT PRIMARY KEY,
test_date DATE,
test_type VARCHAR(150),
test_result VARCHAR(150),
patient_id INT,
doctor_id INT,
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

LOAD DATA LOCAL INFILE
'lab_results_table.txt'
INTO TABLE lab_results
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;