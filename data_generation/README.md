# Data Generation Summary

![](hospitals_db_erd.png)

The bash script `generate_data.sh` (which runs includes a step running the R script `make_tables.R`), creates eight tab delimited plain text files, each of which stores data for input into our `hospitals_db` database.

## Hospital Data: `hospitals_table.txt`

The `hospitals_table.txt` file has seven columns:

1. `hospital_id`: A unique identifier for each hospital.
2. `hospital_name`: The name of each hospital. These were taken from a public csv file made available by the NHS.[^1]
3. `hospital_address`: The street address, town/city and postcode of each hospital, again sourced from data provided by NHS England.[^2]
4. `no_of_beds`: The number of beds at each hospital. This was taken to be the number of general and acute beds listed for the hospital in the NHS England September 2025 situation report.[^3]
5. `hospital_type`: The type of the hospital – either 'Teaching', 'Specialist', or 'General'. This was found using data provided as part of the NHS oversight framework dashboard.[^4]
6. `emergency_services`: A 'Yes' or 'No' string defining whether or not the hospital has emergency services. Found by determining whether 'Urgent and emergency care' was a metric the hospital was assessed by in the NHS oversight framework.[^5]
7. `accreditation_year`: Taken to be the year of the hospital's earlist inspection listed in a csv file provided by the Care Quality Commission.[^6]

## Diseases Data: `diseases_table.txt`

# Steps to Reproduce Generated Data

(Requires a [conda](https://docs.conda.io/projects/conda/en/stable/user-guide/install/index.html) installation.)

Create a directory to store scripts and generated data, for example:

```shell
mkdir /home/ubuntu/hpdm172/assignment/
```

Navigate to the created directory:

```shell
cd /home/ubuntu/hpdm172/assignment/
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
conda env create -f /home/ubuntu/hpdm172/assignment/data_gen_env.yml
```

Activate the conda environment `data_gen_env.yml`:

```shell
conda activate data_gen_env
```

Finally, run the bash script `generate_data.sh`:

```shell
./generate_data.sh
```

# References

[^1]: "[Other NHS organisations](https://digital.nhs.uk/services/organisation-data-service/data-search-and-export/csv-downloads/other-nhs-organisations)," NHS England Digital, accessed November, 30 2025.
[^2]: NHS England Digital, "[Other NHS organisations](https://digital.nhs.uk/services/organisation-data-service/data-search-and-export/csv-downloads/other-nhs-organisations)."
[^3]: "[Critical care and General & Acute Beds – Urgent and Emergency Care Daily Situation Reports 2025-26](https://www.england.nhs.uk/statistics/statistical-work-areas/bed-availability-and-occupancy/critical-care-and-general-acute-beds-urgent-and-emergency-care-daily-situation-reports/critical-care-and-general-acute-beds-urgent-and-emergency-care-daily-situation-reports-25-26/)," NHS England, accessed November 30, 2025.
[^4]: "[NHS oversight framework csv metadata file](https://www.england.nhs.uk/long-read/nhs-oversight-framework-csv-metadata-file/)," NHS England, accessed November 30, 2025.
[^5]: NHS England, "[NHS oversight framework csv metadata file](https://www.england.nhs.uk/long-read/nhs-oversight-framework-csv-metadata-file/)."
[^6]: "[Using CQC data](https://www.cqc.org.uk/about-us/transparency/using-cqc-data#directory)," Care Quality Commission, accessed November 30, 2025.