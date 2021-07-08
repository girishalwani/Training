set serveroutput on
drop procedure get_emp

create or replace procedure get_emp(v_empno in emp.empno%type) is
cursor emp_cur is select * from emp where empno=v_empno;
eval emp%rowtype;
begin
    open emp_cur;
        fetch emp_cur into eval;
        dbms_output.put_line(eval.ename||'--'||eval.sal||'--'||eval.deptno);    
    close emp_cur;
end;

begin
    get_emp(7654);
end;

drop function add_sum


create or replace function add_num(a IN number,b IN number) return number 
is 
total number;
begin
    total:=a+b;
    return total;
end;

select add_num(5,5) from dual


declare 
c number(3);
begin
    c:=add_num(12,12);
    dbms_output.put_line(c);
end;

select distinct(type) from user_source
select * from user_source where name in(select distinct(name) from user_source);
select name,type from user_source group by type order by type


create or replace procedure get_fun_pro as
cursor show_cur is select distinct(name) from user_source;
v_name user_source.name%type;
begin
    open show_cur;
        loop
            fetch show_cur into v_name;
            dbms_output.put_line(v_name);
            exit when show_cur%notfound;
        end loop;
    close show_cur;
end;


begin
    get_fun_pro;
end;