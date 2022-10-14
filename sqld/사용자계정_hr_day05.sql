-- 3일차 hwp 파일 나머지, 4일차 hwp

-- ex11 self join
select employee_id, manager_id, last_name from employees;
select employee_id, last_name from employees;

-- 방법1
select e.employee_id as 사원번호, e.last_name as 사원이름, m.last_name as 관리자
from employees e, employees m
where m.employee_id=e.manager_id;

-- 방법2
select e.employee_id as 사원번호, e.last_name as 사원이름, m.last_name as 관리자
from employees e join employees m on(m.emplyee_id=e.manager_id);

--ex12 cross join
select*from countries, locations;
select*from countries cross join locations;

--ex13 Non equijoin
create table salgrade( salvel varchar2(2), lowst number, highst number);

insert into salgrade values('A', 20000, 29999);
insert into salgrade values('B', 10000, 19999);
insert into salgrade values('C', 0, 9999);
commit;

select * from salgrade;

select last_name, salary, salvel
from employees
join salgrade on(salary between lowst and highst) order by salary desc;


-- 4일차 hwp
create table employees_role as select * from employees where 1=0;
select * from employees_role;

insert into employees_role values(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(101, 'Nee', 'Ko', 'NKOCHHAR', '515.123.4568', '1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(200, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(200, 'Nee', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(300, 'GilDong', 'Hong', 'NKOCHHAR', '010-123-4567', '2009-03-01', 'IT_PROG', 23000.00, NULL, 100, 90);
commit;

--ex1 union
select employee_id, last_name from employees
union
select employee_id, last_name from employees_role;

--ex2 union all
select employee_id, last_name from employees
union all
select employee_id, last_name from employees_role;
-- unoin all 은 자동으로 정렬되지 않는다.
select salary from employees where department_id=10
union all
select salary from employees where department_id=30 order by 1;

--ex3
select employee_id, last_name from employees
minus
select employee_id, last_name from employees_role;

--ex4 intersect 양쪽 결과에 모두 포함되는 행 표현
select employee_id, last_name from employees
intersect
select employee_id, last_name from employees_role;

--문제1 
select last_name, job_id, department_id from employees
where department_id='10'
union
select last_name, job_id, department_id from employees_role
where job_id='IT_PROG';

--ex5
--방법1
select last_name, job_title
from employees
join jobs using(job_id)
where job_title in('Stock Manager','Programmer');
--방법2
select last_name, job_title from employees
join jobs using(job_id) where job_title='Stock Manager'
union
select last_name, job_title
from employees
join jobs using(job_id) where job_title='Programmer';
--order by 2;


-- ex9
select last_name, employee_id, hire_date
from employees
where department_id=20
union
select department_name, department_id, null
from departments
where department_id=20;



