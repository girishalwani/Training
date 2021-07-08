SELECT ename,sal,(SELECT floor(avg(sal))from emp v where v.deptno=e.deptno )" Average Salary Of Department"
from emp e where sal<(SELECT avg(sal) from emp a where a.deptno=e.deptno)