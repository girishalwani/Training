
set serveroutput on;

--1

select to_number(to_char(sysdate,'HH24'), '99') from dual;

create or replace trigger restr
before insert or update or delete on emp
enable
declare
    hr number;
    exc exception;
begin
    select to_number(to_char(sysdate,'HH24'), '99') into hr from dual;
    if(hr>=9 or hr<=7) then
        raise exc;
    end if;
    
    exception
        when exc then
            dbms_output.put_line('not allowed to perform any operatin b/w 9 to 17');
        when others then
            dbms_output.put_line('other error occured');
end;


--2
drop table audit_emp;

create table audit_emp(
    empid number,
    username varchar2(30),
    trdate varchar2(30),
    trtype varchar2(20)
);


create or replace trigger emp_audit
before insert or delete or update on emp 
for each row
enable
declare
    v_date varchar2(30);
    v_user varchar2(30);
begin
    select user,to_char(sysdate,'DD/MON/YYYY HH24:MI:SS') INTO v_user,v_date from dual;
    
    if inserting then
        insert into audit_emp values(:NEW.empno,v_user,v_date,'I');
    elsif deleting then
        insert into audit_emp values(:old.empno,v_user,v_date,'D');
    elsif updating then
        insert into audit_emp values(:old.empno,v_user,v_date,'U');
    end if;
end;

select * from audit_emp

insert into emp(empno,ename) values (103,'babloo');


--3

create or replace view v3 as 
select EMPNO,ENAME, JOB,SAL,EMP.DEPTNO,DNAME,LOC from EMP,DEPT

create or replace trigger to_insert
instead of insert or update on v3
for each row
declare
    v_deptno emp.deptno%type;
    v_empno emp.empno%type;
begin
    if(:old.deptno=:new.deptno) then
        update dept set dname=:new.dname,loc=:new.loc where deptno=:new.deptno;
    else
        insert into dept values (:new.deptno,:new.dname,:new.loc);
    end if;
    
    if(:old.empno=:new.empno) then
        update emp set ename=:new.ename,sal=:new.sal,deptno=:new.deptno where empno=:new.empno;
    else
        insert into emp(EMPNO,ENAME,SAL,JOB,DEPTNO) values (:new.empno,:new.ename,:new.sal,:new.job,:new.deptno);
    end if;
end;



--4

select user from dual

create or replace trigger not_table
before ddl on schema
declare
excp exception;
v_user varchar2(20);
begin
    select user into v_user from dual;
    if(ora_dict_obj_type='TABLE' and v_user='SCOTT') then
        raise excp;
    end if;
    
    exception 
     when excp then
        dbms_output.put_line('you are not allowed to create table');
end;


--5

select sysdate from dual;

create or replace trigger date_format_change
after logon on schema
begin
    execute immediate 'alter session set nls_date_format = ''DD/MM/YYYY'' ';
end;


create trigger emp_audit_part2
before insert or delete on emp 
for each row
enable
declare
    v_date varchar2(30);
    v_user varchar2(30);
begin
    select user,to_char(sysdate,'DD/MON/YYYY HH24:MI:SS') INTO v_user,v_date from dual;
    
    if inserting then
        insert into audit_emp values(:NEW.empno,v_user,v_date,'I');
    elsif deleting then
        insert into audit_emp values(:old.empno,v_user,v_date,'D');
    elsif updating then
        insert into audit_emp values(:old.empno,v_user,v_date,'U');
    end if;
end;

select to_char(sysdate,'HH12:MI am') from dual;

select to_char(sysdate,'DAY') from dual;


create or replace trigger DML_opr
before insert or update or delete on emp
enable
declare
    hr number;
    dy varchar2(10);
    exc exception;
begin
    select to_char(sysdate,'HH12:MI am'),to_char(sysdate,'DY') into hr,dy from dual;
    if(hr>='08:30 am' and hr<='06:00 pm') then
        if(dy>='MONDAY' and dy<='FRIDAY') then
            raise exc;
        end if;
    end if;
    
    exception
        when exc then
            dbms_output.put_line('not allowed to perform any operatin b/w 9 to 17');
        when others then
            dbms_output.put_line('other error occured');
end;

alter trigger DML_opr disable

select * from jobs

alter table emp disable all triggers


set serveroutput on

create or replace trigger sal_update 
before update on employees
for each row
enable
declare
excp1 exception;
excp2 exception;
begin
    if(:new.salary > (:old.salary*1.1)) then 
        raise excp1;
    elsif (:new.salary<:old.salary) then
        raise excp2;
    else 
        dbms_output.put_line('salary updated');
    end if;
    
    exception
    when excp1 then
        dbms_output.put_line('not to increased more than 10%');
    when excp2 then
        dbms_output.put_line('salary cannot be decresed ');
    when others then
        dbms_output.put_line('some other error');

end;


select * from employees

update employees set salary=10000 where employee_id=109;

rollback
