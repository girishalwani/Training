select * from emp;

select job,round(max(sal),0) as "highest",round(min(sal),0) as "lowest",round(avg(sal),0) as "average",round(sum(sal),0) as "sum"
from emp
group by job

select job,count(*)
from emp
group by job

select count(distinct(mgr))  as "number of managers"
from emp

select max(sal)-min(sal) as "difference"
from emp

select mgr,min(sal)
from emp
where mgr is not null
group by mgr
having min(sal) > 2000
order by min(sal) desc

select count(*) "total",
    sum(decode(to_char(hiredate,'YYYY'),1980,1,0)) as "1980",
    sum(decode(to_char(hiredate,'YYYY'),1981,1,0)) as "1981",
    sum(decode(to_char(hiredate,'YYYY'),1982,1,0)) as "1982"
from emp;

select job,
    sum(decode(deptno,10,sal)) as "dept10",
    sum(decode(deptno,20,sal)) as "dept20",
    sum(decode(deptno,30,sal)) as "dept30",
    sum(sal) as "total"
from emp
group by job;

select deptno,'J0b',sum(sal)
from emp
group by deptno
union 
select deptno,job,sum(sal) 
from emp
group by job,deptno

select job,deptno as "x"
from emp
where deptno=20
union
select job,deptno as "dept 10"
from emp
where deptno=10
union
select job,deptno as "dept 30"
from emp
where deptno=30
