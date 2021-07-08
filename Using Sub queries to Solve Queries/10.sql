SELECT ename FROM emp 
WHERE deptno=(SELECT deptno FROM emp WHERE ename=(SELECT ename FROM emp WHERE ename LIKE '%JAMES%'))