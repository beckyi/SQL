--문제1
select max_salary as "최고임금", min_salary as "최저임금", (max_salary - min_salary) as "최고임금 – 최저임금" from jobs;

--문제2
select to_char(max(hire_date),'yyyy"년" mm"월" dd"일"') as "최근 고용 날짜" from employees;

--문제3
select department_id as "부서",
       to_char(avg(salary),99999) as "평균임금",
       max(salary) as "최고임금",
       min(salary) as "최저임금"
    from employees
  group by department_id
  order by "평균임금" desc, "최고임금" desc, "최저임금" desc;

--문제4
select job_id as "업무",
       to_char(avg(salary),999999) as "평균임금",
       max(salary) as "최고임금",
       min(salary) as "최저임금"
    from employees
  group by job_id
  order by "평균임금" desc, "최고임금" desc, "최저임금" desc;

--문제5
select to_char(min(hire_date),'yyyy"년" mm"월" dd"일"') as "가장 오래된 고용 날짜" from employees;

--문제6
select department_id,
       to_char(avg(salary),99999) as "평균임금",
       min(salary) as "최저임금",
       (to_char(avg(salary),99999)-min(salary)) as "평균임금-최저임금"
      from employees
      group by department_id
       having (to_char(avg(salary),99999)-min(salary)) < 2000
      order by "평균임금-최저임금" desc;

--문제7 (오라클 rownum 쿼리 활용 - 출력 갯수 제한)
select job_id, job_title from jobs
  where job_id = (select job_id from (select job_id, MAX(SALARY) - MIN(SALARY) as "차이" from employees group by JOB_ID order by "차이" desc) where ROWNUM<=1);

  --아이디, 차이 출력
  select JOB_ID, MAX(SALARY) - MIN(SALARY) as "차이" from employees group by JOB_ID order by "차이" desc;
  --최대 차이 값 출력
  select max("차이") from (select job_id, MAX(SALARY) - MIN(SALARY) as "차이" from employees group by JOB_ID);
  --상위 아이디 값 출력
  select job_id from (select job_id, MAX(SALARY) - MIN(SALARY) as "차이" from employees group by JOB_ID order by "차이" desc) where ROWNUM<=1;
