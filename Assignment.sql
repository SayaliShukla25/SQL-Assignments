create table salesman4(
salesman_id int primary key,
s_name varchar(30),
s_city varchar(30),
commission float,
)

create table customer4(
c_id int primary key,
c_name varchar(30),
city varchar(30), 
grade int,
salesman_id int,

constraint fk_salesman4_customer4 foreign key (salesman_id) references salesman4(salesman_id)
)

create table order4(
o_id int primary key,
purchase_amt int,
or_date date,
c_id int,
salesman_id int,


constraint fk_cust_order4 foreign key (c_id) references customer4(c_id),
constraint fk_cust_salesman4 foreign key (salesman_id) references salesman4(salesman_id),

)
select * from salesman4
select * from customer4
select * from order4

insert into salesman4 values(1,'smith','mumbai',0.15)
insert into salesman4 values(2,'nick','pune',0.13)
insert into salesman4 values(3,'john','nashik',0.11)
insert into salesman4 values(4,'anne','delhi',0.14)
insert into salesman4 values(5,'eva','banglore',0.12)

insert into customer4 values(10,'sayali','nashik',100,1)
insert into customer4 values(20,'neha','pune',200,2)
insert into customer4 values(30,'pooja','banglore',300,3)
insert into customer4 values(40,'yash','pune',100,4)
insert into customer4 values(50,'shekhar','nashik',300,5)

insert into order4 values(100,1000,getdate(),10,1)
insert into order4 values(200,800,getdate(),20,2)
insert into order4 values(300,600,getdate(),30,3)
insert into order4 values(400,900,getdate(),40,4)
insert into order4 values(500,2000,getdate(),50,5)



SELECT a.o_id,a.or_date,a.purchase_amt,
b.c_name AS "C_Name", b.grade, 
c.s_name AS "Salesman", c.commission 
FROM order4 a 
INNER JOIN customer4 b 
ON a.c_id=b.c_id 
INNER JOIN salesman4 c 
ON a.salesman_id=c.salesman_id;

/* 1. Write a SQL statement to prepare a list with salesman name, customer name and their cities for the salesmen and customer who belongs to the same city. */

SELECT s.S_name,
       c.c_name,
       c.city
  FROM salesman4 s
  INNER JOIN customer4 c
    ON s.S_city = c.city;

/* 2. Write a SQL statement to make a list with order no, purchase amount, customer name and their cities for those orders which order amount between 500 and 2000 */

SELECT o.o_ID,
       o.purchase_amt,
       c.c_name, 
       c.city
  FROM order4 o
  INNER JOIN customer4 c
    ON o.c_id = c.c_id
  WHERE o.purchase_amt BETWEEN 500 AND 2000;


  /* 3. Write a SQL statement to know which salesman are working for which customer. */

SELECT c.c_name AS "Customer Name",
       s.s_name AS "Salesman"
  FROM customer4 c
  INNER JOIN salesman4 s
    ON c.salesman_id = s.salesman_id;

	
/* 5. Write a SQL statement to find the details of an order i.e. order number, order date, amount of order, which customer gives the order and which salesman works for that customer and how much commission he gets for an order. */

SELECT o.o_id,
       o.or_date,
       o.purchase_amt,
       c.c_name AS "Customer Name",
       s.s_name AS "Salesman",
       s.commission 
  FROM order4 o
  INNER JOIN customer4 c
    ON o.c_id=c.c_id 
  INNER JOIN salesman4 s
    ON o.salesman_id=s.salesman_id;

/* 6. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa. */

SELECT s.s_name AS "Salesman",
       c.c_name AS "Customer Name"
  FROM salesman4 s
  CROSS JOIN customer4 c;

 /* 7. Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own. */

SELECT c.c_name AS "Customer Name"
  FROM customer4 c
  LEFT JOIN salesman4 s
    ON c.salesman_id=s.salesman_id
  ORDER BY c.c_id ASC;

 /* 8. Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own. */

SELECT c.c_name AS "Customer Name",
       c.grade
  FROM customer4 c
  LEFT JOIN salesman4 s
    ON c.salesman_id=s.salesman_id
  WHERE c.grade < 300
  ORDER BY c.c_id ASC;

  
/* 9. Write a query to display the commission of all the salesmen servicing customers in Pune. */

SELECT commission
  FROM salesman4
  WHERE salesman_id IN (SELECT salesman_id
                          FROM customer4
                          WHERE city = 'Pune');

/* 10. Write a SQL statement to make a report with customer name, city, order no, order date, purchase amount for those customers from the existing list who placed one or more orders or which order(s) have been placed by the customer who is not on the list. */

SELECT c.c_name AS "Customer Name",
       c.city,
       o.o_id,
       o.or_date,
       o.purchase_amt
  FROM customer4 c
  RIGHT JOIN order4 o
    ON c.c_id= o.c_id;