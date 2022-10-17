--ex15
select round(months_between('95-10-21','94-10-20'),0)from dual;

--ex16
select to_char(to_date('97/9/20', 'YY-MM-DD') , 'YYYY-MON-DD') from dual;
select to_char(to_date('97/9/20', 'RR-MM-DD') , 'RRRR-MON-DD') from dual;

select to_char(to_date('17/9/30', 'YY-MM-DD') , 'YYYY-MON-DD') from dual;
select to_char(to_date('17/9/30', 'RR-MM-DD') , 'RRRR-MON-DD') from dual;

--문제4
select last_name, to_char(hire_date, 'DD-MM"월"-YYYY')
from employees
where hire_date<'05/01/01';

--ex17
select last_name,hire_date from employees where hire_date='05/09/30';
select last_name,hire_date from employees where hire_date='05/9/30';

select to_char(sysdate, 'YYYY-MM-DD') from dual;
select to_char(sysdate, 'YYYY-fmMM-DD') from dual;

select to_char(to_date('2011-03-01','YYYY-MM-DD'), 'YYYY-MM-DD') from dual;
select to_char(to_date('2011-03-01','YYYY-MM-DD'), 'YYYY-fmMM-DD') from dual;
select to_char(to_date('2011-03-01','YYYY-MM-DD'), 'YYYY-fmMM-fmDD') from dual;

--ex18
select max(salary), min(salary), trunc(avg(salary),0), to_char(sum(salary), 'L9,999,999') from employees;

--문제5
select count(nvl(commission_pct,0)) from employees where commission_pct is null;

--ex19
select department_id from employees;
select count(department_id) from employees;
select count(*) from employees;
select count(distinct department_id) from employees;
select count(distinct nvl(department_id,0)) from employees;
select distinct nvl(department_id, 0) from employees;

--ex20
select job_id, case job_id
when 'SA_MAN' then 'Sales Dept'
when 'SA_REP' then 'Sales Dept'
else 'Another' 
end "분류"
from employees
order by 2;

select job_id, case
when job_id='SA_MAN' then 'Sales Dept'
when job_id='SA_REP' then 'Sales Dept'
else 'Another' 
end "분류"
from employees
order by 2;

--문제6
select employee_id as 사원번호, last_name as 사원명, salary, case
when salary<10000 then '초급'
when salary<20000 then '중급'
else '고급'
end "구분"
from employees
order by 4, 2;

--ex21
select rank(3000) within group(order by salary desc) "rank" from employees;
select employee_id, salary, rank() over(order by salary desc) "rank" from employees;

--문제7
select employee_id as 사원번호, last_name as 이름, salary as 급여, nvl(commission_pct, 0) as 커미션, to_char(salary*12+(salary*12*nvl(commission_pct, 0)), '$9,999,999') as 연봉
from employees;

--문제8
select employee_id, last_name, nvl(manager_id, 1000) from employees;

--카톡 문제 
select sum(price) as 판매액
from sellings
where created_at like '2016-11%';