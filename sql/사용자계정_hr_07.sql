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




select sum(salary from employees 
