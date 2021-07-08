SELECT ename FROM emp where sal<(SELECT min(sal) FROM emp where deptno=ALL(SELECT deptno FROM emp where deptno=10));
