-- 4.30

-- generated always as indentity primary key 시퀀스 없이 자동증가 가능 : auto_increment와 동일
-- 출퇴근 테이블
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