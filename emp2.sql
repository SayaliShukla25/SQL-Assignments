create table emp2(
empid int primary key,
firstname varchar(20), 
lastname varchar(20),
salary int,
city varchar(30),
deptname varchar(30),
)

insert into emp2 values(1,'sayali','shukla',35000,'pune','HR')
insert into emp2 values(2,'snehal','kawade',36000,'solapur','sales')
insert into emp2 values(3,'pooja','kulkarni',40000,'mumbai','HR')
insert into emp2 values(4,'muskan','tiwari',42000,'pune','HR')
insert into emp2 values(5,'payal','shukla',50000,'pune','engg')
insert into emp2 values(6,'arti','dube',45000,'pune','it')
insert into emp2 values(7,'yash','shukla',25000,'pune','it')
insert into emp2 values(8,'rutuja','kulkarni',28000,'pune','it')

--1. display all employess from table  
 select * from emp2

--2. display emp who work in sales department
 select * from emp2 where deptname='sales'

-- 3. display emp who's salary is greater than 35000
select * from emp2 where salary>35000

--4. display emp who belong to pune & mumbai city
select * from emp2 where city in('mumbai','pune')

-- 5. display emp who's salary is in between 25,000 - 30,000
select * from emp2 where salary between 25000 and 30000

-- 6. display emp name who's name start with 'T'
select * from emp2 where lastname like 't%'

--7. display emp name who's name end with 'A'
select * from emp2 where firstname like '%a'

--8. display unique department from emp table
select distinct deptname from emp2

--9. display emp those are not working in hr & sales dept
select * from emp2 where deptname not in ('hr','sales')

select sum(salary) as SumSalary from emp2
select avg(salary) as AvgSalary from emp2
select max(salary) as MaxSalary from emp2
select min(salary) as MinSalary from emp2

 select deptname,count(empid) as empcount from emp2
 group by deptname

 select city,count(empid) as empcount from emp2
 group by city

 alter table emp2 drop column deptname
 alter table emp2 add did int

 create table dept1(
did int primary key,
dname varchar(10)
)

insert into dept1 values(1,'sales')
insert into dept1 values(2,'hr')
insert into dept1 values(3,'it')
insert into dept1 values(4,'elec')



alter table emp2 add
constraint fk_dept_emp2 foreign key(did) references dept1(did)

update emp2 set did=1 where empid in (1,3,4)
update emp2 set did=2 where empid in (2,5)
update emp2 set did=3 where empid in (8,7)
update emp2 set did=4 where empid in (6)


select * from dept1
--1. display employees who work in their dept uisng inner join
select e.firstname,e.lastname,d.dname
from emp2 e
inner join dept1 d on d.did=e.did

--2.display emp & dept name who work in hr dept
select e. firstname,d.dname
from emp2 e
inner join dept1 d on d.did=e.did
where d.dname='hr'


--3-- display emp from sales dept in asending order of name
select e.firstname,d.dname,e.salary
from emp2 e
inner join dept1 d on d.did=e.did
where d.dname='sales'
order by e.firstname

--4. display emp & dept asending order of name & salary
select e.firstname,d.dname,e.salary
from emp2 e
inner join dept1 d on d.did=e.did
order by e.firstname,e.salary

--5.display emp in hr dept , desending order of their salary
select e.firstname,d.dname,e.salary
from emp2 e
inner join dept1 d on d.did=e.did
where d.dname='hr'
order by e.salary desc

--sql build in functions
update emp2 set salary=34998.99 where empid=1

select SUBSTRING(firstname,0,3) as tempname from emp2 where empid=4
select CONCAT(firstname,'',city) as info from emp2
select firstname,LEN(firstname) as length from emp2
select UPPER(firstname) as name from emp2
select LOWER(firstname) as name from emp2
select ROUND(salary,0) as salary from emp2 where  empid=1
select ROUND(345.889,2) as roundvalue
select CAST(salary as varchar(20)) from emp2 
select Reverse(firstname) as reversename from emp2
select salary, RANK() over (order by salary desc) as salaryrank from emp2
select replace(firstname,'rutuja','nikita') as info from emp2 where empid=8


--Write a query to display first_name and last_name using alias ‘First Name’ & ‘Last Name’ from employee table
SELECT firstname as[ name], lastname as [name]
FROM emp2

--Write a query to get unique deptid from employee table
select distinct did from emp2

--Write a query to display employee details with salary, calculate the PF as 12 % of basic salary & display as separate column
select firstname,lastname,salary,salary*0.12 pf from emp2

--Write a query to get total salaries payable to all employees from employee table
select sum(salary) from emp2

--Write a query to get number of employees are working in company
select count(empid) from emp2

--Write a query to get first 8 records from the employee table
select count(customerid)from customers 