#!/bin/bash

# Script to prepare input text files for sql.

./get_source_data.sh
Rscript make_table_tsvs.R
./prepare_input_txt_files.sh