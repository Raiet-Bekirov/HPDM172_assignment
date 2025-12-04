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
- [Query 10, `query_name.sql`](#query-10-query_namesql): List all doctors based at who specialize in a particular disease.
- [Query 11, `query_name.sql`](#query-11-query_namesql): List all lab results for all patients over the age of 60.
- [Query 12, `query_name.sql`](#query-12-query_namesql): Print a list of all appointments for a given patient.
- [Query 13, `query_name.sql`](#query-13-query_namesql): Print a list of all appointments for a given doctor.
- [Query 14, `query_name.sql`](#query-14-query_namesql): Print all prescriptions made from a particular hospital ordered alphabetically by the name of the medication being prescribed – the output of this SQL query should include only these 4 columns: the medication name, the name of doctor who prescribed it, the name of the patient, and the name of hospital.
- [Query 15, `query_name.sql`](#query-15-query_namesql): Print a list of all lab results from all hospitals that were accredited between 2013–2020.
- [Query 16, `query_name.sql`](#query-16-query_namesql): Identify which doctor has made the most prescriptions.
- [Query 17, `query_name.sql`](#query-17-query_namesql): Print a list of all doctors at the hospital with biggest size (number of beds).
- [Query 18, `query_name.sql`](#query-18-query_namesql): Print a list of all hospital names which were accredited prior to 2015 and do have Emergency Service facilities.
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
SET @HospitalName = "Southmead Hospital";
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

Then, set the variable `@HospitalName` to the name of the chosen hospital:

```sql
SET @HospitalName = "St Thomas' Hospital";
```

Finally, run the `get_docs_at_hosp` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_docs_at_hosp.sql
```

This produces the following output:

```
+-----------+--------------------------+
| doctor_id | doctor_name              |
+-----------+--------------------------+
|        37 | Dr. Sara Chén            |
|        53 | Dr. Miguel De Los Santos |
|        59 | Dr. Ivana Bird           |
+-----------+--------------------------+
```

### Query 2: `get_prescriptions_for_patient.sql`

If `get_docs_at_hosp.sql` is downloaded, the following SQL code can be used to print a list of all prescriptions for a particular patient, ordered by the prescription date. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@PatientName` to the name of the chosen patient:

```sql
SET @PatientName = 'Manuel Uhm';
```

Finally, run the `get_prescriptions_for_patient.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_prescriptions_for_patient.sql
```

This produces the following output:

```
+-----------------+-------------------+-----------------+---------------------+
| prescription_id | prescription_date | medication_name | doctor_name         |
+-----------------+-------------------+-----------------+---------------------+
|             150 | 2024-09-29        | Phenobarbital   | Dr. Kairo Savchenko |
+-----------------+-------------------+-----------------+---------------------+
```
### Query 3: `get_prescriptions_from_doc.sql`

If `get_prescriptions_from_doc.sql` is downloaded, the following SQL code can be used to print a list of all prescriptions that a particular doctor has prescribed. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@DoctorName` to the name of the chosen doctor:

```sql
SET @DoctorName = 'Dr. Kora Kelmendi'
```

Finally, run the `get_prescriptions_from_doc.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_prescriptions_from_doc.sql
```

This produces the following output:
```
+-----------------+-------------------+-------------------+------------------+----------------------------------+
| prescription_id | prescription_date | doctor_name       | patient_name     | medication_name                  |
+-----------------+-------------------+-------------------+------------------+----------------------------------+
|             430 | 2024-02-15        | Dr. Kora Kelmendi | Abdallah Sharma  | Insulin, Protamine Lispro, Human |
|             330 | 2024-10-01        | Dr. Kora Kelmendi | Marcia Lefebvre  | Clorazepate                      |
|             299 | 2025-09-01        | Dr. Kora Kelmendi | Wen-Hsiung Huang | Aminophylline                    |
+-----------------+-------------------+-------------------+------------------+----------------------------------+
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

The first three rows of produced table:
```
+-----------------------+-----------------+-------------------+----------------------------------+--------------------------+
| patient_name          | prescription_id | prescription_date | medication_name                  | doctor_name              |
+-----------------------+-----------------+-------------------+----------------------------------+--------------------------+
| Ammar Abdrahmanov     |              38 | 2024-03-04        | Crizotinib                       | Dr. Prem Perković        |
| Ammar Abdrahmanov     |             326 | 2025-05-17        | Gatifloxacin                     | Dr. Nikolaos Mikeladze   |
| Batkhaаn Abdullayev   |              49 | 2025-05-09        | Pembrolizumab                    | Dr. Zoran Díaz           |
+-----------------------+-----------------+-------------------+----------------------------------+--------------------------+
```

### Query 5: `query_name.sql`

### Query 6: `query_name.sql`

### Query 7: `query_name.sql`

### Query 8: `query_name.sql`

### Query 9: `query_name.sql`

### Query 10: `query_name.sql`

### Query 11: `query_name.sql`

### Query 12: `query_name.sql`

### Query 13: `query_name.sql`

### Query 14: `query_name.sql`

### Query 15: `query_name.sql`

### Query 16: `query_name.sql`

### Query 17: `query_name.sql`

### Query 18: `query_name.sql`

### Query 19: `query_name.sql`

If `get_pts_at_small_hosps.sql` is downloaded, the following SQL code can be used to print a list of patients registered with doctors who are based at hospital with <400 beds. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_prescriptions_for_all_patient_alphabetical.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_prescriptions_for_all_patient_alphabetical.sql
```

This produces the following output:

```
+------------+---------------------+--------------------------+-----------------------------+
| patient_id | patient_name        | doctor_name              | hospital_name               |
+------------+---------------------+--------------------------+-----------------------------+
|         39 | Andrej Welter       | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        174 | Lydia Mkrtchyan     | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        300 | Emmanuel Aivaliotis | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        318 | Ivan Hur            | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        320 | Mohammad Santos     | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        336 | Aya Farkas          | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        376 | Nikolaos Kawano     | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        446 | Daniel Wagner       | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        557 | Ali Kastrati        | Dr. Kora Kelmendi        | Dorset County Hospital      |
|         24 | James Sánchez       | Dr. Matej Maldonado      | Dorset County Hospital      |
|        115 | Helmi Koak          | Dr. Matej Maldonado      | Dorset County Hospital      |
|        214 | Filip Morel         | Dr. Matej Maldonado      | Dorset County Hospital      |
|        408 | Frida Muñoz         | Dr. Matej Maldonado      | Dorset County Hospital      |
|        509 | Lorenzo Gallagher   | Dr. Matej Maldonado      | Dorset County Hospital      |
|        582 | Mariami Kelmendi    | Dr. Matej Maldonado      | Dorset County Hospital      |
|        137 | Aleksandra Ibraev   | Dr. İnci Todorova        | Amersham Hospital           |
|        139 | Oisín Sánchez       | Dr. İnci Todorova        | Amersham Hospital           |
|        192 | Naïm Wong           | Dr. İnci Todorova        | Amersham Hospital           |
|        196 | Heitor Popescu      | Dr. İnci Todorova        | Amersham Hospital           |
|        200 | Barbara Johnson     | Dr. İnci Todorova        | Amersham Hospital           |
|        309 | Nuka Scheving       | Dr. İnci Todorova        | Amersham Hospital           |
|        439 | Gamalat Özdemir     | Dr. İnci Todorova        | Amersham Hospital           |
|         31 | Lara Delemović      | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|         91 | Emma Bairamovi      | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        125 | Ida Nikolla         | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        227 | Elyas Huáng         | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        241 | Finn Balogh         | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        469 | Maryam Yau          | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        480 | Brahim Polishchuk   | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        510 | Sophia Perera       | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        586 | Vasilisa Wright     | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|         15 | Charlie O'Connor    | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|         85 | Abdullo Pang        | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        247 | Mädïna Lín          | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        248 | Paraskevi Vuković   | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        330 | Elizabeth Ramírez   | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        369 | Evens Lie           | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        549 | Juan Saitō          | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        598 | Isabella Jiménez    | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|         21 | Ricardo Marić       | Dr. Noah Nguyen          | Harrogate District Hospital |
|        103 | Julia Garcia        | Dr. Noah Nguyen          | Harrogate District Hospital |
|        511 | Liam Hodžić         | Dr. Noah Nguyen          | Harrogate District Hospital |
|        530 | Archie Torres       | Dr. Noah Nguyen          | Harrogate District Hospital |
|        566 | Marti Lou           | Dr. Noah Nguyen          | Harrogate District Hospital |
|         74 | Ambre López         | Dr. Alexander Iskakov    | Airedale General Hospital   |
|         79 | Stanisław Angelova  | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        199 | Lea Prakash         | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        226 | Islande Estrada     | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        301 | Konul Wood          | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        441 | Ali Schmidt         | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        467 | Nora Weerasinghe    | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        600 | Damian Gutiérrez    | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        178 | Nika Pak            | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        347 | Sōma Sharma         | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        367 | Hugo Lovrić         | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        371 | Tomás Lee           | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        455 | Annie Sánchez       | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        488 | Djeneba Díaz        | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        580 | Roghayyeh Sousa     | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|         64 | Mikołaj Tan         | Dr. Anna Urbonienė       | Airedale General Hospital   |
|         82 | Oliver Djurhuus     | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        186 | Emely Lynch         | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        315 | Gabriel Shevchuk    | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        443 | Daria Ko            | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        478 | Konstantinos Bustos | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        130 | Mila Muñoz          | Dr. Willow Karlsen       | Airedale General Hospital   |
|        165 | Zahra Trajanovski   | Dr. Willow Karlsen       | Airedale General Hospital   |
|        281 | Umar Orellana       | Dr. Willow Karlsen       | Airedale General Hospital   |
|        581 | Joel Rojas          | Dr. Willow Karlsen       | Airedale General Hospital   |
|          6 | Ivan Nand           | Dr. Willow Morales       | Airedale General Hospital   |
|         14 | Pedro Lombardo      | Dr. Willow Morales       | Airedale General Hospital   |
|        246 | Maria Sepúlveda     | Dr. Willow Morales       | Airedale General Hospital   |
|        290 | Lethabo Carter      | Dr. Willow Morales       | Airedale General Hospital   |
|        303 | Oscar Díaz          | Dr. Willow Morales       | Airedale General Hospital   |
|        328 | Moussa Lương        | Dr. Willow Morales       | Airedale General Hospital   |
|        370 | Mihail Bailey       | Dr. Willow Morales       | Airedale General Hospital   |
|        429 | Farah Markoski      | Dr. Willow Morales       | Airedale General Hospital   |
|        477 | Sofía Correia       | Dr. Willow Morales       | Airedale General Hospital   |
|        518 | Celine Rodríguez    | Dr. Willow Morales       | Airedale General Hospital   |
+------------+---------------------+--------------------------+-----------------------------+
```