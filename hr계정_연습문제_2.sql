--문제1
select a.employee_id as "사번", a.first_name as "이름", nvl(d.department_name,'부서없음') as "부서명", nvl(e.first_name,'매니저 없음')as "매니저 이름"
  from employees a, employees e, departments d where a.MANAGER_ID = e.EMPLOYEE_ID(+) and a.DEPARTMENT_ID = d.DEPARTMENT_ID(+);

--문제2
select r.region_name, c.country_name from regions r, countries c  where r.region_id = c.region_id order by r.REGION_NAME desc, c.COUNTRY_NAME desc;

--문제3
select a.department_id as "부서번호", a.department_name as "부서이름", nvl(e.first_name,'없음') as "매니저이름", b.city as "도시", c.country_name as "나라 이름",d.region_name as "지역구분 이름"
  from departments a, locations b, countries c, regions d, employees e
  where a.manager_id = e.employee_id(+)
  and a.location_id = b.location_id
  and b.COUNTRY_ID = c.COUNTRY_ID
  and c.REGION_ID = d.REGION_ID
  order by a.department_id;

--문제4
select a.employee_id, first_name || last_name 
  from employees a, job_history b, jobs c
  where a.employee_id = b.employee_id
  and b.job_id = c.JOB_ID
  and c.JOB_TITLE = 'Public Accountant';

--문제5
select a.employee_id as "사번", a.first_name as "이름", e.last_name as "성", nvl(d.department_name,'부서없음') as "부서 이름"
  from employees a, employees e, departments d
  where a.last_name = e.last_name
  and a.first_name <> e.first_name
  and a.DEPARTMENT_ID = d.DEPARTMENT_ID(+)
  order by a.employee_id asc;

--문제6
select a.employee_id as "사번", a.last_name as "성", a.hire_date as "채용일" 
  from employees a, employees b
  where a.manager_id = b.employee_id
  and a.HIRE_DATE < b.HIRE_DATE
  order by a.EMPLOYEE_ID;