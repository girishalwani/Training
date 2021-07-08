set serveroutput on

select * from dept;
desc dept
drop procedure add_dept;

create or replace procedure add_dept(v_deptno dept.deptno%type,v_dname dept.dname%type,v_loc dept.loc%type) is
excp exception;
dno dept.deptno%type;

exc exception;
begin
    select deptno into dno from dept where deptno=v_deptno or dname=v_dname or loc=v_loc;
    if sql%rowcount>0 then
        raise excp;
    end if;    
    
    exception
        when excp then
            dbms_output.put_line('values already present');
        when no_data_found then
            insert into dept(deptno,dname,loc) values(v_deptno,v_dname,v_loc);
            dbms_output.put_line('addedd to dept');
end;

begin
    add_dept(50,'MANAGING','OHIO');
end;

select deptno,dname,loc from dept where deptno=10 or dname='RESEARCH' or loc='BOSTON';


create or replace procedure update_dept(v_deptno dept.deptno%type,v_dname dept.dname%type,v_loc dept.loc%type) is
excp exception;
dno dept.deptno%type;

exc exception;
begin
    update dept set dname=v_dname,loc=v_loc where deptno=v_deptno;
    if sql%rowcount=0 then
        raise excp;
    end if;    
    
    exception
        when excp then
            dbms_output.put_line('values already present');
        when others then
            dbms_output.put_line('error occured');
end;

begin
    update_dept(50,'MANAGEMENT','INDIA');
end;



create or replace procedure delete_dept(v_deptno in dept.deptno%type,status out varchar2) is
excp exception;
dno dept.deptno%type;

begin
    DELETE FROM dept WHERE deptno=v_deptno;
    if sql%rowcount=0 then
        raise excp;
    else
        status:='ok';
    end if;    
    
    exception
        when excp then
            dbms_output.put_line('values not present');
        when others then
            dbms_output.put_line('error occured');
end;

declare
    statuss varchar2(20);
begin
    delete_dept(40,statuss);
    dbms_output.put_line(statuss);
end;

rollback;
select * from dept;


--7th question
create or replace procedure add_emp(v_deptno emp.deptno%type) is
excp exception;
cursor cur(dno emp.deptno%type) is select * from emp where deptno=dno;
begin
    for val in cur(v_deptno) loop
        if cur%rowcount=0 then
            raise excp;
        end if;
        insert into emp_test(empno,ename,sal,deptno) values (val.empno,val.ename,val.sal,val.deptno);
        update emp set sal=val.sal*1.20 where empno=val.empno and deptno=val.deptno;
        dbms_output.put_line('successfully completed');
    end loop;
    exception
        when excp then
            dbms_output.put_line('values already present');
        when others then
            dbms_output.put_line('addedd to dept');
end;

begin
    add_emp(10);
end;


--8th question
create or replace procedure add_and_delete(v_deptno emp.deptno%type) is
excp exception;
cursor cur(dno emp.deptno%type) is select * from emp where deptno=dno;
begin
    for val in cur(v_deptno) loop
        if cur%rowcount=0 then
            raise excp;
        end if;
        insert into test1 select * from emp where empno=val.empno and deptno=val.deptno;
        delete from emp where empno=val.empno;
        dbms_output.put_line('successfully completed');
    end loop;
    exception
        when excp then
            dbms_output.put_line('values already present');
        when others then
            dbms_output.put_line(sqlerrm);
end;

begin
    add_and_delete(10);
end;

insert into test1 select * from emp where deptno=10


--9th question
create or replace procedure get_employee(v_empno in emp.empno%type,v_ename out emp.ename%type,v_sal out emp.sal%type) is
excp exception;
e_name emp.ename%type;
e_sal emp.sal%type;
begin
    if v_empno is null then
        raise excp;
    end if;
    select ename,sal into e_name,e_sal from emp where empno=v_empno;
    v_ename:=e_name;
    v_sal:=e_sal;
    
    exception
        when excp then
            dbms_output.put_line('values already present');
        when others then
            dbms_output.put_line(sqlerrm);
end;

declare
    eno emp.empno%type;
    enm emp.ename%type;
    esl emp.sal%type;
begin
    eno:=&eno;
    get_employee(eno,enm,esl);
    dbms_output.put_line(enm||','||esl);
end;


create or replace procedure mobile(mno number) is
excp exception;
vmo number;

begin
    vmo:=
    dbms_output.put_line(

end;

select * from emp

create or replace procedure Update_emp_sal(v_empid emp.empno%type,v_sal emp.sal%type) is
excp exception;
jobid emp.job%type;
exc exception;
begin
    update emp set sal=v_sal where empno=v_empid;
    if sql%rowcount=0 then
        raise excp;
    end if;    
    
    exception
        when excp then
            dbms_output.put_line('values already present');
        when others then
            dbms_output.put_line('error occured');
end;

begin
    Update_emp_sal(7369,2000);
end;

select * from jobs

create or replace procedure add_dept_procedure(p_deptno in dept.deptno%type,p_dname in dept.dname%type,p_loc in dept.loc%type,p_out out dept.dname%type) is
excp exception;
dno dept.deptno%type;
exc exception;
begin
    if (p_deptno is null or p_dname is null or p_loc is null) then
        raise  excp;
    else 
        select deptno into dno from dept where deptno=p_deptno or dname=p_dname or loc=p_loc;
        if sql%rowcount>0 then
            raise exc;
        else
            insert into dept(deptno,dname,loc) values(p_deptno,p_dname,p_loc);
            p_out:='done';
        end if;
    end if;
    
    exception
        when exc then
            dbms_output.put_line('values already present');
        when excp then
            dbms_output.put_line('invalid input');
        when others then
            dbms_output.put_line('some other exception');
end;

declare 
    outp varchar2(30);
begin
    add_dept_procedure(60,'MANAGINGsf','OHIOsd',outp);
    dbms_output.put_line(outp);
end;






SELECT full_name (‘Joe’, ‘Smith’) as “Full Name” FROM DUAL;

CREATE OR REPLACE FUNCTION full_name(p_fname IN customers.first_name%TYPE,p_lname IN customers.last_name%TYPE) RETURN VARCHAR2 IS
No variables
BEGIN
Full name concatenation…
RETURN p_lname || ', '  || p_fname;
EXCEPTION
WHEN others THEN
Do nothing…
NULL;
END full_name;

create sequence s3
    increment by 1
    start with 1
    nominvalue
    nomaxvalue
    nocycle;
    

select avg(sal),sum(sal),deptno,count(empno) from emp group by deptno 

select * from emp where deptno=20

select * from dept_stat

create or replace procedure add_stat(v_deptno emp.deptno%type) is
excp exception;
sno dept_stat.stat_info%type;
v_empno number;
v_totsal number;
v_avgsal number;

begin
    sno:=s3.nextval;
    select count(empno),sum(sal),avg(sal) into v_empno,v_totsal,v_avgsal from emp where deptno=v_deptno;
    if sql%rowcount=0 then
        raise excp;
    end if;
        insert into dept_stat(stat_info,dept_no,no_employees,total_salary,avg_salary) values (sno,v_deptno,v_empno,v_totsal,v_avgsal);
        dbms_output.put_line('successfully completed');
    
    exception
        when excp then
            dbms_output.put_line('values already present');
        when others then
            dbms_output.put_line('addedd to dept');
end;

begin
    add_stat(30);
end;