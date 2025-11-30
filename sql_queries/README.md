# SQL Queries

- Query 1, `get_docs_at_hosp.sql`: Print a list of all doctors based at a particular hospital.
- Query 2, `query_name.sql`: Print a list of all prescriptions for a particular patient, ordered by the prescription date. 
- Query 3, `query_name.sql`: Print a list of all prescriptions that a particular doctor has prescribed.
- Query 4, `query_name.sql`: Print a table showing all prescriptions ordered by the patient name alphabetically.
- Query 5, `query_name.sql`: Add a new customer to the database, including being registered with one of the doctors.
- Query 6, `query_name.sql`: Modify address details of an existing customer.
- Query 7, `query_name.sql`: Print a list of all patient names and addresses for patients registered to doctors based at one particular hospital – that could be used for posting information mail to all of one hospital’s registered patients.
- Query 8, `query_name.sql`: Print a list of all doctors based at Teaching hospitals which were accredited between 2015–2024.
- Query 9, `query_name.sql`: List all patients who may have a particular disease based on which medication they have been prescribed.
- Query 10, `query_name.sql`: List all doctors based at who specialize in a particular disease.
- Query 11, `query_name.sql`: List all lab results for all patients over the age of 60.
- Query 12, `query_name.sql`: Print a list of all appointments for a given patient.
- Query 13, `query_name.sql`: Print a list of all appointments for a given doctor.
- Query 14, `query_name.sql`: Print all prescriptions made from a particular hospital ordered alphabetically by the name of the medication being prescribed – the output of this SQL query should include only these 4 columns: the medication name, the name of doctor who prescribed it, the name of the patient, and the name of hospital.
- Query 15, `query_name.sql`: Print a list of all lab results from all hospitals that were accredited between 2013–2020.
- Query 16, `query_name.sql`: Identify which doctor has made the most prescriptions.
- Query 17, `query_name.sql`: Print a list of all doctors at the hospital with biggest size (number of beds).
- Query 18, `query_name.sql`: Print a list of all hospital names which were accredited prior to 2015 and do have Emergency Service facilities.
- Query 19, `query_name.sql`: Print a list of patients registered with doctors who are based at hospital with <400 beds.

## Steps to run any of these queries

Make directory to store SQL script files, for example:

```shell
mkdir /home/ubuntu/hpdm172/assignment/queries
```
Navigate to the created directory:

```shell
cd /home/ubuntu/hpdm172/assignment/queries
```

Download query .sql file from GitHub, for example:

```shell
wget https://github.com/Raiet-Bekirov/HPDM172_assignment/raw/refs/heads/main/sql_queries/get_docs_at_hosp.sql
```

Log on to MySQL server (in the command below, replace `<USER-NAME>` with the appropriate MySQL server username):

```shell
mysql -u <USER-NAME> -p
```

Switch to `hospitals_db`:

```sql
USE hospitals_db;
```

Set any variables called by the SQL script file, for example:

```sql
SET @HospitalName = "St Thomas' Hospital";
```

Execute the SQL script file, for example:

```sql
source get_docs_at_hosp.sql
```

Quit MySQL:

```sql
quit
```