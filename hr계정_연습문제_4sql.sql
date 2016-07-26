--문제1
select count(*) from employees a, (select to_char(avg(salary),99999) as avg_salary from employees) b
 where a.salary < b.avg_salary;

--문제2
select a.employee_id, a.last_name, a.salary from employees a, (select max(salary) as max_sar,department_id from employees group by department_id order by department_id) b
  where a.salary = b.max_sar and a.department_id = b.department_id
  order by salary desc;
  
--내부 order by (X)
select employee_id, last_name, salary from employees
  where (department_id, salary) in (select department_id, max(salary) from employees group by department_id)
  order by salary desc;

--문제3
select a.job_title, b.sum_salary from jobs a, (select job_id, sum(salary) as sum_salary from employees group by job_id) b
 where a.job_id = b.job_id order by sum_salary desc;

--문제4
select employee_id, last_name, salary from employees a, (select department_id as Did,to_char(avg(salary),99999) as avg_salary from employees group by department_id) b
 where a.salary > b.avg_salary
  and a.department_id = b.Did;