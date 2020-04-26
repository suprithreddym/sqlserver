USe [70-461]

--delete,commmit and rollback

begin transaction
select count(*) from tbltransaction
delete tbltransaction
from tblEmployee as E
right join tbltransaction as T
on e.EmployeeNumber = T.employeenumber
where E.EmployeeNumber = Null
select count(*) from tbltransaction
rollback transaction

select count(*) from tbltransaction

begin tran 
select * from tbltransaction where employeenumber = 194
--select * from tbltransaction where employeenumber = 3
update tbltransaction
set employeenumber = 194
output inserted.employeenumber,deleted.employeenumber
from tbltransaction
where employeenumber in (3,5,7,9)
commit tran

--constraints

insert into tblEmployee
values(2001,'FirstName','N','Lastname','AB123456C','1994-01-01','commercial'),
(null,'anotherfirstname','N','anotherlastname','AB123457C','1994-01-02','Finance')

insert into tblEmployee
values(2001,'FirstName','N','Lastname','AB123456C','1994-01-01','commercial')
insert into tblEmployee values
(null,'anotherfirstname','N','anotherlastname','AB123457C','1994-01-02','Finance')

--unique constraint

Alter table tblemployee
ADD constraint unqgovernmentid UNIQUE (EmployeegovernmentID)
select employeegovernmentID, count(employeegovernmentID) as mycount from tblEmployee
group by EmployeeGovernmentID
having count(employeegovernmentID) > 1
select * from tblEmployee where EmployeeGovernmentID IN ('HN513777D','TX593671R')

begin tran 
delete from tblEmployee
where EmployeeNumber < 3

delete top(2) from tblEmployee
where EmployeeNumber in (131,132)
select * from tblEmployee where EmployeeGovernmentID IN ('HN513777D','TX593671R')
commit tran

CREATE table tbltransaction2
(Amount smallmoney not null,
Dateoftransaction smalldatetime not null,
employeenumber int not null,
constraint unqtransaction2 unique (Amount,dateoftransaction,employeenumber))
DROP table tbltransaction2

--default constraints

ALTER table tbltransaction
ADD dateofentry datetime

ALTER table tbltransaction
add constraint defdateofentry default getdate() for dateofentry

delete from tbltransaction where employeenumber < 3

insert into tbltransaction(Amount,dateoftransaction,employeenumber)
values(1,'2014-01-01',1)

insert into tbltransaction(Amount,dateoftransaction,employeenumber,dateofentry)
values(1,'2014-01-02',1,'2013-01-01')

select * from tbltransaction where employeenumber < 3

CREATE table tbltransaction2
(Amount smallmoney not null,
Dateoftransaction smalldatetime not null,
employeenumber int not null,
Dateofentry datetime null constraint defdateofentry2 default getdate())

insert into tbltransaction2(Amount,dateoftransaction,employeenumber)
values(1,'2014-01-01',1)

insert into tbltransaction2(Amount,dateoftransaction,employeenumber,dateofentry)
values(1,'2014-01-02',1,'2013-01-01')

select * from tbltransaction2 where employeenumber < 3
drop table tbltransaction2

alter table tbltransaction
drop column dateofentry

alter table tbltransaction
drop constraint defdateofentry

--check constaint 

alter table tbltransaction 
add constraint chkamount check(amount > -1000 and amount < 1000)

insert into tbltransaction
values(1010, '2014-01-01',1)

alter table tblemployee with nocheck
add constraint chkmiddlename check
(replace(employeemiddlename,'.','') = employeemiddlename or employeemiddlename is null)

alter table tblemployee
drop constraint chkmiddlename

begin tran 
	insert into tblEmployee
	values (2003,'A','B.','C','D','2014-01-01','Accounts')
	select * from tblEmployee where EmployeeNumber = 2003
rollback tran

create table tblemployee2
(employeemiddlename varchar(50) null constraint ckemployeemiddlename check (replace(employeemiddlename,'.','')=employeemiddlename or employeemiddlename is null))

drop table tblemployee2

alter table tblEmployee
drop chkmiddlename

alter table tbltransaction
drop chkamount

--primary key

alter table tblemployee
add constraint pk_tblemployee PRIMARY KEY (employeenumber)

insert into tblemployee(EmployeeNumber,EmployeeFirstName,EmployeeMiddleName,EmployeeLastName,EmployeeGovernmentID,DateOfBirth,Department)

values(2004, 'FirstName','Middlename','Lastname','AB12345F','2014-01-01','Accounts')

delete from tblEmployee
where EmployeeNumber = 2004

alter table tblemployee
drop constraint pk_tblemployee

create table tblemployee2(
employeenumber int constraint pk_tblemployee2 primary key identity(1,1),
employeename nvarchar(20))

insert into tblemployee2
values ('my name'),
('my name')

select * from tblemployee2

delete from tblemployee2

insert into tblemployee2(employeenumber,employeename)
values(38,'my name'),(39,'my name')

set identity_insert tblemployee2 on

drop table tblemployee2

select @@IDENTITY

select ident_current ('dbo.tblemployee2')

--foreign key

Begin tran 
alter table tbltransaction alter column employeenumber int null
alter table tbltransaction add constraint df_tbltransaction default 124 for employeenumber
alter table tbltransaction with nocheck
add constraint fk_tbltransaction_employeenumber foreign key (employeenumber) 
references tblemployee(employeenumber)
--on update cascade/set default/set null
on delete set default
delete tblemployee where EmployeeNumber = 123

--update tblEmployee set EmployeeNumber = 9123 where EmployeeNumber =123

select e.employeenumber,T.*
from tblEmployee as e
right join tbltransaction as T
on e.employeenumber = t.employeenumber
where t.amount in (-179.47,786.22,-967.36,957.03)
rollback tran

alter table tbltransaction
drop fk_tbltransaction_employeenumber

alter table tbltransaction
drop df_tbltransaction

