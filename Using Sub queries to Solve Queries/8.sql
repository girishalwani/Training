SELECT ename, deptno,job 
FROM emp 
WHERE deptno=(SELECT deptno FROM dept 
WHERE loc=(SELECT loc FROM dept WHERE loc=&loc))