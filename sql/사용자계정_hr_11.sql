--7일차 hwp

create or replace view v_view7("부서ID", "부서평균")
as select nvl(department_id, 5000),
          round( avg(salary), -3)
   from employees
   group by department_id
   order by department_id asc;

select * from v_view7;   

select 부서ID, 부서평균
from (select nvl(department_id, 5000) "부서ID", 
             round( avg(salary), -3) "부서평균"
      from employees
      group by department_id
      order by department_id asc);
      
--문제5-1
select department_name as 부서명, max(salary) as 최대급여
from employees
join departments using(department_id)
group by (department_name);

--문제5-2
select 이름, 부서명, 최대급여
from (select last_name as 이름, department_name as 부서명, salary as 최대급여
      from employees
      join departments using(department_id)
      where (department_name, salary) in (select department_name as, max(salary) as 최대급여-- in 대신 =any 도 가능
                                          from employees
                                          join departments using(department_id)
                                          group by (department_name)
                                          )
      );
      
--ex6 Top N
select rownum, last_name, salary
from (select last_name, nvl(salary,0) as salary from employees order by 2 desc)
where rownum<=3;

--ex7
select rownum, last_name, salary
from (select last_name, nvl(salary,0)as salary from employees order by 2 desc)
where rownum=1; -- rownum=2는 error (특정 행은 사용할 수 없음)

--ex8
select  * from 
(select rownum , ceil(rownum/3) as page, tt.* from
(select last_name, nvl(salary,0)as salary from employees order by salary desc) tt
) where page=2;

select * from
(select rownum rn, tt.* from 
(select last_name, nvl(salary,0) as salary from employees order by 2 desc)tt
) where rn>=4 and rn<=6;


--문제6
select 이름,부서명,연봉 from(
select rownum rn, tt.*from
(select last_name as 이름, department_name as 부서명, to_char(salary*12+(salary*12*nvl(commission_pct,0)), 'L999,999') as 연봉
from employees
join departments using(department_id)
order by 3)tt)
where rn<=5;

--synonym

--[실습]
--java_synonym.sql file
grant all on employees to c##java;
