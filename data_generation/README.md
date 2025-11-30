# Data Generation Summary

![](hospitals_db_erd.png)

# Steps to Reproduce

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
