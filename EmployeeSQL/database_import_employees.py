import csv
import psycopg2
from psycopg2 import sql

# Database connection parameters
dbname = 'postgres'
user = 'postgres'
password = ''
host = 'localhost'  # or your database host
port = '5432'       # or your database port

csv_files = ['departments.csv' 'dept_emp.csv', 'dept_manager.csv', 'employess.csv','salaries.csv','titles.csv']

table_map = { 'departments' : ['dept_no', 'dept_name'] ,
              'dept_emp' : ['emp_no', 'dept_no'],
              'dept_manager' : ['dept_no','emp_no'],
              'employees' : ['emp_no','emp_title_id','birth_date','first_name','last_name','sex','hire_date'],
              'salaries' : ['emp_no','salary'],
              'titles': ['title_id','title']}

csv_file = 'employess.csv'
table_name = 'employess'
columns = table_map[table_name]

try:
    conn = psycopg2.connect(dbname=dbname, user=user, password=password, host=host, port=port)
    cursor = conn.cursor()

    # Open CSV file and iterate over its rows
    with open("data/{}".format(csv_file), 'r', newline='') as f:
        reader = csv.reader(f)
        next(reader)  # Skip the header row if it exists

        for row in reader:
            # Prepare SQL INSERT statement
            insert_statement = sql.SQL('INSERT INTO {} ({}) VALUES ({})').format(
                sql.Identifier(table_name),
                sql.SQL(', ').join(map(sql.Identifier, columns)),
                sql.SQL(', ').join(sql.Placeholder() * len(columns))
            )
            # Execute INSERT statement
            cursor.execute(insert_statement, row)

    # Commit changes and close database connection
    conn.commit()
    cursor.close()
    conn.close()

    print('Data imported successfully.')

except psycopg2.Error as e:
    print('Error connecting to PostgreSQL:', e)