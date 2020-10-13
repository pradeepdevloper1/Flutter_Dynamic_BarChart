create table ftblbarchartdata(
ID int Primary Key identity(1,1),
year nvarchar(10),
sales int)

insert into ftblbarchartdata(year,sales) 
select '2015',100000 union
select '2016',287760 union
select '2017',900000 union
select '2018',345600 union
select '2019',150000 


update ftblbarchartdata
set sales=98576 where year='2017'


