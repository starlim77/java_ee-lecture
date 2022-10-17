--ex1
select last_name,department_id,hire_date
from employees
order by 2 desc;

--ex2
select last_name, department_id, hire_date
from employees
order by 2 desc, 3asc;

--문제1
select last_name as "이 름", salary*12 as "연 봉"
from employees
order by 2 desc;


select department_id from employees; --107
select count(department_id) from employees; --106,  null값은 세지 않음
select distinct department_id from employees; --12
select count(distinct nvl(department_id, 0)) from employees; --12
select count(distinct department_id) from employees; --11   null값은 세지 않음.




--ex1
select employee_id,last_name,department_id
from employees
where lower(last_name)='higgins';

--ex2
select mod(10, 3) from dual;

--ex3
select round(35765.357, 2) from dual;
select round(35765.357, 0) from dual;
select round(35765.357, 1) from dual;
select round(35765.357, -3) from dual;

--ex4
select trunc(35765.367, 2) from dual;
select trunc(35765.367, 0) from dual;
select trunc(35765.367, -3) from dual;

--ex5
select concat('Hello', ' World') from dual;


--한글 3byte - oracle express

--ex6
create table text(
str1 char(20),
str2 varchar2(20));

drop table text;

insert into text(str1, str2) values('angel','angel');
insert into text(str1, str2) values('사천사', '사천사');
commit;

--ex7
select length('korea') from dual; --5
select length('코리아') from dual; --3

select lengthb('korea') from dual; --5
select lengthb('코리아') from dual; --9

--ex8
select instr('HelloWorld', 'W') from dual; --6
select instr('HelloWorld', 'o', -5) from dual; --5
select instr('HelloWorld', 'o', -1) from dual; --7

--ex9
select substr('I am very happy',6,4) from dual; --very
select substr('I am very happy',6) from dual; --very happy

--문제2
select employee_id, concat(first_name, ' ' || last_name) as name,
length(concat(first_name, ' ' || last_name)) as length
from employees
where substr(last_name,-1) = 'n';

--ex10
select width_bucket(74,0,100,10)from dual; --8

--ex11
select rtrim('test  ') || 'exam' from dual;

--ex12
select sysdate from dual;
SELECT SYSDATE, SYSTIMESTAMP FROM DUAL;
select to_char(sysdate, 'YYYY"년" MM"월" DD"일"') as 오늘날짜 from dual;
select to_char(sysdate, 'HH"시" MI"분" SS"초"') as 오늘날짜 from dual;
select to_char(sysdate, 'HH24"시" MM"분" SS"초"') as 오늘날짜 from dual;

--ex13
select add_months(sysdate, 7)from dual;

--ex14
select last_day(sysdate) from dual;
select last_day('2004-02-01') from dual;
select last_day('2005-02-01') from dual;

--문제3
select last_day(sysdate)-sysdate as "남은 날짜" from dual;

