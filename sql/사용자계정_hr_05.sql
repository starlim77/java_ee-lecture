-- 3일차 hwp 파일 나머지

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


