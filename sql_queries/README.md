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
- [Query 14, `get_hosp_prescriptions.sql`](#query-14-get_hosp_prescriptionssql): Print all prescriptions made from a particular hospital ordered alphabetically by the name of the medication being prescribed – the output of this SQL query should include only these 4 columns: the medication name, the name of doctor who prescribed it, the name of the patient, and the name of hospital.
- [Query 15, ``get_lab_results_at_hosp_accred_btwn_2013_2020.sql`](#query-15-get_lab_results_at_hosp_accred_btwn_2013_2020sql): Print a list of all lab results from all hospitals that were accredited between 2013–2020.
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
### Query 14: `get_hosp_prescriptions.sql`

If `get_hosp_prescriptions.sql` is downloaded, the following SQL code can be used to print all prescriptions made from a particular hospital ordered alphabetically by the name of the medication being prescribed. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@HospitalID` to the unique ID number of the chosen hospital:

```sql
SET @HosptialID = 10;
```

Finally, run the `get_hosp_prescriptions.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
 source /filepath/of/get_hosp_prescriptions.sql
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

### Query 15: `get_lab_results_at_hosp_accred_btwn_2013_2020.sql`

If `get_lab_results_at_hosp_accred_btwn_2013_2020.sql` is downloaded, the following SQL code can be used to dentify which doctor has made the most prescriptions. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, run the `get_lab_results_at_hosp_accred_btwn_2013_2020.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/get_lab_results_at_hosp_accred_btwn_2013_2020.sql
```

This produces the following output:

```
+------------+------------------------------------+---------------+----------------------+----------------------+---------------------------------+--------------------+
| test_date  | test_type                          | test_result   | patient_name         | doctor_name          | hospital_name                   | accreditation_year |
+------------+------------------------------------+---------------+----------------------+----------------------+---------------------------------+--------------------+
| 2025-11-26 | Blood Test: Neutrophils            | 3.7 x 10^9/L  | Nazanin-Zahra Katō   | Dr. Sunita Valente   | Westmorland General Hospital    |               2013 |
| 2025-11-26 | Blood Test: Iron                   | 23 umol/L     | Tarita Chu           | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2025-11-11 | Blood Test: Creatinine             | 87 umol/L     | Ana Jovanović        | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2025-11-06 | Blood Test: Haemoglobin            | 95 g/L        | Elmar Martirosyan    | Dr. İnci Todorova    | Amersham Hospital               |               2013 |
| 2025-11-02 | Blood Test: LDL Cholesterol        | 4.1 mmol/L    | Melissa Fontana      | Dr. Seo-yun Iwasaki  | North Tyneside General Hospital |               2019 |
| 2025-10-31 | Blood Test: White Blood Cell Count | 19.7 x 10^9/L | Ali Rebane           | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2025-10-24 | Blood Test: HDL Cholesterol        | 1.5 mmol/L    | Jovana Barbosa       | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2025-10-23 | Blood Test: Alkaline Phosphatase   | 22 IU/L       | Hasan Murphy         | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2025-10-06 | Blood Test: Triglycerides          | 3.5 mmol/L    | Noah Lîm             | Dr. Sunita Valente   | Westmorland General Hospital    |               2013 |
| 2025-09-04 | Blood Test: Potassium              | 9.2 mmol/L    | Emma Novak           | Dr. Peter Tep        | Westmorland General Hospital    |               2013 |
| 2025-09-02 | Blood Test: Urea                   | 2.8 mmol/L    | Maxim Klein          | Dr. Mio Cruz         | North Tyneside General Hospital |               2019 |
| 2025-08-31 | Blood Test: LDL Cholesterol        | 4.9 mmol/L    | Gunel Dizon          | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2025-08-28 | Blood Test: Potassium              | 9 mmol/L      | Adam Hoxha           | Dr. Peter Tep        | Westmorland General Hospital    |               2013 |
| 2025-08-24 | Blood Test: Glucose                | 14.4 mmol/L   | Olivia Morales       | Dr. Nur Santos       | Torbay Hospital                 |               2014 |
| 2025-08-22 | Blood Test: Iron                   | 20 umol/L     | Mark Ueno            | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2025-08-18 | Blood Test: Lymphocytes            | 1 x 10^9/L    | Daniel Montes        | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2025-08-03 | Blood Test: Glucose                | 4.2 mmol/L    | Mila Gashi           | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2025-07-04 | Blood Test: Bilirubin              | 1 umol/L      | Grace Hoti           | Dr. Peter Tep        | Westmorland General Hospital    |               2013 |
| 2025-06-30 | Blood Test: LDL Cholesterol        | 3.1 mmol/L    | Chloe Dương          | Dr. İnci Todorova    | Amersham Hospital               |               2013 |
| 2025-06-27 | Blood Test: Red Blood Cell Count   | 5 x 10^12/L   | Marcia Lefebvre      | Dr. Maddi Gallagher  | Torbay Hospital                 |               2014 |
| 2025-06-21 | Blood Test: C-Reactive Protein     | 7 mg/L        | Ian Jukić            | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2025-06-18 | Blood Test: Neutrophils            | 7.8 x 10^9/L  | Mia Tang             | Dr. Maddi Gallagher  | Torbay Hospital                 |               2014 |
| 2025-06-01 | Blood Test: Triglycerides          | 0.7 mmol/L    | Petar Mortensen      | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2025-05-28 | Blood Test: Albumin                | 43 g/L        | Thiago Andreassen    | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2025-05-19 | Blood Test: HbA1c                  | 52 mmol/mol   | Juliana delos Santos | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2025-04-30 | Blood Test: HbA1c                  | 97 mmol/mol   | Daniel Wagner        | Dr. Maddi Gallagher  | Torbay Hospital                 |               2014 |
| 2025-04-21 | Blood Test: Red Blood Cell Count   | 2.7 x 10^12/L | Jack Rojas           | Dr. Maddi Gallagher  | Torbay Hospital                 |               2014 |
| 2025-04-21 | Blood Test: Haemoglobin            | 139 g/L       | Michal Wagner        | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2025-04-11 | Blood Test: Lymphocytes            | 6.2 x 10^9/L  | Luka Spiteri         | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2025-04-10 | Blood Test: Magnesium              | 0.6 mmol/L    | Ahmad Benedetti      | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2025-04-02 | Blood Test: Red Blood Cell Count   | 2.8 x 10^12/L | Hassan Pavlovski     | Dr. Mio Cruz         | North Tyneside General Hospital |               2019 |
| 2025-03-24 | Blood Test: Potassium              | 1.1 mmol/L    | Margarida Molina     | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2025-03-22 | Blood Test: HbA1c                  | 52 mmol/mol   | Maryam Morales       | Dr. İnci Todorova    | Amersham Hospital               |               2013 |
| 2025-03-13 | Blood Test: Albumin                | 36 g/L        | Sofie Popov          | Dr. Leyla Sasaki     | Torbay Hospital                 |               2014 |
| 2025-03-12 | Blood Test: C-Reactive Protein     | 7.6 mg/L      | Mila Gashi           | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2025-03-01 | Blood Test: Iron                   | 30 umol/L     | Zeynep Hovhannisyan  | Dr. Seo-yun Iwasaki  | North Tyneside General Hospital |               2019 |
| 2025-02-20 | Blood Test: Urea                   | 6.2 mmol/L    | Mateo Takaki         | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2025-02-18 | Blood Test: Albumin                | 44 g/L        | Emma García          | Dr. İnci Todorova    | Amersham Hospital               |               2013 |
| 2025-02-16 | Blood Test: Potassium              | 2.6 mmol/L    | Mateo Takaki         | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2025-02-15 | Blood Test: Albumin                | 47 g/L        | Emma Novak           | Dr. Peter Tep        | Westmorland General Hospital    |               2013 |
| 2025-02-01 | Blood Test: Alkaline Phosphatase   | 109 IU/L      | Lucía Soria          | Dr. Leyla Sasaki     | Torbay Hospital                 |               2014 |
| 2025-01-29 | Blood Test: Lactate                | 9.2 mmol/L    | Gabriel Rosario      | Dr. Seo-yun Iwasaki  | North Tyneside General Hospital |               2019 |
| 2025-01-23 | Blood Test: Neutrophils            | 6.6 x 10^9/L  | Reema Aguilera       | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2025-01-04 | Blood Test: Magnesium              | 1.3 mmol/L    | Josefa Đoàn          | Dr. Nur Santos       | Torbay Hospital                 |               2014 |
| 2025-01-02 | Blood Test: HDL Cholesterol        | 0.9 mmol/L    | Tommaso Kozłowski    | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2024-12-26 | Blood Test: HbA1c                  | 50 mmol/mol   | Katla Lehtinen       | Dr. Nur Santos       | Torbay Hospital                 |               2014 |
| 2024-12-26 | Blood Test: Creatinine             | 102 umol/L    | Nazanin-Zahra Katō   | Dr. Sunita Valente   | Westmorland General Hospital    |               2013 |
| 2024-12-23 | Blood Test: HbA1c                  | 24 mmol/mol   | Lilit Bravo          | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2024-12-22 | Blood Test: White Blood Cell Count | 0.5 x 10^9/L  | Michal Wagner        | Dr. Mio Cruz         | North Tyneside General Hospital |               2019 |
| 2024-12-16 | Blood Test: Potassium              | 6.3 mmol/L    | Kaia Castillo        | Dr. Leyla Sasaki     | Torbay Hospital                 |               2014 |
| 2024-12-11 | Blood Test: Bilirubin              | 28 umol/L     | Reema Aguilera       | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2024-12-07 | Blood Test: White Blood Cell Count | 12.3 x 10^9/L | Emma Davidov         | Dr. Leyla Sasaki     | Torbay Hospital                 |               2014 |
| 2024-12-05 | Blood Test: LDL Cholesterol        | 3.6 mmol/L    | Aysel Watanabe       | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2024-12-02 | Blood Test: Alkaline Phosphatase   | 41 IU/L       | Luka Spiteri         | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2024-11-28 | Blood Test: Alkaline Phosphatase   | 87 IU/L       | Luka Spiteri         | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2024-11-28 | Blood Test: White Blood Cell Count | 11.6 x 10^9/L | Luca Riquelme        | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2024-11-16 | Blood Test: Albumin                | 60 g/L        | Anastasiya Kinoshita | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2024-11-11 | Blood Test: Albumin                | 34 g/L        | María Gonzalez       | Dr. Nur Santos       | Torbay Hospital                 |               2014 |
| 2024-10-20 | Blood Test: Triglycerides          | 2.6 mmol/L    | Aleksandr Ông        | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2024-10-18 | Blood Test: Lactate                | 7 mmol/L      | Mùchén Rodriguez     | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2024-10-12 | Blood Test: Glucose                | 16.6 mmol/L   | Maya Coi             | Dr. Mio Cruz         | North Tyneside General Hospital |               2019 |
| 2024-09-18 | Blood Test: Creatinine             | 116 umol/L    | Lucía Rodríguez      | Dr. Mykhaylo Fischer | North Tyneside General Hospital |               2019 |
| 2024-09-17 | Blood Test: C-Reactive Protein     | 4 mg/L        | Manuel Uhm           | Dr. Peter Tep        | Westmorland General Hospital    |               2013 |
| 2024-09-12 | Blood Test: Magnesium              | 0.7 mmol/L    | Naïm Wong            | Dr. İnci Todorova    | Amersham Hospital               |               2013 |
| 2024-08-24 | Blood Test: HDL Cholesterol        | 1.7 mmol/L    | Barbara Johnson      | Dr. İnci Todorova    | Amersham Hospital               |               2013 |
| 2024-08-13 | Blood Test: Albumin                | 25 g/L        | Dmitry Masuda        | Dr. Mio Cruz         | North Tyneside General Hospital |               2019 |
| 2024-08-07 | Blood Test: Alkaline Phosphatase   | 79 IU/L       | Bruno Kurt           | Dr. Peter Tep        | Westmorland General Hospital    |               2013 |
| 2024-07-27 | Blood Test: Haemoglobin            | 96 g/L        | Karine Martínez      | Dr. Asja Song        | Westmorland General Hospital    |               2013 |
| 2024-07-23 | Blood Test: Lactate                | 0.8 mmol/L    | Aleksandr Ông        | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2024-07-15 | Blood Test: Creatinine             | 127 umol/L    | Theo Kovács          | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2024-06-28 | Blood Test: Lymphocytes            | 8.8 x 10^9/L  | Dunja Chang          | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2024-06-22 | Blood Test: Iron                   | 16 umol/L     | Adam Scheving        | Dr. Jakob Prifti     | North Tyneside General Hospital |               2019 |
| 2024-06-09 | Blood Test: Triglycerides          | 1.9 mmol/L    | Ali Morales          | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2024-05-25 | Blood Test: Red Blood Cell Count   | 6.9 x 10^12/L | Eva Naidu            | Dr. Asja Song        | Westmorland General Hospital    |               2013 |
| 2024-05-17 | Blood Test: Albumin                | 55 g/L        | Aadhya Torres        | Dr. Nur Santos       | Torbay Hospital                 |               2014 |
| 2024-04-18 | Blood Test: Triglycerides          | 4.8 mmol/L    | Emmanuel Aivaliotis  | Dr. Nur Santos       | Torbay Hospital                 |               2014 |
| 2024-03-28 | Blood Test: Urea                   | 5 mmol/L      | Gamalat Özdemir      | Dr. İnci Todorova    | Amersham Hospital               |               2013 |
| 2024-03-09 | Blood Test: Red Blood Cell Count   | 6.5 x 10^12/L | Dunja Chang          | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2024-03-03 | Blood Test: White Blood Cell Count | 2.4 x 10^9/L  | Aron Díaz            | Dr. Isabel Bustos    | North Tyneside General Hospital |               2019 |
| 2024-02-12 | Blood Test: Magnesium              | 0.7 mmol/L    | Viktor Benítez       | Dr. Nur Santos       | Torbay Hospital                 |               2014 |
| 2024-01-07 | Blood Test: Creatinine             | 36 umol/L     | Oisin Prasad         | Dr. Mio Cruz         | North Tyneside General Hospital |               2019 |
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
|         15 | Charlie O'Connor    |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|         21 | Ricardo Marić       |        89 | Dr. Noah Nguyen          | Harrogate District Hospital |
|         31 | Lara Delemović      |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|         85 | Abdullo Pang        |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|         91 | Emma Bairamovi      |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        103 | Julia Garcia        |        89 | Dr. Noah Nguyen          | Harrogate District Hospital |
|        125 | Ida Nikolla         |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        227 | Elyas Huáng         |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        241 | Finn Balogh         |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        247 | Mädïna Lín          |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        248 | Paraskevi Vuković   |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        330 | Elizabeth Ramírez   |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        369 | Evens Lie           |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        469 | Maryam Yau          |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        480 | Brahim Polishchuk   |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        510 | Sophia Perera       |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        511 | Liam Hodžić         |        89 | Dr. Noah Nguyen          | Harrogate District Hospital |
|        530 | Archie Torres       |        89 | Dr. Noah Nguyen          | Harrogate District Hospital |
|        549 | Juan Saitō          |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|        566 | Marti Lou           |        89 | Dr. Noah Nguyen          | Harrogate District Hospital |
|        586 | Vasilisa Wright     |        32 | Dr. Farrah Jakobsson     | Harrogate District Hospital |
|        598 | Isabella Jiménez    |        55 | Dr. Elizaveta Svobodová  | Harrogate District Hospital |
|         24 | James Sánchez       |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|         39 | Andrej Welter       |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        115 | Helmi Koak          |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|        174 | Lydia Mkrtchyan     |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        214 | Filip Morel         |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|        300 | Emmanuel Aivaliotis |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        318 | Ivan Hur            |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        320 | Mohammad Santos     |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        336 | Aya Farkas          |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        376 | Nikolaos Kawano     |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        408 | Frida Muñoz         |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|        446 | Daniel Wagner       |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        509 | Lorenzo Gallagher   |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|        557 | Ali Kastrati        |         1 | Dr. Kora Kelmendi        | Dorset County Hospital      |
|        582 | Mariami Kelmendi    |        29 | Dr. Matej Maldonado      | Dorset County Hospital      |
|          6 | Ivan Nand           |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|         14 | Pedro Lombardo      |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|         64 | Mikołaj Tan         |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|         74 | Ambre López         |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|         79 | Stanisław Angelova  |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|         82 | Oliver Djurhuus     |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        130 | Mila Muñoz          |        35 | Dr. Willow Karlsen       | Airedale General Hospital   |
|        165 | Zahra Trajanovski   |        35 | Dr. Willow Karlsen       | Airedale General Hospital   |
|        178 | Nika Pak            |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        186 | Emely Lynch         |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        199 | Lea Prakash         |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        226 | Islande Estrada     |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        246 | Maria Sepúlveda     |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        281 | Umar Orellana       |        35 | Dr. Willow Karlsen       | Airedale General Hospital   |
|        290 | Lethabo Carter      |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        301 | Konul Wood          |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        303 | Oscar Díaz          |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        315 | Gabriel Shevchuk    |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        328 | Moussa Lương        |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        347 | Sōma Sharma         |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        367 | Hugo Lovrić         |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        370 | Mihail Bailey       |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        371 | Tomás Lee           |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        429 | Farah Markoski      |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        441 | Ali Schmidt         |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        443 | Daria Ko            |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        455 | Annie Sánchez       |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        467 | Nora Weerasinghe    |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        477 | Sofía Correia       |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        478 | Konstantinos Bustos |        30 | Dr. Anna Urbonienė       | Airedale General Hospital   |
|        488 | Djeneba Díaz        |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        518 | Celine Rodríguez    |        80 | Dr. Willow Morales       | Airedale General Hospital   |
|        580 | Roghayyeh Sousa     |        20 | Dr. Lile Kļaviņš         | Airedale General Hospital   |
|        581 | Joel Rojas          |        35 | Dr. Willow Karlsen       | Airedale General Hospital   |
|        600 | Damian Gutiérrez    |         6 | Dr. Alexander Iskakov    | Airedale General Hospital   |
|        137 | Aleksandra Ibraev   |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        139 | Oisín Sánchez       |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        192 | Naïm Wong           |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        196 | Heitor Popescu      |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        200 | Barbara Johnson     |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        309 | Nuka Scheving       |        18 | Dr. İnci Todorova        | Amersham Hospital           |
|        439 | Gamalat Özdemir     |        18 | Dr. İnci Todorova        | Amersham Hospital           |
+------------+---------------------+-----------+--------------------------+-----------------------------+
```
