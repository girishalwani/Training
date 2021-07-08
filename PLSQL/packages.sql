set serveroutput on

---1
create or replace package pk1 is
    procedure add_department(v_deptno dept.deptno%type,v_dname dept.dname%type,v_loc dept.loc%type);
    procedure update_department(v_deptno dept.deptno%type,v_dname dept.dname%type,v_loc dept.loc%type);
    procedure delete_dept(v_deptno dept.deptno%type);
end pk1;


create or replace package body pk1 is
    procedure add_department(v_deptno dept.deptno%type,v_dname dept.dname%type,v_loc dept.loc%type) is
    excp exception;
    dno dept.deptno%type;
    exc exception;
    begin
        if cal_cnt(v_deptno) then
            insert into dept(deptno,dname,loc) values(v_deptno,v_dname,v_loc);
        else
            raise excp;
        end if;    
        
        exception
            when excp then
                dbms_output.put_line('values already present');
            when no_data_found then
                dbms_output.put_line('addedd to dept');
    end add_department;
    
    
    
    procedure update_department(v_deptno dept.deptno%type,v_dname dept.dname%type,v_loc dept.loc%type) is
    excp exception;
    dno dept.deptno%type;
    exc exception;
    begin
        if cal_cnt(v_deptno) then
            raise excp;
        else
             update dept set dname=v_dname,loc=v_loc where deptno=v_deptno;
        end if;    
        
        exception
            when excp then
                dbms_output.put_line('values not present');
            when others then
                dbms_output.put_line('error occured');
    end update_department;
    
    
    
    
    procedure delete_dept(v_deptno dept.deptno%type) is
    excp exception;
    dno dept.deptno%type;
    
    begin
        
        if cal_cnt(v_deptno) then
            raise excp;
        else
            DELETE FROM dept WHERE deptno=v_deptno;
            DBMS_OUTPUT.put_line('deleted');
        end if;    
        
        exception
            when excp then
                dbms_output.put_line('values already present');
            when others then
                dbms_output.put_line('error occured');
    end delete_dept;
    

end pk1;


create or replace function cal_cnt(v_deptno dept.deptno%type) return boolean is
        cursor cur is select * from dept where deptno=v_deptno;
        var_cur dept%rowtype;
        begin
            open cur;
            fetch cur into var_cur;
            
            if cur%notfound then
                return true;
            else
                return false;
            end if;
            close cur;
        end cal_cnt;


begin
    pk1.add_department(50,'management','india');
    pk1.update_department(50,'mgt','america');
    pk1.delete_dept(50);
end;




--2
create or replace function cal_emp(v_empno emp.empno%type) return boolean is
        cursor cur is select * from emp where empno=v_empno;
        var_cur emp%rowtype;
        begin
            open cur;
            fetch cur into var_cur;
            
            if cur%notfound then
                return true;
            else
                return false;
            end if;
            close cur;
        end ;




create or replace package pk2 is
    cursor cur return emp%rowtype;
    procedure disp_3;
    procedure disp_6;
end pk2;

create or replace package body pk2 as
    cursor cur return emp%rowtype is select * from emp;
    eval cur%rowtype;
    
    
    procedure disp_3 is
    begin
        open cur;
        loop
            fetch cur into eval;
            dbms_output.put_line(eval.ename||','||eval.job||','||eval.deptno);
            exit when cur%rowcount=3;
        end loop;
        close cur;
    end disp_3;
    
    procedure disp_6 is
    begin
        open cur;
        loop
            fetch cur into eval;
            dbms_output.put_line(eval.ename||','||eval.job||','||eval.deptno);
            exit when cur%rowcount=6;
        end loop;
        close cur;
    end disp_6;

end pk2;


begin
    pk2.disp_6;
end;



--3
create sequence s2
    increment by 1
    start with 1
    nominvalue
    nomaxvalue
    nocycle;
    
    
create or replace package pk3 is
    procedure add_emp(v_empno emp.empno%type ,v_ename emp.ename%type default 'UNK',v_sal emp.sal%type DEFAULT 1000);
    procedure add_emp(v_ename emp.ename%type default 'UNK',v_sal emp.sal%type DEFAULT 1000);
end pk3;

create or replace package body pk3 is
    procedure add_emp(v_empno emp.empno%type ,v_ename emp.ename%type default 'UNK',v_sal emp.sal%type DEFAULT 1000) is
    excp exception;
    eno emp.empno%type;
    exc exception;
    begin
        if cal_emp(v_empno) then
            insert into emp(empno,ename,sal) values(v_empno,v_ename,v_sal);
        else
            raise excp;
        end if;    
        
        exception
            when excp then
                dbms_output.put_line('values already present');
            when others then
                dbms_output.put_line('addedd to dept');
    end add_emp;
    
    
    procedure add_emp(v_ename emp.ename%type default 'UNK',v_sal emp.sal%type DEFAULT 1000) is
    excp exception;
    eno emp.empno%type;
    exc exception;
    begin
        eno:=s2.nextval;
        if cal_emp(eno) then
            insert into emp(empno,ename,sal) values(eno,v_ename,v_sal);
        else
            raise excp;
        end if;    
        
        exception
            when excp then
                dbms_output.put_line('values already present');
            when others then
                dbms_output.put_line('addedd to dept');
    end add_emp;
end pk3;

begin
    pk3.add_emp();
end;

select * from emp;


