SELECT LENGTH('ABC'),LENGTH('홍길동'),LENGTHB('홍길동'),LENGTHB('ABC')
FROM DUAL;
SELECT ename,UPPER(ename),LOWER(ename),INITCAP(ename)
FROM emp;
--실제는 자바에서 조절 toUpperCase()
SELECT * FROM emp
WHERE ename=UPPER('scott');

--repalce
SELECT 'Hello Java',REPLACE('Hello Java','a','b')
FROM DUAL;
SELECT 'Hello Java',REPLACE('Hello Java','Java','Oracle')
FROM DUAL;
--TRIM
SELECT ' Hello Oracle', LTRIM(' Hello Oracle ')
FROM DUAL;
SELECT ' Hello Oracle', RTRIM(' Hello Oracle ')
FROM DUAL;
--LTRIM을 이용해 지정한 문자제거
SELECT 'aaaaaHello Oracleaaaaaaaa', LTRIM('aaaaaHello Oracleaaaaaaaa','a')
FROM DUAL;
--RTIM 
SELECT 'HTML Hello Oracle HTML', RTRIM('HTML Hello Oracle HTML','HTML')
FROM DUAL;
--TRIM은 괄호 첫번째에는 제거할 문자를 반드시 써야하고 하나의 문자만 가능해 문자열은 안 돼
--좌우로 연속된 부분까지 지워지는 거야 aaaaaaHELLO ORAaaba 이러면 뒤에는 b뒤에 a만 제거돼
SELECT 'aaaaaaaHello Oracleaaaaaaaaa',TRIM('a' FROM 'aaaaaaaHello Oracleaaaaaaaaa')
FROM DUAL;
SELECT 'aaaaaaaHello Oracleaaaaaaaaa',TRIM('      HTML Hello Oracle HTML     ')
FROM DUAL;
--ASCII / CHR
SELECT ASCII ('A'),CHR(65)
FROM DUAL;

SELECT hiredate
FROM emp
WHERE SUBSTR(hiredate,1,2)=81;
--날짜는 저장 문자열 형식으로 저장
SELECT hiredate
FROM emp
WHERE hiredate LIKE '81%';

--SUBSTR
SELECT SUBSTR ('ORACLE',1,3) FROM DUAL;

SELECT SUBSTR ('ORACLE',3,2) FROM DUAL;

--사람 이름은 ENAME / EMP 
--사람이름은 KING =>KI**로 나오게

--첫번째는 내가 시도한 문장
SELECT ename FROM emp;

--문제의 정답
--이름명단을 불러와 그리고 뒤에 두글자를 잘라야하고 나머지는 이름만큼 *를 줘라
SELECT ename , RPAD(SUBSTR(ename,1,2),LENGTH(ename),'*')
FROM emp;

--INSTR
SELECT INSTR('Hello Java','a',1,1)
FROM DUAL;
SELECT INSTR('Hello Java','a',1,2)
FROM DUAL;
--뒤에서부터 찾을때는 -를 붙이면 된다
SELECT INSTR('Hello Java','a',-1,2)
FROM DUAL;

--CONCAT
SELECT CONCAT ('HELLO ','ORACLE') FROM DUAL;
--여기까지 문자함수의 종류

--응용
SELECT ename,hiredate,sal FROM emp 
WHERE ename LIKE ('o',1,1)=3;

SELECT ename,hiredate,sal FROM emp
WHERE INSTR(ename,'o')=3;

--사원중에 사번이 짝수인 사람만 출력
SELECT * FROM emp where mod(empno,2)=0;

--round
--사원 급여의 평균
SELECT ceil(avg(sal)) from emp;
SELECT round(avg(sal),2) from emp;
SELECT trunc(avg(sal),2) from emp;

SELECT ename,months_between(sysdate,hiredate) from emp;

--sysdate 오늘 날짜 출력
-- -1은 어제 날짜 / +1은 내일 날짜
SELECT sysdate-1 from dual;

--last_day
SELECT last_day(sysdate) from dual;
select last_day('26/02/01') from dual;

--next_day
select next_day(sysdate,'수') from dual;

--add_months : 개월 수 추가
--오늘부터 6개월 후의 날짜는
select add_months(sysdate,6) from dual;

--L(대문자)를 입력하면 한화로 단위가 출력이 된다
SELECT ENAME,TO_CHAR(SAL,'$999,999') FROM EMP;

SELECT HIREDATE,TO_CHAR(HIREDATE,'YYYY/MM/DD HH24:MI:SS DAY') FROM EMP;
SELECT HIREDATE,TO_CHAR(HIREDATE,'YYYY/MM/DD HH24:MI:SS DAY') FROM EMP;

--테이블명 변경
rename emp to emp2;
