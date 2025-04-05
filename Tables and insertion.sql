CREATE DATABASE EmployeePayrollDB;
USE EmployeePayrollDB;
-------------

#Employee Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL
);

INSERT INTO Employees (name, position, department_id, hire_date)
VALUES 
('Alice', 'Manager', 1, '2022-01-10'),
('Bob', 'Developer', 2, '2023-02-15'),
('Charlie', 'Accountant', 3, '2021-05-20'),
('Diana', 'HR Executive', 1, '2022-09-01'),
('Ethan', 'Data Analyst', 2, '2023-04-10'),
('Fiona', 'Marketing Lead', 4, '2021-11-30'),
('George', 'Sales Executive', 5, '2023-06-18'),
('Hema', 'UI/UX Designer', 2, '2023-07-12'),
('Ishaan', 'HR Manager', 1, '2020-03-15'),
('Jaya', 'System Admin', 2, '2022-08-05'),
('Karthik', 'Financial Analyst', 3, '2021-10-10'),
('Lavanya', 'Content Writer', 4, '2023-01-20'),
('Manoj', 'Sales Manager', 5, '2020-07-23'),
('Nisha', 'Recruiter', 1, '2021-12-01'),
('Omkar', 'Full Stack Dev', 2, '2022-05-09'),
('Priya', 'Finance Lead', 3, '2023-03-11'),
('Quinn', 'Brand Manager', 4, '2020-11-25'),
('Rahul', 'Sales Rep', 5, '2022-06-30'),
('Sneha', 'Business Analyst', 2, '2021-04-16'),
('Tejas', 'SEO Specialist', 4, '2023-01-01'),
('Usha', 'Content Manager', 4, '2022-08-28'),
('Vikas', 'Tech Lead', 2, '2022-02-02'),
('Wendy', 'Payroll Officer', 3, '2020-09-10'),
('Xavier', 'HR Consultant', 1, '2023-05-12'),
('Yamini', 'Front-End Dev', 2, '2023-03-17'),
('Zoya', 'Sales Intern', 5, '2023-07-20'),
('Ajay', 'Tester', 2, '2022-10-14'),
('Bhavna', 'Business Dev', 5, '2021-03-19'),
('Chirag', 'IT Support', 2, '2021-06-28'),
('Deepa', 'Finance Associate', 3, '2022-07-07');

select * from Employees;

-------------------

#Department Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO Departments (department_name)
VALUES 
('HR'), ('IT'), ('Finance'), ('Marketing'), ('Sales');

select * from Departments;

----------------

#Payroll Table
CREATE TABLE Payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE CASCADE
);

INSERT INTO Payroll (employee_id, salary, bonus)
VALUES 
(1, 75000, 5000), (2, 60000, 3000), (3, 55000, 4000),
(4, 50000, 2000), (5, 65000, 3500), (6, 70000, 4500),
(7, 48000, 2500), (8, 62000, 3000), (9, 72000, 5500),
(10, 58000, 3000), (11, 68000, 4000), (12, 50000, 1500),
(13, 67000, 3500), (14, 52000, 2200), (15, 75000, 5000),
(16, 80000, 6000), (17, 78000, 5000), (18, 49000, 2500),
(19, 61000, 3000), (20, 56000, 2800), (21, 64000, 3500),
(22, 71000, 4000), (23, 53000, 2000), (24, 60000, 3000),
(25, 47000, 1500), (26, 59000, 2800), (27, 63000, 3300),
(28, 54000, 2400), (29, 61000, 2700), (30, 58000, 2500);

select * from Payroll;

-------------

#Attendance Table
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    work_date DATE,
    status ENUM('Present', 'Absent', 'Leave'),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE CASCADE
);

INSERT INTO Attendance (employee_id, work_date, status) VALUES
(1, '2024-04-01', 'Present'),
(1, '2024-04-02', 'Leave'),
(1, '2024-04-03', 'Absent'),
(1, '2024-04-04', 'Present'),
(1, '2024-04-05', 'Present'),

(2, '2024-04-01', 'Absent'),
(2, '2024-04-02', 'Present'),
(2, '2024-04-03', 'Leave'),
(2, '2024-04-04', 'Absent'),
(2, '2024-04-05', 'Present'),

(3, '2024-04-01', 'Leave'),
(3, '2024-04-02', 'Present'),
(3, '2024-04-03', 'Absent'),
(3, '2024-04-04', 'Present'),
(3, '2024-04-05', 'Leave'),

(4, '2024-04-01', 'Present'),
(4, '2024-04-02', 'Leave'),
(4, '2024-04-03', 'Absent'),
(4, '2024-04-04', 'Present'),
(4, '2024-04-05', 'Absent'),

(5, '2024-04-01', 'Absent'),
(5, '2024-04-02', 'Present'),
(5, '2024-04-03', 'Leave'),
(5, '2024-04-04', 'Leave'),
(5, '2024-04-05', 'Present'),

(6, '2024-04-01', 'Present'),
(6, '2024-04-02', 'Present'),
(6, '2024-04-03', 'Absent'),
(6, '2024-04-04', 'Leave'),
(6, '2024-04-05', 'Present'),

(7, '2024-04-01', 'Leave'),
(7, '2024-04-02', 'Absent'),
(7, '2024-04-03', 'Present'),
(7, '2024-04-04', 'Present'),
(7, '2024-04-05', 'Absent'),

