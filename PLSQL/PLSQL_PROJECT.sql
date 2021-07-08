--1

set serveroutput on;

create table bank (
    account_number Integer,
    bank_name varchar2(30) not null,
    amount number(10,2) not null,
    constraint pk_bank primary key (account_number)
);


---2 ---Create a Package Bank_Transactionthat contains the following Methods

--a. Procedure NEW_ACCOUNT that will take 3 arguments Account_Number,Bank_Name,Amount and Insert these values into the Bank Table.

--b. Procedure Account_Transaction that will take 3Arguments Account_Number, Transaction_Amountand Transaction_Type(Withdrawal/Deposit). If the Withdrawal then deduct else Deposit then addto the Amount. Maintain an minimum balance of 5000.

--c. Procedure Close_Account that take one argument Account_Number that will delete the record from the Bank table.

--d. Create a Private Function Return_Boolean that returnsTrue if account number is found in the Bank table else return False. Call this function in all the procedures.
    
    create or replace function valid_acc(v_ac_no bank.account_number%type) return boolean is
        cursor cur is select * from bank where account_number=v_ac_no;
        var_cur bank%rowtype;
        begin
            open cur;
            fetch cur into var_cur;
            if cur%found then
                return true;
            else
                return false;
            end if;
            close cur;
        end;


    create or replace package bank_transaction is
        procedure new_account(v_ac_no bank.account_number%type,v_bankname bank.bank_name%type,v_amount bank.amount%type);
        procedure account_transaction(v_acno bank.account_number%type,transaction_amount bank.amount%type,transaction_type varchar2);
        procedure close_account(v_acno bank.account_number%type);
    end bank_transaction;
    
    
    create or replace package body bank_transaction is
       
        procedure new_account(v_ac_no bank.account_number%type, v_bankname bank.bank_name%type, v_amount bank.amount%type) is
        excptn exception;
        begin
            if valid_acc(v_ac_no) then
                raise excptn;
            else
                insert into bank(account_number,bank_name,amount) values(v_ac_no,v_bankname,v_amount);
            end if;        
            exception
                when excptn then
                    dbms_output.put_line('values already present');
                when others then
                    dbms_output.put_line('some error occured');
        end new_account;
        
        
        procedure account_transaction(v_acno bank.account_number%type,transaction_amount bank.amount%type,transaction_type varchar2) is
        excp exception;
        exc exception;
        amt bank.amount%type;
        begin
            if valid_acc(v_acno) then
                select amount into amt from bank where account_number=v_acno;
                if transaction_type='W' then
                    update bank set amount=amt-transaction_amount where account_number=v_acno;
                elsif transaction_type='D' then
                    update bank set amount=amt+transaction_amount where account_number=v_acno;
                end if;
            else
                raise excp;
                
            end if;    
            
            exception
                when excp then
                    dbms_output.put_line('values already present');
                when others then
                    dbms_output.put_line('error occured');
        end account_transaction;
        
        
        procedure close_account(v_acno bank.account_number%type) is
        excp exception;
        dno dept.deptno%type;
        begin
            
            if valid_acc(v_acno) then
                DELETE FROM bank WHERE account_number=v_acno;
                DBMS_OUTPUT.put_line('deleted');
            else
                raise excp;
            end if;    
            
            exception
                when excp then
                    dbms_output.put_line('account not present');
                when others then
                    dbms_output.put_line('error occured');
        end close_account;
        
    end bank_transaction;
    
begin
    bank_transaction.new_account(1,'BOB',10000);
--    bank_transaction.account_transaction(1,2000,'W');
--    bank_transaction.close_account(1);
end;

select * from bank;



---3
--audit table

create table audit_table(
    account_number Integer,
    transaction_date timestamp,
    transaction_type char(1)
);

drop table audit_table
--4
--Create a Trigger for Insert,Update or delete on Banktable that will insert the current transaction in the Audit_Table. 
--If the user Insert into the Bank Table then Insert the New Account number,Current date and Time and Transaction Type as ‘I’, 
--if the user updates the Account Number then Insert into the Bank table as Old Account Number,Date and Time and Type as ‘U’, 
--and if the user Deletes the row then insert Old Account Number,Date and Time and Type as ‘D


    create or replace trigger audit_table
    before insert or delete or update on bank 
    for each row
    enable
    declare
        v_date varchar2(30);
    begin
        select to_char(sysdate,'DD/MON/YYYY HH24:MI:SS') INTO v_date from dual;
        
        if inserting then
            insert into audit_table values(:NEW.account_number,v_date,'I');
        elsif deleting then
            insert into audit_table values(:old.account_number,v_date,'D');
        elsif updating then
            insert into audit_table values(:old.account_number,v_date,'U');
        end if;
    end;
    
select * from audit_table;

insert into bank values (2,'bob',80000);

    