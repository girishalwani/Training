select * from emp;

select * from location;

select * from countries

select * from dept
order by dname

select * from salgrade;


select empno,ename,dname,deptno
from emp
natural join dept

select job,mgr,sal,comm,dname 
from emp,dept
where job='SALESMAN'

select e.ename,e.job,d.deptno,d.dname
from emp e,dept d
where loc='DALLAS'



select e.employee_id,e.first_name,e.last_name,d.department_id,e.salary,d.department_name
from employees e
inner join departments d
on e.department_id=d.department_id
where e.salary>6000

select e.empno,e.ename,d.deptno,e.sal,d.dname
from emp e
left outer join dept d
on e.deptno=d.deptno

select d.deptno,d.dname,e.empno,e.ename
from dept d
left join emp e
on d.deptno=e.deptno
order by d.deptno

select d.deptno,d.dname,e.empno,e.ename
from dept d
right join emp e
on d.deptno=e.deptno
order by d.deptno

select d.deptno,d.dname,e.empno,e.ename
from dept d
full outer join emp e
on d.deptno=e.deptno
order by d.deptno

select e.ename,d.dname
from emp e
cross join dept d


select emp.employee_id,emp.first_name,emp.last_name,mgr.employee_id,mgr.first_name,mgr.last_name
from employees emp,employees mgr
where emp.manager_id=mgr.employee_id

select employee_id,first_name||' '||last_name as "employee name" ,salary,department_name,location_id
from employees
natural join departments

select e.job,e.mgr,e.sal,e.comm,d.dname 
from emp e,dept d
where e.job='SALESMAN' 

select ename,job,deptno,dname
from emp 
natural join dept
where loc='DALLAS'

select emp.ename as "employee",emp.empno as "Emp#",
mgr.ename as "Manager",mgr.empno as "Mgr#"
from emp emp,emp mgr
where emp.mgr=mgr.empno

select emp.ename as "employee",emp.empno as "Emp#",
mgr.ename as "Manager",mgr.empno as "Mgr#"
from emp emp 
left outer join emp mgr
on emp.mgr=mgr.empno
order by emp.empno

select e.ename,e.job,d.dname,e.sal,s.grade
from emp e,dept d,salgrade s
where e.deptno=d.deptno and e.sal between s.losal and s.hisal

select emp.ename,d.dname
from emp emp
right outer join dept d
on emp.deptno=d.deptno

select e.ename as "employee",e.hiredate as "emp hire date",
m.ename as "manager" ,m.hiredate as "mgr hire date"
from emp e
left outer join emp m
on e.mgr=m.empno
where e.hiredate<m.hiredate

select empno,ename,job,dname,loc
from emp
join dept
using (deptno)
where job like '%CLERK%'

select e.ename,e.sal,e.mgr,d.dname
from emp e
join dept d
on (e.deptno=d.deptno)
where e.sal>2000



select e.empno,e.ename,e.job,e.deptno,d.deptno,d.dname,d.loc
from emp e
left outer join dept d
on (e.deptno=d.deptno)


select e.ename,e.deptno,d.deptno,d.dname
from emp e
right outer join dept d
on(e.deptno=d.deptno)

select empno,dname,loc
from emp
full outer join dept
using (deptno)

select e.empno,d.dname,d.loc
from emp e
full outer join dept d
on (e.deptno=d.deptno)
