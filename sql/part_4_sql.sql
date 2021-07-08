select * from emp;

select sysdate as "DATE" from dual;

select empno,ename,sal,round(sal*1.155,0) as "New Salary"
from emp

select empno,ename,sal,round(sal*1.155,0) as "New Salary", round(sal*1.155,0)-sal as "Increase"
from emp

select initcap(ename),length(ename) as "Length"
from emp where substr(ename,0,1) in ('&start') order by ename

select ename,round(months_between(sysdate,hiredate)) as "MONTHS_WORKED"
from emp order by round(months_between(sysdate,hiredate))

select ename ||' earns '|| to_char(sal,'99,999.00')||'monthly but wants'||to_char(sal*3,'99,999.00') as "Dream salaries"
from emp

select ename,lpad(sal,15,'$') as "salary"
from emp

select ename,hiredate,to_char(next_day(add_months(hiredate,6),'monday'),'fmDay, "the" Ddspth "of" Month, YYYY') as "review"
from emp

select ename,hiredate,to_char(hiredate,'Day') as "DAY"
from emp order by to_char(hiredate-1,'D')

select ename,nvl(to_char(comm),'No Commission') as "commission"
from emp 

select rpad(hiredate,8) || ', ' || RPAD(' ', sal/1000+1, '*') EMPLOYEES_SALARY,sal
from emp

select distinct(job_id) from employees

select distinct(job),decode(job,'PRESIDENT','A','MANAGER','B','SALESMAN','C','CLERK','D','0') as "Grade"
from emp

select distinct(job),
case job
    when 'PRESIDENT' then 'A'
    when 'MANAGER' then 'B'
    when 'SALESMAN' then 'C'
    when 'CLERK' then 'D'
    else '0'
end as "final Grade"
from emp