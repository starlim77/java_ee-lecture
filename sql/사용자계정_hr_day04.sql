-- 2일차 마지막 부분, 3일차 hwp 파일

--ex22
select employee_id, salary, department_id,
first_value(salary) over(partition by department_id order by salary desc)
from employees;


--ex1
select to_char(trunc(avg(salary),0),'99,999') as 사원급여평균 from employees;

--ex2
select department_id as 부서코드, to_char(round(avg(salary),0),'L99,999,999') as 평균급여
from employees
group by department_id
having avg(salary)>=5000
order by department_id asc;

--ex3
select last_name, avg(salary)
from employees
group by department_id;  -- group by 절에 없는 것을 select에서 조회하면 error.

select last_name, avg(salary) over(partition by department_id)
from employees;  -- partition by 를 사용 하면 select절에 없어도 가능하다.


--문제1
select job_id ,sum(salary) as 급여합계
from employees
group by job_id;

--ex4
select department_id, max(salary) as max_salary
from employees
group by department_id
having department_id in(10,20) 
-- 전체 부서에 대해 그룹을 잡은 후 10과 20인 것을 추려낸다
order by department_id;

select department_id, max(salary) as max_salary
from employees
where department_id in(10, 20)
-- 부서번호가 10,20인 것만 골라낸 후 그룹을 생성하므로 속도가 더 빠르다
group by department_id
order by department_id;

-- join
-- join : 데이터의 양이 많을 경우에는 속도가 느려져 join을 사용하지 않는다.

--ex5 inner join

--방법1 오라클 전용 구문
select employee_id, employees.department_id, department_name
from employees, departments
where employees.department_id = departments.department_id;

--방법2 오라클 전용 구문
select employee_id, e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id;

--방법3 Ansi 표준
select employee_id, department_id, department_name
from employees join departments using(department_id);

--문제2 부서테이블(DEPARTMENTS d)과 위치테이블(LOCATIONS l)을 연결하여 부서가 위치한 도시를 알아내시오
-- department_id     city
----------------------------------
--10                Seattle
--방법1
select department_id, city
from departments, locations
where departments.location_id = locations.location_id
order by department_id;
--방법 2
select department_id, city
from departments d, locations l
where d.location_id = l.location_id
order by department_id;
--방법3
select department_id, city
from departments join locations using(location_id)
order by department_id;

--ex6 outer join(left)
--방법1 오라클 전용 구문
select e.last_name,d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);
-- 위에 적은 방법은 left join 일때 (+)가 오른쪽에 붙고 light join 일때 왼쪽에 붙기 때문에, 잘 사용하지 않는 방법이다

--방법2 Ansi 표준
select last_name, department_id, department_name
from employees left join departments using(department_id);

select *
from employees left join departments using(department_id);  -- 107

--ex7 outer join(right)
--방법1
select e.last_name,d.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;
--방법2
select last_name, department_id, department_name
from employees right join departments using(department_id);-- 122

-- inner join
select last_name, department_id, department_name
from employees join departments using(department_id);-- 106  null 값 안 가져옴.

--ex8 full join
-- Ansi 표준
select last_name, department_id, department_name
from employees full join departments using(department_id); --  123



--ex9 inner join 두 개의 컬럼이 일치하는 경우
--방법1 오라클 전용 구문
select e.last_name, d.department_id, d.manager_id
from employees e, departments d
where e.department_id=d.department_id and e.manager_id=d.manager_id;

--방법2 Ansi 표준
select last_name, department_id, manager_id
from employees
inner join departments using(department_id, manager_id);

--ex10 inner join 내용은 같은데 칼럼명이 다른 경우
--테이블 복사
create table locations2 as select * from locations;
alter table locations2 rename column location_id to loc_id;
select * from locations2;

--방법1    오라클 전용
select d.department_id, l.city
from departments d, location2 l
where d.location_id=l.loc_id;
--방법2   Ansi
select department_id, city
from departments join locations2 on(location_id=loc_id);
--방법3   Ansi
select department_id, city
from departments d
join locations2 l on(d.location_id=loc_id);

--ex12 13 은 넘어감. 다음 시간에 수업 예정.

--ex14 n개의 테이블
select last_name, job_title, department_name
from employees
join departments using(department_id)
join jobs using(job_id);

--문제3
select last_name as 사원이름, city as "도   시", department_name as 부서이름
from departments
join employees using(department_id)
join locations2 on(location_id=loc_id)
where city in('Seatle','Oxford')
order by city;

--문제4
select employee_id as 사원번호, 
       last_name as 사원이름,
       department_id as 부서이름,
       city as 도시,
       street_address as 도시주소,
       country_id as 나라이름
from employees
left join departments using(department_id)
join locations2 on(location_id=loc_id)
join countries using(country_id)
where street_address like '%Ch%' 
   or street_address like '%Sh%' 
   or street_address like '%Rd%'
order by country_id, city;
