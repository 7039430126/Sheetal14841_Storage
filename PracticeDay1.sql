use mysql;
-- creating database called "db_Organization"
create database db_Organization;

-- setting database for using
use db_Organization;

-- creating Department table for db_Organization
create table Department(
deptid int primary key
,dname varchar(15) not null
,location varchar(15) not null
);

-- retrieving data from table using select statement
select * from department;

-- inserting records into the table.
insert into department values(101,'Accounts','Mumbai');
insert into department values(102,'Finance','Ahmadabad');
insert into department values(103,'HR','Navi Mumbai');
insert into department values(104,'Sales','Noida');
insert into department values(105,'Marketing','Mumbai');
insert into department values(106,'IT','Chennai');
insert into department values(107,'L and D','Banglore');
insert into department values(108,'R and D','Hyderabad');
insert into department values(109,'BOD','Mumbai');

-- creating another table called Designation for db_Organization
create table designation
(
roleid int primary key,
rolename varchar(20) not null
);

-- inserting records inside the Designation table
insert into designation value(1001, 'HR Executive');
insert into designation value(1002, 'Salesman');
insert into designation value(1003, 'Manager');
insert into designation value(1004, 'Clerk');
insert into designation value(1005, 'Analyst');
insert into designation value(1006, 'Software Engineer');
insert into designation value(1007, 'DevOps Engineer');
insert into designation value(1008, 'Network Engineer');
insert into designation value(1009, 'Trainer');
insert into designation value(1010, 'HR Operation');

-- retrieving data from designation table using select statement
select * from designation;

-- deleting the table permanently using drop command
drop table employee;

-- creating table Employee for database db_Organization
create table employee
(
empid int primary key,
fname varchar(20) not null,
lname varchar(20) not null,
dob datetime not null,
hiredate datetime not null,
address varchar(20) null,
sal decimal(7,2),
comm decimal(5,2),
deptid int references department(deptid),
roleid int references designation(roleid),
mgr int references employee(empid)
);

