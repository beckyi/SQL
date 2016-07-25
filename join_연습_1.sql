--join
select e.first_name, d.department_id, d.department_name from employees e, departments d 
  where e.department_id = d.department_id --join 조건 (table 수 -1)
    and e.salary > 5000;    --row 선택 조건
    
--Inner join
--equi join (=)
select e.first_name, d.department_id from employees e, departments d where e.department_id = d.department_id;

select e.first_name, d.department_id from employees e, departments d where e.department_id = d.department_id;

--theta join (조건)
select * from employees e, jobs j where e.salary between j.min_salary and j.max_salary;

--self join
select a.first_name as "직원", b.first_name as "매니저" from employees a, employees b where a.manager_id = b.employee_id(+);

--outer join (출력할 null이 있는 곳에 (+) 표시)
select a.first_name as "사원", nvl(b.first_name,'없음') as "매니저" from employees a, employees b where a.manager_id = b.employee_id(+);

select a.first_name, b.DEPARTMENT_ID from employees a, departments b where a.department_id = b.department_id(+);

select a.first_name, b.DEPARTMENT_ID from employees a, departments b where a.department_id(+) = b.department_id;

select * from departments;