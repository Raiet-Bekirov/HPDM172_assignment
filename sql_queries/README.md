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
- [Query 19, `query_name.sql`](#query-19-query_namesql): Print a list of patients registered with doctors who are based at hospital with <400 beds.

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

Finally, run the `get_docs_at_hosp` script (In the following command, replace `/filepath/of/` with the appropriate file path):

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

Finally, run the `get_prescriptions_for_patient.sql` script (In the following command, replace `/filepath/of/` with the appropriate file path):

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

Finally, run the `get_prescriptions_from_doc.sql` script (In the following command, replace `/filepath/of/` with the appropriate file path):

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

If `get_docs_at_hosp.sql` is downloaded, the following SQL code can be used to print a table showing all prescriptions ordered by the patient name alphabetically. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_prescriptions_for_all_patient_alphabetical.sql` script (In the following command, replace `/filepath/of/` with the appropriate file path):

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