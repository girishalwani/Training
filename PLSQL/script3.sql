set serveroutput on

declare 
emprow emp%rowtype;
v_empno emp.empno%type;

begin
    v_empno:=&empno;
    select * into emprow from emp where empno=v_empno;
    dbms_output.put_line(emp.ename);
end;