--tableemployee
CREATE TABLE tblEmployee
(
EmployeeNumber INT NOT NULL,
EmployeeFirstName VARCHAR(50) NOT NULL,
EmployeeMiddleName VARCHAR(50) NULL,
EmployeeLastName VARCHAR(50) NOT NULL,
EmployeeGovernmentID CHAR(10) NULL,
DateOfBirth DATE NULL
)


ALTER TABLE tblEmployee
ADD Department VARCHAR(50);

SELECT * FROM tblEmployee

INSERT INTO tblEmployee
VALUES (132, 'Dylan', 'A', 'Word', 'HN513777D', '19920914', 'Customer Relations')

select * from tblemployee
where [employeelastname] = 'word'

select * from tblemployee
where [EmployeeLastName] <> 'word'

select * from tblemployee
where [EmployeeLastName] like '%w%'

select * from tblemployee
where [EmployeeLastName] like '_w%'

select * from tblemployee
where [EmployeeLastName] like '[r-t]%'

select * from tblemployee
where [EmployeeLastName] like '[^rst]%'

select * from tblemployee
where [EmployeeLastName] like '[%]%'

select * from tblemployee
where EmployeeNumber > 200

select * from tblemployee
where EmployeeNumber between 200 and 209

select * from tblemployee
where EmployeeNumber not between 200 and 209

select * from tblemployee
where EmployeeNumber in (200,204,208)

select * from tblemployee
where DateOfBirth between '19760101' and '19861231'

select * from tblemployee
where year(DateOfBirth) between 1976 and 1986

Select year(DateOfBirth) as yearofdateofbirth,count(*) as numberborn
from tblEmployee
group by year(DateOfBirth)
order by year(DateOfBirth)

select LEFT(employeelastname,1) as initial, count(*) as countofinitial
from tblEmployee
group by LEFT(employeelastname,1)
order by count(*) DESC

select top(5) LEFT(employeelastname,1) as initial, count(*) as countofinitial
from tblEmployee
group by LEFT(employeelastname,1)
order by count(*) DESC

select LEFT(employeelastname,1) as initial, count(*) as countofinitial
from tblEmployee
where DateOfBirth > '19860101'
group by LEFT(employeelastname,1)
having count(*) > =10
order by count(*) DESC

select DATENAME(month, dateofbirth) as monthname,
		count(*) as Numberemployees,
		count(employeemiddlename) as numberofmiddlenames,
		count(*) - count(employeemiddlename) as nomiddlenames,
		format(min(DateofBirth),'dd-mm-yyyy') as earliestdateofbirth,
		format(max(DateofBirth),'D') as latestdateofbirth
from tblEmployee
group by DATENAME(month,dateofbirth),DATEPART(month,dateofbirth)
order by DATEPART(month,dateofbirth)


--table transaction

Create table tbltransaction(
Amount smallmoney NOT NULL,
dateoftransaction smalldatetime null,
employeenumber int not null
)

--innerjoin
select tblEmployee.EmployeeNumber,employeefirstname,employeelastname,sum(Amount) as sumofamount
from tblEmployee
join tbltransaction
on tblEmployee.EmployeeNumber = tbltransaction.employeenumber
group by tblEmployee.EmployeeNumber,EmployeeFirstName,EmployeeLastName
order by EmployeeNumber

--leftjoin
select tblEmployee.EmployeeNumber,employeefirstname,employeelastname,sum(Amount) as sumofamount
from tblEmployee
join tbltransaction
on tblEmployee.EmployeeNumber = tbltransaction.employeenumber
group by tblEmployee.EmployeeNumber,EmployeeFirstName,EmployeeLastName
order by EmployeeNumber

--rightjoin 

select tblEmployee.EmployeeNumber,employeefirstname,employeelastname,sum(Amount) as sumofamount
from tblEmployee
right join tbltransaction
on tblEmployee.EmployeeNumber = tbltransaction.employeenumber
group by tblEmployee.EmployeeNumber,EmployeeFirstName,EmployeeLastName
order by EmployeeNumber

--derived table

select department as numberofdepartments
into tbldepartment2
from
(select department, count(*) as numberofdepartments
from tblEmployee
group by department) as newtable

select * from tbldepartment2

--distinct values

select distinct department,convert(varchar(20),N'') as departmenthead
into tbldepartment
from tblemployee

select * from tbldepartment

alter table tbldepartment
alter column departmenthead varchar(30) null

--joining three tables

select tbldepartment.Department,departmenthead,sum(amount) as sumofamount
from tbldepartment
left join tblEmployee
on tbldepartment.Department = tblEmployee.Department
left join tbltransaction
on tblEmployee.EmployeeNumber = tbltransaction.employeenumber
group by tbldepartment.Department,departmenthead
order by Department

insert into tbldepartment 
values ('accounts','james')

--using aliases

select D.Department,sum(amount) as sumofamount
from tbldepartment as D
left join tblEmployee as E
on D.Department = E.Department
left join tbltransaction as T
on E.EmployeeNumber = T.employeenumber
group by D.Department,departmenthead
order by Department














