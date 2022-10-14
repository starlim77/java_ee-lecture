select*from tab;
select*from recyclebin; -- 휴지통에 테이블 정보 검색
show recyclebin;
flashback table 성적 to before drop;
select*from 성적;
drop table 성적 purge; -- 휴지통을 거치지 않고 바로 삭제(영구 삭제)
purge recyclebin; -- 휴지통 비우기
show recyclebin;

create table dbtest(
name varchar2(15), -- 문자열 char 고정형, varchar 가변형
age number,
height number(10,2),
logtime date);

select*from dbtest;

insert into dbtest(name,age,height,logtime) values ('홍길동',25,185.567,sysdate);
insert into dbtest(name, age, height, logtime) values('Hong',30,175.56,sysdate);
insert into dbtest(name, age) values('희동이', 3);
insert into dbtest(name,height) values('홍당무',168.89);
insert into dbtest values('분홍신',5,123.5,sysdate);
insert into dbtest(name)values('진분홍');

commit; -- transaction : 커밋 이전 까지의 명령어들을 트랜잭션이라고 한다

select name, age from dbtest;
delete dbtest;

rollback;
commit;

select * from dbtest where name = '홍길동';
--이름이 Hong인 레코드를 추출하시오
select*from dbtest where name = 'HONG'; -- 데이터는 대소문자 구별, 명령어는 구별하지 않음.
select*from dbtest where lower(name)= 'hong'; --name 을 소문자로 변환

select*from dbtest where name like '%홍%'; -- name에 홍이라는 글자가 들어가는 데이터 선택
select*from dbtest where name like '홍%'; -- 첫글자가 홍
select*from dbtest where name like '%홍'; -- 마지막 글자가 홍
select*from dbtest where name like '_홍%'; -- 두번째 글자가 홍
select*from dbtest where name like '__홍%'; -- 세번째 글자가 홍

select*from dbtest where age is not null;

-- 이름에 홍이 들어가고, 나이가 20살 이상인 레코드 검색 (java && || -> oracle and or)
select*from dbtest where name like '%홍%' and age>=20;

update dbtest set age=age+1 where name='홍길동'; -- 홍길동 나이 1살 증가
drop user c##java; -- 계정삭제
drop table dbtest; -- table 삭제

delete dbtest where name = '홍길동'; --레코드 삭제
select*from dbtest;
commit;

create sequence test increment by 2 start with 1 maxvalue 9 cycle nocache;
select test.nextval from dual; -- dual 가상 테이블명
select test.currval from dual;

create sequence test2 nocycle nocache;
select test2.nextval from dual;
select test2.currval from dual;
select*from user_sequences;


select*from student;
select*from student where name = '임윤환';



