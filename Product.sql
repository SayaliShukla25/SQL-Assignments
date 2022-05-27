create table Products(
id int primary key,
name varchar(30),
price int,
)
select * from Products

insert into Products values(1,'laptop',34000)
insert into Products values(2,'watch',1200)
insert into Products values(3,'bag',600)
insert into Products values(4,'mouse',1000)
insert into Products values(5,'mobile',10000)

--15. Use the MIN function to select the record with the smallest value of the Price column.
select min(price) from Products

--16. Use an SQL function to select the record with the highest value of the Price column.
select max(price) from Products

--17.Use the correct function to return the number of records that have the Price value set to 600
select count(*)from products where price=600

--18.Use an SQL function to calculate the average price of all products.
select avg(price) from Products

--19.Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(price) from Products

--31.Use the BETWEEN operator to select all the records where the value of the Price column is between 500 and 1200
select * from Products where price between 500 and 1200

--32.Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
select * from Products where price not between 500 and 1200

--33.Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'bag' and 'watch'.
select * FROM Products where name between 'bag'and'watch' 

