SELECT ename, sal
FROM emp
WHERE mgr IN (SELECT empno FROM emp WHERE ename=(SELECT ename FROM emp WHERE ename='KING'));
