CREATE TABLE "departments" (
 
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (

    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (

    "emp_no" INT   NOT NULL,
 
    "emp_title_id" VARCHAR   NOT NULL,

    "birth_date" DATE   NOT NULL,

    "first_name" VARCHAR   NOT NULL,

    "last_name" VARCHAR   NOT NULL,

    "sex" VARCHAR   NOT NULL,

    "hire_date" DATE   NOT NULL,
    CONSTRAINT "const_primary_key_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (

    "emp_no" INT   NOT NULL,

    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "dept_manager" (

    "dept_no" VARCHAR   NOT NULL,

    "emp_no" INT   NOT NULL
);

CREATE TABLE "salaries" (

    "emp_no" INT   NOT NULL,

    "salary" INT   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "foreign_key_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "foreign_key_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE departments ADD CONSTRAINT departments_dept_no_unique UNIQUE (dept_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no) REFERENCES departments (dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES departments (dept_no);


ALTER TABLE "dept_emp" ADD CONSTRAINT "foreign_key_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "foreign_key_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "foreign_key_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "foreign_key_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


SELECT * FROM departments;
SELECT * FROM titles;	
SELECT * FROM employees;	
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;	
SELECT * FROM salaries;