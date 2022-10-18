-- 5일차 hwp 


--ex1
select department_id from employees where first_name='Neena';
select department_name from departments where department_id=90;

select department_name from departments
where department_id=(select department_id from employees where first_name='Neena');

--ex2
select last_name, department_id, salary from employees
where department_id = (select department_id from employees where first_name='Neena')
      and salary > (select salary from employees where first_name='Neena');

--문제1
select last_name, salary from employees
where salary = (select min(salary) from employees);

--문제2
select max(sum(salary)) from employees group by department_id;--304500 부서별 중에서 가장 큰 값

select department_name, sum(salary)
from employees
join departments using(department_id)
group by department_name
having sum(salary) = (select max(sum(salary)) from employees group by department_id);

--ex3
select last_name, department_name, salary from employees
left join departments using(department_id)
where department_id = (select department_id from employees where last_name='Austin')
and salary = (select salary salary from employees where last_name='Austin');


--ex4
select last_name, job_id, salary
from employees
where job_id = 'IT_PROG'
and salary >any (select salary from employees where job_id='ST_MAN');

--문제 3
select last_name, job_id, salary
from employees
where job_id in('FI_ACCOUNT', 'SA_REP') 
      and salary > all (select salary from employees where job_id='IT_PROG');

--ex5
select last_name, job_id, salary
from employees
where salary in(select salary from employees where job_id='IT_PROG');

--ex6
--방법 1 in 연산자
select employee_id as 사원번호, last_name as 이름,
       case 
            when employee_id in(select manager_id from employees) then '관리자'
            else '직원'
       end as 구분
from employees
order by 3,1;

--방법 2
select employee_id as 사원번호, last_name as 이름, '관리자' as 구분 from employees
where employee_id in (select manager_id from employees)
union
select employee_id as 사원번호, last_name as 이름, '직원' as 구분
from employees
where employee_id not in (select manager_id from employees where manager_id is not null) order by 3,1;

--방법 3
select employee_id as 사원번호, last_name as 이름, '관리자' as 구분
from employees e
where exists (select null from employees where e.employee_id=manager_id) union
select employee_id as 사원번호, last_name as 이름, '직원' as 구분
from employees e
where not exists (select null from employees where e.employee_id=manager_id) order by 3, 1;

--문제 4
select last_name as 사원이름, job_id as 업무, job_title as 직무, to_char(salary, '$99,999') as 급여 from employees
join jobs using(job_id)
where (job_id, salary) in (select job_id, trunc(avg(salary), -3) from employees group by job_id)
order by 4;

