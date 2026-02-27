import pandas as pd
import numpy as np

# ===============================
# 1. LOAD DATA
# ===============================
file_path = "C:/Users/HP/Desktop/de_practice/sales_big_dataset.csv"   # change if needed
df = pd.read_csv(file_path)

print("Original Shape:", df.shape)
print(df.head())

# ===============================
# 2. REMOVE DUPLICATES
# ===============================
df.drop_duplicates(inplace=True)

# ===============================
# 3. FIX CUSTOMER NAME SPACES
# ===============================
df["customer_name"] = df["customer_name"].str.strip()

# ===============================
# 4. FIX DATE FORMAT
# ===============================
df["date"] = pd.to_datetime(df["date"], errors="coerce")

# Remove rows where date is invalid
df = df.dropna(subset=["date"])

# ===============================
# 5. HANDLE MISSING PRICE
# ===============================
# Fill missing price using product average
df["price"] = df.groupby("product")["price"].transform(
    lambda x: x.fillna(x.mean())
)

# If still missing → fill with global mean
df["price"].fillna(df["price"].mean(), inplace=True)

# ===============================
# 6. CREATE NEW COLUMN
# ===============================
df["total"] = df["quantity"] * df["price"]

# ===============================
# 7. DATA TYPE FIX
# ===============================
df["quantity"] = df["quantity"].astype(int)
df["price"] = df["price"].astype(float)
df["total"] = df["total"].astype(float)

# ===============================
# 8. SAVE CLEAN DATA
# ===============================
df.to_csv("sales_clean.csv", index=False)

print("Clean Shape:", df.shape)
print("Cleaning Complete ✅")



