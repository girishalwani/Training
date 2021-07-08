SELECT D.loc,(SELECT AVG(sal) FROM emp E WHERE D.deptno = E.deptno)
FROM dept D ;