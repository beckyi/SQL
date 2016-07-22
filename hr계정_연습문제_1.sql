--문제1
select first_name||' '||last_name as "이름", email as "이메일", phone_number as "전화번호" from employees order by hire_date asc;

--문제2
select job_title, max_salary from jobs order by max_salary desc;

--문제3
select count(*) from employees where manager_id is null;

--문제4
select job_title from jobs order by job_title desc, max_salary desc;

--문제5
select count(*) from departments;

--문제6
select * from departments order by length(DEPARTMENT_NAME) desc;

--문제7
select count(*) from departments where manager_id is null;

--문제8
select upper(country_name) from countries order by country_name asc;

--문제9
select REGION_NAME from regions order by length(REGION_NAME) asc;

--문제10 //컬럼 하나를 두고 여러 조건을 주면 어떤 조건에 맞춰 출력해줘야할지 혼란함 (city - 중복제거 기준? 오름차순 기준(중복포함)?)
select DISTINCT lower(city) as city from locations order by city asc;