USE [70-461]
GO
CREATE TABLE tblemployee
(EmployeeNumber int, EmployeeName int)

DECLARE @myvar as int=2
SET @myvar = 4
SELECT @myvar as myVariable

DECLARE @myvar1 as smallint
SET @myvar1 = 20000
Select @myvar1 as Result

DECLARE @myvar2 as decimal(7,2)
SET @myvar2 =12345.67
Select @myvar2 as Result

Declare @myvar3 as smallmoney = 123456.6781
SELECT @myvar3 as RESULT

Declare @myvar4 as float(24) = 123456.7891
SELECT @myvar4 as Result

DECLARE @myvar5 as numeric(7,2) = 3
SELECT Power(@myvar5,3)
SELECT SQUARE(@myvar5)
SELECT SQRT(@myvar5) 

DECLARE @myvar6 as numeric(7,2) = 12.345
SELECT FLOOR(@myvar6) as myfloor
SELECT CEILING(@myvar6) as myceiling
SELECT ROUND(@myvar6,1) as myround
SELECT ROUND(@myvar6,-1) as myround

SELECT PI() as mypi
SELECT exp(1) as e
SELECT ABS(-456),SIGN(456)
GO
SELECT RAND(345)

SELECT CONVERT(decimal(5,2),3)/2
SELECT CAST(3 as decimal(5,2))/2
SELECT CONVERT(decimal(6,2),1000)

DECLARE @chrmycharacters as char(10)
SET @chrmycharacters = 'hello'
SELECT @chrmycharacters as mystring, LEN(@chrmycharacters) as MyLength, DATALENGTH(@chrmycharacters) as Mydatalength

DECLARE @chrmycharacters1 as nvarchar(10)
SET @chrmycharacters1 = N'hello'
SELECT @chrmycharacters1 as mystring, LEN(@chrmycharacters1) as MyLength, DATALENGTH(@chrmycharacters1) as Mydatalength

DECLARE @chrASCII as varchar(10) = 'hellothere'
DECLARE @chrUNICODE as nvarchar(10) = N'hello'
SELECT @chrASCII as Myascii,@chrUNICODE as Myunicode
SELECT LEFT(@chrASCII,2) as myASCII
SELECT RIGHT(@chrASCII,2) as myASCII
SELECT SUBSTRING(@chrASCII,2,3) as middleletters

DECLARE @chrASCII1 as varchar(10) = ' hello'
SELECT ltrim(rtrim(@chrASCII1)) as trim
SELECT REPLACE(@chrASCII1,'l','L') as myReplace
SELECT UPPER(@chrASCII1) as myupper
SELECT LOWER(@chrASCII1) as mylower

DECLARE @myvar as int
--SET @myvar = 4
SELECT @myvar as mycol

DECLARE @mydecimal decimal(5,2)
SELECT TRY_CONVERT(decimal(5,2),1000)
SELECT TRY_CAST(1000 as decimal(5,2))

DECLARE @firstname as nvarchar(20)
DECLARE @middlename as nvarchar(20)
DECLARE @lastname as nvarchar(20)
SET @firstname = 'suprith'
--SET @middlename= 'reddy'
SET @lastname= 'mekala'
SELECT @firstname + IIF(@middlename is Null,'',' ' +@middlename) + ' ' +@lastname as fullname
SELECT @firstname + Case when @middlename is Null Then '' ELSE ' ' + @middlename END + ' ' + @lastname as fullname
SELECT concat(@firstname,' '+@middlename, ' ', @lastname) as fullname

SELECT 'My number is: ' + CONVERT(varchar(20),4567)
SELECT 'MY number is: ' +CAST(4567 as varchar(20))
SELECT 'MY Salary is: ' + FORMAT(2345.6,'C','fr-FR')

DECLARE @mydate as datetime = '2020-03-22 12:34:56.124'
SELECT @mydate as Mydate

DECLARE @mydate2 as datetime2 = '2020.03.22 12:34:56.124'
SELECT @mydate2 as Mydate2

SELECT datefromparts(2015,06,24) as thisdate
SELECT datetime2fromparts(2015,06,24,12,34,56,124,3) as thatdate
SELECT YEAR(@mydate) as myyear,month(@mydate) as mymonth,day(@mydate) as myday


--todaydate

SELECT CURRENT_TIMESTAMP as RightNow
SELECT getdate() as RightNow
SELECT SYSDATETIME() as RightNow
SELECT DATEADD(year,1,'2015-01-02') as myyear 
SElect DATEPART(hour,'2015-02-04 03:04:05') as myhour
select datename (weekday, getdate()) as myanswer
select DATEDIFF(second, '2015-02-04 03:04:05', GETDATE()) as secondslapsed

DECLARE @mydateoffset as datetimeoffset(2) = '2015-06-25 01:02:03.456 +05:30'
SELECT @mydateoffset as MyDateOffset
GO
DECLARE @mydate as datetime2 = '2015-06-25 01:02:03.456'
SELECT TODATETIMEOFFSET(@mydate,'+05:30') as mydateoffset
SELECT datetime2fromparts (2015,06,25,1,2,3,456,3)
SELECT DATETIMEOFFSETFROMPARTS (2015,06,25,1,2,3,456,05,30,3) as mydateoffset
SELECT SYSDATETIMEOFFSET() as timenowwithoffset
SELECT SYSUTCDATETIME() as timenowutc

DECLARE @mydateoffset1 as datetimeoffset = '2015-06-25 01:02:03.456 +05:30'
SELECT SWITCHOFFSET(@mydateoffset1, '-05:00') as mydateoffsettexas
 
DECLARE @mydate1 as datetime = '2015-06-25 01:02:03.456'
SELECT 'the date and time is:' + CONVERT(nvarchar(20),@mydate1,10) as myconverteddate
SELECT CAST(@mydate1 as nvarchar(20)) as mycastdate
SELECT PARSE('thursday,25 JUNE 2015' as date) as myparsedate
SELECT PARSE('54eves, 25 de junio de 2015' as date using 'es-ES') as myspainparsedate

Select FORMAT(cast('2015-06-25 01:02:03.456' as datetime),'D') as myformattedlongdate
select FORMAT(cast('2015-06-25 01:02:03.456' as datetime),'d') as myfroemttedshortdate
select FORMAT(cast('2015-06-25 01:02:03.456' as datetime), 'dd-mm-yyyy') as myformattedbritishdate
select FORMAT(cast('2015-06-25 01:02:03.456' as datetime),'D','zh_CN') as myformattedinternationallongdate

