desc employees;

-- 글자 함수
select LOWER('Database System') from dual;

select UPPER('Database System') from dual;

select INITCAP('database system') from dual;

select concat('data','base') from dual;
 --(오라클에서만 지원)
select 'data' || 'base'from dual;

select substr('database',2,3) from dual;

select length('database') from  dual;

select instr('database','ba') from dual;

select first_name, LPAD(salary, 10, ' ') from employees;

select first_name, RPAD(salary, 10, '*') from employees;

select trim('#' from '####Database####') from dual;

select trim(' ' from '    Data    base    ') from dual;

--숫자 함수
select abs(-20000) from dual;

select floor(2.65) from dual;

select ceil(2.15) from dual;

select power(2,10) from dual;

select trunc(3.14159,2) from dual;

select first_name, hire_date from employees;

SELECT value FROM nls_session_parameters WHERE parameter = 'NLS_DATE_FORMAT';

select first_name, to_char(hire_date,'yyyy-mm-dd am hh24:mm:ss') from employees;

select first_name, to_char(hire_date,'yyyy-mm-dd am hh24:mm') from employees where '2007' <= to_char(hire_date,'yyyy-mm-dd am hh24:mm');

--따로 자바에 넣지않아도 함수로 호출가능
select sysdate from dual;

select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') from dual;

select to_date('2007-12-10','yyyy-mm-dd') from dual;

select first_name, to_char(salary,'999999') from employees;

select first_name, to_char(salary,'999,999') from employees;

select first_name, to_char(salary,'0,999,999') from employees;

select first_name, to_char(salary,'L999,999') from employees;

select to_char(-100000,'999999MI') from dual;

select to_char(-100000,'999999PR') from dual;

select to_char(123,'RN') from dual;

select to_char(1024,'xxxx') from dual;

select first_name, salary + salary*NVL(commission_pct,0) from employees;
select first_name, salary + salary*NVL2(commission_pct, commission_pct,0) from employees;

select first_name, job_id, salary,
       case job_id
            when 'AD_VP' then salary*1.1
       end
       from employees;

select first_name, job_id, salary,
       case job_id
            when 'AD_VP' then salary*1.1
            when 'FI_MGR' then salary*1.5
            else salary
       end,
       decode(job_id, 'AD_VP', salary*1.1,
                      'FI_MGR',salary*1.5,
                               salary)
       from employees;