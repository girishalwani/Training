set serveroutput on;

--1
variable title varchar2(35);

create or replace function get_job(v_empno emp.empno%type) return varchar is
    jb emp.job%type;
begin
    select job into jb from emp where empno=v_empno;
    return jb;
end;

begin
    :title:=get_job(7654);
    dbms_output.put_line(:title);
end;


--2
create or replace function get_annual_sal(v_empno emp.empno%type) return number is
    v_sal emp.sal%type;
    begin
        select sal into v_sal from emp where empno=v_empno;
        return v_sal;
    end;

select empno,ename,deptno,get_annual_sal(empno) from emp where deptno=30;


--3

create or replace function valid_deptno(v_deptno dept.deptno%type) return boolean is
    dno number;    
    begin
        select count(*) into dno from dept where deptno=v_deptno;
        if dno>0 then
            return true;
        else
            return false;
        end if;
    end;

create or replace procedure add_empl(v_empno emp.empno%type ,v_ename emp.ename%type default 'UNK',v_sal emp.sal%type DEFAULT 1000
,v_deptno emp.deptno%type) is
    excp exception;
    eno emp.empno%type;
    exc exception;
    begin
        if valid_deptno(v_deptno) then
            insert into emp(empno,ename,sal,deptno) values(v_empno,v_ename,v_sal,v_deptno);
        else
            raise excp;
        end if;    
        
        exception
            when excp then
                dbms_output.put_line('dept doesnot exist');
            when others then
                dbms_output.put_line('addedd to dept');
    end add_empl;

begin
    add_empl(v_empno=>1031,v_deptno=>80);
end;


--4

create or replace function reverse_str(input1 varchar2) return varchar2 is
    rev varchar2(30):='';
        
    begin
        for str in reverse 1..length(input1) loop
            rev:=rev||substr(input1,str,1);
        end loop;
        
        return rev;
    end;    
    
begin
    dbms_output.put_line(reverse_str('girish'));
end;



--5

create or replace function cal_per(v_empno emp.empno%type,percentage number default 16) return number is
    v_sal emp.sal%type;
    perc number(10,2);
    begin
        select sal into v_sal from emp where empno=e_empno;
        perc:=(v_sal*percentage)/100;
        return perc;
    end;
    
select empno,ename,sal,cal_per(empno,20) from emp;


--6

create or replace function get_salary(v_sal emp.sal%type) return boolean is
avgsal emp.sal%type;
begin
    select avg(sal) into avgsal from emp;
    if(v_sal<avgsal) then
        return true;
    else
        return false;
    end if;
    
end;

create or replace procedure rec_insupd(v_empno emp.empno%type,v_ename emp.ename%type,v_sal emp.sal%type) is

begin
    if get_salary(v_sal) then
        update emp set empno=v_empno,ename=v_ename,sal=v_sal where empno=v_empno;
    end if;
end;

begin
    rec_insupd(7369,'watson',2000);
end;

select * from emp where empno=7369;


--7

create or replace function cal_date(v_empno emp.empno%type) return varchar2 is
v_date emp.hiredate%type;
begin
    select hiredate into v_date from emp where empno=v_empno;
    return to_char(v_date,'DAY, MONTH DD, YYYY','nls_date_language=GERMAN');
end;

begin
    dbms_output.put_line(cal_date(7369));
end;

--8

create or replace function cal_date(nu number) return varchar2 is
    words varchar2(30);
begin
    select to_char(to_date(nu,'J'),'Jsp') into words from dual;
    return words;
end;

begin
    dbms_output.put_line(cal_date(666));
end;



create or replace function table_name(tbl_nm varchar2) return varchar2 is 
    tbl_name varchar2(30);
begin
    tbl_name:=tbl_nm;
    dbms_output.put_line(tbl_nm);
    return tbl_name;
end;



begin
    dbms_output.put_line(table_name('dept'));
end;


create or replace procedure tab_disp(tbl_nm varchar2) is
    count_rec number;
    var_cur cur_sor%rowtype;
begin
    open cur_sor;
    loop
        fetch cur_sor into var_cur;
        dbms_output.put_line(var_cur);
        exit when cur_sor%notfound;
    end loop;
    close cur_sor;
end;
    
    
    
create or replace procedure tab_disp_number(tbl_nm varchar2) is
    count_rec number;
begin   
    select count(*) into count_rec from table_name(tbl_nm);
    dbms_output.put_line(count_rec);
end;





create or replace function get_table(t_name varchar2) return number is
strr varchar2(1000);
recds number;
begin
strr:='select count(*) from'||loc;
execute immediate strr into recds;
return recds;
end




CREATE OR REPLACE FUNCTION get_total_recs (loc VARCHAR2)
RETURN NUMBER IS
Query_str VARCHAR2(1000);
Num_of_recs NUMBER;
BEGIN
Query_str := 'SELECT COUNT(*) FROM ' || loc;
EXECUTE IMMEDIATE query_str INTO num_of_recs;
RETURN num_of_recs;
END


create or replace procedure customer_stats_tab is
-- define cursor
    cursor cur_sor is select last_name, trade_date,sum(shares_owned*current_price) portfolio_value 
    from customers, portfolio, stocks s 
    where id = customer_id and stock_symbol = symbol
    and trade_date = (select max(trade_date) from stocks where symbol = s.symbol)
    group by last_name, trade_date;
BEGIN
    for var_cur in cur_sor loop
        --insert into cust_stat
        insert into cust_stat values (var_cur.last_name, var_cur.trade_date,var_cur.portfolio_value);
        -- commit.
        commit;
    end loop;
        exception
        -- no data found
        when no_data_found then
        dbms_output.put_line('No data found.');
        when invalid_number then
        dbms_output.put_line('Invalid number');
        when others then
        dbms_output.put_line('Other problem.');
end;







