select * from emp
set serveroutput on

declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_sal emp.sal%TYPE;
actual_empno emp.empno%type;
begin
    v_empno:=&empno;
    v_ename :='&ename';
    v_sal :=&sal;
    select count(*) into actual_empno from emp where empno=v_empno;
    
    if actual_empno=0 then
        insert into emp(empno,ename,sal) values (v_empno,v_ename,v_sal);
    else 
        update emp set ename=v_ename,sal=v_sal where empno=actual_empno;
    end if;
end;


select * from emp

DECLARE 
NUM1 NUMBER;
BEGIN
    num1:=&num;
    if mod(num1,2)=0 then
        dbms_output.put_line(num1||' is an even number');
    else
        dbms_output.put_line(num1||' is a odd number');
    end if;
END;


declare
v_empno emp.empno%type;
v_sal emp.sal%type;
v_comm emp.comm%type;
v_deptno emp.deptno%type;
begin
    v_empno:=&empno;
    select sal,nvl(comm,0),deptno into v_sal,v_comm,v_deptno from emp where empno=v_empno;
    
    if v_deptno=10 then
        update emp set sal=(v_sal*1.10) where empno=v_empno;
    elsif v_deptno=20 then
        update emp set sal=(v_sal*1.15) where empno=v_empno;
    else
        update emp set sal=(v_sal+v_comm) where empno=v_empno;
    end if;
end;

select * from emp where deptno not in (10,20)
drop table mytable1

select * from mytable1
create table &table_name (&col_name &datatype_name);
begin     
    for val in 1..10 loop
        if val=6 or val=8 then
            continue;
        end if;
        insert into mytable1(result) values(val);
    end loop;    
end;


