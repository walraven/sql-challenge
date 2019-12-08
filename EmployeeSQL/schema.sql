CREATE TABLE Department (
    id VARCHAR(8) PRIMARY KEY  NOT NULL,
    name VARCHAR(30)   NOT NULL
);

CREATE TABLE Employee (
    id INT PRIMARY KEY  NOT NULL,
    birthdate DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    gender VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL
);

CREATE TABLE Salaries (
    emp_id INT   NOT NULL,
    salary INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE Titles (
    emp_id INT   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE Dept_Emp (
    emp_id INT   NOT NULL,
    dept_id VARCHAR(8)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE Dept_Mgr (
    dept_id VARCHAR(8)   NOT NULL,
    emp_id INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_id FOREIGN KEY(emp_id)
REFERENCES Employee (id);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_emp_id FOREIGN KEY(emp_id)
REFERENCES Employee (id);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_emp_id FOREIGN KEY(emp_id)
REFERENCES Employee (id);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_dept_no FOREIGN KEY(dept_id)
REFERENCES Department (id);

ALTER TABLE Dept_Mgr ADD CONSTRAINT fk_Dept_Mgr_dept_no FOREIGN KEY(dept_id)
REFERENCES Department (id);

ALTER TABLE Dept_Mgr ADD CONSTRAINT fk_Dept_Mgr_emp_id FOREIGN KEY(emp_id)
REFERENCES Employee (id);

--See the note in the top of analysis.sql re:primary keys not created by this file.