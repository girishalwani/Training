SELECT *
FROM (select * from employees ORDER BY employee_id DESC) 
WHERE rownum <= &N;
