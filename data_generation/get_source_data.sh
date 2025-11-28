#!/bin/bash

# Script to obtain source data.

curl -L -o acute_trust_services.csv https://www.england.nhs.uk/wp-content/uploads/2025/09/nhs-oversight-framework-acute-trust-data.csv

curl -L -o addresses.csv https://www.odsdatasearchandexport.nhs.uk/api/getReport?report=etr

curl -L -o beds.csv https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2025/11/202509-September-2025-beds-sitrep-data-finalversion.csv

curl -L -o cqc_directory.zip https://www.cqc.org.uk/sites/default/files/2025-11/26_November_2025_CQC_directory.zip
unzip cqc_directory.zip
mv 26_November_2025_CQC_directory.csv cqc_inspections.csv
rm cqc_directory.zip
tail -n +5 cqc_inspections.csv > cleaned_cqc_inspections.csv
mv cleaned_cqc_inspections.csv cqc_inspections.csv

mkdir source_data

mv acute_trust_services.csv ./source_data/
mv addresses.csv ./source_data/
mv beds.csv ./source_data/
mv cqc_inspections.csv ./source_data/

# TODO

# https://github.com/matt40k/Names/blob/34d163a5c99aa0581ad5d4965d51bf53dd9d78b4/Forename_Autumn2014.csv
# https://github.com/matt40k/Names/blob/34d163a5c99aa0581ad5d4965d51bf53dd9d78b4/Surname_Autumn2014.csv
# https://github.com/academe/UK-Postcodes/blob/b0ec095967119671347074f44dd0a62f9e0830f1/postcodes.csv

# USEFUL

# https://www.mrs.org.uk/pdf/postcodeformat.pdf
# https://pmc.ncbi.nlm.nih.gov/articles/PMC6177714/
# https://academic.oup.com/ajcp/article/151/5/446/5237639