# sql_queries

This directory contains SQL scipt files for nineteen different queries that can be used to obtain information from `hospitals_db`.

- [Query 1, `get_docs_at_hosp.sql`](#query-1-get_docs_at_hospsql): Print a list of all doctors based at a particular hospital.
- [Query 2, `get_prescriptions_for_patient.sql`](#query-2-get_prescriptions_for_patientsql): Print a list of all prescriptions for a particular patient, ordered by the prescription date.
- [Query 3, `get_prescriptions_from_doc.sql`](#query-3-get_prescriptions_from_docsql): Print a list of all prescriptions that a particular doctor has prescribed.
- [Query 4, `get_prescriptions_for_all_patient_alphabetical.sql`](#query-4-get_prescriptions_for_all_patient_alphabeticalsql): Print a table showing all prescriptions ordered by the patient name alphabetically.
- [Query 5, `query_name.sql`](#query-5-query_namesql): Add a new customer to the database, including being registered with one of the doctors.
- [Query 6, `query_name.sql`](#query-6-query_namesql): Modify address details of an existing customer.
- [Query 7, `query_name.sql`](#query-7-query_namesql): Print a list of all patient names and addresses for patients registered to doctors based at one particular hospital – that could be used for posting information mail to all of one hospital’s registered patients.
- [Query 8, `get_docs_from_accredited_hospitals.sql`](#query-8-get_docs_from_accredited_hospitals.sql): Print a list of all doctors based at Teaching hospitals which were accredited between 2015–2024.
- [Query 9, `get_patients_and_medication_from_diseaseID.sql`](#query-9-get_patients_and_medication_from_diseaseID.sql): List all patients who may have a particular disease based on which medication they have been prescribed.
- [Query 10, `query_name.sql`](#query-10-query_namesql): List all doctors who specialize in a particular disease.
- [Query 11, `lab_results_for_all_patients_over_the_age_of_60.sql`](#query-11-lab_results_for_all_patients_over_the_age_of_60sql): List all lab results for all patients over the age of 60.
- [Query 12, `list_of_all_appointments_for_a_patient.sql`](#query-12-list_of_all_appointments_for_a_patientsql): Print a list of all appointments for a given patient.
- [Query 13, `list_of_all_appointments_for_a_doctor.sql`](#query-13-list_of_all_appointments_for_a_doctorsql): Print a list of all appointments for a given doctor.
- [Query 14, `get_hosp_prescriptions.sql`](#query-14-get_hosp_prescriptionssql): Print all prescriptions made from a particular hospital ordered alphabetically by the name of the medication being prescribed – the output of this SQL query should include only these 4 columns: the medication name, the name of doctor who prescribed it, the name of the patient, and the name of hospital.
- [Query 15, `get_lab_results_at_hosp_accred_btwn_2013_2020.sql`](#query-15-get_lab_results_at_hosp_accred_btwn_2013_2020sql): Print a list of all lab results from all hospitals that were accredited between 2013–2020.
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

### Query 8: `get_docs_from_accredited_hospitals.sql`

If `get_docs_from_accredited_hospitals.sql` is downloaded, the following SQL code can be used to print a list of all doctors based at a particular hospital. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Finally, run the `get_docs_from_accredited_hospitals.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

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

If `get_patients_and_medication_from_diseaseID.sql` is downloaded, the following SQL code can be used to print a list of all doctors based at a particular hospital. First, select the `hospitals_db` database:

```sql
USE hospitals_db;
```

Then, set the variable `@HospitalID` to the unique ID number of the chosen hospital:

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

### Query 10: `query_name.sql`

### Query 11: `lab_results_for_all_patients_over_the_age_of_60.sql`

If `lab_results_for_all_patients_over_the_age_of_60.sql` is downloaded, the following SQL code can be used to print a list of lab results for all patients over the age of 60. First, select the `hospitals_db` database:
```sql
USE hospitals_db;
```
Finally, run the `list_of_all_appointments_for_a_patient.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/lab_results_for_all_patients_over_the_age_of_60.sql
```

This produces the following output:

```
+---------------+------------+------------------------------------+---------------+------------+
| lab_result_id | test_date  | test_type                          | test_result   | patient_id |
+---------------+------------+------------------------------------+---------------+------------+
|            42 | 2025-11-28 | Blood Test: C-Reactive Protein     | 1.1 mg/L      |         18 |
|           394 | 2025-11-26 | Blood Test: Iron                   | 23 umol/L     |         34 |
|           211 | 2025-11-25 | Blood Test: C-Reactive Protein     | 8.9 mg/L      |        356 |
|           300 | 2025-11-20 | Blood Test: Glucose                | 19.2 mmol/L   |        562 |
|            79 | 2025-11-11 | Blood Test: HbA1c                  | 93 mmol/mol   |        434 |
|           464 | 2025-11-06 | Blood Test: Magnesium              | 1 mmol/L      |        299 |
|           331 | 2025-11-06 | Blood Test: Haemoglobin            | 95 g/L        |        506 |
|           278 | 2025-10-31 | Blood Test: White Blood Cell Count | 19.7 x 10^9/L |        286 |
|           188 | 2025-10-30 | Blood Test: Triglycerides          | 0.1 mmol/L    |        485 |
|           143 | 2025-10-28 | Blood Test: Red Blood Cell Count   | 2.5 x 10^12/L |        295 |
|           385 | 2025-10-24 | Blood Test: HDL Cholesterol        | 1.5 mmol/L    |        224 |
|           174 | 2025-10-23 | Blood Test: Alkaline Phosphatase   | 22 IU/L       |         23 |
|           373 | 2025-10-23 | Blood Test: Urea                   | 5.5 mmol/L    |        473 |
|           305 | 2025-10-06 | Blood Test: Triglycerides          | 3.5 mmol/L    |        512 |
|           165 | 2025-10-03 | Blood Test: Bilirubin              | 23 umol/L     |          3 |
|           195 | 2025-10-01 | Blood Test: Albumin                | 22 g/L        |         33 |
|           298 | 2025-09-30 | Blood Test: Neutrophils            | 1.9 x 10^9/L  |        307 |
|            53 | 2025-09-29 | Blood Test: HbA1c                  | 39 mmol/mol   |         48 |
|           129 | 2025-09-20 | Blood Test: Magnesium              | 1.5 mmol/L    |        338 |
|           450 | 2025-09-20 | Blood Test: Bilirubin              | 22 umol/L     |        518 |
|            92 | 2025-09-19 | Blood Test: Iron                   | 12 umol/L     |        356 |
|            29 | 2025-09-17 | Blood Test: Magnesium              | 1.3 mmol/L    |        472 |
|           244 | 2025-09-15 | Blood Test: Alkaline Phosphatase   | 90 IU/L       |        419 |
|            54 | 2025-09-12 | Blood Test: Creatinine             | 40 umol/L     |        513 |
|           218 | 2025-09-09 | Blood Test: Lymphocytes            | 2.2 x 10^9/L  |        156 |
|           353 | 2025-09-02 | Blood Test: Urea                   | 2.8 mmol/L    |        156 |
|           260 | 2025-08-31 | Blood Test: LDL Cholesterol        | 4.9 mmol/L    |        206 |
|           216 | 2025-08-28 | Blood Test: Potassium              | 9 mmol/L      |        233 |
|           339 | 2025-08-28 | Blood Test: Haemoglobin            | 131 g/L       |        331 |
|           219 | 2025-08-26 | Blood Test: Magnesium              | 1 mmol/L      |        346 |
|           200 | 2025-08-24 | Blood Test: HDL Cholesterol        | 1 mmol/L      |         60 |
|           418 | 2025-08-24 | Blood Test: Glucose                | 14.4 mmol/L   |        256 |
|            93 | 2025-08-20 | Blood Test: HbA1c                  | 38 mmol/mol   |         65 |
|           242 | 2025-08-20 | Blood Test: Urea                   | 1.2 mmol/L    |        529 |
|           229 | 2025-08-16 | Blood Test: Alkaline Phosphatase   | 140 IU/L      |        591 |
|           314 | 2025-08-14 | Blood Test: HDL Cholesterol        | 1.9 mmol/L    |        252 |
|           267 | 2025-08-14 | Blood Test: Bilirubin              | 12 umol/L     |        401 |
|           232 | 2025-08-13 | Blood Test: Alkaline Phosphatase   | 94 IU/L       |        101 |
|           286 | 2025-08-13 | Blood Test: C-Reactive Protein     | 3.1 mg/L      |        479 |
|           368 | 2025-08-07 | Blood Test: Alkaline Phosphatase   | 93 IU/L       |         83 |
|           139 | 2025-08-06 | Blood Test: Lactate                | 5.2 mmol/L    |        272 |
|           128 | 2025-08-06 | Blood Test: Glucose                | 17.8 mmol/L   |        274 |
|           142 | 2025-08-05 | Blood Test: Creatinine             | 92 umol/L     |        511 |
|           292 | 2025-08-03 | Blood Test: Glucose                | 4.2 mmol/L    |        147 |
|            19 | 2025-07-28 | Blood Test: Neutrophils            | 8.3 x 10^9/L  |        265 |
|           196 | 2025-07-28 | Blood Test: Lactate                | 3.1 mmol/L    |        291 |
|            44 | 2025-07-26 | Blood Test: White Blood Cell Count | 0.5 x 10^9/L  |        243 |
|           377 | 2025-07-22 | Blood Test: Magnesium              | 0.8 mmol/L    |        470 |
|           316 | 2025-07-16 | Blood Test: Potassium              | 2.8 mmol/L    |         55 |
|           113 | 2025-07-15 | Blood Test: Creatinine             | 101 umol/L    |        146 |
|           125 | 2025-07-14 | Blood Test: Lymphocytes            | 8.9 x 10^9/L  |        335 |
|           424 | 2025-07-11 | Blood Test: Red Blood Cell Count   | 4.4 x 10^12/L |        472 |
|           149 | 2025-07-10 | Blood Test: C-Reactive Protein     | 7 mg/L        |          1 |
|           277 | 2025-07-07 | Blood Test: Creatinine             | 37 umol/L     |        219 |
|           199 | 2025-07-04 | Blood Test: Bilirubin              | 1 umol/L      |         55 |
|            11 | 2025-07-04 | Blood Test: HDL Cholesterol        | 1.9 mmol/L    |        240 |
|           407 | 2025-06-30 | Blood Test: Creatinine             | 102 umol/L    |        241 |
|           233 | 2025-06-27 | Blood Test: Red Blood Cell Count   | 5 x 10^12/L   |        388 |
|           280 | 2025-06-26 | Blood Test: HDL Cholesterol        | 1.4 mmol/L    |        560 |
|           264 | 2025-06-24 | Blood Test: Magnesium              | 1 mmol/L      |         18 |
|           386 | 2025-06-21 | Blood Test: Lymphocytes            | 4.1 x 10^9/L  |        454 |
|           390 | 2025-06-18 | Blood Test: Neutrophils            | 7.8 x 10^9/L  |        358 |
|           245 | 2025-06-15 | Blood Test: Bilirubin              | 29 umol/L     |        470 |
|           496 | 2025-06-13 | Blood Test: Albumin                | 28 g/L        |        490 |
|           362 | 2025-06-07 | Blood Test: Lymphocytes            | 1.1 x 10^9/L  |        113 |
|           168 | 2025-06-07 | Blood Test: Lymphocytes            | 7.7 x 10^9/L  |        495 |
|           234 | 2025-06-02 | Blood Test: Alkaline Phosphatase   | 97 IU/L       |        479 |
|           342 | 2025-06-01 | Blood Test: HDL Cholesterol        | 1.6 mmol/L    |         73 |
|           212 | 2025-05-15 | Blood Test: Creatinine             | 142 umol/L    |        244 |
|           304 | 2025-05-09 | Blood Test: Albumin                | 33 g/L        |        556 |
|            66 | 2025-05-03 | Blood Test: Haemoglobin            | 175 g/L       |        598 |
|           396 | 2025-04-30 | Blood Test: HbA1c                  | 97 mmol/mol   |        446 |
|             4 | 2025-04-26 | Blood Test: Red Blood Cell Count   | 4.2 x 10^12/L |        573 |
|           271 | 2025-04-24 | Blood Test: Iron                   | 35 umol/L     |        321 |
|            59 | 2025-04-17 | Blood Test: Albumin                | 46 g/L        |        208 |
|           159 | 2025-04-16 | Blood Test: Neutrophils            | 8.3 x 10^9/L  |        365 |
|           415 | 2025-04-15 | Blood Test: Urea                   | 9.7 mmol/L    |        322 |
|           350 | 2025-04-11 | Blood Test: Lymphocytes            | 6.2 x 10^9/L  |        501 |
|           225 | 2025-04-10 | Blood Test: LDL Cholesterol        | 3.6 mmol/L    |        387 |
|           492 | 2025-04-06 | Blood Test: Haemoglobin            | 78 g/L        |        193 |
|            23 | 2025-04-02 | Blood Test: Red Blood Cell Count   | 2.8 x 10^12/L |        568 |
|            46 | 2025-03-24 | Blood Test: Potassium              | 1.1 mmol/L    |        523 |
|           481 | 2025-03-22 | Blood Test: HbA1c                  | 52 mmol/mol   |        492 |
|           431 | 2025-03-12 | Blood Test: C-Reactive Protein     | 7.6 mg/L      |        147 |
|           187 | 2025-03-11 | Blood Test: White Blood Cell Count | 0.2 x 10^9/L  |        459 |
|           423 | 2025-03-11 | Blood Test: Alkaline Phosphatase   | 121 IU/L      |        594 |
|           150 | 2025-03-04 | Blood Test: Potassium              | 4.3 mmol/L    |        489 |
|            16 | 2025-02-28 | Blood Test: Red Blood Cell Count   | 6.4 x 10^12/L |        533 |
|           330 | 2025-02-25 | Blood Test: Alkaline Phosphatase   | 88 IU/L       |        161 |
|            80 | 2025-02-21 | Blood Test: Bilirubin              | 24 umol/L     |        572 |
|           324 | 2025-02-20 | Blood Test: LDL Cholesterol        | 4.9 mmol/L    |        262 |
|           356 | 2025-02-19 | Blood Test: Bilirubin              | 21 umol/L     |        494 |
|           428 | 2025-02-13 | Blood Test: Red Blood Cell Count   | 7 x 10^12/L   |        260 |
|           205 | 2025-02-12 | Blood Test: C-Reactive Protein     | 1.9 mg/L      |        228 |
|           132 | 2025-02-11 | Blood Test: Haemoglobin            | 91 g/L        |         55 |
|           162 | 2025-02-11 | Blood Test: C-Reactive Protein     | 7.8 mg/L      |        577 |
|           176 | 2025-02-09 | Blood Test: Bilirubin              | 8 umol/L      |        416 |
|           468 | 2025-02-06 | Blood Test: White Blood Cell Count | 17.5 x 10^9/L |        513 |
|           274 | 2025-02-01 | Blood Test: Alkaline Phosphatase   | 109 IU/L      |        220 |
|           306 | 2025-01-29 | Blood Test: Lactate                | 9.2 mmol/L    |        288 |
|           337 | 2025-01-27 | Blood Test: Creatinine             | 130 umol/L    |        495 |
|            74 | 2025-01-26 | Blood Test: Alkaline Phosphatase   | 98 IU/L       |        233 |
|           283 | 2025-01-24 | Blood Test: HbA1c                  | 23 mmol/mol   |        366 |
|           372 | 2025-01-23 | Blood Test: Neutrophils            | 6.6 x 10^9/L  |        164 |
|           317 | 2025-01-23 | Blood Test: White Blood Cell Count | 6 x 10^9/L    |        166 |
|            13 | 2025-01-22 | Blood Test: Neutrophils            | 5.1 x 10^9/L  |          9 |
|           261 | 2025-01-17 | Blood Test: Magnesium              | 1.3 mmol/L    |         13 |
|           147 | 2025-01-17 | Blood Test: Iron                   | 31 umol/L     |        347 |
|           480 | 2025-01-15 | Blood Test: Urea                   | 1.7 mmol/L    |        170 |
|           482 | 2025-01-12 | Blood Test: White Blood Cell Count | 14.9 x 10^9/L |        259 |
|           427 | 2025-01-09 | Blood Test: HbA1c                  | 86 mmol/mol   |        299 |
|           192 | 2025-01-08 | Blood Test: Glucose                | 10.8 mmol/L   |        416 |
|           435 | 2025-01-05 | Blood Test: Lactate                | 7.3 mmol/L    |         13 |
|           321 | 2025-01-03 | Blood Test: Bilirubin              | 17 umol/L     |        572 |
|           295 | 2024-12-25 | Blood Test: Iron                   | 38 umol/L     |        493 |
|            88 | 2024-12-21 | Blood Test: Red Blood Cell Count   | 7.9 x 10^12/L |        327 |
|            55 | 2024-12-16 | Blood Test: Potassium              | 6.3 mmol/L    |        454 |
|           349 | 2024-12-15 | Blood Test: Potassium              | 8.1 mmol/L    |        246 |
|           171 | 2024-12-14 | Blood Test: HbA1c                  | 60 mmol/mol   |        271 |
|           420 | 2024-12-13 | Blood Test: Iron                   | 39 umol/L     |        132 |
|           182 | 2024-12-12 | Blood Test: Magnesium              | 1.4 mmol/L    |         13 |
|           475 | 2024-12-11 | Blood Test: Bilirubin              | 28 umol/L     |        164 |
|           498 | 2024-12-07 | Blood Test: White Blood Cell Count | 12.3 x 10^9/L |        162 |
|           453 | 2024-12-05 | Blood Test: LDL Cholesterol        | 3.6 mmol/L    |        150 |
|           223 | 2024-12-03 | Blood Test: Bilirubin              | 1 umol/L      |        459 |
|            25 | 2024-12-02 | Blood Test: Haemoglobin            | 87 g/L        |        149 |
|           397 | 2024-12-02 | Blood Test: Potassium              | 7.4 mmol/L    |        464 |
|           248 | 2024-12-02 | Blood Test: Alkaline Phosphatase   | 41 IU/L       |        501 |
|            34 | 2024-11-28 | Blood Test: White Blood Cell Count | 11.6 x 10^9/L |        431 |
|           346 | 2024-11-28 | Blood Test: Alkaline Phosphatase   | 87 IU/L       |        501 |
|            68 | 2024-11-27 | Blood Test: White Blood Cell Count | 15.4 x 10^9/L |        556 |
|           382 | 2024-11-26 | Blood Test: Red Blood Cell Count   | 6.7 x 10^12/L |        295 |
|           287 | 2024-11-24 | Blood Test: Albumin                | 31 g/L        |         66 |
|           485 | 2024-11-21 | Blood Test: C-Reactive Protein     | 3.6 mg/L      |        591 |
|            50 | 2024-11-12 | Blood Test: Red Blood Cell Count   | 2.9 x 10^12/L |        471 |
|           257 | 2024-11-08 | Blood Test: Magnesium              | 1.1 mmol/L    |        394 |
|           440 | 2024-11-06 | Blood Test: Lymphocytes            | 7.5 x 10^9/L  |        591 |
|           275 | 2024-11-04 | Blood Test: Urea                   | 3.4 mmol/L    |        545 |
|            47 | 2024-11-03 | Blood Test: Triglycerides          | 4.5 mmol/L    |        324 |
|           175 | 2024-10-20 | Blood Test: Triglycerides          | 2.6 mmol/L    |        405 |
|           363 | 2024-10-18 | Blood Test: Lactate                | 7 mmol/L      |        343 |
|           436 | 2024-10-13 | Blood Test: Triglycerides          | 1.6 mmol/L    |         34 |
|           208 | 2024-10-09 | Blood Test: Magnesium              | 1.3 mmol/L    |         81 |
|           403 | 2024-10-08 | Blood Test: Creatinine             | 113 umol/L    |        229 |
|             1 | 2024-10-04 | Blood Test: LDL Cholesterol        | 4 mmol/L      |        228 |
|           392 | 2024-09-30 | Blood Test: Bilirubin              | 15 umol/L     |        434 |
|           177 | 2024-09-29 | Blood Test: Urea                   | 7.8 mmol/L    |        273 |
|           389 | 2024-09-26 | Blood Test: Urea                   | 6.4 mmol/L    |        191 |
|            48 | 2024-09-26 | Blood Test: C-Reactive Protein     | 9.6 mg/L      |        277 |
|           246 | 2024-09-18 | Blood Test: Creatinine             | 116 umol/L    |        276 |
|           307 | 2024-09-17 | Blood Test: C-Reactive Protein     | 4 mg/L        |          1 |
|            73 | 2024-09-10 | Blood Test: Albumin                | 28 g/L        |        265 |
|           411 | 2024-09-06 | Blood Test: Alkaline Phosphatase   | 103 IU/L      |         81 |
|           426 | 2024-09-06 | Blood Test: Neutrophils            | 1.4 x 10^9/L  |        395 |
|           210 | 2024-09-06 | Blood Test: Haemoglobin            | 120 g/L       |        468 |
|           158 | 2024-08-27 | Blood Test: HDL Cholesterol        | 1 mmol/L      |        533 |
|            85 | 2024-08-24 | Blood Test: Albumin                | 34 g/L        |        133 |
|            86 | 2024-08-24 | Blood Test: HDL Cholesterol        | 1.7 mmol/L    |        200 |
|           101 | 2024-08-24 | Blood Test: Triglycerides          | 1.6 mmol/L    |        383 |
|             3 | 2024-08-23 | Blood Test: HDL Cholesterol        | 0.7 mmol/L    |         34 |
|           419 | 2024-08-18 | Blood Test: Potassium              | 7.9 mmol/L    |        560 |
|           312 | 2024-08-16 | Blood Test: Magnesium              | 1.4 mmol/L    |        181 |
|           333 | 2024-08-13 | Blood Test: Iron                   | 15 umol/L     |        567 |
|           144 | 2024-08-13 | Blood Test: Albumin                | 25 g/L        |        584 |
|           311 | 2024-08-12 | Blood Test: Glucose                | 11.2 mmol/L   |        204 |
|           433 | 2024-08-12 | Blood Test: Lymphocytes            | 2 x 10^9/L    |        238 |
|            87 | 2024-08-08 | Blood Test: Lymphocytes            | 9.7 x 10^9/L  |         26 |
|           365 | 2024-08-07 | Blood Test: Alkaline Phosphatase   | 79 IU/L       |        472 |
|            40 | 2024-08-06 | Blood Test: C-Reactive Protein     | 5.3 mg/L      |         38 |
|           364 | 2024-08-03 | Blood Test: Lactate                | 5.6 mmol/L    |        186 |
|           116 | 2024-08-03 | Blood Test: White Blood Cell Count | 10.5 x 10^9/L |        373 |
|            57 | 2024-07-31 | Blood Test: HDL Cholesterol        | 1.9 mmol/L    |        231 |
|           445 | 2024-07-31 | Blood Test: Creatinine             | 78 umol/L     |        564 |
|           399 | 2024-07-28 | Blood Test: HbA1c                  | 26 mmol/mol   |         62 |
|           180 | 2024-07-25 | Blood Test: Alkaline Phosphatase   | 144 IU/L      |        196 |
|           406 | 2024-07-23 | Blood Test: Lactate                | 0.8 mmol/L    |        405 |
|           378 | 2024-07-22 | Blood Test: Alkaline Phosphatase   | 102 IU/L      |        265 |
|           253 | 2024-07-20 | Blood Test: Lactate                | 9.3 mmol/L    |        472 |
|           268 | 2024-07-16 | Blood Test: White Blood Cell Count | 6.7 x 10^9/L  |        152 |
|           409 | 2024-07-15 | Blood Test: Iron                   | 38 umol/L     |        353 |
|           134 | 2024-07-14 | Blood Test: Albumin                | 34 g/L        |         31 |
|           327 | 2024-07-12 | Blood Test: Lactate                | 7.1 mmol/L    |        265 |
|           308 | 2024-07-08 | Blood Test: Albumin                | 26 g/L        |        538 |
|           194 | 2024-07-07 | Blood Test: LDL Cholesterol        | 0.7 mmol/L    |        389 |
|           388 | 2024-07-06 | Blood Test: Albumin                | 23 g/L        |        256 |
|            96 | 2024-07-06 | Blood Test: HDL Cholesterol        | 1.3 mmol/L    |        345 |
|           155 | 2024-06-30 | Blood Test: Iron                   | 12 umol/L     |         57 |
|            97 | 2024-06-26 | Blood Test: LDL Cholesterol        | 2.5 mmol/L    |        554 |
|           290 | 2024-06-23 | Blood Test: Alkaline Phosphatase   | 136 IU/L      |         23 |
|             9 | 2024-06-21 | Blood Test: HbA1c                  | 76 mmol/mol   |        389 |
|           228 | 2024-06-09 | Blood Test: Triglycerides          | 1.9 mmol/L    |        237 |
|           153 | 2024-06-07 | Blood Test: White Blood Cell Count | 15.1 x 10^9/L |        122 |
|           421 | 2024-06-07 | Blood Test: Bilirubin              | 25 umol/L     |        464 |
|             5 | 2024-06-05 | Blood Test: HDL Cholesterol        | 1.9 mmol/L    |         32 |
|           442 | 2024-06-05 | Blood Test: Magnesium              | 0.6 mmol/L    |        547 |
|           126 | 2024-06-03 | Blood Test: HbA1c                  | 93 mmol/mol   |         15 |
|           348 | 2024-06-02 | Blood Test: Albumin                | 59 g/L        |        545 |
|           106 | 2024-06-01 | Blood Test: Urea                   | 7.9 mmol/L    |        292 |
|           357 | 2024-05-31 | Blood Test: Potassium              | 7.7 mmol/L    |        470 |
|            76 | 2024-05-20 | Blood Test: Red Blood Cell Count   | 6.3 x 10^12/L |        563 |
|           102 | 2024-05-19 | Blood Test: Iron                   | 7 umol/L      |        217 |
|           352 | 2024-05-17 | Blood Test: Lymphocytes            | 8.3 x 10^9/L  |        426 |
|           296 | 2024-05-17 | Blood Test: Albumin                | 55 g/L        |        573 |
|           297 | 2024-05-12 | Blood Test: Alkaline Phosphatase   | 55 IU/L       |        271 |
|            77 | 2024-05-11 | Blood Test: LDL Cholesterol        | 0.1 mmol/L    |         55 |
|           354 | 2024-05-10 | Blood Test: Magnesium              | 0.9 mmol/L    |        464 |
|           123 | 2024-05-09 | Blood Test: LDL Cholesterol        | 2.1 mmol/L    |         74 |
|           497 | 2024-05-09 | Blood Test: C-Reactive Protein     | 8.4 mg/L      |        394 |
|            36 | 2024-05-06 | Blood Test: Neutrophils            | 2.3 x 10^9/L  |         23 |
|            10 | 2024-05-02 | Blood Test: Red Blood Cell Count   | 2.9 x 10^12/L |        598 |
|           100 | 2024-05-01 | Blood Test: Haemoglobin            | 85 g/L        |        168 |
|           138 | 2024-04-30 | Blood Test: HbA1c                  | 38 mmol/mol   |         20 |
|           457 | 2024-04-27 | Blood Test: Glucose                | 1.2 mmol/L    |        300 |
|           400 | 2024-04-23 | Blood Test: Bilirubin              | 3 umol/L      |        426 |
|           170 | 2024-04-21 | Blood Test: Bilirubin              | 25 umol/L     |        153 |
|           471 | 2024-04-18 | Blood Test: Triglycerides          | 4.8 mmol/L    |        300 |
|           186 | 2024-04-17 | Blood Test: HDL Cholesterol        | 1.6 mmol/L    |        147 |
|           338 | 2024-04-13 | Blood Test: Urea                   | 1.9 mmol/L    |        286 |
|            38 | 2024-04-12 | Blood Test: Urea                   | 5.6 mmol/L    |        238 |
|           462 | 2024-04-07 | Blood Test: Glucose                | 4.4 mmol/L    |          6 |
|           456 | 2024-04-05 | Blood Test: Neutrophils            | 9.3 x 10^9/L  |        402 |
|           469 | 2024-03-28 | Blood Test: Red Blood Cell Count   | 7.4 x 10^12/L |         10 |
|            70 | 2024-03-19 | Blood Test: Bilirubin              | 11 umol/L     |        152 |
|            78 | 2024-03-19 | Blood Test: Creatinine             | 133 umol/L    |        198 |
|            71 | 2024-03-19 | Blood Test: Creatinine             | 119 umol/L    |        486 |
|           236 | 2024-03-17 | Blood Test: White Blood Cell Count | 16.5 x 10^9/L |        494 |
|            84 | 2024-03-12 | Blood Test: C-Reactive Protein     | 3.8 mg/L      |        288 |
|           326 | 2024-03-10 | Blood Test: Albumin                | 59 g/L        |        181 |
|           146 | 2024-03-08 | Blood Test: Triglycerides          | 2.3 mmol/L    |         95 |
|           110 | 2024-02-23 | Blood Test: LDL Cholesterol        | 2.2 mmol/L    |         26 |
|           332 | 2024-02-23 | Blood Test: Lactate                | 7.1 mmol/L    |        461 |
|           323 | 2024-02-22 | Blood Test: Iron                   | 36 umol/L     |        531 |
|           163 | 2024-02-21 | Blood Test: White Blood Cell Count | 15.6 x 10^9/L |        526 |
|            12 | 2024-02-20 | Blood Test: Haemoglobin            | 157 g/L       |        493 |
|           181 | 2024-02-16 | Blood Test: Alkaline Phosphatase   | 59 IU/L       |        471 |
|           293 | 2024-02-13 | Blood Test: Urea                   | 9.4 mmol/L    |        454 |
|           276 | 2024-02-11 | Blood Test: Potassium              | 7.7 mmol/L    |        185 |
|           197 | 2024-02-11 | Blood Test: Glucose                | 11.1 mmol/L   |        542 |
|           201 | 2024-02-09 | Blood Test: Bilirubin              | 13 umol/L     |         83 |
|           270 | 2024-02-09 | Blood Test: Potassium              | 1.4 mmol/L    |        594 |
|           220 | 2024-02-02 | Blood Test: Neutrophils            | 6.7 x 10^9/L  |        322 |
|           124 | 2024-01-30 | Blood Test: Magnesium              | 0.9 mmol/L    |        401 |
|           204 | 2024-01-30 | Blood Test: Lymphocytes            | 6.2 x 10^9/L  |        466 |
|            17 | 2024-01-29 | Blood Test: Alkaline Phosphatase   | 51 IU/L       |        271 |
|           484 | 2024-01-18 | Blood Test: Bilirubin              | 15 umol/L     |        249 |
|           289 | 2024-01-16 | Blood Test: White Blood Cell Count | 13.2 x 10^9/L |        454 |
|           369 | 2024-01-12 | Blood Test: Glucose                | 13.9 mmol/L   |         93 |
|           193 | 2024-01-12 | Blood Test: Lactate                | 7.4 mmol/L    |        133 |
|           455 | 2024-01-07 | Blood Test: Creatinine             | 36 umol/L     |        269 |
|           167 | 2024-01-01 | Blood Test: Glucose                | 9.8 mmol/L    |        122 |
+---------------+------------+------------------------------------+---------------+------------+

```



### Query 12: `list_of_all_appointments_for_a_patient.sql`

If `list_of_all_appointments_for_a_patient.sql` is downloaded, the following SQL code can be used to print a list of all appointments for a given patient.First, select the `hospitals_db` database:
```sql
USE hospitals_db;
```
Then, set the variable `@PatientID` to the unique ID number of the chosen patient:  

```sql
SET @PatientID = 35;
```
Finally, run the `list_of_all_appointments_for_a_patient.sql` script (in the following command, replace `/filepath/of/` with the appropriate file path):

```sql
source /filepath/of/list_of_all_appointments_for_a_patient.sql
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
### Query 13: `list_of_all_appointments_for_a_doctor.sql`

If `list_of_all_appointments_for_a_doctor.sql` is downloaded, the following SQL code can be used to print a list of all appointments for a given doctor. First, select the `hospitals_db` database:
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
