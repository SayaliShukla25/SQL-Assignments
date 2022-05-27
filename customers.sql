create table customers(
customerid int primary key,
customername varchar(20),
city varchar(30), 
country varchar(30),
postalcode int,
)
select * from customers

insert into customers values(1,'john','berlin','germany',121110)
insert into customers values(2,'nik','oslo','norway',10115)
insert into customers values(3,'gia','london','england',11150)
insert into customers values(4,'mahi','pune','india',411041)
insert into customers values(5,'joe','oslo','norway',10115)
insert into customers values(23,'mahi','mumbai','india',400001)
insert into customers values(6,'smith','berlin','germany',null)
insert into customers values(7,'yash','delhi','india',null)

--1.Write a statement that will select the City column from the Customers table
select city from customers;

--2.Select all the different values from the Country column in the Customers table.
select distinct Country from Customers

--3.Select all records where the City column has the value "London"
select * from customers where city ='london'

--4.Use the NOT keyword to select all records where City is NOT "Berlin".
select * from customers where not city='Berlin'

--5.Select all records where the CustomerID column has the value 23.
select * from customers where customerid=23

--6.Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from customers where city='berlin' and postalcode=121110

--7.Select all records where the City column has the value 'Berlin' or 'London'.
select * from customers where city='berlin' or city='london'

--8.Select all records from the Customers table, sort the result alphabetically by the column City.
select * from customers
order by city

--9.Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select * from customers
order by city desc

--10.Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select * from customers
order by country,city;

--11.Select all records from the Customers where the PostalCode column is empty.
select * from customers where postalcode is null

--12.Select all records from the Customers where the PostalCode column is NOT empty.
select * from customers where postalcode is not null

--13.Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update customers
set City = 'Oslo'
where Country = 'Norway'

--20.Select all records where the value of the City column starts with the letter "b".
select * from customers where city like 'b%'

--21.Select all records where the value of the City column ends with the letter "i".
select * from customers where city like '%i'

--22.Select all records where the value of the City column contains the letter "a".
select * from customers where city like '%a%'

--23.Select all records where the value of the City column starts with letter "b" and ends with the letter "n".
select * from customers where city like 'b%n'

--24.Select all records where the value of the City column does NOT start with the letter "o".
select * from customers where city not like 'o%'

--25.Select all records where the second letter of the City is an "e".
select * from customers where city like '_e%'

--26.Select all records where the first letter of the City is an "b" or a "l" or an "d".
select * from Customers where City Like'[bld]%'

--27.Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * FROM Customers where City Like '[a-f]%'

--28.Select all records where the first letter of the City is NOT an "b" or a "l" or an "d".
select * from Customers where City not Like'[bld]%'

--29.Use the IN operator to select all the records where the Country is either "Norway" or "France".
select * from customers where country in('Norway','France')

--30.Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from customers where country not in('Norway','France')
 
--34.When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
SELECT Customername ,PostalCode as Pno from Customers

--35.When displaying the Customers table, refer to the table as Consumers instead of Customers.
select * from Customers as Consumers 

--37.List the number of customers in each country, ordered by the country with the most customers first.
select count(customerid),country from customers group by country order by count(customerid) desc

--38.Write the correct SQL statement to create a new database called testDB.
create database testdb

--39.Write the correct SQL statement to delete a database named testDB
drop database testdb

