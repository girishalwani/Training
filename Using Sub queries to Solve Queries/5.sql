SELECT E.*FROM emp E 
WHERE (E.deptno, E.mgr) = (SELECT A.deptno, A.mgr FROM emp A WHERE A.empno = (SELECT empno FROM emp WHERE empno=&&empno))
and E.empno <> &&empno;