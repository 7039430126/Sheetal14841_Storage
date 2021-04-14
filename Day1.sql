use mysql;
-- creating database
create database Org_Database;
use Org_Database;
-- creating table
create table dept(
deptno int not null , 
dname varchar(20) not null,
loc varchar(30) not null,
primary key(deptno)
);
-- inserting data into tables
insert into dept values(10,'Accounts','New York');
insert into dept values(20,'Research','Dallas');
insert into dept values(30,'Sales','Chicago');
insert into dept values(40,'Operations','Boston');

-- retrieving table data using select statement
select * from dept;

-- droping table 
drop table dept;

-- creating tables
create table emp
(
empid int not null primary key,
ename varchar(20) not null,
job varchar(15),
mgr int references emp(empno),
hiredate datetime,
sal numeric(7,2),
comm numeric(7,2),
deptno int references dept(deptno)
);
-- inserting data into tables using Insert statement

INSERT INTO EMP VALUES   (7839, 'KING',   'PRESIDENT', NULL,    str_to_date('11/17/1981','%m/%d/%Y') , 5000, NULL, null);   
INSERT INTO EMP VALUES   (7566, 'JONES',  'MANAGER',   		7839, str_to_date('04/2/1981'	,'%m/%d/%Y'),  2975, NULL, 20);
INSERT INTO EMP VALUES   (7698, 'BLAKE',  'MANAGER',   		7839, str_to_date('05/01/1981'	,'%m/%d/%Y'),  2850, NULL, 30);
INSERT INTO EMP VALUES   (7782, 'CLARK',  'MANAGER',   		7839, str_to_date('06/09/1981'	,'%m/%d/%Y'),  2450, NULL, 10);
INSERT INTO EMP VALUES   (7999, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/01/2011'  ,'%m/%d/%Y'), 4000, NULL, 10);
INSERT INTO EMP VALUES   (7788, 'SCOTT',  'ANALYST',   		7566, str_to_date('12/09/1982'  ,'%m/%d/%Y'), 3000, NULL, 20);
INSERT INTO EMP VALUES   (7902, 'FORD',   'ANALYST',   		7566, str_to_date('12/03/1981'  ,'%m/%d/%Y'),  3000, NULL, 20);
INSERT INTO EMP VALUES   (7499, 'ALLEN',  'SALESMAN',  		7698, str_to_date('02/20/1981'  ,'%m/%d/%Y'), 1600,  300, 30);
INSERT INTO EMP VALUES   (7521, 'WARD',   'SALESMAN',  		7698, str_to_date('02/22/1981'  ,'%m/%d/%Y'), 1250,  500, 30);
INSERT INTO EMP VALUES   (7654, 'MARTIN', 'SALESMAN',  		7698, str_to_date('09/28/1981'  ,'%m/%d/%Y'), 1250, 1400, 30);
INSERT INTO EMP VALUES   (7844, 'TURNER', 'SALESMAN',  		7698, str_to_date('09/08/1981'  ,'%m/%d/%Y'),  1500,    0, 30);
INSERT INTO EMP VALUES   (7900, 'JAMES',  'CLERK',			7698, str_to_date('12/03/1981'  ,'%m/%d/%Y'),   950, NULL, 30);
INSERT INTO EMP VALUES   (7369, 'SMITH',  'CLERK',			7902, str_to_date('12/17/1980'  ,'%m/%d/%Y'), 800, NULL, 20);
INSERT INTO EMP VALUES   (7876, 'ADAMS',  'CLERK',			7788, str_to_date('01/12/2003'  ,'%m/%d/%Y'), 1100, NULL, 20);
INSERT INTO EMP VALUES   (7934, 'MILLER', 'CLERK',			7782, str_to_date('01/23/2002'  ,'%m/%d/%Y'), 1300, NULL, 10);
INSERT INTO EMP VALUES   (7901, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/23/2012'  ,'%m/%d/%Y'), 3000, NULL, 10);
select * from emp;
select * from dept;

-- Assignments for Day1 Full Stack FOundation_Storage Layer
-- 1) LIST ALL MANAGER DATA
 select * from emp where Job='Manager';
-- 2) LIST EMP WHO ARE WORKING AS MANAGER OR ANALYST OR CLERK
select * from emp where job in ('Manager','Analyst','Clerk');
-- 3) LIST EMP WHO ARE EARNING SAL BETWEEN 3000 AND 5000 (INCLUSIVE OF LIMIT)
select * from emp where sal between 3000 and 5000 limit 4;
-- 4) LIST EMP WHO ARE WORKING AS MANAGER OR ANALYST OR CLERK AND EARNING SAL BETWEEN 3000 AND 5000
select * from emp where job in ('Manager','Analyst','Clerk') and (sal between 3000 and 5000);
-- 5) LIST ALL EMP WHO ARE EARNING COMM
select * from emp where COMM >=0;
-- 6) LIST ALL EMP WHOSE COMM IS NOT NULL
select * from emp where comm IS NOT NULL;
-- 7) LIST ALL EMP WHOSE NAME STARTS WITH S
select * from emp where ename like 'S%';
-- 8) LIST ALL EMP WHOSE NAME ENDS WITH R
select * from emp where ename like '%R';
-- 9) LIST ALL EMP WHOSE NAME CONTAINS A
select * from emp where ename like '%A%';
-- 10) LIST ALL EMP WHOSE NAME CONTAINS A AS SECOND LETTER
select * from emp where ename like '_A%';
-- 11) LIST ALL EMP WHOSE NAME STARTS WITH EITHER M OR S
select * from emp where ename like 'M%' or ename like 'S%';
-- 12) LIST ALL EMP WHOSE NAME STARTS BETWEEN A TO M
 select * from emp where ename regexp '^[A-M]';
