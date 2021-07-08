WITH employee AS (SELECT loc FROM dept d where (SELECT avg(sal) from emp e where e.deptno=d.deptno)<(SELECT avg(sal) from emp))
SELECT * from employee;

 