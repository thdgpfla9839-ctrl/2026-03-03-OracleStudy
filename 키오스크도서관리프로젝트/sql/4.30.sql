-- 출퇴근(근태) 테이블
create table attend(
    no number generated always as identity primary key,
    empno number,
   work_date date default sysdate,
   check_in date default sysdate,
   check_out date default sysdate,
   status varchar2(20),
   constraint att_empno_fk foreign key(empno)
   references emp2(empno),
   constraint att_status_ck check(status in('정상','지각','조퇴'))
  
);

desc attend;
desc emp2;

desc dept;

alter TABLE emp2 add isadmin char(1) DEFAULT 'n';

desc emp2;
SELECT * FROM emp2;
UPDATE emp2 set 
isadmin = 'y'
where job='부장';
COMMIT;
-- 100번이 부장이다 -> 관리자

