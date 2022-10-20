--7일차 hwp 파일 내용

--ex1
create or replace view v_view1
as select employee_id, last_name, salary, department_id from employees
where department_id=90;

select * from v_view1;

delete from v_view1; --ORA-02292: 무결성 제약조건(HR.DEPT_MGR_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다

--문제1
create or replace view v_view2
as select employee_id, last_name, salary, department_id
from employees
where salary>=5000 and salary<=10000;

select * from v_view2;

--ex2
select * from v_view2;

update v_view2 set salary=12000 where employee_id=103;

select*from v_view2; --103번 사원이 조건에서 벗어나 자동으로 빠짐
select * from employees where employee_id=103; -- 원본인 employees 의 내용도 바뀜

update employees set salary=9000 where employee_id=103;
select*from v_view2; --103번 사원이 조건에 맞게 salary 값이 변경되었으므로 다시 들어옴.

--문제2
create or replace view v_view3(사원번호, 사원명, 부서명)
as select employee_id, last_name, department_name
   from employees
   join departments using(department_id)
   where department_id in(10, 90)
   order by employee_id;

select * from departments;

select * from v_view3;

--문제3
create or replace view v_view4(사원번호, 사원명, 급여, 입사일, 부서명, 부서위치)
as select employee_id, last_name, to_char(trunc(salary, -3), '999,999')||'원', to_char(hire_date, 'YYYY"년" MM"월" DD"일"'), department_name, city
from departments
join employees using(department_id)
join locations using(location_id)
order by employee_id;

select * from v_view4;

--ex3 뷰에 제약조건 달기
create or replace view v_view5
as select employee_id, last_name, job_id
from employees
where job_id='IT_PROG'
with read only;

select * from v_view5;
update v_view5 set last_name='홍길동' where employee_id=103; --error 읽기 전용 뷰

--ex4
create or replace view v_view6
as select employee_id, last_name, email, hire_date, job_id
from employees
where job_id='IT_PROG'
with check option;

select * from v_view6;
insert into v_view6(employee_id, last_name, email, hire_date, job_id)
values(500,'kim','candy','2004-01-01','Sales'); --check option error

update v_view6 set job_id='Sales' where employee_id=103;

insert into v_view6(employee_id, last_name, email, hire_date, job_id)
values(500,'kim','candy','2004-01-01','IT_PROG');

select * from v_view6;

--문제4
create table bookshop(
isbn varchar2(10) constraint PISBN primary key,
title varchar2(50) constraint CTIT not null,
author varchar2(50),
price number,
company varchar2(30));

insert into bookshop values('is001', '자바3일완성', '김자바', 25000, '야메루출판사');
insert into bookshop values('pa002', 'JSP달인되기', '이달인', 28000, '공갈닷컴');
insert into bookshop values('or003', '오라클무작정따라하기', '빅따라', 23500, '야메루출판사');
commit;

create table bookorder(
idx number primary key,
isbn varchar2(10), constraint FKISBN foreign key(isbn) references bookshop on delete set null,
qty number
);
create table bookorder(
idx number primary key,
isbn varchar2(10) constraint FKISBN references bookshop on delete set null,
qty number
);

create sequence idx_seq increment by 1 start with 1 nocache nocycle;

insert into bookorder values(idx_seq.nextval, 'is001', 2);
insert into bookorder values(idx_seq.nextval, 'or003', 3);
insert into bookorder values(idx_seq.nextval, 'pa002', 5);
insert into bookorder values(idx_seq.nextval, 'is001', 3);
insert into bookorder values(idx_seq.nextval, 'or003', 10);
commit;

create or replace view bs_view(책제목, 저자, 총판매금액)
as select title, author,to_char(sum(qty*price), '999,999,999')
   from bookshop
   join bookorder using(isbn)
   group by (title, author)
with read only;

select*from bs_view;



