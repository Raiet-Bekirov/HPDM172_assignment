# data_generation

This directory contains the R and bash scripts we used in order to generate data to import into our `hospitals_db` database, along with the reulting plain text data files.

## Explanation of the Generated Data

The bash script `generate_data.sh` (which runs includes a step running the R script `make_tables.R`) creates eight tab delimited plain text files, each of which stores data for input into our `hospitals_db` database.

We generated data according to the below entity relationship diagram.

![](hospitals_db_erd.png)

### Hospital Data: `hospitals_table.txt`

The file `generated_data/hospitals_table.txt` has seven columns:

1. `hospital_id`: A unique identifier for each hospital.
2. `hospital_name`: The name of each hospital. These were taken from a public csv file made available by the NHS.[^1]
3. `hospital_address`: The street address, town/city and postcode of each hospital, again sourced from data provided by NHS England.[^2]
4. `no_of_beds`: The number of beds at each hospital. This was taken to be the number of general and acute beds listed for the hospital in the NHS England September 2025 situation report.[^3]
5. `hospital_type`: The type of the hospital – either 'Teaching', 'Specialist', or 'General'. This was found using data provided as part of the NHS oversight framework dashboard.[^4]
6. `emergency_services`: A 'Yes' or 'No' string defining whether or not the hospital has emergency services. Found by determining whether 'Urgent and emergency care' was a metric the hospital was assessed by in the NHS oversight framework.[^5]
7. `accreditation_year`: Taken to be the year of the hospital's earlist inspection listed in a csv file provided by the Care Quality Commission.[^6]

### Diseases Data: `diseases_table.txt`

The file `generated_data/diseases_table.txt` has two columns:

1. `disease_id`: A unique identifier for each of the ten diseases represented in our database.
2. `disease_name`: The name of the disease. The ten diseases we chose to include in our database were guided by the ten diseases projected by the Health Foundation to have the highest impact on health care use in the UK in 2040.[^7]  In their list they combined the third highest impact disease group, 'anxiety or depression' into one group, whereas we split it into two categories – anxiety disorder and major depressive disorder. We also chose two specific conditions – bowel cancer and lung cancer – to represent their fourth highest impact disease group, 'cancer'. Bowel and lung cancer were chosen because they were the only cancers in the top three highest incidence causes of cancer for both men and women in the UK between 2017 and 2019.[^8]   For the second highest impact condition included in their list – 'diabetes' – we chose to only include type 2 diabetes, as around 90% of people in the UK with a diabetes diagnosis have type 2 diabetes.[^9]

### Doctors Data: `doctors_table.txt`

The file `generated_data/doctors_table.txt` file has six columns:

1. `doctors_id`: A unique identifier for each doctor.
2. `doctor_name`: The name of the doctor. First and last names were randomly selected from an open source dataset of popular names.[^10] 
3. `doctor_dob`: A randomly chosen date between 01/01/1950 and 31/12/1999.
4. `doctor_address`: The doctor's address. For the street address, a random house number was chosen between 1 and 100, and a street name was randomly selected from a list of the 100 most common street names in the UK.[^11] The first part of the doctor's postcode, along with the corresponding city/town/village, was randomly selected from a selection of postal outward codes from the same region as the doctor's base hospital.[^12] The second part of the postcode was randomly selected from a list of all valid UK postal inward codes.[^13]
5. `hospital_id`: The ID number of the doctor's base hospital.
6. `disease_id`: The ID number of the disease the doctor specialises in.

### Patients Data: `patients_table.txt`

The file `generated_data/patients_table.txt` file has five columns:

