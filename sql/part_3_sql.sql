select * from emp order by ename;

select ename,sal,comm as commission from emp where comm>0 order by sal DESC,comm DESC;

select distinct job as job_code from emp;

select empno as "emp #", ename as Employee,job as job,hiredate as "hired on" from emp;

select concat(concat(ename,', '),job)as "employee and title" from emp;

select ename || ', ' || job as "employee and title" from emp;

select empno || ', ' || ename || ', ' || job|| ', ' || hiredate || ', ' || mgr as "THE OUTPUT" from emp;

select ename,job,hiredate from emp where ename in('SCOTT','TURNER') order by hiredate ASC;

select ename,deptno from emp where deptno in(20,30) order by ename;

select ename as Employee ,sal as "Monthly salary" from emp where sal between 2000 and 3000 and deptno in (20,30) order by ename;

select ename,hiredate from emp where hiredate like '%81';

select ename,sal from emp where sal>&sal;

select ename,job from emp where mgr is null;

select empno,ename,sal,deptno from emp where mgr=&manager_id order by &column_name;

select ename from emp where ename like '__a%'

select ename from emp where ename like '%sa%';

select ename,job,sal from emp where sal between 1000 and 12000 and job like '%CLERK%' order by sal
