create table emp3(
empid int primary key,
firstname varchar(20), 
lastname varchar(20),
salary int,
city varchar(30),
deptname varchar(30),
)
select * from emp3

insert into emp3 values(1,'sayali','shukla',35000,'pune','HR')
insert into emp3 values(2,'snehal','kawade',36000,'solapur','sales')
insert into emp3 values(3,'pooja','kulkarni',40000,'mumbai','HR')
insert into emp3 values(4,'muskan','tiwari',42000,'pune','HR')
insert into emp3 values(5,'payal','shukla',50000,'pune','engg')
insert into emp3 values(6,'arti','dube',45000,'pune','it')
insert into emp3 values(7,'yash','shukla',25000,'pune','it')
insert into emp3 values(8,'rutuja','kulkarni',28000,'pune','it')

select deptname,count(empid) as empcount from emp3
group by deptname
having deptname in ('hr','sales')
order by count(empid)