#!/bin/bash

# Script to prepare input csv files with data for SQL hospitals database.

curl -L -o acute_trust_services.csv https://www.england.nhs.uk/wp-content/uploads/2025/09/nhs-oversight-framework-acute-trust-data.csv

curl -L -o addresses.csv https://www.odsdatasearchandexport.nhs.uk/api/getReport?report=etr

curl -L -o beds.csv https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2025/11/202509-September-2025-beds-sitrep-data-finalversion.csv

curl -L -o cqc_directory.zip https://www.cqc.org.uk/sites/default/files/2025-11/26_November_2025_CQC_directory.zip
unzip cqc_directory.zip
mv 26_November_2025_CQC_directory.csv cqc_inspections.csv
rm cqc_directory.zip
tail -n +5 cqc_inspections.csv > cleaned_cqc_inspections.csv
mv cleaned_cqc_inspections.csv cqc_inspections.csv

curl -L -o first_names.csv https://raw.githubusercontent.com/sigpwned/popular-names-by-country-dataset/refs/heads/main/common-forenames-by-country.csv

curl -L -o last_names.csv https://raw.githubusercontent.com/sigpwned/popular-names-by-country-dataset/refs/heads/main/common-surnames-by-country.csv

curl -L -o medications.csv https://www.vumc.org/wei-lab/sites/default/files/public_files/MEDI-2_HPS.csv

curl -L -o uk_postcodes.csv https://raw.githubusercontent.com/academe/UK-Postcodes/b0ec095967119671347074f44dd0a62f9e0830f1/postcodes.csv

curl -L -o uk_postcode_ins.csv https://data.ideal-postcodes.co.uk/incodes.csv?_gl=1*1fd2gym*_gcl_au*MTYyNjU4MTgyNS4xNzY0MzY1OTgz*_ga*OTM3MTg2NzM1LjE3NjQzNjU5ODM.*_ga_TCWN2YPGY5*czE3NjQzNjU5ODIkbzEkZzEkdDE3NjQzNjYxMTQkajYwJGwwJGgxNzA5MjcxNzE.
tail -n +2 uk_postcode_ins.csv > cleaned_uk_postcode_ins.csv
mv cleaned_uk_postcode_ins.csv uk_postcode_ins.csv

mkdir source_data

mv acute_trust_services.csv addresses.csv beds.csv cqc_inspections.csv first_names.csv \
last_names.csv medications.csv uk_postcodes.csv uk_postcode_ins.csv source_data/

Rscript make_tables.R

mkdir generated_data_csv

mv appointments_table.csv diseases_table.csv doctors_table.csv hospitals_table.csv \
lab_results_table.csv medications_table.csv patients_table.csv prescriptions_table.csv generated_data_csv/

rm appointments_table.txt diseases_table.txt doctors_table.txt hospitals_table.txt \
lab_results_table.txt medications_table.txt patients_table.txt prescriptions_table.txt

rm -r source_data/