 --  1) Display all the information of the EMP table?
 select * from emp;
 -- 2)  Display unique Jobs from EMP table?
 select distinct(job) as Jobs from emp;
 -- 3)  List the emps in the asc order of their Salaries?
 select empid,ename,sal from emp order by sal;
 -- 4)  List the details of the emps in asc order of the Dptnos and desc of Jobs?
 select deptno, job from emp  order by job desc;
 -- 5)  Display all the unique job groups in the descending order?
 select distinct(job) as Job from emp order by job desc;
 -- 6)  Display all the details of all ‘Mgrs’
 select * from emp where job='Manager';
 -- 7)  List the emps who joined before 1981
 select * from emp where year(hiredate) < 1981;
 -- 8)  List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
 select empid,ename,sal,comm,concat((sal+ifnull(comm,0))/30) as DailySal from emp order by Dailysal;
 -- 9)  Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
 select empid,ename,job,(year(Now())-year(hiredate)) as Experience from emp where empid in (select empid from emp where job='Manager');
 -- 10) List the Empno, Ename, Sal, Exp of all emps working for Mgr 7698
 select empid,ename,sal,(year(now())-year(hiredate)) as Experience from emp where empid in(select empid from emp where mgr='7698');
 -- 11)  Display all the details of the emps whose Comm  Is more than their Sal
 select * from emp where empid in (select empid from emp where ifnull(comm,0)>sal);
 -- 12)  List the emps along with their Exp and Daily Sal is more than Rs 100
 select empid,ename,sal,comm, (year(now())-year(hiredate)) as Experience,concat((sal+ifnull(comm,0))/30) as 'DailySal' from emp where empid in (select empid from emp where concat((sal+ifnull(comm,0))/30) >100);
 -- 13)  List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
 select * from emp where job='Manager' or job='Analyst' order by job desc;
 -- 14)  List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
 select empid,ename,sal,hiredate,(year(now())-year(hiredate)) as Experience from emp where empid in (select empid from emp where hiredate in('1981-05-01','1981-12-03','1981-12-17','1980-01-19'));
 -- 15)  List the emp who are working for the Deptno 10 or20
 select * from emp where deptno= 10 or deptno= 20;
 -- 16)  List the emps who are joined in the year 81
 select * from emp where year(hiredate) = 1981;
 -- 17)  List the emps Who Annual sal ranging from 22000 and 45000
 select * from emp where ((sal+ifnull(comm,0))*12) between 22000 and 45000;
 -- 18)  List the Enames those are having five characters in their Names
 select substring(ename,1,5)as Emp_Name from emp;
 -- 19)  List the Enames those are starting with ‘S’ and with five characters
 select ename from emp where ename like 'S%';
 -- 20)  List the emps those are having four chars and third character must be ‘r’
 select substring(ename,1,5)as Emp_Name from emp where ename like '__r%';
 -- 21) List the Five character names starting with ‘S’ and ending with ‘H’
 select substring(ename,1,5)as Emp_Name from emp where ename like 'S%h';
 -- 22)  List the emps who joined in January
 select * from emp where month(hiredate) = '01';
 -- 23) List the emps whose names having a character set ‘ll’ together
 select * from emp where ename like '%ll%';
 -- 24)  List the emps who does not belong to Deptno 20
 select * from emp where deptno not in (select deptno from emp where deptno=20);
 -- 25)  List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries
 select empid, ename,sal,job from emp where empid not in (select empid from emp where job='PRESIDENT' or job='MGR');
 -- 26)  List the emps whose Empno not starting with digit78
 select * from emp where ename not in (select ename from emp where substring(empid,1,2)=78);
 -- 26)  List the emps who are working under ‘MGR’
 select * from emp where mgr is not null;
 -- 27)  List the emps who joined in any year but not belongs to the month of March
 select * from emp where empid not in(select empid from emp where month(hiredate)='03');
 -- 28)  List all the Clerks of Deptno 20
 select * from emp where job='Clerk' and deptno=20;
 -- 29)  List the emps of Deptno 30 or 10 joined in the year 1981
 select * from emp where empid in(select empid from emp where year(hiredate)='1981' and (deptno=30 or deptno=10));
 -- 30)  Display the details of SMITH
 select * from emp where ename='smith';
 -- 31)  Display the location of SMITH
 select e.empid,e.ename,d.loc from emp e left join dept d on e.deptno = d.deptno where e.ename='smith';
 
 
 
 