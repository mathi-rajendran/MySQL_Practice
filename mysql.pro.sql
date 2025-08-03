create database Employee;
use Employee ;
create table Employee_details(
emp_id int,first_name varchar(50),
last_name varchar(100),
salary int,
 joining_date varchar(50),
 department varchar(100),
 primary key(emp_id)
);
 
insert into Employee_details(emp_id,first_name,last_name,salary,joining_date,department)
values(1,"Venkatesh","S",100000,"08/28/2015","Banking"),
(2,"Ragul","P",7500,"08/28/2015","Business"),
(3,"Gopinath","C",50000,"03/02/2016","Pharma"),
(4,"Dinesh","G",50000,"03/02/2016","Insurance"),
(5,"Saibabu","E",40000,"07/08/2017","Software"),
(6,"Hasan","S",29000,"07/08/2017","Manufacturing"),
(7,"Divya","P",33000,"07/08/2017","Healthcare"),
(8,"Aravindan","R",40000,"07/08/2017","Healthcare"),
(9,"Sathish","MD",45000,"03/02/2016","Automobile"),
(10,"Prasanth","PKP",34000,"03/02/2016","Insurance"),
(11,"Vijay","R",25000,"03/02/2016","Business"),
(12,"Sivakumar","K",54700,"03/02/2016","Software");

select * from Employee_details;

create table Incentives(Employee_ref_id int,incentive_date varchar(50),incentive_amt int,
foreign key(Employee_ref_id)references Employee_details(emp_id)
);

insert into Incentives(Employee_ref_id,incentive_date,incentive_amt)values(1,"01-FEB-16",5000),
(2,"01-FEB-16",3000),
(3,"01-FEB-17",4000),
(4,"01-JAN-17",4500),
(5,"01-JAN-17",3500);

SELECT * from Incentives;

-- 1. Get all employee details from the employee table
     select * from Employee_details;
     
-- 2. Get First_name,Last_name from employee table
     select first_name,last_name from Employee_details;
     
-- 3.Get First_name from employee table using alias name "employee name"
     select first_name as fn from Employee_details;
     
-- 4.Get First_name from employee table in upper case
    select upper(first_name) as fn from Employee_details;     
    
-- 5.Get First_name from employee table in lower case
   select lower(first_name) as fn from Employee_details;  
   
-- 6.Get unique department from employee table 
  select distinct department from Employee_details; 
  
-- 7.Select first 3 characters of first_name from employee table
   select substring(first_name, 1,3) from Employee_details;
	
-- 8.Get position of "a" in name "ragavi" from employee table
   select position('a' in 'Ragavi') from Employee_details;
   
-- 9.Get first_name from employee table after removing while spaces from right side
  select rtrim(first_name) from Employee_details;
  
-- 10.Get first_name from employee table after removing while spaces from left side
  select ltrim(first_name) from Employee_details;
  
-- 11.Get length of first_name from employee table
  select length(first_name) from Employee_details;
  
-- 12.Get first-name from employee table after replacing "a" with "$"
  select replace(first_name,'a','$') from employee_details;
  
-- 13.Get first_name and last_name as single column from employee table separated by a'_'
select concat(first_name,'_',last_name) from Employee_details;

-- 14.Get first_name,joining year,joining month,and joining date from employee table
select first_name,substring(joining_date,7,4)from Employee_details;
select first_name,substring(joining_date,1,2)from Employee_details;
select first_name,substring(joining_date,4,2)from Employee_details;

-- 15.Get all employee details from the employee table order by first_name ascending
    select * from Employee_details order by first_name asc;  
    
-- 16.Get all employee details from the employee table order by first_name descending
   select * from Employee_details order by first_name desc;
   
-- 17.Get all employee details from the employee table order by first_name ascending and salary decending
  select * from Employee_details order by first_name asc ,salary desc;
  
-- 18.Get employee details from employee table whose employee name is "Dinesh"
  select * from Employee_details where first_name="Dinesh";
  
-- 19.Get employee details from employee table whose employee name is "Dinesh" and "Roy"
select * from Employee_details where first_name="Dinesh" || first_name="Roy";
    
-- 20.Get employee details from employee table whose employee name is not "Dinesh" and "Roy"
select * from Employee_details where first_name != "Dinesh" and first_name != "Roy";

-- 21.Get employee details from employee table whose first name starts with 's'
select * from Employee_details where first_name like "s%"; 

-- 22.Get employee details from employee table whose first name contains 'v'
select * from Employee_details where first_name like '%v%';

