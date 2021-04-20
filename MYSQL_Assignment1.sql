use org_database;
select * from emp;

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




