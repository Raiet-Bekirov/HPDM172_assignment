# data_generation

This directoty contains the R and bash scripts we used in order to generate data to import into our `hospitals_db` database, along with the reulting plain text data files.

## Explanation of the Generated Data

The bash script `generate_data.sh` (which runs includes a step running the R script `make_tables.R`) creates eight tab delimited plain text files, each of which stores data for input into our `hospitals_db` database.

We generated data according to the below entity relationship diagram.

![](hospitals_db_erd.png)

### Hospital Data: `hospitals_table.txt`

The `hospitals_table.txt` file has seven columns:

1. `hospital_id`: A unique identifier for each hospital.
2. `hospital_name`: The name of each hospital. These were taken from a public csv file made available by the NHS.[^1]
3. `hospital_address`: The street address, town/city and postcode of each hospital, again sourced from data provided by NHS England.[^2]
4. `no_of_beds`: The number of beds at each hospital. This was taken to be the number of general and acute beds listed for the hospital in the NHS England September 2025 situation report.[^3]
5. `hospital_type`: The type of the hospital – either 'Teaching', 'Specialist', or 'General'. This was found using data provided as part of the NHS oversight framework dashboard.[^4]
6. `emergency_services`: A 'Yes' or 'No' string defining whether or not the hospital has emergency services. Found by determining whether 'Urgent and emergency care' was a metric the hospital was assessed by in the NHS oversight framework.[^5]
7. `accreditation_year`: Taken to be the year of the hospital's earlist inspection listed in a csv file provided by the Care Quality Commission.[^6]

### Diseases Data: `diseases_table.txt`

The `diseases_table.txt` file has two columns.

1. `disease_id`: A unique identifier for each of the ten diseases represented in our database.
2. `disease_name`: The name of the disease. The ten diseases we chose to include in our database were guided by the ten diseases projected by the Health Foundation to have the highest impact on health care use in the UK in 2040.[^7]  In their list they combined the third highest impact disease group, 'anxiety or depression' into one group, whereas we split it into two categories – anxiety disorder and major depressive disorder. We also chose two specific conditions – bowel cancer and lung cancer – to represent their fourth highest impact disease group, 'cancer'. Bowel and lung cancer were chosen because they were the only cancers in the top three highest incidence causes of cancer for both men and women in the UK between 2017 and 2019.[^8]  

### Doctors Data: `doctors_table.txt`

1. `doctors_id`:
2. `doctor_name`: https://raw.githubusercontent.com/sigpwned/popular-names-by-country-dataset/refs/heads/main/common-forenames-by-country.csv, https://raw.githubusercontent.com/sigpwned/popular-names-by-country-dataset/refs/heads/main/common-surnames-by-country.csv
3. `doctor_dob`:
4. `doctor_address`: uk_postcodes.csv https://raw.githubusercontent.com/academe/UK-Postcodes/b0ec095967119671347074f44dd0a62f9e0830f1/postcodes.csv, https://data.ideal-postcodes.co.uk/incodes.csv?_gl=1*1fd2gym*_gcl_au*MTYyNjU4MTgyNS4xNzY0MzY1OTgz*_ga*OTM3MTg2NzM1LjE3NjQzNjU5ODM.*_ga_TCWN2YPGY5*czE3NjQzNjU5ODIkbzEkZzEkdDE3NjQzNjYxMTQkajYwJGwwJGgxNzA5MjcxNzE., https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3063381
5. `hospital_id`:
6. `disease_id`:

### Patients Data: `patients_table.txt`

1. `patient_id`:
2. `patient_name`:
3. `patient_dob`:
4. `patient_address`:
5. `doctor_id`:

### Medications Data: `medications_table.txt`

1. `medication_id`:
2. `medication_name`: https://www.vumc.org/wei-lab/sites/default/files/public_files/MEDI-2_HPS.csv

### Prescriptions Data: `prescriptions_table.txt`

1. `prescription_id`:
2. `prescription_date`:
3. `medication_id`:
4. `patient_id`:
5. `doctor_id`:

### Appointments Data: `appointments_table.txt`

1. `appointment_id`:
2. `appointment_date`:
3. `patient_id`:
4. `doctor_id`:

### Lab Results: `lab_results_table.txt`

1. `lab_result_id`:
2. `test_date`:
3. `test_name`: https://www.therotherhamft.nhs.uk/services/pathology/biochemistry, https://www.hcahealthcare.co.uk/locations/hca-uk-laboratories
4. `test_result`:
5. `patient_id`:
6. `doctor_id`:

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
wget https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172\_assignment/refs/heads/main/data_generation/data_gen_env.yml
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
[^3]: "[Critical care and General & Acute Beds – Urgent and Emergency Care Daily Situation Reports 2025-26](https://www.england.nhs.uk/statistics/statistical-work-areas/bed-availability-and-occupancy/critical-care-and-general-acute-beds-urgent-and-emergency-care-daily-situation-reports/critical-care-and-general-acute-beds-urgent-and-emergency-care-daily-situation-reports-25-26/)," NHS England, accessed November 30, 2025.
[^4]: "[NHS oversight framework csv metadata file](https://www.england.nhs.uk/long-read/nhs-oversight-framework-csv-metadata-file/)," NHS England, accessed November 30, 2025.
[^5]: NHS England, "[NHS oversight framework csv metadata file](https://www.england.nhs.uk/long-read/nhs-oversight-framework-csv-metadata-file/)."
[^6]: "[Using CQC data](https://www.cqc.org.uk/about-us/transparency/using-cqc-data#directory)," Care Quality Commission, accessed November 30, 2025.
Department for Energy & Climate Change, Community Energy Strategy, URN 14D/019 (The Stationery Office, 2014), 4, https://www.gov.uk/government/publications/community-energy-strategy. 
[^7]: "[Health in 2040: projected patterns of illness in England](https://www.health.org.uk/reports-and-analysis/reports/health-in-2040-projected-patterns-of-illness-in-england)," The Health Foundation, accessed November 30, 2025. 
[^8]: "[Incidence for common cancers](https://crukcancerintelligence.shinyapps.io/CancerStatsDataHub/_w_3fcbaae1cc564876b67093aefabcecde/_w_a3f5f2563b1946cfb4ac68cfdd7d1ac4/?_inputs_&nav=%22Incidence%20Common%20Cancers%22&app_select_Country=%22United%20Kingdom%22)," Cancer Research UK, accessed November 30, 2025.