(8, '2024-04-01', 'Absent'),
(8, '2024-04-02', 'Leave'),
(8, '2024-04-03', 'Present'),
(8, '2024-04-04', 'Leave'),
(8, '2024-04-05', 'Present'),

(9, '2024-04-01', 'Present'),
(9, '2024-04-02', 'Present'),
(9, '2024-04-03', 'Absent'),
(9, '2024-04-04', 'Absent'),
(9, '2024-04-05', 'Leave'),

(10, '2024-04-01', 'Leave'),
(10, '2024-04-02', 'Present'),
(10, '2024-04-03', 'Present'),
(10, '2024-04-04', 'Absent'),
(10, '2024-04-05', 'Leave'),

(11, '2024-04-01', 'Present'),
(11, '2024-04-02', 'Leave'),
(11, '2024-04-03', 'Absent'),
(11, '2024-04-04', 'Present'),
(11, '2024-04-05', 'Absent'),

(12, '2024-04-01', 'Leave'),
(12, '2024-04-02', 'Present'),
(12, '2024-04-03', 'Leave'),
(12, '2024-04-04', 'Absent'),
(12, '2024-04-05', 'Present'),

(13, '2024-04-01', 'Absent'),
(13, '2024-04-02', 'Present'),
(13, '2024-04-03', 'Present'),
(13, '2024-04-04', 'Leave'),
(13, '2024-04-05', 'Present'),

(14, '2024-04-01', 'Present'),
(14, '2024-04-02', 'Absent'),
(14, '2024-04-03', 'Leave'),
(14, '2024-04-04', 'Leave'),
(14, '2024-04-05', 'Present'),

(15, '2024-04-01', 'Absent'),
(15, '2024-04-02', 'Leave'),
(15, '2024-04-03', 'Present'),
(15, '2024-04-04', 'Present'),
(15, '2024-04-05', 'Leave'),

(16, '2024-04-01', 'Present'),
(16, '2024-04-02', 'Present'),
(16, '2024-04-03', 'Leave'),
(16, '2024-04-04', 'Absent'),
(16, '2024-04-05', 'Present'),

(17, '2024-04-01', 'Absent'),
(17, '2024-04-02', 'Leave'),
(17, '2024-04-03', 'Present'),
(17, '2024-04-04', 'Present'),
(17, '2024-04-05', 'Absent'),

(18, '2024-04-01', 'Leave'),
(18, '2024-04-02', 'Leave'),
(18, '2024-04-03', 'Present'),
(18, '2024-04-04', 'Absent'),
(18, '2024-04-05', 'Present'),

(19, '2024-04-01', 'Present'),
(19, '2024-04-02', 'Absent'),
(19, '2024-04-03', 'Leave'),
(19, '2024-04-04', 'Present'),
(19, '2024-04-05', 'Leave'),

(20, '2024-04-01', 'Absent'),
(20, '2024-04-02', 'Present'),
(20, '2024-04-03', 'Absent'),
(20, '2024-04-04', 'Leave'),
(20, '2024-04-05', 'Present'),

(21, '2024-04-01', 'Leave'),
(21, '2024-04-02', 'Present'),
(21, '2024-04-03', 'Present'),
(21, '2024-04-04', 'Absent'),
(21, '2024-04-05', 'Present'),

(22, '2024-04-01', 'Present'),
(22, '2024-04-02', 'Leave'),
(22, '2024-04-03', 'Leave'),
(22, '2024-04-04', 'Absent'),
(22, '2024-04-05', 'Present'),

(23, '2024-04-01', 'Absent'),
(23, '2024-04-02', 'Present'),
(23, '2024-04-03', 'Present'),
(23, '2024-04-04', 'Leave'),
(23, '2024-04-05', 'Leave'),

(24, '2024-04-01', 'Present'),
(24, '2024-04-02', 'Present'),
(24, '2024-04-03', 'Leave'),
(24, '2024-04-04', 'Absent'),
(24, '2024-04-05', 'Present'),

(25, '2024-04-01', 'Leave'),
(25, '2024-04-02', 'Absent'),
(25, '2024-04-03', 'Present'),
(25, '2024-04-04', 'Present'),
(25, '2024-04-05', 'Leave'),

(26, '2024-04-01', 'Present'),
(26, '2024-04-02', 'Present'),
(26, '2024-04-03', 'Leave'),
(26, '2024-04-04', 'Absent'),
(26, '2024-04-05', 'Present'),

(27, '2024-04-01', 'Leave'),
(27, '2024-04-02', 'Present'),
(27, '2024-04-03', 'Present'),
(27, '2024-04-04', 'Absent'),
(27, '2024-04-05', 'Leave'),

(28, '2024-04-01', 'Absent'),
(28, '2024-04-02', 'Leave'),
(28, '2024-04-03', 'Present'),
(28, '2024-04-04', 'Present'),
(28, '2024-04-05', 'Present'),

(29, '2024-04-01', 'Present'),
(29, '2024-04-02', 'Present'),
(29, '2024-04-03', 'Absent'),
(29, '2024-04-04', 'Leave'),
(29, '2024-04-05', 'Leave'),

(30, '2024-04-01', 'Present'),
(30, '2024-04-02', 'Absent'),
(30, '2024-04-03', 'Leave'),
(30, '2024-04-04', 'Present'),
(30, '2024-04-05', 'Present');

select * from Attendance;

---------------

    
    













