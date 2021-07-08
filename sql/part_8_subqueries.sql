select * from employees

select * 
from employees 
where salary>(select avg(salary) from employees)

select last_name,job_id
from employees
where exists(
    select * 
    from employees e,employees m
    where e.manager_id=m.employee_id
)

select * 
from employees 
where salary< all(select min(salary) from employees where department_id =10)


SELECT COUNT(DISTINCT (manager_id)) "Number of Managers" FROM employees;


SELECT COUNT(*) as "total",
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1995,1,0)) as "1995",
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1996,1,0)) as "1996",
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1997,1,0)) as "1997",
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1998,1,0)) as "1998"
FROM employees;


SELECT job_id as "Job",
SUM(DECODE(department_id , 20, salary)) as "Dept 20",
SUM(DECODE(department_id , 50, salary)) as "Dept 50",
SUM(DECODE(department_id , 80, salary)) as "Dept 80",
SUM(DECODE(department_id , 90, salary)) as "Dept 90",
SUM(salary) as "Total"
FROM employees
GROUP BY job_id;

SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e 
JOIN departments d 
ON (e.department_id = d.department_id) 
JOIN locations l 
ON (d.location_id = l.location_id)
WHERE LOWER(l.city) = 'toronto';


SELECT employee_id, last_name 
FROM employees WHERE department_id 
IN (SELECT department_id FROM employees WHERE last_name like '%u%')

SELECT last_name, department_id, salary
FROM employees 
WHERE (department_id, salary) IN (SELECT department_id, salary FROM employees WHERE commission_pct IS NOT NULL ) ;

SELECT last_name, hire_date, salary
	FROM employees
	WHERE (salary, NVL(commission_pct,0)) IN
		(SELECT salary, NVL(commission_pct,0)
		FROM employees
		WHERE last_name = 'Kochhar')
	AND last_name != 'Kochhar';


SELECT e.last_name as "name", e.salary as "salary",
		e.department_id as "deptno", AVG(a.salary) as "dept_avg"
	FROM employees e, employees a
	WHERE e.department_id = a.department_id
	AND e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id )
	GROUP BY e.last_name, e.salary, e.department_id
	ORDER BY AVG(a.salary);
    
SELECT DISTINCT (e.job_id), d.location_id
	FROM employees e, departments d
	WHERE e.department_id = d.department_id
	AND e.department_id = 80;
    
    
SELECT e.department_id as "department_no", e.last_name as "employee_name",
	c.last_name as "colleague_name"
	FROM employees e 
    JOIN employees c
	ON (e.department_id = c.department_id)
	WHERE e.employee_id <> c.employee_id
	ORDER BY e.department_id, e.last_name, c.last_name
    
select last_name || ', ' || job_id as "Employee and Title" from employees;
    
select employee_id || ', ' || first_name || ', ' ||last_name || ', ' || 
   email || ', ' || job_id || ', ' || hire_date || ', ' ||phone_number||', '||
   salary||', '||manager_id||', '||department_id as "THE OUTPUT" from employees; 

select last_name,salary from employees where salary not between 5000 and 12000  

select last_name,job_id,hire_date from employees where hire_date between '20-FEB-98' and '1-MAY-98' order by hire_date 

select last_name,department_id from employees where department_id in(20,50) order by last_name;

select last_name,job_id from employees where manager_id is null;

select last_name,salary,commission_pct from employees where commission_pct>0 order by salary desc,commission_pct desc;

select employee_id,last_name,salary as "Old Salary",round(salary*1.155,0) as "New Salary" from employees

select employee_id,last_name,salary as "Old Salary",round(salary*1.155,0) as "New Salary",round(salary*1.155,0)-salary as "Increase" from employees

select initcap(last_name),length(last_name) as "Length" from employees where substr(last_name,0,1) in ('J','A','M') order by last_name

select distinct (e.job_id), d.location_id
	from employees e, departments d
	where e.department_id = d.department_id
	and e.department_id = 80;

select e.last_name, e.job_id, e.department_id, d.department_name
	from employees e 
	join departments d 
	on (e.department_id = d.department_id) 
	join locations l 
	on (d.location_id = l.location_id)
	where l.city = 'Toronto';


select emp1.department_id as "department_no", emp1.last_name as "employee_name",
	emp2.last_name as "Colleague_name"
	from employees emp1
    	join employees emp2
	on (emp1.department_id = emp2.department_id)
	where emp1.employee_id <> emp2.employee_id


select e.last_name as "employees",e.hire_date as "employee hire date",
	m.last_name as "manager" ,m.hire_date as "mgr hire date"
	from employees e
	left outer join employees m
	on e.employee_id=m.employee_id
	where e.hire_date<m.hire_date

select round(max(salary),0) as "Maximum", round(min(salary),0) as "Minimum",
	round(sum(salary),0) as "Sum", round(avg(salary),0) as "Average" from employees;

select count(distinct(manager_id)) "Number of Managers" from employees;

select count(*) as "total",
	sum(decode(to_char(hire_date, 'YYYY'),1995,1,0)) as "1995",
	sum(decode(to_char(hire_date, 'YYYY'),1996,1,0)) as "1996",
	sum(decode(to_char(hire_date, 'YYYY'),1997,1,0)) as "1997",
	sum(decode(to_char(hire_date, 'YYYY'),1998,1,0)) as "1998"
	from employees;


select job_id as "Job",
	sum(decode(department_id , 20, salary)) as "Dept-20",
	sum(decode(department_id , 50, salary)) as "Dept-50",
	sum(decode(department_id , 80, salary)) as "Dept-80",
	sum(decode(department_id , 90, salary)) as "Dept-90",
	sum(salary) as "Total"
	from employees
	group by job_id;


select employee_id, last_name from employees where department_id IN (select department_id from employees where last_name like '%u%')

select last_name, department_id, salary from employees where (department_id, salary) in (select department_id, salary from employees where commission_pct is not null ) ;

select last_name, hire_date, salary from employees where (salary, nvl(commission_pct,0)) in
		(select salary, nvl(commission_pct,0)
		from employees
		where last_name = 'Kochhar')
		and last_name != 'Kochhar';


select e1.last_name as "name", e1.salary as "salary",
		e1.department_id as "deptno", avg(e2.salary) as "dept_avg"
	from employees e1, employees e2
	where e1.department_id = e2.department_id
	and e1.salary > (select avg(salary) from employees where department_id = e1.department_id )
	group by e1.last_name, e1.salary, e1.department_id
	order by avg(e2.salary);

