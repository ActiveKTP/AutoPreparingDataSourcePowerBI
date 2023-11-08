import pandas as pd
import pymysql

# MySQL database connection parameters
db_params = {
    'host': 'my_host',
    'user': 'my_username',
    'password': 'my_password',
    'db': 'my_db',
}

# SQL query
query = 'SELECT ...'

# Connect to the database and fetch data
connection = pymysql.connect(**db_params)
data = pd.read_sql(query, connection)

# Export data to a CSV file
data.to_csv('output.csv', index=False)
connection.close()