-- inserting records inside the employee table using insert statement
insert into employee values(201,'Afeefa','Shammon',str_to_date('03/12/1998','%m/%d/%Y'),str_to_date('08/31/2021','%m/%d/%Y'),'Delhi',5000,750.25,106,1006,212);
insert into employee values(202,'Deepali','Narang',str_to_date('01/29/1980','%m/%d/%Y'),str_to_date('03/25/2014','%m/%d/%Y'),'Noida',4000,150.25,101,1004,213);
insert into employee values(203,'Sneha','Pangle',str_to_date('05/25/1988','%m/%d/%Y'),str_to_date('06/17/2016','%m/%d/%Y'),null,3500,null,105,1002,218);
insert into employee values(204,'Rashmi','Sakre',str_to_date('01/30/1992','%m/%d/%Y'),str_to_date('11/14/2013','%m/%d/%Y'),'Gurgaon',1500,150.95,105,1005,211);
insert into employee values(205,'Suraj','Chauhan',str_to_date('12/27/194','%m/%d/%Y'),str_to_date('09/01/2019','%m/%d/%Y'),'Mumbai',5000,370.00,105,1003,213);
insert into employee values(206,'Bhavika','Kadam',str_to_date('07/01/1995','%m/%d/%Y'),str_to_date('05/03/2015','%m/%d/%Y'),'Hyderabad',4000,512.25,108,1003,218);
insert into employee values(207,'Komal','Mahajan',str_to_date('11/15/1990','%m/%d/%Y'),str_to_date('05/29/2017','%m/%d/%Y'),'Chennai',1200,null,106,1008,213);
insert into employee values(208,'Rahul','Chauhan',str_to_date('08/29/1994','%m/%d/%Y'),str_to_date('01/07/2017','%m/%d/%Y'),'Banglore',1500,340.00,106,1007,215);
insert into employee values(209,'Swaroopa','Joshi',str_to_date('05/04/1997','%m/%d/%Y'),str_to_date('04/09/2018','%m/%d/%Y'),'Chennai',5000,275.45,107,1009,211);
insert into employee values(210,'Nikita','Pokharkar',str_to_date('03/16/1991','%m/%d/%Y'),str_to_date('08/10/2017','%m/%d/%Y'),'Hyderabad',4500,550.00,108,1002,218);
insert into employee values(211,'Sharoon','Stankovic',str_to_date('05/11/1996','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'Delhi',3500,null,108,1003,218);
insert into employee values(212,'Paras','Mhatre',str_to_date('09/12/1992','%m/%d/%Y'),str_to_date('03/28/2015','%m/%d/%Y'),'Banglore',2500,600.00,107,1003,218);
insert into employee values(213,'Akhilesh','Rai',str_to_date('10/30/1985','%m/%d/%Y'),str_to_date('10/22/2009','%m/%d/%Y'),'Ahmadabad',5000,750.25,108,1003,218);
insert into employee values(214,'Tejas','Pathare',str_to_date('03/14/1994','%m/%d/%Y'),str_to_date('01/21/2017','%m/%d/%Y'),'Navi Mumbai',4000,350.75,102,1005,212);
insert into employee values(215,'Anjani','Pathak',str_to_date('10/02/1980','%m/%d/%Y'),str_to_date('07/15/2012','%m/%d/%Y'),'Banglore',1800,null,104,1005,212);
insert into employee values(216,'Shweta','Mokal',str_to_date('07/18/1994','%m/%d/%Y'),str_to_date('02/16/2017','%m/%d/%Y'),'Delhi',2800,400.00,107,1009,204);
insert into employee values(217,'Suryanarayan','Murthi',str_to_date('02/29/1984','%m/%d/%Y'),str_to_date('11/01/2016','%m/%d/%Y'),'Hyderabad',4800,350.00,106,1008,218);
insert into employee values(218,'Edward','Pollard',str_to_date('02/28/1985','%m/%d/%Y'),str_to_date('12/12/2015','%m/%d/%Y'),'Delhi',4300,null,105,1003,219);

-- retrieving the records from all the 3 tables
select * from department;
select * from designation;
select * from employee;

-- Creating user name of Employee using string function and Concatenation
select Fname,Lname,concat((substring(fname,1,1)),(lname)) as USER_NAME from employee;
select empid,fname,concat(fname,empid) as USER_NAME from employee;
-- where clause
use db_organization;
select empid,fname,lname,deptid,sal from employee group by deptid order by sal desc;

select empid, fname,lname,mgr from employee where roleid=1003;

select empid, fname, sal, comm from employee where comm is null;

select e.empid,e.deptid,d.rolename,count(*) as Count from employee e join designation d on
e.roleid = d.roleid group by e.deptid;

select e.empid,e.deptid,d.rolename,count(*) as Count from employee e left outer join designation d on
e.roleid = d.roleid group by e.deptid;

select e.empid,e.deptid,d.rolename,count(*) as Count from employee e right outer join designation d on
e.roleid = d.roleid group by e.deptid;

select e.empid,d.dname,count(*) as Count from employee e left outer join department d on
e.deptid = d.deptid group by d.dname;
use db_organization;

select fname,mgr,dname 
from employee join department
on employee.deptid=department.deptid
where empid in
(select fname from employee
where deptid=(select deptid from employee where fname='rahul'));
-- salary less than max salary

select empid,fname,sal from employee
where sal > ANY (select sal from employee
where sal <(select max(sal) from employee))
ORDER BY SAL DESC;

select empid,fname,sal from employee
where sal > ALL (select sal from employee
where sal <(select max(sal) from employee))
ORDER BY SAL DESC;

select sal from employee
where sal <(select max(sal) from employee)
order by sal desc;


select empid,fname,sal from employee
where sal < ANY (select sal from employee
where sal <(select max(sal) from employee))
ORDER BY SAL DESC;

select empid,fname,sal,deptid,rank() over(partition by deptid order by sal desc) as RankNO from  employee;

select empid,fname,deptid,sal,dense_rank() over (partition by deptid order by sal)as DenseRankNum from employee;

-- select empid,fname,sal,comm,sal+ifnull(comm,0) as 'Total_Sal' from employee; => will not add anything to total salary coloumn  AS it does not add null value
-- value+null = value
select empid,fname,sal,comm,sal+ifnull(comm,0) as 'Total_Sal' from employee;

-- views
drop view vw_GetRole_byID;
create view vw_GetRole_byID
as
select e.empid,e.fname,d.rolename from employee e,designation d where e.roleid=d.roleid;
select * from vw_GetRole_byID;

create view vw_GetEmpDetails
as 
select empid,concat(fname,lname) as 'Name',dob,address,sal,comm from employee;

select * from vw_GetEmpDetails;
-- function
delimiter //
create function total_salary(sal decimal(7,2),comm decimal(7,2))
returns decimal(7,2)
deterministic
begin
declare result decimal(7,2);
set result = sal+ifnull(comm,0);
return result;
end; //
delimiter //

select empid,fname,sal,comm, total_salary(sal,comm) as 'Total_salary' from employee;