-- 23.Get employee details from employee table whose first name ends with 'n'
select *  from Employee_details where first_name like '%n'; 

-- 24.Get employee details from employee table whose first name ends with 'n' and name contains 4 letters
select *  from Employee_details where first_name like '%n' and character_length(first_name)=4; 

-- 25.Get employee details from employee table whose first name starts with 'J' and name contains 4 letters
select * from Employee_details where first_name like 'j%' and character_length(first_name)=4;

-- 26.Get employee details from employee table who's salary greater than 60000
select * from Employee_details where salary > 60000;

-- 27.Get employee details from employee table who's salary less than 80000
select * from Employee_details where salary < 80000;

-- 28.Get employee details from employee table who's salary between 50000 and 80000
select * from Employee_details where salary between 50000 and 80000;

-- 29.Get employee details from employee table whose name is venkatesh and ragavi
select * from Employee_details where first_name="Venkatesh" || first_name="Ragul";

-- 30. Get names from employee table who has '%' in last_name.
-- Tips: Escape characters for special characters in a queue
select * from Employee_details where first_name like '%!%%' escape '!';

-- 31. Get last name from employee tables after replacing special character with white space
select replace(last_name, ' ', '$') from Employee_details where last_name like ' ';

-- sql queries question and answer on 'sql group by function' examples

-- 41. Get department, total salary with respect to a department from employee table.
select department, sum(salary) from Employee_details group by department;

-- 42. Get department, total salary with respect to a department from employee table order by total salary descending
select department, sum(salary) from Employee_details group by department order by sum(salary) desc;

-- sql queries interview questions and answers on "sql mathematical operations using group by" - examples

-- 43. Get department, no of employees in a department, total salary with respect to a department from employee table order salary descending
select department, count(*), sum(salary) from Employee_details group by department order by sum(salary) desc;

-- 44. Get department wise average salary from employee table order by salary ascending
select department, avg(salary) from Employee_details group by department order by avg(salary) asc;

-- 45. Get department wise maximum salary from employee table order by salary ascending
select department, max(salary) from Employee_details group by department order by max(salary) asc;

-- 46. Get department wise minimum salary from employee table order by salary ascending
select department, min(salary) from Employee_details group by department order by min(salary) asc;

-- 47. Select no of employees joined with respect to year and month from employee table
select year(str_to_date(joining_date, '%m/%d/%Y')) join_year,
       month(str_to_date(joining_date, '%m/%d/%Y')) join_month, 
       count(*) 
from Employee_details 
group by join_year, join_month 
order by join_year, join_month;

-- 48. Select department, total salary with respect to a department from employee table where total salary greater than 800000 total_salary descending
select department, sum(salary) 
from Employee_details 
group by department 
having sum(salary) > 800000 
order by sum(salary) desc;

-- sql queries interview questions and answers on "sql joins" - examples

-- 49. Select first_name, incentive amount from employee and incentives table for those employees who have incentives
select e.first_name, i.incentive_amt
from Employee_details e
inner join incentives i on e.emp_id = i.employee_ref_id;

-- 50. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive greater than 3000
select e.first_name, i.incentive_amt
from Employee_details e
inner join incentives i on e.emp_id = i.employee_ref_id 
where i.incentive_amt > 3000;

-- 51. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
select e.first_name, i.incentive_amt
from Employee_details e
left join incentives i on e.emp_id = i.employee_ref_id;

-- 52. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentive, incentive amount as 0 for those employees who didn't get incentives.
select e.first_name, ifnull(i.incentive_amt, 0)
from Employee_details e
left join incentives i on e.emp_id = i.employee_ref_id;

-- 53. Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join.
select Employee_details.first_name, incentives.incentive_amt
from Employee_details 
left join incentives on Employee_details.emp_id = incentives.employee_ref_id
where incentives.incentive_amt is not null
limit 0, 1000;

-- 54. Select max incentive with respect to employee from employee and incentives table using subquery.

select employee_ref_id, incentive_amt 
from incentives
where incentive_amt = (
    select max(incentive_amt) 
    from incentives
);

-- 55. Select top 2 salary from employee table
select distinct salary
from Employee_details
order by salary desc
limit 2;

-- 56. Select top N salary from employee table
select distinct salary
from Employee_details
order by salary desc
limit 5;

-- 57. Select 2nd highest salary from employee table
select distinct salary
from Employee_details
order by salary desc
limit 1 offset 1;

-- 58. Select nth highest salary from employee table
select distinct salary
from Employee_details
order by salary desc
limit 1 offset 3;

