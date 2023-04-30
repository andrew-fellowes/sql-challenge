# SQL-Challenge

 This assignment requires students to do a research project about people who were employed at the fictitious company **Pewlett Hackard** during the 1980s and 1990s.

---

## Aims

### 1. Data Modelling

Using the csv tables provided, create an ERD

### 2. Data Engineering

Create a table schema in **pgadmin** and import each csv file into corresponding SQL table

### 3. Data Analysis

Perform a series of SQL queries based on questions provided

### 4. Bonus

Create a Jupyter notebook for the bonus analysis

---

## Results

### 1. Data Modelling

ERD SQL output: [QuickDBD-employeeSQL.sql](./EmployeeSQL/QuickDBD-employeeSQL.sql)

![ERD diagram](./EmployeeSQL/QuickDBD-employeeSQL.png)

### 2. Data Engineering

Lines 1 to 51 of [EmployeeSQL](./EmployeeSQL/employeeSQL.sql) create the tables. Data was imported into each table using the **pgadmin** *Table Import/Export data* menu.

### 3. Data Analysis

Lines 52 to 125 of [EmployeeSQL](./EmployeeSQL/employeeSQL.sql) answer the following questions (an image of first 10 lines of the **pgadmin** output is shown for each question)

1. List the employee number, last name, first name, sex, and salary of each employee.

![Screenshot_1 2023-04-29 231917.png](./Screenshot_1%202023-04-29%20231917.png)

2. List the first name, last name, and hire date for the employees who were hired in 1986.

![Screenshot_2 2023-04-29 232015.png](./Screenshot_2%202023-04-29%20232015.png)

3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

![Screenshot_3 2023-04-29 232245.png](./Screenshot_3%202023-04-29%20232245.png)

4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

![Screenshot_4 2023-04-29 232347.png](./Screenshot_4%202023-04-29%20232347.png)

5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

![Screenshot_5 2023-04-29 232443.png](./Screenshot_5%202023-04-29%20232443.png)

6. List each employee in the Sales department, including their employee number, last name, and first name.

![Screenshot_6 2023-04-29 232523.png](./Screenshot_6%202023-04-29%20232523.png)

7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

![Screenshot_7 2023-04-29 232607.png](./Screenshot_7%202023-04-29%20232607.png)

8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

![Screenshot_8 2023-04-29 232650](./Screenshot_8%202023-04-29%20232650.png)

### 4. Bonus

A jupyter notebook [EmployeeSQLAlchemy.ipynb](./EmployeeSQLAlchemy.ipynb) was created in which the employees table was created in [EmployeeSQL/PewlettHackard.sqlite](./EmployeeSQL/PewlettHackard.sqlite), an SQLite database, by importing the [employees.csv](./EmployeeSQL/employees.csv) file into a pandas dataframe and writing to an SQL table object using the **SQLalchemy** library. Query number 2 above was performed on the database. The output from VSCode is shown below.
![VSCode screen grab](./VSCode_grab.png)

## Acknowledgements
- Advice on overcoming postgreSQL DATESTYLE incompatibility when importing the employees.csv file was gratefully received on Slack from [@Henry Leighton](https://mon-data-feb-2023.slack.com/archives/C04FHDYRLFM/p1682740802239079)
- *Customizing date parser* in [Tricks to parse date columns with Pandas read_csv()
](https://github.com/BindiChen/machine-learning/blob/main/data-analysis/012-parse-date-with-read_csv/parse-date-column-with-read_csv.ipynb) was used to overcome the same incompatibility when reading employees.csv date fields into pandas for populating the employees table in the bonus jupyter notebook.