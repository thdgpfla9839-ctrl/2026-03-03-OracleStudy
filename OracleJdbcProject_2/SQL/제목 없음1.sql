--TO_DATE
SELECT TO_DATE('2026-04-15','YYYY-MM-DD') FROM DUAL;
SELECT TO_DATE('20260415','YYYYMMDD') FROM DUAL;
SELECT TO_DATE('04-15-2026','MM-DD-YYYY') FROM DUAL;
SELECT TO_DATE('2026-04-15 14:14:49','YYYY-MM-DD HH24:MI:SS') FROM DUAL;

--한글이 들어갈 때는 큰따옴표를 사용해야 에러가 안 남
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY"년" MM"월" DD"일"') FROM DUAL;

--DATE형식으로 바꾼 다음 +5를 해줘야 오류가 안 남
--날짜를 계산할 때는 문자열을 DATE형으로 바꾸고 +,- 해주면 됨
SELECT TO_DATE('2026-04-10','YYYY-MM-DD')+5 FROM DUAL;
--예약 며칠 남았는지 알림 보낼 때 -를 붙인다

--NVL NULL 대체
SELECT * FROM EMP;
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,NVL(comm,0)AS comm,DEPTNO FROM EMP;

--COMM이 NULL값이면 성과급이 없음
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,NVL(TO_CHAR(comm),'성과급없음')AS comm,DEPTNO FROM EMP;

--CASE
SELECT ENAME,DEPTNO,SAL, 
       CASE 
       DEPTNO WHEN 10 THEN SAL*0.1 WHEN 20 THEN SAL*0.2
              WHEN 30 THEN SAL*0.3 
              ELSE 0 END AS BUNUS 
FROM EMP;
--CASE
SELECT ENAME, HIREDATE, 
      CASE
      WHEN HIREDATE<TO_DATE('1982-02-02','YYYY-MM-DD') THEN 'OLD'
      ELSE 'NEW'
      END AS TYPE 
FROM EMP;

--GROUP BY
SELECT COUNT(*) "인원수",
       SUM(SAL) "급여 총합",
       AVG(SAL) "급여 평균",
       MAX(SAL) "최고 급여",
       MIN(SAL) "최하 급여"
FROM EMP
WHERE DEPTNO=10;

SELECT COUNT(*) "인원수",
       SUM(SAL) "급여 총합",
       AVG(SAL) "급여 평균",
       MAX(SAL) "최고 급여",
       MIN(SAL) "최하 급여"
FROM EMP
WHERE DEPTNO=20;

SELECT COUNT(*) "인원수",
       SUM(SAL) "급여 총합",
       AVG(SAL) "급여 평균",
       MAX(SAL) "최고 급여",
       MIN(SAL) "최하 급여"
FROM EMP
WHERE DEPTNO=30;


SELECT * FROM EMP
ORDER BY DEPTNO ASC;

--GROUP BY 해버림
SELECT DEPTNO,
       COUNT(*) "인원수",
       SUM(SAL) "급여 총합",
       AVG(SAL) "급여 평균",
       MAX(SAL) "최고 급여",
       MIN(SAL) "최하 급여"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO ASC;

--년도별
SELECT HIREDATE,
       COUNT(*) "인원수",
       SUM(SAL) "급여 총합",
       AVG(SAL) "급여 평균",
       MAX(SAL) "최고 급여",
       MIN(SAL) "최하 급여"
FROM EMP
GROUP BY HIREDATE
ORDER BY HIREDATE ASC;

--요일별
SELECT TO_CHAR (HIREDATE,'MM'),
       COUNT(*) "인원수",
       SUM(SAL) "급여 총합",
       AVG(SAL) "급여 평균",
       MAX(SAL) "최고 급여",
       MIN(SAL) "최하 급여"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'MM')
ORDER BY TO_CHAR(HIREDATE,'MM')ASC;

--직위 => 관리자페이지 / 마이 페이지
SELECT JOB,
       COUNT(*) "인원수",
       SUM(SAL) "급여 총합",
       AVG(SAL) "급여 평균",
       MAX(SAL) "최고 급여",
       MIN(SAL) "최하 급여"
FROM EMP
GROUP BY JOB
ORDER BY JOB ASC;

--두개를 그룹(복합 컬럼)
SELECT DEPTNO,JOB,
       COUNT(*) "인원수",
       SUM(SAL) "급여 총합",
       AVG(SAL) "급여 평균",
       MAX(SAL) "최고 급여",
       MIN(SAL) "최하 급여"
FROM EMP
GROUP BY DEPTNO,JOB
ORDER BY DEPTNO,JOB ASC;


--HAVING은 집계함수를 이용해서 조건을 준다
SELECT DEPTNO,SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL)>=5000;

