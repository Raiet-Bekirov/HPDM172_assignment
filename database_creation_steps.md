This markdown file details the steps any MySQL user can follow to duplicate our database, `hospitals_db`.

# Option 1: Create the database from scratch and import data from files

Make directory to store input data, for example:

```shell
mkdir /home/ubuntu/hpdm172/assignment/
```
Navigate to the created directory:

```shell
cd /home/ubuntu/hpdm172/assignment/
```

Download input data .zip file from GitHub:

```shell
wget https://github.com/Raiet-Bekirov/HPDM172_assignment/raw/refs/heads/main/data_generation/generated_data/all_data.zip
```
Unzip `all_data.zip` and place contents into a new `data/` directory:

```shell
unzip all_data.zip -d data
```

Log on to MySQL server (in the command below, replace `<USER-NAME>` with the appropriate MySQL server username):

```shell
mysql --local-infile=1 -u <USER-NAME> -p
```
Create new database:
```sql
CREATE DATABASE hospitals_db;
```
Switch to `hospitals_db`:
```sql
USE hospitals_db;
```
Create `hospitals` table:
```sql
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
```
Load data from `hospitals_table.txt`:

```sql
LOAD DATA LOCAL INFILE
'/home/ubuntu/hpdm172/assignment/data/hospitals_table.txt'
INTO TABLE hospitals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

Create `diseases` table:

```sql
CREATE TABLE diseases
(
disease_id INT PRIMARY KEY,
disease_name VARCHAR(150)
);
```

Load data from `diseases_table.txt`:

```sql
LOAD DATA LOCAL INFILE
'/home/ubuntu/hpdm172/assignment/data/diseases_table.txt'
INTO TABLE diseases
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

Create `doctors` table:

```sql
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
```

Load data from `doctors_table.txt`:

```sql
LOAD DATA LOCAL INFILE
'/home/ubuntu/hpdm172/assignment/data/doctors_table.txt'
INTO TABLE doctors
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

Create `patients` table:

```sql
CREATE TABLE patients
(
patient_id INT PRIMARY KEY,
patient_name VARCHAR(150),
patient_dob DATE,
patient_address VARCHAR(150),
doctor_id INT,
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
```

Load data from `patients_table.txt`:

```sql
LOAD DATA LOCAL INFILE
'/home/ubuntu/hpdm172/assignment/data/patients_table.txt'
INTO TABLE patients
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

Create `medications` table:

```sql
CREATE TABLE medications
(
medication_id INT PRIMARY KEY,
medication_name VARCHAR(150),
disease_id INT,
FOREIGN KEY (disease_id) REFERENCES diseases(disease_id)
);
```

Load data from `medications_table.txt`:

```sql
LOAD DATA LOCAL INFILE
'/home/ubuntu/hpdm172/assignment/data/medications_table.txt'
INTO TABLE medications
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

Create `prescriptions` table:

```sql
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
```

Load data from `prescriptions_table.txt`:

```sql
LOAD DATA LOCAL INFILE
'/home/ubuntu/hpdm172/assignment/data/prescriptions_table.txt'
INTO TABLE prescriptions
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

Create `appointments` table:

```sql
CREATE TABLE appointments
(
appointment_id INT PRIMARY KEY,
appointment_date DATE,
patient_id INT,
doctor_id INT,
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
```

Load data from `appointments_table.txt`:

```sql
LOAD DATA LOCAL INFILE
'/home/ubuntu/hpdm172/assignment/data/appointments_table.txt'
INTO TABLE appointments
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

Create `lab_results` table:

```sql
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
```

Load data from `lab_results_table.txt`:

```sql
LOAD DATA LOCAL INFILE
'/home/ubuntu/hpdm172/assignment/data/lab_results_table.txt'
INTO TABLE lab_results
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

Quit MySQL:

```sql
quit
```

Export database to a .sql file (in the command below, replace `<USER-NAME>` with the appropriate MySQL server username):

```shell
mysqldump -u <USER-NAME> -p hospitals_db > hospitals_db.sql
```

# Option 2: Restore the database from the provided backup file

Make directory to store backup file, for example:

```shell
mkdir /home/ubuntu/hpdm172/assignment/
```

Navigate to the created directory:

```shell
cd /home/ubuntu/hpdm172/assignment/
```

Download backup .sql file from GitHub:

```shell
wget https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/hospitals_db.sql
```

Log on to MySQL server (in the command below, replace `<USER-NAME>` with the appropriate MySQL server username):

```shell
mysql -u <USER-NAME> -p
```

Create new database:

```sql
CREATE DATABASE hospitals_db;
```

Quit MySQL:

```sql
quit
```

Restore database from `hospitals_db.sql` (in the command below, replace `<USER-NAME>` with the appropriate MySQL server username):

```shell
mysql -u <USER-NAME> -p hospitals_db < /home/ubuntu/hpdm172/assignment/hospitals_db.sql
```

# Delete `hospitals_db`

Log on to MySQL server (in the command below, replace `<USER-NAME>` with the appropriate MySQL server username):

```shell
mysql -u <USER-NAME> -p
```

Delete `hospitals_db`:

```sql
DROP DATABASE hospitals_db;
```

Quit MySQL:

```sql
quit
```