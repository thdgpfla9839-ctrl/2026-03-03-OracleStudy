-- PUNCTION 연습
CREATE TABLE STUDENT(
             hakbun NUMBER PRIMARY KEY,
             name VARCHAR2(51) NOT NULL,
             kor NUMBER(3),
             eng NUMBER(3),
             math NUMBER(3)
);

CREATE SEQUENCE std_seq
             START WITH 1
             INCREMENT BY 1
             NOCACHE
             NOCYCLE;
             
             
INSERT INTO STUDENT VALUES (std_seq.nextval,'김',90,88,77);             
INSERT INTO STUDENT VALUES (std_seq.nextval,'나',80,88,47);
INSERT INTO STUDENT VALUES (std_seq.nextval,'다',80,88,67);
INSERT INTO STUDENT VALUES (std_seq.nextval,'라',60,68,67);
INSERT INTO STUDENT VALUES (std_seq.nextval,'마',50,58,27);
COMMIT;

/*
punction의 형식
CREATE [or replace] FUNCTION func_name(매개변수)
RETURN 데이터형(NUMBER, VARCHAR2, CLOB, DATE)

IS 
   지역변수
BEGIN
    기능 처리
    RETURN 값  -> 여기 값이랑 위에 데이터형이랑 일치 시켜야함/ 리턴에 지정된 데이터형과 일치
    
END;    
*/

SELECT hakbun,name,kor,eng,math,(kor+eng+math) "total",
       ROUND ((kor+eng+math)/3.0,2)"avg"
FROM student;
-- column 단위 어쩌구 주석추가학디

-- 함수로 구현
CREATE OR REPLACE FUNCTION studentTotal(
     pHakbun student.hakbun%TYPE
) RETURN NUMBER
IS
   pSum NUMBER;
BEGIN
   SELECT kor+eng+math INTO pSum
   FROM student
   WHERE hakbun=phakbun;
   RETURN pSum;
END;
/

CREATE OR REPLACE FUNCTION studentAvg(
     pHakbun student.hakbun%TYPE
) RETURN NUMBER
IS
  pAvg NUMBER;
BEGIN
   SELECT ROUND ((kor+eng+math)/3.0,2) INTO pAvg
   FROM student
   WHERE hakbun=phakbun;
   RETURN pAvg;
END;
/

SELECT hakbun, name, kor, eng, math,studentTotal(hakbun)
FROM student;
-- 계산식에서 많이 사용


-- join에서 처리
-- 오라클 조인 보다는 안시조인을 써라 -> sql튜닝의 기본
SELECT empno, ename, hiredate, job, sal, dname, loc
FROM emp JOIN dept
ON emp.deptno = dept.deptno
ORDER BY sal DESC;

-- 조인에 함수이용
create or replace function deptGetDname(
    p_dept_no dept.deptno%type
)return varchar2
is
 p_dname dept.dname%type;
begin
    select dname into p_dname from dept where deptno = p_dept_no;
    return p_dname;
end;
/

-- 변환
-- 스칼라 서브쿼리 
SELECT empno,ename,job,hiredate,sal,deptGetDname(deptno)
FROM emp;
------------------------------------------------------------------------------

SELECT * FROM orders;

CREATE OR REPLACE FUNCTION ordersGetData(
    pCustId orders.custid%TYPE
)RETURN VARCHAR2
IS
  pName customer.name%TYPE;
BEGIN
  SELECT  name INTO pName
  FROM customer
  WHERE custid=pCustid;
  RETURN pName;
END;
/

SELECT orderid, orderSGetData(custid),bookid,orderdate
FROM orders;

-----------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION dataChange(
     pEmpno emp.empno%TYPE
)
---------------------------------------------------------------------------------

-- 삭제
-- Drop Function 

-- 생성 : create function
-- 삭제 : drop function func_name
-- 수정 : create or replace function

-- row 단위 계산
-- join / 스칼라 서브쿼리

-- 데이터변환
---> insert  뒤에서 호출 / return 값을 가지고 있어야 함
---> insert / update / delete

-- 함수 재사용 -> 반복적인 sql문장이 있는 경우에 사용

