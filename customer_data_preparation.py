import pandas as pd 

customer = pd.read_csv('customer_shopping_data.csv')

# Convert invoice_date to datetime

customer['invoice_date'] = pd.to_datetime(customer['invoice_date'], format='%d/%m/%Y' ,errors='coerce')


# Remove duplicates (same invoice, customer, category, date)

customer = customer.drop_duplicates(subset=('invoice_no', 'customer_id', 'category', 'invoice_date'))

# Create calculated columns

customer['total_spend'] = customer['quantity']*customer['price']

customer['year'] = customer['invoice_date'].dt.year
customer['month'] = customer['invoice_date'].dt.month
customer['year_month'] = customer['invoice_date'].dt.to_period('M')


# Create Age Groups

bins = [0, 17 , 25 ,35, 45, 55, 65 ,100]
labels= ['<18' ,'18-25' , '26-35', '36-45' , '46-55' , '56-65' , '65+' ]

customer['age_groups'] = pd.cut(customer['age'], bins=bins, labels=labels, right=True)

print(customer.head())

# Save cleaned data to CSV

customer.to_csv("customer_data_cleaned.csv", index=False)

print("Saved")