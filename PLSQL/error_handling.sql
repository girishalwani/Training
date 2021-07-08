create table messages (results varchar2(1000))
select * from emp;
select * from messages
set serveroutput on;

desc emp
alter table emp modify ename varchar2(10) not null;

delete from emp where empno=1234

declare 
v_sal emp.sal%type;
v_ename emp.ename%type;
no_emp exception;
other_err exception;
begin
    v_sal:=&sal;
    select ename into v_ename from emp where sal=v_sal;
    if sql%rowcount=1 then
        insert into messages(results) values (v_ename||' , '||v_sal);
    elsif sql%rowcount>1 then
        insert into messages(results) values('more than one employees with sal'||v_sal);
    elsif sql%rowcount=0 then
        raise no_emp;
    else
        raise other_err;
    end if;
    
    exception
        when no_emp then
            dbms_output.put_line('no emp with sal '||v_sal);
        when other_err then
            dbms_output.put_line('some err occoured');
        when others then
            dbms_output.put_line('errored occured');
end;

declare 
v_empno emp.empno%type;
v_ename emp.ename%type;
v_sal emp.sal%type;

begin
    v_empno:=&empno;
    v_ename:='&name';
    v_sal:=&sal;
    
    insert into emp(empno,ename,sal) values(v_empno,v_ename,v_sal);
    exception
        when invalid_number then
            dbms_output.put_line('invalid number error');
        when others then
            dbms_output.put_line('an error has occured');
end;



declare
no_exp exception;
v_empno emp.empno%type;
no_emp exception;
begin
    v_empno:=&empno;
    if v_empno is null then
        raise no_exp;
    end if;
    
    delete from emp where empno=v_empno;
    
    if sql%rowcount=0 then
     raise no_emp;
    end if;
    
    exception
        when no_exp then
            dbms_output.put_line(' write the appropirate emp no');
        when no_emp then
            dbms_output.put_line('no emp found');
        when others then
            dbms_output.put_line('error');
end;


CREATE TABLE STOCK(PNO NUMBER,PNAME VARCHAR2(20),RATE NUMBER,TR_QTY NUMBER,TR_TYPE VARCHAR2(20));
INSERT INTO STOCK VALUES('1','JACK','20','5','R');
INSERT INTO STOCK VALUES('2','RON','30','6','I');
INSERT INTO STOCK VALUES('3','HOWARD','40','7','A');

DECLARE
NEWTR_QTY NUMBER;
N number;
TPE VARCHAR2(20);
QTY VARCHAR2(20);
exp exception;
BEGIN
NEWTR_QTY:=5;
for c in (SELECT PNO,TR_TYPE,TR_QTY INTO N,TPE,QTY FROM STOCK)
loop
N:= c.PNO;
TPE:=c.TR_TYPE;
QTY:=c.TR_QTY;
IF N IS NOT NULL AND TPE='R' THEN
UPDATE STOCK SET TR_QTY=QTY+NEWTR_QTY WHERE TR_TYPE='R' ;
ELSIF N IS NOT NULL AND TPE='I' THEN
UPDATE STOCK SET TR_QTY=QTY-NEWTR_QTY WHERE TR_TYPE='I' ;
ELSE
dbms_output.put_line(N);
RAISE exp;
END IF;
N:=0;
TPE:=NULL;
QTY:=0;
end loop;
EXCEPTION
WHEN exp THEN
dbms_output.put_line('TR_TYPE is neither R nor I for above PNO');
END;
