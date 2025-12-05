# sql_queries

This directory contains SQL scipt files for nineteen different queries that can be used to obtain information from `hospitals_db`.

- [Query 1, `get_docs_at_hosp.sql`](#query-1-get_docs_at_hospsql): Print a list of all doctors based at a particular hospital.
- [Query 2, `get_prescriptions_for_patient.sql`](#query-2-get_prescriptions_for_patientsql): Print a list of all prescriptions for a particular patient, ordered by the prescription date.
- [Query 3, `get_prescriptions_from_doc.sql`](#query-3-get_prescriptions_from_docsql): Print a list of all prescriptions that a particular doctor has prescribed.
- [Query 4, `get_prescriptions_for_all_patient_alphabetical.sql`](#query-4-get_prescriptions_for_all_patient_alphabeticalsql): Print a table showing all prescriptions ordered by the patient name alphabetically.
- [Query 5, `query_name.sql`](#query-5-query_namesql): Add a new customer to the database, including being registered with one of the doctors.
- [Query 6, `query_name.sql`](#query-6-query_namesql): Modify address details of an existing customer.
- [Query 7, `query_name.sql`](#query-7-query_namesql): Print a list of all patient names and addresses for patients registered to doctors based at one particular hospital – that could be used for posting information mail to all of one hospital’s registered patients.
- [Query 8, `query_name.sql`](#query-8-query_namesql): Print a list of all doctors based at Teaching hospitals which were accredited between 2015–2024.
- [Query 9, `query_name.sql`](#query-9-query_namesql): List all patients who may have a particular disease based on which medication they have been prescribed.
- [Query 10, `query_name.sql`](#query-10-query_namesql): List all doctors who specialize in a particular disease.
- [Query 11, `query_name.sql`](#query-11-query_namesql): List all lab results for all patients over the age of 60.
- [Query 12, `query_name.sql`](#query-12-query_namesql): Print a list of all appointments for a given patient.
- [Query 13, `list_of_all_appointments_for_a_doctor.sql`](#query-13-list_of_all_appointments_for_a_doctorsql): Print a list of all appointments for a given doctor.
- [Query 14, `query_name.sql`](#query-14-query_namesql): Print all prescriptions made from a particular hospital ordered alphabetically by the name of the medication being prescribed – the output of this SQL query should include only these 4 columns: the medication name, the name of doctor who prescribed it, the name of the patient, and the name of hospital.
- [Query 15, `query_name.sql`](#query-15-query_namesql): Print a list of all lab results from all hospitals that were accredited between 2013–2020.
- [Query 16, `get_max_prescriber.sql`](#query-16-get_max_prescribersql): Identify which doctor has made the most prescriptions.
- [Query 17, `get_docs_at_biggest_hosp.sql`](#query-17-get_docs_at_biggest_hospsql): Print a list of all doctors at the hospital with biggest size (number of beds).
- [Query 18, `get_emergency_hosps_accred_pre_2015.sql`](#query-18-get_emergency_hosps_accred_pre_2015sql): Print a list of all hospital names which were accredited prior to 2015 and do have Emergency Service facilities.
- [Query 19, `get_pts_at_small_hosps.sql`](#query-19-get_pts_at_small_hospssql): Print a list of patients registered with doctors who are based at hospital with <400 beds.

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
wget https://github.com/Raiet-Bekirov/HPDM172_assignment/raw/refs/heads/main/sql_queries/get_docs_at_hosp.sql
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
source get_docs_at_hosp.sql
```

Quit MySQL:

```sql
quit
```

## Example ouputs from each query

### Query 1: `get_docs_at_hosp.sql`

If `get_docs_at_hosp.sql` is downloaded, the following SQL code can be used to print a list of all doctors based at a particular hospital. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@HospitalID` to the unique ID number of the chosen hospital:

```sql
SET @HospitalID = 33;
```

Finally, run the `get_docs_at_hosp` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_docs_at_hosp.sql
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
SET @PatientID = 52;
```

Finally, run the `get_prescriptions_for_patient.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_prescriptions_for_patient.sql
```

This produces the following output:

```
+-----------------+-------------------+--------------+-------------------+------------------+
| prescription_id | prescription_date | patient_name | doctor_name       | medication_name  |
+-----------------+-------------------+--------------+-------------------+------------------+
|             303 | 2025-10-09        | Liam Singh   | Dr. Lara Valverde | Darbepoetin Alfa |
|             225 | 2025-02-24        | Liam Singh   | Dr. Ali Imai      | Ceritinib        |
|              92 | 2025-02-04        | Liam Singh   | Dr. Lara Valverde | Flecainide       |
+-----------------+-------------------+--------------+-------------------+------------------+
```
### Query 3: `get_prescriptions_from_doc.sql`

If `get_prescriptions_from_doc.sql` is downloaded, the following SQL code can be used to print a list of all prescriptions that a particular doctor has prescribed. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@DoctorID` to the unique ID number of the chosen doctor:

```sql
SET @DoctorID = 100
```

Finally, run the `get_prescriptions_from_doc.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_prescriptions_from_doc.sql
```

This produces the following output:
```
+-----------------+-------------------+------------------+--------------+------------------+
| prescription_id | prescription_date | patient_name     | doctor_name  | medication_name  |
+-----------------+-------------------+------------------+--------------+------------------+
|             137 | 2025-10-19        | Anna Eriksson    | Dr. Ali Imai | Fomepizole       |
|              28 | 2025-10-11        | Shaikha Araya    | Dr. Ali Imai | Prazosin         |
|             214 | 2025-07-27        | Mariam Huang     | Dr. Ali Imai | Doxylamine       |
|              62 | 2025-06-21        | Alejandro Robles | Dr. Ali Imai | Buspirone        |
|             225 | 2025-02-24        | Liam Singh       | Dr. Ali Imai | Ceritinib        |
|              29 | 2025-02-09        | Lillie Kimura    | Dr. Ali Imai | Chlordiazepoxide |
|             272 | 2024-10-11        | Sophie Murati    | Dr. Ali Imai | Dabigatran       |
|             178 | 2024-05-13        | Hashem Benedetti | Dr. Ali Imai | Hydralazine      |
|             454 | 2024-02-09        | Mariam Choy      | Dr. Ali Imai | Mannitol         |
+-----------------+-------------------+------------------+--------------+------------------+
```

### Query 4: `get_prescriptions_for_all_patient_alphabetical.sql`

If `get_prescriptions_for_all_patient_alphabetical.sql` is downloaded, the following SQL code can be used to print a table showing all prescriptions ordered by the patient's last name alphabetically. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_prescriptions_for_all_patient_alphabetical.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_prescriptions_for_all_patient_alphabetical.sql
```

The first five rows of produced table:
```
+-----------------+-------------------+-----------------------+--------------------------+----------------------------------+
| prescription_id | prescription_date | patient_name          | doctor_name              | medication_name                  |
+-----------------+-------------------+-----------------------+--------------------------+----------------------------------+
|             326 | 2025-05-17        | Ammar Abdrahmanov     | Dr. Nikolaos Mikeladze   | Gatifloxacin                     |
|              38 | 2024-03-04        | Ammar Abdrahmanov     | Dr. Prem Perković        | Crizotinib                       |
|             479 | 2025-06-28        | Batkhaаn Abdullayev   | Dr. Ariana Murat         | Bromazepam                       |
|              49 | 2025-05-09        | Batkhaаn Abdullayev   | Dr. Zoran Díaz           | Pembrolizumab                    |
|             100 | 2025-10-04        | Mustafa Aguilar       | Dr. Kairo Savchenko      | Milrinone                        |
+-----------------+-------------------+-----------------------+--------------------------+----------------------------------+
```

### Query 5: `query_name.sql`

### Query 6: `query_name.sql`

### Query 7: `query_name.sql`

### Query 8: `query_name.sql`

### Query 9: `query_name.sql`

### Query 10: `query_name.sql`

### Query 11: `query_name.sql`

### Query 12: `query_name.sql`

### Query 13: `list_of_all_appointments_for_a_doctor.sql`

If `list_of_all_appointments_for_a_doctor.sql` is downloaded, the following SQL code can be used to print a list of all appointments for a given doctor.First, select the `hospitals_db` database:
```sql
USE hospitals_db;
```

Then, set the variable `@DoctorID` to the unique ID number of the chosen doctor:

```sql
SET @DoctorID = 5;
```

Finally, run the `list_of_all_appointments_for_a_doctor.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/list_of_all_appointments_for_a_doctor.sql
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
### Query 14: `query_name.sql`

### Query 15: `query_name.sql`

### Query 16: `get_max_prescriber.sql`

If `get_max_prescriber.sql` is downloaded, the following SQL code can be used to dentify which doctor has made the most prescriptions. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_max_prescriber.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_max_prescriber.sql.sql
```

This produces the following output:

```
+-----------+------------------+------------------------+---------------------+
| doctor_id | doctor_name      | hospital_name          | total_prescriptions |
+-----------+------------------+------------------------+---------------------+
|        78 | Dr. Ariana Murat | Darent Valley Hospital |                  11 |
+-----------+------------------+------------------------+---------------------+
```

### Query 17: `get_docs_at_biggest_hosp.sql`

If `get_docs_at_biggest_hosp.sql` is downloaded, the following SQL code can be used to print a list of all doctors at the hospital with biggest size (number of beds). First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_docs_at_biggest_hosp.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_docs_at_biggest_hosp.sql
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

### Query 18: `get_emergency_hosps_accred_pre_2015.sql`

If `get_emergency_hosps_accred_pre_2015.sql` is downloaded, the following SQL code can be used to print a list of all hospital names which were accredited prior to 2015 and do have Emergency Service facilities. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_emergency_hosps_accred_pre_2015.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_emergency_hosps_accred_pre_2015.sql
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

### Query 19: `get_pts_at_small_hosps.sql`

If `get_pts_at_small_hosps.sql` is downloaded, the following SQL code can be used to print a list of patients registered with doctors who are based at hospital with <400 beds. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_pts_at_small_hosps.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_pts_at_small_hosps.sql
```

This produces the following output:

```
+------------+---------------------+-----------+--------------------------+-----------------------------+
| patient_id | patient_name        | doctor_id | doctor_name              | hospital_name               |
+------------+---------------------+-----------+--------------------------+-----------------------------+
|        566 | Marti Lou           |        89 | Dr. Noah Nguyen          | Harrogate District Hospital |
|        530 | Archie Torres       |        89 | Dr. Noah Nguyen          | Harrogate District Hospital |
|        511 | Liam Hodžić         |        89 | Dr. Noah Nguyen          | Harrogate District Hospital |
|        103 | Julia Garcia        |        89 | Dr. Noah Nguyen          | Harrogate District Hospital |
|         21 | Ricardo Marić       |        89 | Dr. Noah Nguyen          | Harrogate District Hospital |
|        598 | Isabella Jiménez    |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        549 | Juan Saitō          |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        369 | Evens Lie           |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        330 | Elizabeth Ramírez   |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        248 | Paraskevi Vuković   |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        247 | Mädïna Lín          |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|         85 | Abdullo Pang        |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|         15 | Charlie O'Connor    |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        586 | Vasilisa Wright     |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        510 | Sophia Perera       |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        480 | Brahim Polishchuk   |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        469 | Maryam Yau          |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        241 | Finn Balogh         |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        227 | Elyas Huáng         |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        125 | Ida Nikolla         |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|         91 | Emma Bairamovi      |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|         31 | Lara Delemović      |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|         39 | Andrej Welter       |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        557 | Ali Kastrati        |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        174 | Lydia Mkrtchyan     |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        300 | Emmanuel Aivaliotis |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        318 | Ivan Hur            |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        320 | Mohammad Santos     |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        336 | Aya Farkas          |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        376 | Nikolaos Kawano     |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        446 | Daniel Wagner       |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|         24 | James Sánchez       |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|        115 | Helmi Koak          |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|        214 | Filip Morel         |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|        408 | Frida Muñoz         |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|        509 | Lorenzo Gallagher   |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|        582 | Mariami Kelmendi    |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|        186 | Emely Lynch         |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        429 | Farah Markoski      |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        178 | Nika Pak            |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        315 | Gabriel Shevchuk    |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        443 | Daria Ko            |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        478 | Konstantinos Bustos |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        347 | Sōma Sharma         |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        367 | Hugo Lovrić         |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        371 | Tomás Lee           |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        518 | Celine Rodríguez    |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        477 | Sofía Correia       |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        600 | Damian Gutiérrez    |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        467 | Nora Weerasinghe    |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        441 | Ali Schmidt         |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        301 | Konul Wood          |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        130 | Mila Muñoz          |        35 | Dr. Willow Karlsen       | Airedale General Hospital   |
|        165 | Zahra Trajanovski   |        35 | Dr. Willow Karlsen       | Airedale General Hospital   |
|        281 | Umar Orellana       |        35 | Dr. Willow Karlsen       | Airedale General Hospital   |
|        581 | Joel Rojas          |        35 | Dr. Willow Karlsen       | Airedale General Hospital   |
|        226 | Islande Estrada     |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        199 | Lea Prakash         |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|         79 | Stanisław Angelova  |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|         74 | Ambre López         |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|         64 | Mikołaj Tan         |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        580 | Roghayyeh Sousa     |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        488 | Djeneba Díaz        |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        455 | Annie Sánchez       |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|          6 | Ivan Nand           |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|         14 | Pedro Lombardo      |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        246 | Maria Sepúlveda     |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        290 | Lethabo Carter      |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        303 | Oscar Díaz          |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        328 | Moussa Lương        |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        370 | Mihail Bailey       |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|         82 | Oliver Djurhuus     |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        137 | Aleksandra Ibraev   |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        139 | Oisín Sánchez       |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        192 | Naïm Wong           |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        196 | Heitor Popescu      |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        200 | Barbara Johnson     |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        309 | Nuka Scheving       |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        439 | Gamalat Özdemir     |        18 | Dr. İnci Todorova        | Amersham Hospital           |
+------------+---------------------+-----------+--------------------------+-----------------------------+
```
