--SubQury
select salary from employees where first_name = 'Jack';

select first_name,salary from employees where salary > 2000;

--문제점
select first_name, salary from employees
  where salary > (select salary from employees where first_name = 'Karen');

--  2개의 값 출력
select salary from employees where first_name = 'Karen';

--practice01
select first_name, salary from employees where salary = (select min(salary) from employees);

select first_name, salary from employees where salary < (select avg(salary) from employees);

select first_name, department_id from employees where department_id = (select department_id from departments where department_name = 'Purchasing');

--join
select a.first_name, a.department_id from employees a, departments b where a.department_id = b.department_id and b.department_name='Purchasing';

--<where절 내>--
--subQury의 결과가 multi row일 경우
select first_name, salary from employees where salary in (select min(salary) from employees group by department_id);

select first_name, salary from employees where salary = any (select min(salary) from employees group by department_id);

--(multi row & multi colum)
select first_name, salary from employees where (department_id, salary) in (select department_id, min(salary) from employees group by department_id);

--correlated query
select first_name, department_id, salary from employees a where salary = (select min(salary) from employees where department_id = a.department_id);

--<from절 내>-- (select 결과를 테이블로 사용한다.)
--select department_id, min(salary) as min_salary from employees group by department_id;
--
--select * from employees;
select a.first_name, a.salary from employees a, (select department_id, min(salary) as min_salary from employees group by department_id) b
  where a.department_id = b.department_id
   and a.salary = b.min_salary;
   