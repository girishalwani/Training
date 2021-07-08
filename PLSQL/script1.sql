set serveroutput on;
DECLARE
v_sal emp.sal%type;
v_comm emp.comm%type;
v_name emp.ename%type;

BEGIN
    v_name:='&ename';
    select sal,nvl(comm,0) into v_sal,v_comm from emp where ename=v_name;
    dbms_output.put_line('NETSAL (SAL+COMM)= ' || (v_sal+v_comm));
END;