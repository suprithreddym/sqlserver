Create view viewbydepartment as
select D.department,T.employeenumber,T.dateoftransaction,T.Amount as totalamount
from tbldepartment as D
left join tblEmployee as E
on D.department = E.Department
left join tbltransaction as T
on E.employeenumber = T.EmployeeNumber
where T.employeenumber between  120 and 139
GO

select * from viewbydepartment
GO

Create view viewsummary as
select D.department,T.employeenumber as empnum,sum(T.Amount) as totalamount
from tbldepartment as D
left join tblEmployee as E
on D.department = E.Department
left join tbltransaction as T
on E.employeenumber = T.EmployeeNumber
group by D.department,T.employeenumber
GO

select * from viewsummary
GO

--altering and dropping views


USE [70-461]
GO

if exists(select * from INFORMATION_SCHEMA.VIEWS where [TABLE_NAME] = 'viewbydepartment' and [TABLE_SCHEMA] = 'dbo')
drop view dbo.viewbydepartment
GO

--security

Create view dbo.viewbydepartment with encryption as
select D.department,T.employeenumber,T.dateoftransaction,T.Amount as totalamount
from tbldepartment as D
left join tblEmployee as E
on D.department = E.Department
left join tbltransaction as T
on E.employeenumber = T.EmployeeNumber
where T.employeenumber between  120 and 139
with check option
GO

select v.name,s.text from sys.syscomments as s
inner join sys.views as v
on s.id=v.object_id
select OBJECT_DEFINITION(object_id('dbo.viewbydepartment'))
select * from sys.sql_modules

--adding new rows to views

begin tran
insert into viewbydepartment(employeenumber,dateoftransaction,totalamount)
values(132,'2015-07-07',999.99)

select * from viewbydepartment order by department,employeenumber

rollback tran

begin tran
--select * from viewbydepartment order by employeenumber, dateoftransaction
--select * from tbltransaction where employeenumber in (132,142)
update viewbydepartment
set employeenumber = 124
where employeenumber = 123
select * from viewbydepartment order by employeenumber,dateoftransaction
--select * from tbltransaction where employeenumber in (132,142)
rollback tran

--deleting rows in view

--we can't delete rows in a view if view is based on two/more tables but we can delete view if view is a single table)

select * from viewbydepartment
delete from viewbydepartment
where totalamount = 999.99 and employeenumber=132 --won't run
GO

Create view viewsimple
as
select * from tbltransaction
GO

begin tran
delete from viewsimple
where employeenumber = 132
select * from viewsimple
rollback tran
GO
--indexed view

Create view dbo.viewbydepartment with schemabinding as
select D.department,T.employeenumber,T.dateoftransaction,T.Amount as totalamount
from dbo.tbldepartment as D
inner join dbo.tblEmployee as E
on D.department = E.Department
inner join dbo.tbltransaction as T
on E.employeenumber = T.EmployeeNumber
where T.employeenumber between  120 and 139
GO

Create unique clustered index inx_viewbydepartment on dbo.viewbydepartment(employeenumber,department) --won'run as 123 is ther twice

