select*from employees;

-- 문제1
select employee_id as 사원번호,
       first_name||' '||last_name as "이 름",
       salary*12||'달러' as "연 봉"
       from employees;

--문제2
select last_name||' is a '||job_id as "Employee Detail" from employees;

select last_name, hire_date, department_id
from employees
where department_id=10  or  department_id=90;

--ex5
select distinct department_id from employees;

--ex6
select last_name,hire_date,department_id from employees
where department_id=10 or department_id=90;

--ex7
select last_name,hire_date,department_id from employees
where salary>=2500 and salary<3500;

--문제3
select first_name||' '||last_name as 사원명,
       '$'||salary as "월 급",
       department_id as 부서코드
       from employees 
       where (salary<=2500 or salary>=3500) and department_id=90;

--ex8
select*from employees where last_name = 'King';

--ex9
select last_name,job_id,department_id from employees
where job_id like '%MAN%';

--ex10
select last_name, job_id, department_id from employees
where job_id like 'IT%';

--ex11
select last_name,job_id,department_id from employees
where commission_pct is not null;

select last_name,job_id,department_id from employees
where commission_pct is null;

--ex12
select employee_id,last_name,job_id from employees
where job_id='FI_MGR' or job_id='FI_ACCOUNT';

select employee_id,last_name,job_id from employees
where job_id in('FI_MGR','FI_ACCOUNT');

--ex13
select employee_id, last_name,salary from employees
where salary>=10000 and salary<=20000;

select employee_id, last_name,salary from employees
where salary between 10000 and 20000;

--문제4
select last_name as 이름, job_id as 업무ID, salary||'원' as "급 여"
from employees
where job_id in('SA_REP','AD_PRES') and salary>10000;

--문제5
select distinct job_id from employees;

--문제6
select employee_id as 사원번호, first_name||' '||last_name as 이름, hire_date as 입사일
from employees
where hire_date like '05%';

select * from employees;