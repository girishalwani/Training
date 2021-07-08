set serveroutput on;


create table superhero (name varchar2(30));

create or replace trigger demo_trigger1
before insert on superhero
for each row
enable
declare 
    v_user varchar2(30);
begin
    select user into v_user from dual;
    dbms_output.put_line('user ='||v_user);
end;

insert into superhero values ('girish');



create or replace trigger bu_trigger1
before update on superhero
for each row
enable
declare 
    v_user varchar2(30);
begin
    select user into v_user from dual;
    dbms_output.put_line('update row by user ='||v_user);
end;

update superhero set name='superman' where name='girish';

alter trigger tr_superhero disable;


create or replace trigger tr_superhero
before insert or update or delete on superhero
for each row
declare
    v_user varchar2(30);
begin
    select user into v_user from dual;
    if inserting then
        dbms_output.put_line('inserting by user ='||v_user);
    elsif deleting then
        dbms_output.put_line('deleteing by user ='||v_user);
    elsif updating then
        dbms_output.put_line('updateing by user ='||v_user);
    end if;
end;


insert into superhero values ('batman');
update superhero set name='ironman' where name='batman';
delete from superhero where name='ironman';


--auditing

create table auditing(
    new_name varchar2(30),
    old_name varchar2(30),
    user_name varchar2(30),
    entry_date varchar2(30),
    operation varchar2(30)
);


create or replace trigger dh_audit
before insert or delete or update on superhero 
for each row
enable
declare
    v_user varchar2(30);
    v_date varchar2(30);
begin
    select user,to_char(sysdate,'DD/MON/YYYY HH24:MI:SS') INTO v_user,v_date from dual;
    
    if inserting then
        insert into auditing values(:NEW.name,NULL,v_user,v_date,'insert');
    elsif deleting then
        insert into auditing values(NULL,:OLD.name,v_user,v_date,'delete');
    elsif updating then
        insert into auditing values(:NEW.name,:OLD.name,v_user,v_date,'update');
    end if;
end;

 insert into superhero values ('tushar');
update superhero set name='hulk' where name='tushar';
delete from superhero where name='hulk';


--synchronized copy of table

create table superhero_copy as select * from superhero where 1=2;


select * from superhero_copy;

create or replace trigger sh_backup
before insert or delete or update on superhero 
for each row
enable
begin
    if inserting then
        insert into superhero_copy values (:new.name);
    elsif deleting then
        delete from superhero_copy where name=:old.name;
    elsif updating then
        update superhero_copy set name=:new.name where name=:old.name;
    end if;
end;

select * from superhero;
select * from superhero_copy;


insert into superhero values ('batman');
insert into superhero values ('superman');



-- ddl trigger with auditing;
create table schema_audit(
    ddl_date date,
    ddl_user varchar2(30),
    object_created varchar2(30),
    object_name varchar2(30),
    ddl_operation varchar2(30)
);


create or replace trigger hr_auit
after ddl on schema
begin
    insert into schema_audit
    values
    (sysdate,
    sys_context('userenv','current_user'),
    ora_dict_obj_type,
    ora_dict_obj_name,
    ora_sysevent
    );
end;

select * from schema_audit;

create table sample (a number);
insert into sample values(8);
truncate table sample; 
drop table sample;


-- databse triggerss
--logon trigger

create table hr_audit(
    event_type varchar2(20),
    logon_date date,
    logon_time varchar2(20),
    logof_date date,
    logof_time varchar2(20)
);

create or replace trigger hr_audit_trig
after logon on schema
begin
    insert into hr_audit values(
        ora_sysevent,
        sysdate,
        to_char(sysdate,'hh24:mi:ss'),
        null,
        null
    );
    commit;
end;

select * from hr_audit;

disc;

conn scott/tiger;

create or replace trigger hr_audit_logof
before logoff on schema
begin
    insert into hr_audit values(
        ora_sysevent,
        null,
        null,
        sysdate,
        to_char(sysdate,'hh24:mi:ss')
    );
    commit;
end;



-- iinstead off

create table trainer(
full_name varchar2(30)
);

create table subject(subject_name varchar2(30));

insert into trainer values ('girish');
insert into subject values ('oracle');

create view gg as select full_name,subject_name from  trainer,subject;

create or replace trigger to_insert
instead of insert on gg
for each row
begin
    insert into trainer(full_name) values (:new.full_name);
    insert into subject(subject_name) values (:new.subject_name);
end;

insert into gg values ('tushar','account');



select * from employees

create or replace procedure update_emp_sal(v_job_id IN employees.job_id%TYPE,v_min_sal IN employees.salary%TYPE) IS
cursor cur_sal_update(p_job_id employees.job_id%TYPE) IS
select salary from employees where job_id = p_job_id for update of salary;
BEGIN
  FOR var_cur IN cur_sal_update(v_job_id)
  LOOP
    if var_cur.salary < v_min_sal then
      update employees set salary = v_min_sal where current of cur_sal_update;
    end if;
  end loop;
end update_emp_sal;




create or replace update_sal_emp_tri 
after insert or update of min_salary on jobs
for each now
begin
  if :NEW.min_salary > :OLD.min_salary then
    update_emp_sal(:NEW.job_id, :NEW.min_salary);
  end if;
end update_sal_emp_tri;
 