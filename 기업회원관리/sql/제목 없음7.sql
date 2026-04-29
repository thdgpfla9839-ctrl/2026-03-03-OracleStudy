-- 4.29
select *  from member;
desc member;

create table grades(
 id VARCHAR2(20),
 grade VARCHAR2(20) CONSTRAINT grades_gr_nn not null,
 CONSTRAINT grades_id_fk FOREIGN key(id)
 references member(id)
 );
 
 select *  from grades;