#!/bin/bash

# Script to prepare text files for input into database.

mkdir generated_data

mv hospitals.tsv hospitals_table.txt
mv hospitals_table.txt ./generated_data/