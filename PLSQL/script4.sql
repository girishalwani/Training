select * from emp

set serveroutput on
declare
    v_job emp.job%type;
    total number(4);
begin
    v_job:='&jb';
    delete from emp where job=v_job;
    if sql%found then
        total:=sql%rowcount;
        dbms_output.put_line(total || ' no of rows deleted');
    else
        dbms_output.put_line('no rows deleted');
    end if;
end;


set serveroutput on
declare
    v_job emp.job%type;
    total number(4);
begin
    v_job:='&jb';
    delete from emp where job=v_job;
    if sql%found then
        total:=sql%rowcount;
        dbms_output.put_line(total || ' no of rows deleted');
    else
        rollback;
    end if;
end;


declare
cursor top_job is select empno,ename,sal from emp order by sal desc;
v_empno emp.empno%type;
v_ename emp.ename%type;
v_sal emp.sal%type;
n number;

begin
n:=&n;
    open top_job;
    loop
        fetch top_job into v_empno,v_ename,v_sal;
        DBMS_OUTPUT.PUT_LINE(v_empno||','||v_ename||','||v_sal);
        exit when top_job%rowcount=n or top_job%notfound;
    end loop;
    close top_job;
end;



declare
cursor top_job is select empno,ename,sal from emp where sal>(select avg(sal) from emp);
v_empno emp.empno%type;
v_ename emp.ename%type;
v_sal emp.sal%type;
begin
    open top_job;
    loop
        fetch top_job into v_empno,v_ename,v_sal;
        DBMS_OUTPUT.PUT_LINE(v_empno||','||v_ename||','||v_sal);
        exit when top_job%notfound;
    end loop;
    close top_job;
end;



declare
cursor top_job is select ename,sal,hiredate from emp where sal>2000 and hiredate>'15-JUN-1981';
v_hiredate emp.hiredate%type;
v_ename emp.ename%type;
v_sal emp.sal%type;
begin
    open top_job;
    loop
        fetch top_job into v_ename,v_sal,v_hiredate;
        DBMS_OUTPUT.PUT_LINE(v_ename||' earns '|| v_sal ||' and joined the organization on '|| v_hiredate);
        exit when top_job%notfound;
    end loop;
    close top_job;
end;

select to_char(hiredate,'DD-MM-RRRR'),to_char(hiredate,'Day') from emp order by to_char(hiredate+1,'D') 

declare
cursor top_job is select to_char(hiredate,'DD-MM-RRRR'),to_char(hiredate,'Day') from emp order by to_char(hiredate+1,'D');
v_hiredate varchar2(30);
v_day varchar2(30);
begin
    open top_job;
    loop
        fetch top_job into v_hiredate,v_day;
        DBMS_OUTPUT.PUT_LINE(v_hiredate||'-'||v_day);
        exit when top_job%notfound;
    end loop;
    close top_job;
end;


select * from emp

declare
cursor emp_job is select ename,sal,comm from emp;
var_cur emp_job%rowtype;
begin
    open emp_job;
    loop
        fetch emp_job into var_cur;
        DBMS_OUTPUT.PUT_LINE(var_cur.ename||'---'|| nvl(var_cur.comm,0));
        exit when emp_job%notfound;
    end loop;
    close emp_job;
end;

alter table emp add star varchar2(20);
select * from emp;

declare 
cursor cur(dno number) is select * from emp where deptno=dno;
eval emp%rowtype;
dno number;
begin
dno:=&dno;
    for val in cur(dno)
    loop
    dbms_output.put_line(val.sal);
        update emp set star=rpad(' ',val.sal/1000+1,'*') where deptno=val.deptno and empno=val.empno;
    end loop;
end;

SELEct * from emp where job='CLERK' and sal>1000;


declare 
cursor cur(v_job varchar2) is select * from emp where JOB=v_job;
v_job varchar2(20);
begin
v_job:='&v_job';
    for val in cur(v_job)
    loop
        update emp set job='SR CLERK',sal=val.sal*1.10 where job='CLERK' and sal>1000 AND EMPNO=VAL.EMPNO;
    end loop;
end;


declare 
cursor cur(v_job varchar2(30)) is (select * from emp where job=v_job);
begin
    for val in cur('CLERK')
    loop
        update emp set job='SR CLERK',sal=val.sal*1.10 where sal>1000 AND EMPNO=val.empno;
    end loop;
end;


declare 
cursor cur(dno number) is select * from emp where deptno=dno;
eval emp%rowtype;
dno number;
begin
dno:=&dno;
    for val in cur(dno)
    loop
        if(val.deptno=10 or val.deptno=20)then
            update emp set sal=val.sal*1.15 where deptno=val.deptno and empno=val.empno;
            dbms_output.put_line(val.ename|| ' '|| val.sal);
        else
            update emp set sal=val.sal*1.05 where deptno=val.deptno and empno=val.empno;
        end if;
    end loop;
end;

select * from emp where deptno not in (10,20)


set serveroutput on
declare 
type cur_sal is ref cursor;
ref_cur cur_sal;
eval emp%rowtype;
n number;
begin
    n:=&n;
    if n=1 then
        open ref_cur for select * from emp where sal>2000;
        loop
            fetch ref_cur into eval;
            dbms_output.put_line(eval.ename||'  '||eval.sal);
            exit when ref_cur%notfound;
        end loop;
        close ref_cur;
    else
        open ref_cur for select * from emp where sal<2000;
        loop
            fetch ref_cur into eval;
            dbms_output.put_line(eval.ename||'  '||eval.sal);
            exit when ref_cur%notfound;
        end loop;
        close ref_cur;    
    end if;
end;
