--5일차 hwp 뒷부분, 6일차 ex19까지.

--ex7
select department_name, job_title, round(avg(salary),2) as "Avg_sal"
from employees
join departments using(department_id)
join jobs using (job_id)
group by rollup(department_name, job_title);

--ex8
select department_name, job_title, round(avg(salary),2) as "Avg_sal"
from employees
join departments using(department_id)
join jobs using (job_id)
group by cube(department_name, job_title);

--ex9
select job_title, round(avg(salary),2) as "Avg_sal"
from employees
join departments using(department_id)
join jobs using (job_id)
group by grouping sets((job_title),());  --() all rows의 역할

--  6일차 hwp
--ex1
create table test(
id number(5),
name char(10),
address varchar2(50));

--ex2
create table user1(
idx     number  primary key,
id      varchar2(10) unique,
name    varchar2(10) not null,
phone   varchar2(15),
address varchar2(50),
score   number(6,2)  check(score >= 0 and score <= 100),
subject_code  number(5),
hire_date  date default sysdate,
marriage   char(1)  default 'N'  check(marriage in('Y', 'N')));

--ex3 제약조건 확인
select constraint_name, constraint_type
from user_constraints
where table_name='USER1';

select *
from user_constraints
where table_name='USER1';

--ex4
create table user3(
idx     number        constraint PKIDX primary key,
id      varchar2(10)  constraint UNID unique,
name    varchar2(10)  constraint NOTNAME not null,
phone   varchar2(15),
address varchar2(50),
score   number(6,2)   constraint CKSCORE check(score >= 0 and score <= 100),
subject_code  number(5),
hire_date  date default sysdate,
marriage   char(1)  default 'N' constraint CKMARR check(marriage in('Y','N')));

--ex5
select constraint_name, constraint_type
from user_constraints
where table_name='USER2';

select *
from user_constraints
where table_name='USER2';

--ex6  제약 조건 위반 -- user 2 table 처럼 제약 조건에 이름을 지어줘 알아보기 편하게 한다. (constraint_name)
insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(1,'aaa','kim','010-000-0000','서울',75,100,'2010-08-01','Y');

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(1,'aaa','kim','010-000-0000','서울',75,100,'2010-08-01','Y'); --

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'aaa','kim','010-000-0000','서울',75,100,'2010-08-01','Y'); 

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','','010-000-0000','서울',75,100,'2010-08-01','Y');

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','lee','010-000-0000','서울',120,100,'2010-08-01','Y');

insert into user2(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','lee','010-000-0000','서울',75,100,'2010-08-01','K');

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','lee','010-000-0000','서울',75,100,'2010-08-01','N');

--ex7
select * from tab;

--ex8
select * from user1;
select * from user2;

--ex9 테이블 구조 확인
desc user1;
--ex10 시퀸스 목록 확인
select * from user_sequences;
--ex11 테이블 명 변경
alter table test rename to user3;
--ex12 칼럼 추가  
alter table user3 add phone varchar2(15);
desc user3;
--ex13 제약 조건 추가
alter table user3 add constraint UID2 unique(id);

select constraint_name, constraint_type
from user_constraints
where table_name='USER3';
--ex14 제약조건 삭제 
alter table user3 drop constraint UID2;

select *
from user_constraints
where table_name='USER3';
--ex15 칼럼 추가 
alter table user3 add no number primary key;
desc user3;
--ex16 구조 변경
alter table user3 modify name varchar2(10);
desc user3;
--ex17 컬럼 삭제
alter table user3 drop column address;
desc user3;
--ex18
drop table user3;
purge recyclebin; -- 휴지통 비우기

drop table user1 purge; --휴지통에 넣지 않고 바로 삭제

drop table user2;
show recyclebin; --휴지통 보기
flashback table user2 to before drop; --휴지통에서 되살리기
flast back table BIN$60Z8JyoHAKzgUwIAEaxePQ==$0 to before drop;

select * from recyclebin;
--ex19 시퀀스 생성/삭제
create sequence idx_sql increment by 2 start with 1 maxvalue 9 cycle nocache;

select idx_sql.nextval from dual; -- 다음 시퀸스 값 표시시
select idx_sql.currval from dual; -- 현재 시퀸스값 표

drop sequence idx_sql;







