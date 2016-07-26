--문제1
select a.first_name || a.last_name as "이름", a.salary as "연봉", b.department_name as "부서이름"
   from employees a, departments b
  where hire_date in (select max(hire_date) from employees)
   and a.department_id = b.department_id;
  
--문제2
select employee_id, last_name, salary from employees a, (select department_id as Did,to_char(avg(salary),99999) as avg_salary from employees group by department_id) b
 where a.salary > b.avg_salary
  and a.department_id = b.Did;

--문제3
select a.employee_id as "사번", a.first_name as "이름", a.last_name as "성", b.job_title as "업무", a.salary as "연봉" from employees a, jobs b
 where a.department_id = (select department_id from (select department_id, to_char(avg(salary),99999) as avg_salary from employees group by department_id) a,
                          (select max(to_char(avg(salary),99999)) as avg_salary from employees group by department_id) b
                            where a.avg_salary = b.avg_salary)
  and a.job_id=b.job_id order by "연봉" desc;

--select * from employees where department_id = 90;
--department_id, 평균연봉 구하기
select department_id, to_char(avg(salary),99999) as avg_salary from employees group by department_id order by avg_salary desc;
--max(평균연봉) 구하기 (19333)
select max(to_char(avg(salary),99999)) as avg_salary from employees group by department_id;
--department_id 구하기 (90)
select department_id from (select department_id, to_char(avg(salary),99999) as avg_salary from employees group by department_id) a,
                          (select max(to_char(avg(salary),99999)) as avg_salary from employees group by department_id) b
                        where a.avg_salary = b.avg_salary;
                        
--문제4
select department_id, to_char(avg(salary),99999) as avg_salary from employees group by department_id order by avg_salary desc;
select  department_id, department_name from departments
  where department_id = (select department_id from (select department_id, to_char(avg(salary),99999) as avg_salary from employees group by department_id) a,
                          (select max(to_char(avg(salary),99999)) as avg_salary from employees group by department_id) b
                            where a.avg_salary = b.avg_salary);

--문제5
select city from (select AVG(salary) as avg_sal, city from employees a, departments b, locations c
                    where a.department_id = b.department_id and b.location_id = c.location_id group by city) a
  where a. avg_sal= (select max(avg_sal) from (select AVG(salary) as avg_sal, city from employees a, departments b, locations c
  where a.department_id = b.department_id and b.location_id = c.location_id group by city));

--avg(salary), city 목록
select AVG(salary), city
from employees a, departments b, locations c
where a.department_id = b.department_id and b.location_id = c.location_id
group by city;
--max salary
select max(avg_sal) from (select AVG(salary) as avg_sal, city
from employees a, departments b, locations c
where a.department_id = b.department_id and b.location_id = c.location_id
group by city);

--문제6
select job_id, job_title from jobs
 where job_id = (select job_id from (select job_id, to_char(avg(salary),99999) as avg_salary from employees group by job_id) a,
                          (select max(to_char(avg(salary),99999)) as avg_salary from employees group by job_id) b
                        where a.avg_salary = b.avg_salary);
                        
--job_id, 평균연봉 구하기
select job_id, to_char(avg(salary),99999) as avg_salary from employees group by job_id order by avg_salary desc;
--job_id 구하기 (AD_PRES)
select job_id from (select job_id, to_char(avg(salary),99999) as avg_salary from employees group by job_id) a,
                          (select max(to_char(avg(salary),99999)) as avg_salary from employees group by job_id) b
                        where a.avg_salary = b.avg_salary;