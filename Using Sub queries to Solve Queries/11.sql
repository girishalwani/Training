SELECT ename, sal, deptno
 FROM emp outer
 WHERE sal < (SELECT AVG(sal) FROM emp WHERE deptno =outer.deptno);
 