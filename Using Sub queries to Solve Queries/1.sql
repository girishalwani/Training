SELECT empno,ename,deptno FROM emp WHERE deptno=(SELECT deptno FROM emp WHERE empno=7902)