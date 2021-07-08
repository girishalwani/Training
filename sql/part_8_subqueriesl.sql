select * from emp
select * from dept

select * from emp
where sal > (select avg(sal) from emp)


SELECT ename,job
FROM emp e
WHERE EXISTS
(SELECT job FROM emp WHERE e.job='MANAGER');

    
select ename,job
from emp
where exists(select * from emp where job='MANAGER')
    
select * 
from emp
where sal< all(select min(sal) from emp where deptno =10)

SELECT ename FROM emp where sal<(SELECT min(sal) FROM emp where deptno=ALL(SELECT deptno FROM emp where deptno=10));


select *
from emp
where mgr in (select mgr from emp where deptno in (select deptno from emp where empno=&&emp))
and empno!=&&empno


SELECT E.*FROM emp E 
WHERE (E.deptno, E.mgr) = (SELECT A.deptno, A.mgr FROM emp A WHERE A.empno = (SELECT empno FROM emp WHERE empno=&&empno))
and E.empno <> &&empno;

SELECT empno,ename FROM emp where deptno IN (SELECT deptno FROM emp where ename IN(select ename from emp where ename like'%R%'))

select empno,ename
from emp
where deptno in (select deptno from emp where ename like '%R%')

select ename,deptno,job
from emp
where deptno in (select emp.deptno 
    from emp join dept
    on emp.deptno=dept.deptno
    where dept.loc in ('NEW YORK'))
    
select ename,deptno,job
from emp
where deptno in (select emp.deptno 
    from emp join dept
    on emp.deptno=dept.deptno
    where dept.loc in (upper('&loc')))
    
select ename,sal
from emp
where mgr = (select empno from emp where ename='KING')

select * 
from emp
where mgr IN (select empno from emp where ename='JAMES') or empno in (select mgr from emp where ename='JAMES')

select * from emp e
where sal < (select avg(sal) from emp where deptno=e.deptno)

select d.loc,(select avg(sal) from emp e where d.deptno=e.deptno)
from dept d 

select * from (select sal from emp order by sal asc)
where rownum<=&n

select * from emp
where rownum<(select count(*)+1 from emp)
order by rownum desc

select d.loc,(select * from emp e where d.deptno=e.deptno)
from dept d order by d.loc='DALLAS'


