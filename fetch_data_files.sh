#!/bin/bash

# Script to download input text files with data for SQL hospitals database.

curl -o hospitals_table.txt https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/data_generation/generated_data/hospitals_table.txt
curl -o diseases_table.txt https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/data_generation/generated_data/diseases_table.txt
curl -o doctors_table.txt https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/data_generation/generated_data/doctors_table.txt
curl -o patients_table.txt https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/data_generation/generated_data/patients_table.txt
curl -o medications_table.txt https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/data_generation/generated_data/medications_table.txt
curl -o prescriptions_table.txt https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/data_generation/generated_data/prescriptions_table.txt
curl -o appointments_table.txt https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/data_generation/generated_data/appointments_table.txt
curl -o lab_results_table.txt https://raw.githubusercontent.com/Raiet-Bekirov/HPDM172_assignment/refs/heads/main/data_generation/generated_data/lab_results_table.txt