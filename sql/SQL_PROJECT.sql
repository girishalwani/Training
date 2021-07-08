
--1
-- creating table

create table emp_details(
    empno Integer,
    first_name varchar2(30) not null,
    last_name varchar2(30) not null,
    lodge_name varchar2(30) not null,
    CONSTRAINT emp_details_pk primary key (empno),
    CONSTRAINT fk_lodge foreign key (lodge_name) references lodge_details(lodge_name)
);

create table lodge_details(
    lodge_name varchar2(30),
    lodge_manager varchar2(30) not null,
    lodge_address varchar2(30),
    constraints lodge_details_pk primary key (lodge_name)
);

desc emp_details



create table skill_details(
    skill varchar2(30) primary key,
    skill_desc varchar2(30)
);

create table emp_skill(
    empno Integer,
    skill varchar2(30),
    grade number(10),
    constraints pk_emp_skill primary key(empno,skill),
    constraints fk_emp_details foreign key (empno) references emp_details(empno),
    constraints fk_skill_details foreign key (skill) references skill_details(skill)
);

desc emp_skill

alter table emp_skill drop constraints fk_emp_details;
alter table emp_skill add constraints fk_emp_details foreign key (empno) references emp_details(empno) on delete cascade;


--2
--inserting data

insert all
    into lodge_details values ('Jessy Lodge','Rajan','Rakesh Nagar')
    
    into lodge_details values ('Rajesh Lodge','Rajani','Anna Nagar')
    
    into lodge_details values ('Gooday Lodge','John','Sea Road')
    
select * from dual;

select * from lodge_details

insert all 
    into emp_details values (101,'James','Jackson','Rajesh Lodge')
    into emp_details values (102,'Kalpash','Raj','Gooday Lodge')
    into emp_details values (103,'Jasmine','joy','Jessy Lodge')
select * from dual;

select * from emp_details


insert all
    into skill_details values ('Oracle SQL','Oracle Corporation')
    into skill_details values ('Dot Net','Microsoft')
    into skill_details values ('Sybase','SAP Corporation')
select * from dual;

select * from skill_details


insert all 
    into emp_skill values(101,'Oracle SQL',9)
    into emp_skill values(101,'Sybase',8)
    into emp_skill values(102,'Dot Net',9)
    into emp_skill values(103,'Oracle SQL',8)
    
select * from dual;

select * from emp_skill
select * from emp_details



---3
--Now the employee 101 has change his lodge to Gooday Lodge

update emp_details set lodge_name='Gooday Lodge' where empno=101


--4
--Employee 103 has resigned from the company and vacated the lodge so delete his details from the respective tables.

delete from emp_details where empno=103;


--5
--- The HR Departments want to create reports base on the following requirements
--a. Write a query that will display the employee with skill Sybase. Pass Sybase in any case. Use Function.
        
        select * from emp_details where empno in (select empno from emp_skill where skill='Sybase')
        
--b. Create a report that will display the First_Name,Skill and Lodge Manager

    select a.first_name,b.skill,c.lodge_manager
    from emp_details a,emp_skill b,lodge_details c
    where a.empno=b.empno and a.lodge_name=c.lodge_name

--c. Create a report that will that display the number of skill that employee 101 has.
        
        select count(skill) as "no of skills" from emp_skill where empno=101;
    
--d. Display the employee First_Name who has the Skill Oracle SQL

        select first_name from emp_details where empno in (select empno from emp_skill where skill='Oracle SQL')

--6
--Create a View EMP_VIEW so that the users can use it that contains columns EMPNO, FIRST_NAME,SKILL, LODGE_MANAGER

    create or replace view emp_view as 
        select a.empno,a.first_name,b.skill,c.lodge_manager
        from emp_details a,emp_skill b,lodge_details c
        where a.empno=b.empno and a.lodge_name=c.lodge_name

    select * from emp_view
    
--7
-- Create a Synonym EMPV for the View EMP_VIEW

        create or replace public synonym empv 
        for emp_view
        
--8
--Create Index on Skillcolumn in EMP_Skill table.
        
        create index idx_skill
        on emp_skill(skill)
        