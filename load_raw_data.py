import pandas as pd
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv
from sqlalchemy.types import String, Date, Float  # import SQLAlchemy types

# Load .env variables
load_dotenv()

DB_HOST = os.getenv("DB_HOST")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_NAME = os.getenv("DB_NAME")
DB_PORT = os.getenv("DB_PORT", "5432")  # default 5432 if missing
DB_SCHEMA = "raw"

# Create SQLAlchemy engine
engine = create_engine(
    f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)

# Define column types per table
table_column_types = {
    "raw_customers": {
        "id": String,
        "name": String
    },
    "raw_orders": {
        "id": String,
        "customer": String,
        "ordered_at": Date,
        "store_id": String,
        "subtotal": Float,
        "tax_paid": Float,
        "order_total": Float
    },
    "raw_items": {
        "id": String,
        "order_id": String,
        "sku": String
    },
    "raw_products": {
        "sku": String,
        "name": String,
        "type": String,
        "price": Float,
        "description": String
    },
    "raw_stores": {
        "id": String,
        "name": String,
        "opened_at": Date,
        "tax_rate": Float
    },

}

# Insert tables to database
for table in ["raw_customers", "raw_orders", "raw_items", "raw_products", "raw_stores"]:
    df = pd.read_csv(f"jaffle-data/{table}.csv")
    df.to_sql(table, engine, schema=DB_SCHEMA, if_exists="replace", index=False,  dtype=table_column_types.get(table))

print("Raw data loaded.")
