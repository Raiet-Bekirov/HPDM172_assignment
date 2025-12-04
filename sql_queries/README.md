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

If `get_prescriptions_for_patient.sql` is downloaded, the following SQL code can be used to print a list of all prescriptions for a particular patient, ordered by the prescription date. First, select the `hospitals_db` database:

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
+-----------+------------------------+-------------------+------------+
| doctor_id | doctor_name            | hospital_name     | no_of_beds |
+-----------+------------------------+-------------------+------------+
|        12 | Dr. Kajus Kang         | Worthing Hospital |       1832 |
|        13 | Dr. Ximena Mizrachi    | Worthing Hospital |       1832 |
|        19 | Dr. Elif Rossi         | Worthing Hospital |       1832 |
|        21 | Dr. Vasileios Jönsson  | Worthing Hospital |       1832 |
|        84 | Dr. Artiom Përmeti     | Worthing Hospital |       1832 |
|        96 | Dr. Zoran Díaz         | Worthing Hospital |       1832 |
+-----------+------------------------+-------------------+------------+
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
+------------+---------------------+--------------------------+-----------------------------+------------+
| patient_id | patient_name        | doctor_name              | hospital_name               | no_of_beds |
+------------+---------------------+--------------------------+-----------------------------+------------+
|         31 | Lara Delemović      | Dr. Farrah Jakobsson     | Harrogate District Hospital |        303 |
|         91 | Emma Bairamovi      | Dr. Farrah Jakobsson     | Harrogate District Hospital |        303 |
|        125 | Ida Nikolla         | Dr. Farrah Jakobsson     | Harrogate District Hospital |        303 |
|        227 | Elyas Huáng         | Dr. Farrah Jakobsson     | Harrogate District Hospital |        303 |
|        241 | Finn Balogh         | Dr. Farrah Jakobsson     | Harrogate District Hospital |        303 |
|        469 | Maryam Yau          | Dr. Farrah Jakobsson     | Harrogate District Hospital |        303 |
|        480 | Brahim Polishchuk   | Dr. Farrah Jakobsson     | Harrogate District Hospital |        303 |
|        510 | Sophia Perera       | Dr. Farrah Jakobsson     | Harrogate District Hospital |        303 |
|        586 | Vasilisa Wright     | Dr. Farrah Jakobsson     | Harrogate District Hospital |        303 |
|         15 | Charlie O'Connor    | Dr. Elizaveta Svobodová  | Harrogate District Hospital |        303 |
|         85 | Abdullo Pang        | Dr. Elizaveta Svobodová  | Harrogate District Hospital |        303 |
|        247 | Mädïna Lín          | Dr. Elizaveta Svobodová  | Harrogate District Hospital |        303 |
|        248 | Paraskevi Vuković   | Dr. Elizaveta Svobodová  | Harrogate District Hospital |        303 |
|        330 | Elizabeth Ramírez   | Dr. Elizaveta Svobodová  | Harrogate District Hospital |        303 |
|        369 | Evens Lie           | Dr. Elizaveta Svobodová  | Harrogate District Hospital |        303 |
|        549 | Juan Saitō          | Dr. Elizaveta Svobodová  | Harrogate District Hospital |        303 |
|        598 | Isabella Jiménez    | Dr. Elizaveta Svobodová  | Harrogate District Hospital |        303 |
|         21 | Ricardo Marić       | Dr. Noah Nguyen          | Harrogate District Hospital |        303 |
|        103 | Julia Garcia        | Dr. Noah Nguyen          | Harrogate District Hospital |        303 |
|        511 | Liam Hodžić         | Dr. Noah Nguyen          | Harrogate District Hospital |        303 |
|        530 | Archie Torres       | Dr. Noah Nguyen          | Harrogate District Hospital |        303 |
|        566 | Marti Lou           | Dr. Noah Nguyen          | Harrogate District Hospital |        303 |
|         39 | Andrej Welter       | Dr. Kora Kelmendi        | Dorset County Hospital      |        320 |
|        174 | Lydia Mkrtchyan     | Dr. Kora Kelmendi        | Dorset County Hospital      |        320 |
|        300 | Emmanuel Aivaliotis | Dr. Kora Kelmendi        | Dorset County Hospital      |        320 |
|        318 | Ivan Hur            | Dr. Kora Kelmendi        | Dorset County Hospital      |        320 |
|        320 | Mohammad Santos     | Dr. Kora Kelmendi        | Dorset County Hospital      |        320 |
|        336 | Aya Farkas          | Dr. Kora Kelmendi        | Dorset County Hospital      |        320 |
|        376 | Nikolaos Kawano     | Dr. Kora Kelmendi        | Dorset County Hospital      |        320 |
|        446 | Daniel Wagner       | Dr. Kora Kelmendi        | Dorset County Hospital      |        320 |
|        557 | Ali Kastrati        | Dr. Kora Kelmendi        | Dorset County Hospital      |        320 |
|         24 | James Sánchez       | Dr. Matej Maldonado      | Dorset County Hospital      |        320 |
|        115 | Helmi Koak          | Dr. Matej Maldonado      | Dorset County Hospital      |        320 |
|        214 | Filip Morel         | Dr. Matej Maldonado      | Dorset County Hospital      |        320 |
|        408 | Frida Muñoz         | Dr. Matej Maldonado      | Dorset County Hospital      |        320 |
|        509 | Lorenzo Gallagher   | Dr. Matej Maldonado      | Dorset County Hospital      |        320 |
|        582 | Mariami Kelmendi    | Dr. Matej Maldonado      | Dorset County Hospital      |        320 |
|         74 | Ambre López         | Dr. Alexander Iskakov    | Airedale General Hospital   |        365 |
|         79 | Stanisław Angelova  | Dr. Alexander Iskakov    | Airedale General Hospital   |        365 |
|        199 | Lea Prakash         | Dr. Alexander Iskakov    | Airedale General Hospital   |        365 |
|        226 | Islande Estrada     | Dr. Alexander Iskakov    | Airedale General Hospital   |        365 |
|        301 | Konul Wood          | Dr. Alexander Iskakov    | Airedale General Hospital   |        365 |
|        441 | Ali Schmidt         | Dr. Alexander Iskakov    | Airedale General Hospital   |        365 |
|        467 | Nora Weerasinghe    | Dr. Alexander Iskakov    | Airedale General Hospital   |        365 |
|        600 | Damian Gutiérrez    | Dr. Alexander Iskakov    | Airedale General Hospital   |        365 |
|        178 | Nika Pak            | Dr. Lile Kļaviņš         | Airedale General Hospital   |        365 |
|        347 | Sōma Sharma         | Dr. Lile Kļaviņš         | Airedale General Hospital   |        365 |
|        367 | Hugo Lovrić         | Dr. Lile Kļaviņš         | Airedale General Hospital   |        365 |
|        371 | Tomás Lee           | Dr. Lile Kļaviņš         | Airedale General Hospital   |        365 |
|        455 | Annie Sánchez       | Dr. Lile Kļaviņš         | Airedale General Hospital   |        365 |
|        488 | Djeneba Díaz        | Dr. Lile Kļaviņš         | Airedale General Hospital   |        365 |
|        580 | Roghayyeh Sousa     | Dr. Lile Kļaviņš         | Airedale General Hospital   |        365 |
|         64 | Mikołaj Tan         | Dr. Anna Urbonienė       | Airedale General Hospital   |        365 |
|         82 | Oliver Djurhuus     | Dr. Anna Urbonienė       | Airedale General Hospital   |        365 |
|        186 | Emely Lynch         | Dr. Anna Urbonienė       | Airedale General Hospital   |        365 |
|        315 | Gabriel Shevchuk    | Dr. Anna Urbonienė       | Airedale General Hospital   |        365 |
|        443 | Daria Ko            | Dr. Anna Urbonienė       | Airedale General Hospital   |        365 |
|        478 | Konstantinos Bustos | Dr. Anna Urbonienė       | Airedale General Hospital   |        365 |
|        130 | Mila Muñoz          | Dr. Willow Karlsen       | Airedale General Hospital   |        365 |
|        165 | Zahra Trajanovski   | Dr. Willow Karlsen       | Airedale General Hospital   |        365 |
|        281 | Umar Orellana       | Dr. Willow Karlsen       | Airedale General Hospital   |        365 |
|        581 | Joel Rojas          | Dr. Willow Karlsen       | Airedale General Hospital   |        365 |
|          6 | Ivan Nand           | Dr. Willow Morales       | Airedale General Hospital   |        365 |
|         14 | Pedro Lombardo      | Dr. Willow Morales       | Airedale General Hospital   |        365 |
|        246 | Maria Sepúlveda     | Dr. Willow Morales       | Airedale General Hospital   |        365 |
|        290 | Lethabo Carter      | Dr. Willow Morales       | Airedale General Hospital   |        365 |
|        303 | Oscar Díaz          | Dr. Willow Morales       | Airedale General Hospital   |        365 |
|        328 | Moussa Lương        | Dr. Willow Morales       | Airedale General Hospital   |        365 |
|        370 | Mihail Bailey       | Dr. Willow Morales       | Airedale General Hospital   |        365 |
|        429 | Farah Markoski      | Dr. Willow Morales       | Airedale General Hospital   |        365 |
|        477 | Sofía Correia       | Dr. Willow Morales       | Airedale General Hospital   |        365 |
|        518 | Celine Rodríguez    | Dr. Willow Morales       | Airedale General Hospital   |        365 |
|        137 | Aleksandra Ibraev   | Dr. İnci Todorova        | Amersham Hospital           |        396 |
|        139 | Oisín Sánchez       | Dr. İnci Todorova        | Amersham Hospital           |        396 |
|        192 | Naïm Wong           | Dr. İnci Todorova        | Amersham Hospital           |        396 |
|        196 | Heitor Popescu      | Dr. İnci Todorova        | Amersham Hospital           |        396 |
|        200 | Barbara Johnson     | Dr. İnci Todorova        | Amersham Hospital           |        396 |
|        309 | Nuka Scheving       | Dr. İnci Todorova        | Amersham Hospital           |        396 |
|        439 | Gamalat Özdemir     | Dr. İnci Todorova        | Amersham Hospital           |        396 |
+------------+---------------------+--------------------------+-----------------------------+------------+
```