create table tblstudy(
studId varchar(5),
courseId varchar(5),
year int
)

select * from tblstudy

insert into tblstudy values('s1','c1',2016)
insert into tblstudy values('s2','c2',2017)
insert into tblstudy values('s1','c2',2017)

select s1.studId,s1.courseId,s1.year
from tblstudy s1, tblstudy s2
where s1.studId=s2.studId and s1.courseId<>s2.courseId
