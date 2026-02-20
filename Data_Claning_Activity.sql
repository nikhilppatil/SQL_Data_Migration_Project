create database Human_Capital_Management;

Use human_capital_management;

SELECT * FROM `employee data`;

SELECT COUNT(*) FROM `employee data`;

ALTER TABLE `employee data`
RENAME COLUMN `ï»¿RFID No/FACE` TO `RFID_No_FACE`;

select RFID_No_FACE, Name, `Actual Basic`
from `employee data`
where
case 
    when staff = "Teachning" then `Actual Basic` > 10000
    else salary > 37354
end;

select * from `employee data`;

select staff, staff
from `employee data`
where
case 
	when Salary > 70000 THEN "HIGHER GRADE PAY"
    ELSE Salary > 50000
end
group by staff;

desc `employee data`;

create view  employe_data as
select Name, Gender, Designation, Salary
from `employee data`
limit 10;

select * from employe_data;

insert into employe_data values("Nikhil Patil", "Male", "Solution Consultant", 85000);

INSERT INTO update_salary_data
VALUES ("Sandip", "Male", "Politician", null);

CREATE TABLE update_salary_data (
    name VARCHAR(100),
    gender VARCHAR(20),
    role VARCHAR(100),
    salary INT
);

select * from update_salary_data;

Update update_salary_data
set salary = salary / 5;

SET SQL_SAFE_UPDATES = 0;

Update update_salary_data
set gender = "Male"
where name = "Punit Balan";

use human_capital_management;
select * from `employee data`;

select max(Salary) from `employee data`
where salary < (select max(salary) from `employee data`);

select distinct(salary)
from `employee data`
order by salary desc
limit 1 offset 1;

select max(salary) from `employee data`;

select name, Salary,
		row_number() over(order by salary desc) AS SALARY
FROM `employee data`
LIMIT 1 OFFSET 1;

select name, Salary,
		dense_rank() over(order by salary desc) AS SALARY
FROM `employee data`;

select name, department, salary,
		dense_rank() over(partition by Department order by salary desc) AS SALARY
FROM `employee data`;

select department, salary,
		avg(salary) over(partition by department) as avg_sal_department_wise
from `employee data`;

select department, round(avg(salary)) as avg_salary
from `employee data`
group by department
order by  department desc;

select name, salary,
		lag(salary) over (order by name) as depart
from `employee data`;

select name, salary,
		lead(salary) over (order by name) as depart
from `employee data`;


SELECT `Date of Joining`, salary,
       salary - LAG(salary) OVER (ORDER BY `Date of Joining`) AS salary_difference
FROM `employee data`;

select * from `employee data`;

SELECT COALESCE(SUM(salary), 0) AS total_salary
FROM `employee data`
WHERE `Date of Joining` 
BETWEEN '26-08-2002' AND '07-05-2028';

SELECT SUM(salary) AS total_salary
FROM `employee data`
WHERE `Date of Joining` >= '26-08-2002';

select Mobile, length(mobile) as length_mobile,
	case
		when mobile is not null 
			and  length(Mobile) = 10
		Then "valid"
        else "invalid"
end as mobile_status, 
row_number() over(order by mobile) as count_sal
from `employee data`;


select mobile,
      count(mobile) over(order by mobile) as count_mobile
from `employee data`;

select name, mobile
from `employee data`
where length(mobile) >= 10;



update `employee data`
set mobile = 985432
where mobile = 9876543204;



select mobile 
from `employee data`;


select length(mobile) 
from `employee data`;




















