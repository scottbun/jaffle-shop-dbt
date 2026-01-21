# Jaffle Shop data – dbt + PostgreSQL workflow

This project demonstrates a simple analytics workflow using:

- **Python**
- **PostgreSQL (Supabase)**
- **dbt Core**
- **Jaffle Shop example data**

The pipeline:
1. Loads raw CSV data into Supabase PostgreSQL database
2. Transforms data using dbt models

## Getting started
Prerequisites:
* Python 3.11
* Supabase PostgreSQL database

Create a virtual environment, activate it, and install the project requirements
```bash
python3.11 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```
Create a `.env` file in the project root for database connection information. Update `~/.dbt/profiles.yml` to use this content and run
```bash
export $(grep -v '^#' .env | xargs)
```

## Raw data
Jaffle Shop data was generated using: https://github.com/dbt-labs/jaffle-shop-generator

The generated CSV files can be found in the `jaffle-data/` folder.  
To load data into the raw schema in the Postgres database use the command
```bash
python load_raw_data.py
```

## Data Transformation
Data is tranformed in the database using dbt models. To run the transformations use the command
```bash
dbt run
```
The dbt models can be found in `models/`. They are divided into three sections:  

`example/`: example models provided by dbt  
`staging/`: minimal transformation of raw data into a clean and consistent format to be used by downstream models  
`marts/`: transformation into analytics-ready tables  

## Analytics
`marts/analytics/` contains pre-aggregated tables used in a sales dashboard.  
See https://github.com/scottbun/jaffle-shop-dashboard

## To Do
* Add `schema.yml` for testing and documenting the models

## Credits
Modeling patterns are inspired from examples by dbt Labs.

## References

* Courses from dbt Labs: https://learn.getdbt.com/catalog
