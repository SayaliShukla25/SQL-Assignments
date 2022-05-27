create table Person(
personId int,
personName varchar(20) not null

)

create unique index index_person on person (personId);

alter table person add country varchar(20) default 'india'
 
alter table person add age int not null

alter table person add constraint chk_age check(age>=18)

sp_help person

alter table person alter column name varchar(40) not null

alter table Person add city varchar(50)

alter table Person drop column city

alter table Person alter column personName varchar(40)

sp_rename 'person.personname','name'


--DML--
insert into person values(12,'sneha',28,'USA')
update person set age=30 where personId=7
select name,age from person
select name,age from person where personId=2
select distinct country from person
--arithmetic operators--
select * from person where personId <>4
select * from person where personId >5
select * from person where personId <8
select * from person where personId <=4
select * from person where personId >=5
select * from person where personId = 4

--DQL--
select * from person where personId in(2,3,4)
select * from person where personId not in(4,5,6)
select * from person where country in('USA','india')
select * from person where country not in('USA')

select* from person where age between 23 and 27

---and/ or/ not operator--

select * from Person where country ='india' and age <=27
select * from Person where not country='USA'
select * from Person where country ='india' or age <=27

--like,not like--
select * from person where name like 'p%'  -- name start with p
select * from person where name like '%i' -- name end with i
select * from person where name like '%a%' -- start with & end with any letter having a letter
select * from person where name like '___i' 
select * from person where name like 's____'

select * from person where name not like 'p%'  -- name start with p
select * from person where name not like '%i' -- name end with i
select * from person where name not like '%h%' -- start with & end with any letter having h letter
select * from person where name not like '___i' 
select * from person where name not like 's____'

select * from person where name like '[a-z]%' 
select * from person where name like '[pa]%' 

select * from Person

--null values in sql
--is null
--not null

insert into person values(14,'harsha',30,null)

select * from person where country is null

select * from person where country is not null


--Order by clause in sql -sort data

select * from Person 
order by age 

select * from Person 
order by country desc

 select country,count(personId) as PerosnCount from person
 group by country

 --40.Add a column of type DATE called Birthday in Persons table
 alter table Person add birthday date

 --41.Delete the column Birthday from the Persons table
 alter table Person drop column birthday



