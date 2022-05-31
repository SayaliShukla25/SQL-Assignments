create procedure SP_Insert_Dept1(@did int, @dname varchar(10))
as begin
insert into dept values(@did,@dname)
return
end
-- to alter the existing SP
alter procedure SP_Insert_Dept1(@did int, @dname varchar(10))
as begin
insert into dept1 values(@did,@dname)
return
end


create procedure SP_Update_Dept1(@did int, @dname varchar(10))
as begin
update dept1 set dname=@dname where did=@did
return
end

create procedure SP_SelectAll_Dept1
as begin
select * from dept1
return
end

exec SP_SelectAll_Dept1

exec SP_Insert_Dept1
@did=2,
@dname='HR'
