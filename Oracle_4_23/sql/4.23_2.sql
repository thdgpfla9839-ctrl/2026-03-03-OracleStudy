-- procedure 리턴형이 없는 함수 -> 기능중심
--create or REPLACE PROCEDURE pro_name(매개변수)
--is
--    필요변수 설정
--begin
--   기능 처리
--end;
--/
--Call pro_name(값) -> 이걸 해야 위에 걸 갖다 쓸 수 있음
------------------------------------------------------------------------------
-- student
-- insert : 받는 변수가 없으니 전부 in변수 사용
-- update : in변수 사용
-- delete : in변수 사용
-- select : 값을 받아야 하니 out변수 포함
----------------------------------------------------------------------------
-- 매개 변수 안 3가지 유형
--1. in : 값을 대입할 때(디폴트 변수시에 생략이 가능) -> insert / update / delete
--2. out : 값을 받는 변수, Call by Reference
--3. inout : 값 대입, 값다기 둘다 가능
---------------------------------------------------------------------------------
-- insert
CREATE or REPLACE PROCEDURE studentInsert(
   pName student.name%TYPE,
   pKor student.kor%TYPE,
   pEng student.eng%TYPE,
   pMath student.math%TYPE
)
IS 
BEGIN
     INSERT INTO student VALUES (std_seq.nextval,pName,pKor,pEng,pMath);
     COMMIT;
end;
/

CALL studentinsert('나나나',8,55,63);
SELECT * FROM student;
--------------------------------------------------------------------------------

-- update
CREATE or REPLACE PROCEDURE studentUpdate(
   pHakbun student.hakbun%TYPE,
   pName student.name%TYPE,
   pKor student.kor%TYPE,
   pEng student.eng%TYPE,
   pMath student.math%TYPE
)
IS
 -- 필요한 변수가 있는 경우 선언하는 위치
BEGIN
     UPDATE student SET
     name = pName,kor = pKor,eng = pEng,math = pMath
     WHERE hakbun=pHakbun;
     COMMIT;
end;
/

CALL studentupdate(2,'김가가',89,56,23);
SELECT * FROM student;
--------------------------------------------------------------------------------
-- delete
CREATE or REPLACE PROCEDURE studentDelete(
   pHakbun student.hakbun%TYPE  
)
IS
BEGIN
     -- sql문장을 갖고 제어
     DELETE from student
            WHERE hakbun=pHakbun;
     COMMIT;
end;
/
CALL studentDelete(2);
SELECT * FROM student;
-- 여러개의 sql문장을 제어 / 일괄 처리 / 보안처리를 할 대 procedure를 이용한다
--------------------------------------------------------------------------------

-- select
-- Out 값 받는 변수 앞에 쓴다
CREATE or REPLACE PROCEDURE studentSelect(
   pHakbun student.hakbun%TYPE,
   pName Out student.name%TYPE,
   pKor Out student.kor%TYPE,
   pEng Out student.eng%TYPE,
   pMath Out student.math%TYPE
)
IS
BEGIN
    SELECT name,kor,eng,math INTO pName,pKor,pEng,pMath
    FROM student
    WHERE hakbun=pHakbun;
    
    
end;
/

variable pName varchar2(51);
variable pKor Number(3);
variable pEng Number(3);
variable pMath Number(3);

execute studentSelect(1,:pName,:pKor,:pEng,:pMath); --  -> :를 붙여야 주소값을 입력하겠다는 명령어
print pName;
print pKor;
print pEng;
print pMath;