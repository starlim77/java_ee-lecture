create synonym hr_emp for hr.employees;
-- grant create synonym to c##java;

select*from user_synonyms;

select * from hr.employees;
select * from hr_emp; -- 보안 유지에 도움된다.

--synonym 삭제
drop synonym hr_emp;

create synonym hr_dep for hr.departments;

