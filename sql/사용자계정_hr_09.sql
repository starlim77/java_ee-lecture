-- 6일차 hwp 파일 마지막까지 


--ex20 테이블 생성 시퀸스 적용
create table book(
no number primary key,
subject varchar2(50),
price number,
year date);

create sequence no_seq increment by 1 start with 1 nocycle nocache;

insert into book(no, subject, price, year)
values(no_seq.nextval, '오라클 무작정 따라하기', 10000, sysdate);
insert into book(no, subject, price, year)
values(no_seq.nextval, '자바 3일 완성', 15000, '2007-03-01');
insert into book values(no_seq.nextval, 'JSP 달인 되기', 18000, '2010-01-01');

select * from book;

--ex21 테이블 구조만 복사

select*from user2;

create table user2(
idx     number        constraint PKIDX primary key,
id      varchar2(10)  constraint UNID unique,
name    varchar2(10)  constraint NOTNAME not null,
phone   varchar2(15),
address varchar2(50),
score   number(6,2)   constraint CKSCORE check(score >= 0 and score <= 100),
subject_code  number(5),
hire_date  date default sysdate,
marriage   char(1)  default 'N' constraint CKMARR check(marriage in('Y','N')));
desc user2;

create table user3 as select * from user2 where 1=0;
desc user3;

select constraint_name, constraint_type, search_condition
from user_constraints
where table_name='USER2'; 

select constraint_name, constraint_type, search_condition
from user_constraints
where table_name='USER3'; 
-- not null 을 제외하고 제약조건이 복사되지 않음, 복사된 제약조건의 제약조건명은 복사되지 않음


--ex22 테이블(idx → bunho,  name → irum,  address → juso) 을 복사하고 id가  bbb인 레코드를 복사하시오
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

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(1,'aaa','kim','010-000-0000','서울',75,100,'2010-08-01','Y');

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','lee','010-000-0000','서울',75,100,'2010-08-01','N');

select*from user1;
commit;

create table user4(bunho, irum, juso) 
as select idx, name, address from user1 where id='bbb';

select*from user4;

--ex23 테이블 생성 후 행 추가
create table dept(
deptno number constraint DNO primary key,
dname varchar2(30) constraint DNAME not null);

create table emp(
empno number constraint ENO primary key,
ename varchar2(30) constraint ENAME not null,
deptno number, constraint FKNO foreign key(deptno) references dept on delete set null);

insert into dept(deptno, dname) values(10, '개부');
insert into dept(deptno, dname) values(20, '영업부');
insert into dept(deptno, dname) values(30, '관리부');
insert into dept(dname) values(40, '경리부'); -- ORA-00913: 값의 수가 너무 많습니다

insert into dept(deptno, dname) values(40, '경리부');

insert into emp(empno, ename, deptno) values(100, '홍길동', 10);
insert into emp(empno, ename, deptno) values(101, '라이언', 20);
insert into emp(empno, ename, deptno) values(102, '튜브', 50); -- 무결성 제약조건(HR.FKNO)이 위배되었습니다- 부모 키가 없습니다

insert into emp(empno, ename, deptno) values(103, '어피치', 40);
insert into emp(empno, ename) values(105, '프로도');
insert into emp(ename, deptno) values('콘', 10); -- primary key는 NULL허용 안함

commit;

--ex24 삭제
delete from dept;
select * from dept;
rollback;
select * from dept;

delete from dept where deptno=40;
select * from dept; -- 40번 부서 삭제
select * from emp; -- 40번 부서 컬럼에 (null)이 들어간다

rollback;

--ex25 수정
update emp set deptno=30 where ename='프로도';
select * from emp;
commit;

