# sql_queries

This directory contains SQL scipt files for nineteen different queries that can be used to obtain information from `hospitals_db`.

- [Query 1, `get_docs_at_hospital.sql`](#query-1-get_docs_at_hospitalsql): Print a list of all doctors based at a particular hospital.
- [Query 2, `get_prescriptions_for_patient.sql`](#query-2-get_prescriptions_for_patientsql): Print a list of all prescriptions for a particular patient, ordered by the prescription date.
- [Query 3, `get_prescriptions_from_doc.sql`](#query-3-get_prescriptions_from_docsql): Print a list of all prescriptions that a particular doctor has prescribed.
- [Query 4, `get_prescriptions_for_all_patients_alphabetical.sql`](#query-4-get_prescriptions_for_all_patient_alphabeticalsql): Print a table showing all prescriptions ordered by the patient name alphabetically.
- [Query 5, `add_new_patient.sql`](#query-5-add_new_patientsql): Add a new customer to the database, including being registered with one of the doctors.
- [Query 6, `update_existing_patient_address.sql`](#query-6-update_existing_patient_addresssql): Modify address details of an existing customer.
- [Query 7, `get_patients_from_hospital.sql`](#query-7-get_patients_from_hospitalsql): Print a list of all patient names and addresses for patients registered to doctors based at one particular hospital – that could be used for posting information mail to all of one hospital’s registered patients.
- [Query 8, `get_docs_at_teaching_hospitals_accred_btwn_2015_2024.sql`](#query-8-get_docs_at_teaching_hospitals_accred_btwn_2015_2024sql): Print a list of all doctors based at Teaching hospitals which were accredited between 2015–2024.
- [Query 9, `get_patients_and_medication_from_diseaseID.sql`](#query-9-get_patients_and_medication_from_diseaseID.sql): List all patients who may have a particular disease based on which medication they have been prescribed.
- [Query 10, `get_docs_for_disease.sql`](#query-10-get_docs_for_diseasesql): List all doctors who specialize in a particular disease.
- [Query 11, `get_lab_results_over_60.sql`](#query-11-get_lab_results_over_60sql): List all lab results for all patients over the age of 60.
- [Query 12, `get_appointments_for_patient.sql`](#query-12-get_appointments_for_patientsql): Print a list of all appointments for a given patient.
- [Query 13, `get_appointments_for_doc.sql`](#query-13-get_appointments_for_docsql): Print a list of all appointments for a given doctor.
- [Query 14, `get_hospital_prescriptions.sql`](#query-14-get_hospital_prescriptionssql): Print all prescriptions made from a particular hospital ordered alphabetically by the name of the medication being prescribed – the output of this SQL query should include only these 4 columns: the medication name, the name of doctor who prescribed it, the name of the patient, and the name of hospital.
- [Query 15, `get_lab_results_at_hospitals_accred_btwn_2013_2020.sql`](#query-15-get_lab_results_at_hospitals_accred_btwn_2013_2020sql): Print a list of all lab results from all hospitals that were accredited between 2013–2020.
- [Query 16, `get_max_prescriber.sql`](#query-16-get_max_prescribersql): Identify which doctor has made the most prescriptions.
- [Query 17, `get_docs_at_biggest_hospital.sql`](#query-17-get_docs_at_biggest_hospitalsql): Print a list of all doctors at the hospital with biggest size (number of beds).
- [Query 18, `get_emergency_hospitals_accred_pre_2015.sql`](#query-18-get_emergency_hospitals_accred_pre_2015sql): Print a list of all hospital names which were accredited prior to 2015 and do have Emergency Service facilities.
- [Query 19, `get_patients_at_small_hospitals.sql`](#query-19-get_patients_at_small_hospitalssql): Print a list of patients registered with doctors who are based at hospital with <400 beds.

## Steps to download and run any of these scripts

Make directory to store SQL script files, for example:

```shell
mkdir queries
```
Navigate to the created directory:

```shell
cd queries
```

Download a query .sql file from GitHub, for example:

```shell
wget https://github.com/Raiet-Bekirov/HPDM172_assignment/raw/refs/heads/main/sql_queries/get_docs_at_hospital.sql
```

Log on to a MySQL server (in the command below, replace `<USER-NAME>` with the appropriate MySQL server username):

```shell
mysql -u <USER-NAME> -p
```

Switch to `hospitals_db`:

```sql
USE hospitals_db;
```

Set any variables called by the SQL script file, for example:

```sql
SET @HospitalID = 40;
```

Execute the SQL script file, for example:

```sql
source get_docs_at_hospital.sql
```

Quit MySQL:

```sql
quit
```

## Example ouputs from each query

### Query 1: `get_docs_at_hospital.sql`

If `get_docs_at_hospital.sql` is downloaded, the following SQL code can be used to print a list of all doctors based at a particular hospital. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@HospitalID` to the unique ID number of the chosen hospital:

```sql
SET @HospitalID = 33;
```

Finally, run the `get_docs_at_hosp` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_docs_at_hospital.sql
```

This produces the following output:

```
+-----------+--------------------------+---------------------+
| doctor_id | doctor_name              | hospital_name       |
+-----------+--------------------------+---------------------+
|        37 | Dr. Sara Chén            | St Thomas' Hospital |
|        53 | Dr. Miguel De Los Santos | St Thomas' Hospital |
|        59 | Dr. Ivana Bird           | St Thomas' Hospital |
+-----------+--------------------------+---------------------+
```

### Query 2: `get_prescriptions_for_patient.sql`

If `get_prescriptions_for_patient.sql` is downloaded, the following SQL code can be used to print a list of all prescriptions for a particular patient, ordered by the prescription date. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@PatientID` to the unique ID number of the chosen patient:

```sql
SET @PatientID = 106;
```

Finally, run the `get_prescriptions_for_patient.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_prescriptions_for_patient.sql
```

This produces the following output:

```
+-----------------+-------------------+------------------+------------------------+-----------------------+
| prescription_id | prescription_date | patient_name     | doctor_name            | medication_name       |
+-----------------+-------------------+------------------+------------------------+-----------------------+
|             483 | 2024-11-23        | Regina Kobayashi | Dr. Zoran Díaz         | Cefuroxime            |
|              69 | 2024-08-13        | Regina Kobayashi | Dr. Vasileios Jönsson  | Potassium Bicarbonate |
|             324 | 2024-04-03        | Regina Kobayashi | Dr. Malak Takeuchi     | Mexiletine            |
|              67 | 2024-03-22        | Regina Kobayashi | Dr. Jelena van Dijk    | Necitumumab           |
+-----------------+-------------------+------------------+------------------------+-----------------------+
```
### Query 3: `get_prescriptions_from_doc.sql`

If `get_prescriptions_from_doc.sql` is downloaded, the following SQL code can be used to print a list of all prescriptions that a particular doctor has prescribed. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@DoctorID` to the unique ID number of the chosen doctor:

```sql
SET @DoctorID = 100;
```

Finally, run the `get_prescriptions_from_doc.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_prescriptions_from_doc.sql
```

This produces the following output:
```
+-----------------+-------------------+------------------+--------------+---------------------------+
| prescription_id | prescription_date | patient_name     | doctor_name  | medication_name           |
+-----------------+-------------------+------------------+--------------+---------------------------+
|              11 | 2025-08-22        | Luka Spiteri     | Dr. Ali Imai | Phosphatidylethanolamines |
|             248 | 2025-05-25        | Emma Jeong       | Dr. Ali Imai | Borage Oil                |
|              77 | 2025-02-16        | Saliha Bertrand  | Dr. Ali Imai | Witch Hazel               |
|             308 | 2024-11-27        | Alexander Fekete | Dr. Ali Imai | Linagliptin / Metformin   |
|             297 | 2024-04-28        | Maya Molnár      | Dr. Ali Imai | Fluticasone               |
|             323 | 2024-02-12        | Ali Rebane       | Dr. Ali Imai | Lithium                   |
+-----------------+-------------------+------------------+--------------+---------------------------+
```

### Query 4: `get_prescriptions_for_all_patients_alphabetical.sql`

If `get_prescriptions_for_all_patients_alphabetical.sql` is downloaded, the following SQL code can be used to print a table showing all prescriptions ordered by the patient's last name alphabetically. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_prescriptions_for_all_patients_alphabetical.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_prescriptions_for_all_patients_alphabetical.sql
```

The first five rows of the produced table are as follows:
```
+-----------------+-------------------+-----------------------+--------------------------+--------------------------------------------------+
| prescription_id | prescription_date | patient_name          | doctor_name              | medication_name                                  |
+-----------------+-------------------+-----------------------+--------------------------+--------------------------------------------------+
|             170 | 2025-05-01        | Ammar Abdrahmanov     | Dr. Titaina Božić        | Pegvisomant                                      |
|             168 | 2024-01-14        | Batkhaan Abdullayev   | Dr. Vasileios Jönsson    | Fluvastatin                                      |
|             327 | 2025-04-03        | Amir Acosta           | Dr. Fernanda Castillo    | Bosentan                                         |
|             411 | 2025-07-18        | Tapuarii Ahmetov      | Dr. Míngzé O'Ryan        | Ephedrine                                        |
|             292 | 2025-04-13        | Tapuarii Ahmetov      | Dr. Santiago Kılıç       | Bromazepam                                       |
+-----------------+-------------------+-----------------------+--------------------------+--------------------------------------------------+
```

### Query 5: `add_new_patient.sql`
If `add_new_patient.sql` is downloaded, the following SQL code can be used to add a new patient to the existing patients table. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```
Then, set the variables `@NewPtName`, `@NewPtDOB`, and `@NewPtAddress` to the name, date of birth, and a address of the new patient:

```sql
SET @NewPtName = 'Paul Dirac';
```

```sql
SET @NewPtDOB = '2002-08-08';
```

```sql
SET @NewPtAddress = '15 Monk Road, Bristol BS7 8LE';
```

Additionally, set the variable `@NewPtDocID` to the unique ID number of the doctor the patient will be registered with:

```sql
SET @NewPtDocID = 28;
```

Finally, run the `add_new_patient.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/add_new_patient.sql
```

This adds the patient to the `patients` table. Use the following SQL comand to confirm the change:

```sql
SELECT * FROM patients
ORDER BY patient_id DESC
LIMIT 1;
```

This produces the following output:

```
+------------+--------------+-------------+-------------------------------+-----------+
| patient_id | patient_name | patient_dob | patient_address               | doctor_id |
+------------+--------------+-------------+-------------------------------+-----------+
|        601 | Paul Dirac   | 2002-08-08  | 15 Monk Road, Bristol BS7 8LE |        28 |
+------------+--------------+-------------+-------------------------------+-----------+
```

### Query 6: `update_existing_patient_address.sql`

If `update_existing_patient_address.sql` is downloaded, the following SQL code can be used to update an existing patient's address data. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```
Then, set the variable `@Pt2UpdateID` to the unique ID number of the patient whose address needs to be updated:

```sql
SET @Pt2UpdateID = 56;
```

Additionally, set the variable `@Address2Update` to their new address:

```sql
SET @Address2Update = '221B Baker Street, London NW1 6XE';
```

Finally, run the `update_existing_patient_address.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/update_existing_patient_address.sql
```

Use the following SQL command to confirm the change:

```sql
SELECT * FROM patients
WHERE patient_id = @Pt2UpdateID;
```

```
+------------+--------------+-------------+-----------------------------------+-----------+
| patient_id | patient_name | patient_dob | patient_address                   | doctor_id |
+------------+--------------+-------------+-----------------------------------+-----------+
|         56 | Angela Kola  | 2004-05-21  | 221B Baker Street, London NW1 6XE |        48 |
+------------+--------------+-------------+-----------------------------------+-----------+
```

### Query 7: `get_patients_from_hospital.sql`

If `get_patients_from_hospital.sql` is downloaded, the following SQL code can be used to print a list of all patients registered to doctors based at a particular hospital. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@HospitalID` to the unique ID number of the chosen hospital:

```sql
SET @HospitalId = 33;
```

Finally, run the `get_patients_from_hospital.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_patients_from_hospital.sql
```

This produces the following output:

```
+-------------------+----------------------------------------+
| patient_name      | patient_address                        |
+-------------------+----------------------------------------+
| Agnes Hé          | 94 Union Street, Ealing W3 4RS         |
| Ahmed Laine       | 61 Bridge Street, Islington EC1M 0US   |
| Ali Bernardi      | 21 Church Lane, Camberwell SE16 5DX    |
| Amelija Hysi      | 63 New Street, Brent HA0 5BA           |
| Ammar Chhetri     | 98 The Avenue, Hillingdon TW6 3LP      |
| Artem Lynch       | 67 Charles Street, Hammersmith SW6 5EZ |
| Bismah Díaz       | 26 Sandy Lane, Camberwell SE24 8XX     |
| Dylan Chetry      | 12 Manor Close, Stratford E12 2DW      |
| George Rose       | 83 Water Lane, Southall UB5 1ER        |
| Lydia Yu          | 92 Park View, Wandsworth SW12 2ES      |
| Mariam Phạm       | 20 Station Road, Camberwell SE15 2AA   |
| Matteo Pereyra    | 7 Park Road, Hillingdon UB4 3ZU        |
| Milena Gjika      | 72 Hill Street, Camberwell SE5 6TQ     |
| Qillaq Murati     | 22 The Paddock, Croydon CR7 3HD        |
| Raul Saavedra     | 83 North Road, Hillingdon UB4 3AQ      |
| Samantha Martínez | 52 Silver Street, Romford RM5 3WW      |
| Shaimaa Cortés    | 18 Main Street, Camden Town WC1A 7ES   |
| Sienna Babić      | 50 Mill Road, Lewisham SE6 3GU         |
| Wilson Villa      | 44 Sycamore Close, Westminster W1J 0EG |
+-------------------+----------------------------------------+
```

### Query 8: `get_docs_from_accredited_hospitals.sql`

If `get_docs_from_accredited_hospitals.sql` is downloaded, the following SQL code can be used to print a list of all doctors based at Teaching hospitals which were accredited between 2015–2024. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_docs_from_accredited_hospitals.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_docs_from_accredited_hospitals.sql
```

This produces the following output:

```
+-----------+--------------------------+---------------------------+--------------------+
| doctor_id | doctor_name              | hospital_name             | accreditation_year |
+-----------+--------------------------+---------------------------+--------------------+
| 88        | Dr. Aarav Benítez        | Northwick Park Hospital   | 2022               |
| 100       | Dr. Ali Imai             | Freeman Hospital          | 2024               |
| 66        | Dr. Arthur Szabó         | Leicester Royal Infirmary | 2024               |
| 65        | Dr. Ava Sohn             | Bradford Royal Infirmary  | 2024               |
| 92        | Dr. Aylin Jakobsson      | Northwick Park Hospital   | 2022               |
| 2         | Dr. Dmytro Thy           | Northwick Park Hospital   | 2022               |
| 50        | Dr. Eliška Nieminen      | Leicester Royal Infirmary | 2024               |
| 76        | Dr. Emiliya Mamedovi     | Leicester Royal Infirmary | 2024               |
| 43        | Dr. Emir García          | Warrington Hospital       | 2024               |
| 59        | Dr. Ivana Bird           | St Thomas' Hospital       | 2022               |
| 90        | Dr. Julia Pavlov         | Northern General Hospital | 2022               |
| 81        | Dr. Leo Pino             | Bradford Royal Infirmary  | 2024               |
| 39        | Dr. Malak Müller         | Bradford Royal Infirmary  | 2024               |
| 60        | Dr. Malthe Herath        | Leicester Royal Infirmary | 2024               |
| 53        | Dr. Miguel De Los Santos | St Thomas' Hospital       | 2022               |
| 27        | Dr. Mohammad Shala       | Bradford Royal Infirmary  | 2024               |
| 79        | Dr. Muhammed López       | Leicester Royal Infirmary | 2024               |
| 82        | Dr. Sara Bai             | Northwick Park Hospital   | 2022               |
| 37        | Dr. Sara Chén            | St Thomas' Hospital       | 2022               |
| 51        | Dr. Titaina Božić        | Warrington Hospital       | 2024               |
| 15        | Dr. Turki Maeda          | Warrington Hospital       | 2024               |
+-----------+--------------------------+---------------------------+--------------------+
```

### Query 9: `get_patients_and_medication_from_diseaseID.sql`

If `get_patients_and_medication_from_diseaseID.sql` is downloaded, the following SQL code can be used to print a list of all patients who may have a particular disease based on which medication they have been prescribed. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@DiseaseID` to the unique ID number of the chosen disease:

```sql
SET @DiseaseId = 3;
```

Finally, run the `get_patients_and_medication_from_diseaseID.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_patients_and_medication_from_diseaseID.sql
```

This produces the following output:

```
+------------+--------------------+--------------+----------------------+
| patient_id | patient_name       | disease_name | medication_name      |
+------------+--------------------+--------------+----------------------+
| 278        | Vedant Todorova    | Bowel cancer | Fluorouracil         |
| 101        | Maya Petek         | Bowel cancer | Trifluridine         |
| 155        | Sofiya Jiménez     | Bowel cancer | Trifluridine         |
| 213        | Theodore Ivanovski | Bowel cancer | Picosulfate Sodium   |
| 558        | Maeva Vázquez      | Bowel cancer | Sodium Bicarbonate   |
| 358        | Mia Tang           | Bowel cancer | Sodium Sulfate       |
| 440        | Ali Cavalcante     | Bowel cancer | Capecitabine         |
| 70         | Maria Moser        | Bowel cancer | Panitumumab          |
| 534        | Dylan Subotić      | Bowel cancer | Levoleucovorin       |
| 272        | Martín Rivero      | Bowel cancer | Irinotecan Liposomal |
| 178        | Nika Pak           | Bowel cancer | Irinotecan Liposomal |
| 62         | Kyra Rusu          | Bowel cancer | Irinotecan Liposomal |
| 365        | Kairo Klein        | Bowel cancer | Irinotecan Liposomal |
+------------+--------------------+--------------+----------------------+
```

### Query 10: `get_docs_for_disease.sql`

If `get_docs_for_disease.sql` is downloaded, the following SQL code can be used to print a list of doctors who specialize in a particular disease. First, select the `hospitals_db` database:
```sql
USE hospitals_db;
```

Then, set the variable `@DiseaseID` to the unique ID number of the chosen disease:

```sql
SET @DiseaseID = 4;
```


Finally, run the `get_docs_for_disease.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_docs_for_disease.sql
```

This produces the following output:

```
+-----------+-------------------------+------------------------+-----------------------------+
| doctor_id | doctor_name             | disease_name           | hospital_name               |
+-----------+-------------------------+------------------------+-----------------------------+
|         4 | Dr. Lara Valverde       | Chronic kidney disease | Queen Elizabeth Hospital    |
|        32 | Dr. Farrah Jakobsson    | Chronic kidney disease | Harrogate District Hospital |
|        37 | Dr. Sara Chén           | Chronic kidney disease | St Thomas' Hospital         |
|        41 | Dr. Kairo Savchenko     | Chronic kidney disease | Whiston Hospital            |
|        42 | Dr. Varvara Karunaratne | Chronic kidney disease | Great Western Hospital      |
|        48 | Dr. Nikolaos Mikeladze  | Chronic kidney disease | Whiston Hospital            |
|        68 | Dr. Halim Edri          | Chronic kidney disease | Royal Cornwall Hospital     |
|        77 | Dr. Ahmed Mao           | Chronic kidney disease | Derriford Hospital          |
|        85 | Dr. Mia Pereyra         | Chronic kidney disease | Sunderland Royal Hospital   |
|        97 | Dr. Haruma Phạm         | Chronic kidney disease | Derriford Hospital          |
+-----------+-------------------------+------------------------+-----------------------------+
```



### Query 11: `get_lab_results_over_60.sql`

If `get_lab_results_over_60.sql` is downloaded, the following SQL code can be used to print a list of lab results for all patients over the age of 60. First, select the `hospitals_db` database:
```sql
USE hospitals_db;
```
Then, run the `get_lab_results_over_60.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_lab_results_over_60.sql
```

The first five rows of the produced table are as follows:

```
+------------+------------------------------------+---------------+------------+-----------------------+-------------+
| test_date  | test_type                          | test_result   | patient_id | patient_name          | patient_dob |
+------------+------------------------------------+---------------+------------+-----------------------+-------------+
| 2025-11-28 | Blood Test: C-Reactive Protein     | 1.1 mg/L      |         18 | Emma García           | 1933-07-19  |
| 2025-11-26 | Blood Test: Iron                   | 23 umol/L     |         34 | Tarita Chu            | 1936-05-08  |
| 2025-11-25 | Blood Test: C-Reactive Protein     | 8.9 mg/L      |        356 | Yǔzé Žukauskienė      | 1942-07-05  |
| 2025-11-20 | Blood Test: Glucose                | 19.2 mmol/L   |        562 | Hashem Iû             | 1959-01-05  |
| 2025-11-11 | Blood Test: HbA1c                  | 93 mmol/mol   |        434 | Kabita Andreassen     | 1936-04-01  |
+------------+------------------------------------+---------------+------------+-----------------------+-------------+
```



### Query 12: `get_appointments_for_patient.sql`

If `get_appointments_for_patient.sql` is downloaded, the following SQL code can be used to print a list of all appointments for a given patient.First, select the `hospitals_db` database:
```sql
USE hospitals_db;
```
Then, set the variable `@PatientID` to the unique ID number of the chosen patient:

```sql
SET @PatientID = 35;
```
Finally, run the `get_appointments_for_patient.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_appointments_for_patient.sql
```

This produces the following output:

```
+------------------+--------------+------------------------+
| appointment_date | patient_name | doctor_name            |
+------------------+--------------+------------------------+
| 2026-01-21       | Noor Ali     | Dr. Vasileios Jönsson  |
| 2026-12-16       | Noor Ali     | Dr. Siti Gouw          |
+------------------+--------------+------------------------+
```
### Query 13: `get_appointments_for_doc.sql`

If `get_appointments_for_doc.sql` is downloaded, the following SQL code can be used to print a list of all appointments for a given doctor. First, select the `hospitals_db` database:
```sql
USE hospitals_db;
```

Then, set the variable `@DoctorID` to the unique ID number of the chosen doctor:

```sql
SET @DoctorID = 5;
```

Finally, run the `get_appointments_for_doc.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_appointments_for_doc.sql
```

This produces the following output:

```
+------------------+------------------+--------------------+
| appointment_date | patient_name     | doctor_name        |
+------------------+------------------+--------------------+
| 2026-02-19       | Oliver Molnár    | Dr. Prem Perković  |
| 2027-03-07       | Frida Ilić       | Dr. Prem Perković  |
| 2027-07-11       | Daniela Lungu    | Dr. Prem Perković  |
| 2027-07-15       | Angela Kola      | Dr. Prem Perković  |
| 2027-07-21       | Naya Sin         | Dr. Prem Perković  |
| 2027-10-02       | Riko Tóth        | Dr. Prem Perković  |
| 2027-11-25       | Matei Ivanov     | Dr. Prem Perković  |
| 2027-12-28       | Eliška Pedersen  | Dr. Prem Perković  |
+------------------+------------------+--------------------+
```
### Query 14: `get_hospital_prescriptions.sql`

If `get_hospital_prescriptions.sql` is downloaded, the following SQL code can be used to print all prescriptions made from a particular hospital ordered alphabetically by the name of the medication being prescribed. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@HospitalID` to the unique ID number of the chosen hospital:

```sql
SET @HosptialID = 10;
```

Finally, run the `get_hospital_prescriptions.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
 source /filepath/of/get_hospital_prescriptions.sql
```

This produces the following output:

```
+-----------------------------+-------------------+----------------------+--------------------------+
| medication_name             | doctor_name       | patient_name         | hospital_name            |
+-----------------------------+-------------------+----------------------+--------------------------+
| Atezolizumab                | Dr. Gogo Lín      | Lucía Rodríguez      | Queen Elizabeth Hospital |
| Echinacea Purpurea Extract  | Dr. Lara Valverde | Charbel Tremblay     | Queen Elizabeth Hospital |
| Ertugliflozin / Sitagliptin | Dr. Gogo Lín      | Gabor Popović        | Queen Elizabeth Hospital |
| Fleroxacin                  | Dr. Gogo Lín      | Julia Kobayashi      | Queen Elizabeth Hospital |
| Isosorbide                  | Dr. Gogo Lín      | Melissa Fontana      | Queen Elizabeth Hospital |
| Lorcaserin                  | Dr. Lara Valverde | Liam Singh           | Queen Elizabeth Hospital |
| Mephentermine               | Dr. Lara Valverde | Mùchén Rodriguez     | Queen Elizabeth Hospital |
| Naldemedine                 | Dr. Gogo Lín      | Oscar Muñoz          | Queen Elizabeth Hospital |
| Niacin                      | Dr. Gogo Lín      | Alexander Fekete     | Queen Elizabeth Hospital |
| Pertuzumab                  | Dr. Gogo Lín      | Goran Yokoyama       | Queen Elizabeth Hospital |
| Pirbuterol                  | Dr. Gogo Lín      | Victoria Ryan        | Queen Elizabeth Hospital |
| Tannic Acid                 | Dr. Lara Valverde | Patricia Díaz        | Queen Elizabeth Hospital |
| Trifluridine                | Dr. Lara Valverde | Maya Petek           | Queen Elizabeth Hospital |
| Trovafloxacin               | Dr. Gogo Lín      | Melissa Fontana      | Queen Elizabeth Hospital |
| Yucca Schidigera Extract    | Dr. Gogo Lín      | Juliana delos Santos | Queen Elizabeth Hospital |
+-----------------------------+-------------------+----------------------+--------------------------+
```

### Query 15: `get_lab_results_at_hospitals_accred_btwn_2013_2020.sql`

If `get_lab_results_at_hospitals_accred_btwn_2013_2020.sql` is downloaded, the following SQL code can be used to print a list of lab results from all hospitals that were accredited between 2013–2020. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_lab_results_at_hospitals_accred_btwn_2013_2020.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_lab_results_at_hospitals_accred_btwn_2013_2020.sql
```

The first five rows of the produced table are as follows:

```
+------------+------------------------------------+---------------+----------------------+----------------------+---------------------------------+--------------------+
| test_date  | test_type                          | test_result   | patient_name         | doctor_name          | hospital_name                   | accreditation_year |
+------------+------------------------------------+---------------+----------------------+----------------------+---------------------------------+--------------------+
| 2025-11-26 | Blood Test: Neutrophils            | 3.7 x 10^9/L  | Nazanin-Zahra Katō   | Dr. Sunita Valente   | Westmorland General Hospital    |               2013 |
| 2025-11-26 | Blood Test: Iron                   | 23 umol/L     | Tarita Chu           | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2025-11-11 | Blood Test: Creatinine             | 87 umol/L     | Ana Jovanović        | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2025-11-06 | Blood Test: Haemoglobin            | 95 g/L        | Elmar Martirosyan    | Dr. İnci Todorova    | Amersham Hospital               |               2013 |
| 2025-11-02 | Blood Test: LDL Cholesterol        | 4.1 mmol/L    | Melissa Fontana      | Dr. Seo-yun Iwasaki  | North Tyneside General Hospital |               2019 |
+------------+------------------------------------+---------------+----------------------+----------------------+---------------------------------+--------------------+
```

### Query 16: `get_max_prescriber.sql`

If `get_max_prescriber.sql` is downloaded, the following SQL code can be used to dentify which doctor has made the most prescriptions. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_max_prescriber.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_max_prescriber.sql
```

This produces the following output:

```
+-----------+------------------+------------------------+---------------------+
| doctor_id | doctor_name      | hospital_name          | total_prescriptions |
+-----------+------------------+------------------------+---------------------+
|        78 | Dr. Ariana Murat | Darent Valley Hospital |                  11 |
+-----------+------------------+------------------------+---------------------+
```

### Query 17: `get_docs_at_biggest_hospital.sql`

If `get_docs_at_biggest_hospital.sql` is downloaded, the following SQL code can be used to print a list of all doctors at the hospital with biggest size (number of beds). First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_docs_at_biggest_hospital.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_docs_at_biggest_hospital.sql
```

This produces the following output:

```
+-----------+------------------------+-------------------+
| doctor_id | doctor_name            | hospital_name     |
+-----------+------------------------+-------------------+
|        12 | Dr. Kajus Kang         | Worthing Hospital |
|        13 | Dr. Ximena Mizrachi    | Worthing Hospital |
|        19 | Dr. Elif Rossi         | Worthing Hospital |
|        21 | Dr. Vasileios Jönsson  | Worthing Hospital |
|        84 | Dr. Artiom Përmeti     | Worthing Hospital |
|        96 | Dr. Zoran Díaz         | Worthing Hospital |
+-----------+------------------------+-------------------+
```

### Query 18: `get_emergency_hospitals_accred_pre_2015.sql`

If `get_emergency_hospitals_accred_pre_2015.sql` is downloaded, the following SQL code can be used to print a list of all hospital names which were accredited prior to 2015 and do have Emergency Service facilities. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_emergency_hospitals_accred_pre_2015.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_emergency_hospitals_accred_pre_2015.sql
```

This produces the following output:

```
+-------------+------------------------------+--------------------+
| hospital_id | hospital_name                | accreditation_year |
+-------------+------------------------------+--------------------+
|          20 | Torbay Hospital              |               2014 |
|          14 | Westmorland General Hospital |               2013 |
|          25 | Amersham Hospital            |               2013 |
|          26 | Royal Blackburn Hospital     |               2010 |
+-------------+------------------------------+--------------------+
```

### Query 19: `get_patients_at_small_hospitals.sql`

If `get_patients_at_small_hospitals.sql` is downloaded, the following SQL code can be used to print a list of patients registered with doctors who are based at hospital with <400 beds. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_patients_at_small_hospitals.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_patients_at_small_hospitals.sql
```

The first five rows of the produced table are as follows:

```
+------------+---------------------+-----------+--------------------------+-----------------------------+
| patient_id | patient_name        | doctor_id | doctor_name              | hospital_name               |
+------------+---------------------+-----------+--------------------------+-----------------------------+
|         15 | Charlie O'Connor    |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|         21 | Ricardo Marić       |        89 | Dr. Noah Nguyen          | Harrogate District Hospital |
|         31 | Lara Delemović      |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|         85 | Abdullo Pang        |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|         91 | Emma Bairamovi      |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
+------------+---------------------+-----------+--------------------------+-----------------------------+
```
