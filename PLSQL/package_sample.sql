set serveroutput on

create or replace package girish_pkg is
    function print_string return varchar2;
    procedure proc_one(f_name varchar2,l_name varchar2);
end girish_pkg;


create or replace package body girish_pkg is
    function print_string return varchar2 is
    begin
        return 'function';
    end print_string;
    
    procedure proc_one(f_name varchar2,l_name varchar2) is
    begin
        dbms_output.put_line(f_name||','||l_name);
    end proc_one;

end girish_pkg;


begin
    dbms_output.put_line(girish_pkg.print_string);
    girish_pkg.proc_one('girish','alwani');
end;


create or replace function cal_cnt(v_deptno dept.deptno%type) return boolean is
        cursor c1 is select * from dept where deptno=v_deptno;
        var_cur c1%rowtype;
        begin
            open c1;
            fetch c1 into var_cur;
            
            if c1%notfound then
                return true;
            else
                return false;
            end if;
            close c1;
        end;

drop function cal_cnt

set serveroutput on;

begin
    if cal_cnt(50) then
        dbms_output.put_line('not exist');
    else
        dbms_output.put_line('exist');
    end if;
end;