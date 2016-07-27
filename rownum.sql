select sysdate employee_id from employees;

--connect by prior (계층구조 데이터 표현할 때, ~)
select level, employee_id , last_name from employees start with manager_id is null connect by prior employee_id = manager_id order by level;

--rollup, cube
select * from employees group by department_id;

--

SELECT sysdate, employee_id FROM EMPLOYEES;

SELECT level, employee_id, manager_id, last_name
FROM EMPLOYEES
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id
ORDER BY level;

--roll up, cube
SELECT department_id, job_id, SUM(salary)
FROM EMPLOYEES
GROUP BY department_id, job_id
ORDER BY department_id;

SELECT department_id, job_id, SUM(salary)
FROM EMPLOYEES
GROUP BY ROLLUP(department_id, job_id);

SELECT department_id, job_id, SUM(salary)
FROM EMPLOYEES
GROUP BY CUBE(department_id, job_id);

--top k rownum (게시판에서 페이징처리)
SELECT rownum, employee_id, first_name
FROM EMPLOYEES
WHERE ROWNUM < 6;

-- order by 이전에 where 절까지 실행되서 선택된 row가 있는 임시 테이블에서 rownum이 세팅됨
SELECT rownum, employee_id, first_name
FROM EMPLOYEES
ORDER BY first_name;

--해결방법(subquery)
SELECT rownum, employee_id, first_name
FROM (SELECT employee_id, first_name
      FROM EMPLOYEES
      ORDER BY first_name)
WHERE rownum < 11;

--최종 해결 방법
select * from (select rownum as rn, employee_id, first_name
                from (select employee_id, first_name 
                        from employees order by first_name))
  where (4-1)*10+1< rn and rn < 4*10;
  
--rowid(pseudo column - rownum, sysdate, rowid) 컬럼이 없어도 조회 가능
select rowid, first_name from employees;