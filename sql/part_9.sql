create table dept1(
deptno Integer PRIMARY KEY,
dname varchar2(30) not null,
loc varchar(30) not null
)

create table dept_stat(
 stat_info Integer Primary key,
 dept_no integer,
 no_employees integer,
 total_salary integer,
 avg_salary integer
)

drop table dept_stat

create table emp1(
EMPNO INTEGER PRIMARY KEY,
ENAME VARCHAR2(20) NOT NULL,
SAL NUMBER(10,2) CHECK(SAL>5000),
MGR number references emp1(empno),
DEPTNO INTEGER REFERENCES DEPT1(DEPTNO)
)

create table dept11 as (select * from dept1)

create table emp11 as (select * from emp1)

alter table emp1 add Address varchar2(30)

alter table emp1 rename column sal to salary

alter table emp1 modify ename varchar2(40)

describe dept1

alter table emp1 modify deptno integer

alter table emp1 modify ename null

comment on table dept1 is 'depts of wipro' 

comment on column dept1.deptno is 'Deptno of wipro'

comment on table emp1 is 'employees of wipro'

comment on column emp1.empno is 'empno of wipro'

select * from user_tab_comments where TABLE_NAME = 'DEPT1' 
comment on table emp1 is ''
comment on table DEPT1 is ''

desc emp1

select * from user_col_comments where TABLE_NAME = 'DEPT1' 
comment on column dept1.deptno is ''

select * from user_col_comments where TABLE_NAME = 'EMP1' 
comment on column emp1.empno is ''

alter table emp1 set unused (salary,ename)

SELECT * 
FROM USER_UNUSED_COL_TABS;

alter table emp1 drop unused columns

select * from dept1

drop table emp1
drop table dept1

create table emp1 as select * from emp

select * from emp_test

alter table emp1 rename to emp_test

truncate table emp_test

create table emp2 as select empno,ename,sal from emp
select * from emp2

drop table emp2

create table emp2 as select * from emp where 1=2
drop table emp2

FLASHBACK TABLE emp2 TO BEFORE DROP rename to emp_drop_3
select * from emp_drop_3

FLASHBACK TABLE emp2 TO BEFORE DROP rename to emp_drop_2
select * from emp_drop_2

show recyclebin 
show tables

SELECT table_name
FROM user_tables
ORDER BY table_name;


