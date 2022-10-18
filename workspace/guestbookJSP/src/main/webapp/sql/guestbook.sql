create table guestbook(
seq number primary key, -- 시퀀스 객체로부터 값을 얻어온다 name varchar2(30),
email varchar2(30),
homepage varchar2(35),
subject varchar2(500) not null,
content varchar2(4000) not null,
logtime date);

create sequence seq_guestbook nocycle nocache;


select * from
(select rownum rn, tt.* from
(select name, email, homepage, subject, content, to_char(logtime, 'YYYY.MM.DD') as logtime 
from guestbook order by seq desc) tt)
where rn>=1 and rn<=3;  -- pg=1;

select * from
(select rownum rn, tt.* from
(select name, email, homepage, subject, content, to_char(logtime, 'YYYY.MM.DD') as logtime 
from guestbook order by seq desc) tt)
where rn>=4 and rn<=6;  -- pg=2;

select count(*) from guestbook;