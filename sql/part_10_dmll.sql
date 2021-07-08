create table emptest as select * from emp

select * from emptest
desc emptest

insert into emptest (empno,ename,sal) 
values (7777,'girish',15000)

update emptest
set sal=sal*1.15
where ename='TURNER'

commit

update emptest 
set sal=(select sal from emptest where ename='SCOTT')
WHERE ename='SMITH'

select * from emptest where deptno = (select deptno from dept where loc='NEW YORK')


commit
select deptno from dept where loc='NEW YORK'

select * from dept

update emptest 
set sal = sal*1.10
where deptno = (select deptno from dept where loc='NEW YORK')

select * from emptest where deptno = (select deptno from dept where loc='NEW YORK')

update emptest set comm=NULL

select * from emptest

select * from dept

delete from emptest 
where deptno = (select deptno from dept where dname='SALES') 

delete from emptest
where mgr in (select empno from emptest where ename='&ename') or empno in (select mgr from emptest where ename = '&ename')

create table emp2 as
(select empno,ename,sal from emp where 1=0)

select * from emp2

create table emp3 as
(select empno,job from emp where 1=0)

select * from emp3

insert all
    into emp2(empno,ename,sal)
        values (empno,ename,sal)
    into emp3 (empno,job)
        values (empno,job)
    
    select * from emp

truncate table emp2

select * from emp2
desc emp2
select * from emp

insert into emp2 (empno,ename,sal) values (7788,'SMITH',4500)
insert into emp2 (empno,ename,sal) values (7654,'JACK',3500)

commit work

merge into emp2 e2
using emp e1
on (e2.empno=e1.empno)
    when matched then 
        update set e2.ename=e1.ename,e2.sal=e1.sal
    when not matched then
        insert (empno,ename,sal) values (e1.empno,e1.ename,e1.sal)

        
select * from emp2

rollback

merge into emp2 e2
using emp e1
on (e2.empno=e1.empno)
    when matched then 
        update set e2.ename=e1.ename,e2.sal=e1.sal where e2.empno=7788
    when not matched then
        insert (empno,ename,sal) values (e1.empno,e1.ename,e1.sal) where e1.sal>3000

select * from emp2