1. `patient_id`: A unique identifier for each patient.
2. `patient_name`: The name of the patient. Generated in the same way as the doctors' names.
3. `patient_dob`: A randomly chosen date between 01/01/1929 and 31/12/2004.
4. `patient_address`: The patient's address. Generated in the same way as the doctors' addresses (except that the patient's region was taken to be the region of the hospital their registered doctor was based at).
5. `doctor_id`: The ID number of the patient's registered doctor.

### Medications Data: `medications_table.txt`

The file `generated_data/medications_table.txt` file has three columns:

1. `medication_id`: A unique identifier for each medication.
2. `medication_name`: The name of the medication. Medication names and indications were derived from an open source dataset made available by Vanderbilt University Medical Center.[^14]
3. `disease_id`: The ID number of the disease the medication is indicated for.

### Prescriptions Data: `prescriptions_table.txt`

The file `generated_data/prescriptions_table.txt` has five columns:

1. `prescription_id`: A unique identifier for each prescription.
2. `prescription_date`: A randomly chosen date between 01/01/2024 and 29/11/2025.
3. `medication_id`: The ID number of the prescribed medication.
4. `patient_id`: The ID number of the patient the medication was prescribed for.
5. `doctor_id`: The ID number of the doctor who prescribed the medication.

### Appointments Data: `appointments_table.txt`

The file `generated_data/appointments_table.txt` has four columns:

1. `appointment_id`: A unique identifier for each appointment.
2. `appointment_date`: A randomly chosen date between 01/01/2026 and 31/12/2027.
3. `patient_id`: The ID number of the patient the appointment is for.
4. `doctor_id`: The ID number of the doctor the appointment is with.

### Lab Results Data: `lab_results_table.txt`

The file `generated_data/lab_results_table.txt` has six columns:

1. `lab_result_id`: A unique identifier for each lab result.
2. `test_date`: A randomly chosen date between 01/01/2024 and 29/11/2025.
3. `test_name`: The name of the type of test (20 common blood tests were chosen).
4. `test_result`: The result of the test. Results were randomly chosen from intervals which contained common 'normal' reference ranges for the test[^15][^16], as well as more extreme values outside the normal reference range.
5. `patient_id`: The ID number of the patient the test was requested for.
6. `doctor_id`: The ID number of the doctor who requested the test.

## Steps to Reproduce Generated Data

(Requires a [conda](https://docs.conda.io/projects/conda/en/stable/user-guide/install/index.html) installation.)

Create a directory to store scripts and generated data, for example:

```shell
mkdir hosp_data
```

Navigate to the created directory:

```shell
cd hosp_data
```

Download the bash script used to generate the data:

```shell
wget https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/data_generation/generate_data.sh
```

Modify the permissions of the bash script:

```shell
chmod u=rwx generate_data.sh
```

Download the R script called by `generate_data.sh` when generating the data:

```shell
wget https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/data_generation/make_tables.R
```

Download the conda environment file used to create the virtual environment in which the data is generated:

```shell
wget https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/data_generation/data_gen_env.yml
```

Create a new conda environment from `data_gen_env.yml`:

```shell
conda env create -f data_gen_env.yml
```

Activate the conda environment `data_gen_env.yml`:

```shell
conda activate data_gen_env
```

Finally, run the bash script `generate_data.sh`:

```shell
./generate_data.sh
```

[^1]: "[Other NHS organisations](https://digital.nhs.uk/services/organisation-data-service/data-search-and-export/csv-downloads/other-nhs-organisations)," NHS England Digital, accessed November, 30 2025.
[^2]: NHS England Digital, "[Other NHS organisations](https://digital.nhs.uk/services/organisation-data-service/data-search-and-export/csv-downloads/other-nhs-organisations)."
[^3]: "[Critical care and general & acute Beds – urgent and emergency care daily situation reports 2025-26](https://www.england.nhs.uk/statistics/statistical-work-areas/bed-availability-and-occupancy/critical-care-and-general-acute-beds-urgent-and-emergency-care-daily-situation-reports/critical-care-and-general-acute-beds-urgent-and-emergency-care-daily-situation-reports-25-26/)," NHS England, accessed November 30, 2025.
[^4]: "[NHS oversight framework csv metadata file](https://www.england.nhs.uk/long-read/nhs-oversight-framework-csv-metadata-file/)," NHS England, accessed November 30, 2025.
[^5]: NHS England, "[NHS oversight framework csv metadata file](https://www.england.nhs.uk/long-read/nhs-oversight-framework-csv-metadata-file/)."
[^6]: "[Using CQC data](https://www.cqc.org.uk/about-us/transparency/using-cqc-data#directory)," Care Quality Commission, accessed November 30, 2025.
[^7]: "[Health in 2040: projected patterns of illness in England](https://www.health.org.uk/reports-and-analysis/reports/health-in-2040-projected-patterns-of-illness-in-england)," The Health Foundation, accessed November 30, 2025. 
[^8]: "[Incidence for common cancers](https://crukcancerintelligence.shinyapps.io/CancerStatsDataHub/_w_3fcbaae1cc564876b67093aefabcecde/_w_a3f5f2563b1946cfb4ac68cfdd7d1ac4/?_inputs_&nav=%22Incidence%20Common%20Cancers%22&app_select_Country=%22United%20Kingdom%22)," Cancer Research UK, accessed November 30, 2025.
[^9]: "[How many people in the UK have diabetes?](https://www.diabetes.org.uk/about-us/about-the-charity/our-strategy/statistics)," Diabetes UK, accessed November 30, 2025. 
[^10]: "[Popular names by country dataset](https://github.com/sigpwned/popular-names-by-country-dataset)" Andy Boothe, accessed November 30, 2025.
[^11]:Daniel Oto‐Peralías, "[What Do Street Names Tell Us? An Application to Great Britain's Streets](https://dx.doi.org/10.2139/ssrn.3063381)," *SSRN* (2017): 3. 
[^12]: "[UK postcodes](https://github.com/academe/UK-Postcodes)" Academe Computing Ltd, accessed November 30, 2025.
[^13]: "[The UK postcode format](https://ideal-postcodes.co.uk/guides/uk-postcode-format)" Doaa Kurdi, accessed November 30, 2025. 
[^14]: "[MEDI–an ensemble MEDication Indication resource](https://www.vumc.org/wei-lab/medi)" The Wei Lab, accessed November 30, 2025.
[^15]: "[Biochemistry](https://www.therotherhamft.nhs.uk/services/pathology/biochemistry)" The Rotherham NHS Foundation Trust, accessed November 30, 2025. 
[^16]: "[About HCA UK laboratories](https://www.hcahealthcare.co.uk/locations/hca-uk-laboratories)" HCA Healthcare UK, accessed November 30, 2025.