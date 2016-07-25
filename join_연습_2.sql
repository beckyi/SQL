-- natural join ( 두개의 조인 조건이 의도하지 않았는데 조건이 걸림 ) -> department_id 외에도 manager_id도 걸림
select a.first_name, b.department_name from employees a natural join departments b;

--join - using
select a.first_name, b.department_name from employees a join departments b using (department_id);

--join - on
select a.first_name, b.department_name from employees a join departments b on a.department_id = b.department_id;
--select a.first_name, b.DEPARTMENT_ID from employees a, departments b where a.department_id = b.department_id; - 동일

--left-outer
--select a.first_name, b.DEPARTMENT_name from employees a, departments b where a.department_id = b.department_id(+);
select a.first_name, b.DEPARTMENT_name from employees a left outer join departments b on a.department_id = b.department_id;

--right-outer
--select a.first_name, b.DEPARTMENT_ID from employees a, departments b where a.department_id = b.department_id(+);
select a.first_name, b.DEPARTMENT_ID from departments b right outer join employees a on a.department_id = b.department_id;

