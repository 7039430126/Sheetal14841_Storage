
-- order by asc ->natural a-z 0-9
select * from emp order by empno;

select job,empno,ename,mgr,hiredate,sal,comm,deptno from emp
order by job asc,empno desc;

select job,empno,ename,mgr,hiredate,sal,comm,deptno from emp
order by job asc,empno ;
select job,empno,ename,mgr,hiredate,sal,comm,deptno from emp
order by job asc,empno,sal desc;

select job,empno,ename,mgr,hiredate,sal,comm,deptno from emp
order by job asc,sal ;

-- Aggreate functions 
select max(sal) from emp;
select min(sal) from emp;
select avg(sal) from emp;
select sum(sal) from emp;
-- Employees getting comm

select count(comm)  from emp;
-- Total number of employees
select count(*) from emp;
select count(*), count(comm) from emp;
-- Group by Aggregation
-- count of employee getting commission with their name
select ename,comm from emp where comm is not null;
select deptno,count(comm)  from emp
group by deptno;
-- Each department and total no. of employee working in that department
-- 10 5
select deptno,count(empno) from emp group by deptno;
-- how many employee having same job
-- manager ? analyst ? cleark ?
select job,count(empno) from emp group by job;

-- empno,ename, department name 
select * from dept;
-- below query gives the soulution but it has problem of 
-- giving cross join if we forgot where clause
select empno,ename, dname from emp,dept 
where emp.deptno=dept.deptno;


select empno,ename, dname 
from emp join dept 
on emp.deptno=dept.deptno;

select empno,ename, dname 
from emp left outer join dept 
on emp.deptno=dept.deptno;

select empno,ename, dname 
from emp right outer join dept 
on emp.deptno=dept.deptno;

-- select empno,ename, dname 
-- from emp full outer join dept 
-- on emp.deptno=dept.deptno;
-- subquery returning exactly one value 
-- display employees earning less than max salary
select * from emp
where sal=(select max(sal) from emp);

-- i need people working in Turner's department
-- a. get deptno of Turner
-- b. find people working in that department
select * from emp
where deptno=(select deptno from emp where ename='Turner');
-- 
select empno from emp
where deptno=(select deptno from emp where ename='Turner');

-- display employee name and mgr name for people working with
-- terner
select ename,mgr from emp
where deptno=(select deptno from emp where ename='Turner');

-- subquery returning more than one row
select ename,mgr,dname 
from emp join dept 
on emp.DEPTNO=dept.deptno
where empno in
(select empno from emp
where deptno=(select deptno from emp where ename='Turner'));
-- salary less than max salary

select empno,ename,sal from emp
where sal > ANY (select sal from emp
where sal <(select max(sal) from emp))
ORDER BY SAL DESC;

select empno,ename,sal from emp
where sal > ALL (select sal from emp
where sal <(select max(sal) from emp))
ORDER BY SAL DESC;

select sal from emp
where sal <(select max(sal) from emp)
order by sal desc;


select empno,ename,sal from emp
where sal < ANY (select sal from emp
where sal <(select max(sal) from emp))
ORDER BY SAL DESC;

-- select empno,ename,sal from emp
-- where sal < ALL (select sal from emp
-- where sal <(select max(sal) from emp))
-- ORDER BY SAL DESC;

create view vw_empdept as
select empno,ename,dname,sal,comm 
from emp join dept
on emp.deptno=dept.deptno;

select * from vw_empdept;


alter view vw_empdept as
select empno,ename,dname,sal,comm,job 
from emp join dept
on emp.deptno=dept.deptno;
