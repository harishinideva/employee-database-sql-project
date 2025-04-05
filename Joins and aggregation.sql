
USE EmployeePayrollDB;

#Total Days Each Employee Was Present
SELECT 
    e.employee_id,
    e.name,
    COUNT(a.attendance_id) AS total_days_present
FROM 
    employees e
JOIN 
    attendance a ON e.employee_id = a.employee_id
WHERE 
    a.status = 'Present'
GROUP BY 
    e.employee_id, e.name;
    
--------

#Attendance Summary by Status (Present, Absent, Leave)
SELECT 
    e.employee_id,
    e.name,
    a.status,
    COUNT(*) AS status_count
FROM 
    employees e
JOIN 
    attendance a ON e.employee_id = a.employee_id
GROUP BY 
    e.employee_id, e.name, a.status
ORDER BY 
    e.employee_id;

---------

#Employees with More Than 2 Leaves
SELECT 
    e.employee_id,
    e.name,
    COUNT(*) AS leave_days
FROM 
    employees e
JOIN 
    attendance a ON e.employee_id = a.employee_id
WHERE 
    a.status = 'Leave'
GROUP BY 
    e.employee_id, e.name
HAVING 
    COUNT(*) > 2;
    
-------------

#Average Salary by Department
SELECT 
    d.department_name,
    AVG(p.salary) AS avg_salary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Payroll p ON e.employee_id = p.employee_id
GROUP BY d.department_name;

---------------
# Count of Present Employees by Department
SELECT 
    d.department_name,
    COUNT(*) AS present_count
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Attendance a ON e.employee_id = a.employee_id
WHERE a.status = 'Present' AND a.work_date = '2024-04-01'
GROUP BY d.department_name;

------------
#Total Salary and Bonus by Department
SELECT 
    d.department_name,
    SUM(p.salary) AS total_salary,
    SUM(p.bonus) AS total_bonus
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Payroll p ON e.employee_id = p.employee_id
GROUP BY d.department_name;

-------------
