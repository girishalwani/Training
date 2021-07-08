set serveroutput on
declare
    age number:=&var;
begin
    if age<18 then
        RAISE_APPLICATION_ERROR(-20001,'LESS THAN 18 YEARS');
    end if;
    dbms_output.put_line('more than 18 years');
    
    exception
        when others then
            dbms_output.put_line(sqlerrm);
end;


declare
    v_dividend number:=10;
    v_divi number:=0;
    v_res number;
    ex_divzero exception;
begin
    if v_divi=0 then
        RAISE ex_divzero;
    end if;
    v_res:=v_dividend/v_divi;
    
    exception
        when ex_divzero then
            dbms_output.put_line('zero divide error');

end;


declare
    ex_age exception;
    pragma EXCEPTION_INIT(ex_age, -20008);
    age number;
begin
    age:=&age;
    if age<18 then
        RAISE_APPLICATION_ERROR(-20008,'LESS THAN 18 YEARS');
    end if;
    dbms_output.put_line('more than 18 years');
    
    exception
        when ex_age then
            dbms_output.put_line(sqlerrm);
end;