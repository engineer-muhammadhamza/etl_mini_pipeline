import pandas as pd
import numpy as np
from sqlalchemy import create_engine

engine = create_engine("postgresql://postgres:hamza121720@localhost:5432/sq_start")

file_path = "C:/Users/HP/Desktop/de_practice/sales_clean.csv"   # change if needed
df = pd.read_csv(file_path)
df.to_sql("sales_clean", engine, if_exists="replace", index=False)

print("Data loaded to PostgreSQL successfully 🚀")