-- 13) LIST ALL EMP WHOSE NAME CONTAINS _
select * from emp where ename regexp '_';
-- 14) LIST ALL EMP WHO ARE WORKING AS MANAGER IN EITHER DEPT 10 OR 20 AND ALL CLERK FOR DEPT3 30
 select * from emp where job='Manager' and  deptno in (10, 20) or  job= 'clerk' and deptno = 30;
-- 15) LIST ENAME, SAL AND BONUS AS 10% OF SALARY
alter table emp
add column bonus decimal(5,2) default null;
select * from emp;
select ename,sal,(sal*10/100) as bonus from emp;
-- 16) LIST EMP DATA AS PER THE ASCENDING ORDER OF NAME
select empid,ename from emp order by ename;
-- 17) LIST ALL AS PER THEIR SALARY HIGHES TO LOWEST
select empid,ename,sal from emp order by sal desc limit 3;
-- 18) LIST EMP AS PER THEIR DEPT, WITH IN DEPT HIGHEST TO LOWESET SAL
select * from emp group by deptno in(select sal from emp order by sal desc)
-- 19) list top 3 highest paid emp
select empid,ename,sal from emp order by sal desc limit 3;
-- 20) RETURN SEQUENTIAL NUMBER
select empid,ename,deptno,sal,row_number() over (partition by deptno order by empid) as RowNumber from emp;
-- 21) RETURN RANK BASED ON SPECIFED CRITERIA IF TWO EMP HAVE SAME SALARY THEY BOTH GET SAME NUMBER AND NEXT NUMBER WILL BE SKIPPED
select empid,ename,deptno,sal,rank() over (partition by deptno order by empid) as RankNum from emp;
-- 22)  RETURN CONSECUTIVE RANKING VALUES BASED ON A SPECIFIED CRITERIA
select empid,ename,deptno,sal,dense_rank() over (partition by deptno order by empid)as DenseRankNum from emp;
-- 23) LIST THE DIFFERNT JOB NAME
select distinct(Job) as JobRole from emp;
-- 24) LIST TOTAL ORGANIZATION SALARY
select sum(sal) as TotalSal from emp;
-- 25) LIST DEPTWISE TOTAL SALARY
select sum(sal) as Total_Salary, DeptNo from emp group by deptno;
-- 26) LIST JOBWISE EMP COUNT.
select empid,ename,job,count(1) as Count from emp group by job;
-- 27) LIST ALL EMP WHO HAVE JOINED IN MONTH OF FEB
select * from emp where month(hiredate)=2;
-- 28) LIST EMP COUNT   JOINED BETWEEN 1981 AND 1985
select count(*) as Emp_count from emp where hiredate between '1981-01-01' and '1983-12-31';
-- 29) LIST HOW MANY YEARS OF SERVICE COMPLETED BY EACH EMP ARRANGE BASED ON TENURE HIGHEST TO LOWEST
select ename, year(now())-year(hiredate) as 'Tenure' from emp order by Tenure desc;








