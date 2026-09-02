# 🗄️ Oracle 스터디 정리

## 📌 목차

- [x] Chapter01~02 : 데이터베이스 개념, SQL 종류, 테이블/JOIN/PK
- [x] Chapter03 : 함수 (문자함수·숫자함수·날짜함수·변환함수·기타함수), GROUP BY·HAVING
- [x] Chapter04 : SUBQUERY
- [x] Chapter05 : DDL 상세 (테이블 생성규칙 · 데이터형 · 제약조건)
- [x] JDBC 연동 프로젝트

> 아래 각 항목을 클릭하면 상세 내용이 펼쳐집니다.

---

<details>
<summary><b>Chapter01~02. 데이터베이스 개념 · SQL 종류 · 테이블 · JOIN · PK</b></summary>

### 1. 데이터베이스란

관련된 데이터들을 모아서 쉽게 관리할 수 있게 해주는 것. 데이터는 종류별로 모아서 **테이블**로 관리한다.

```plain text
비유) 도서관 : 책 = 데이터,  책장 = 테이블,  도서관 전체 = 데이터베이스
비유) 회사   : 데이터베이스 = 패키지,  사원 = 데이터(VO),  근무처 = 테이블(클래스)
```

**데이터베이스 시스템 구성**

```plain text
사용자 응용프로그램(자바)
        |
      오라클      -- DBMS: 오라클/MySQL/MariaDB 같은 시스템, 저장은 안 함(연결 역할)
        |
      운영체제
        |
     하드디스크    -- 실제 저장 위치
```

**데이터베이스의 특징**
- 실시간 접근: 오라클은 계속 서버가 구동되고 있어야 하며, 사용자가 요청할 때마다 찾아준다
- 계속적인 변화: 추가(INSERT), 수정(UPDATE), 삭제(DELETE) 가능
- 동시 공유: 모든 사용자가 같은 데이터를 함께 사용
- 내용에 따른 참조: `ROWID`, `ROWNUM`으로 INSERT할 때마다 오라클이 자동 설정

### 2. SQL의 종류

| 종류 | 의미 | 명령어 |
|---|---|---|
| DQL | 데이터 검색 | `SELECT` (JOIN, SUBQUERY 포함) |
| DML | 데이터 조작 | `INSERT`, `UPDATE`, `DELETE` |
| DDL | 테이블 정의 | `CREATE`, `ALTER`, `DROP`, `RENAME`, `TRUNCATE` |
| DCL | 권한 관련 | `GRANT`(권한 부여), `REVOKE`(권한 해제) |
| TCL | 저장 관련 | `COMMIT`, `ROLLBACK` |

> DQL + DML을 합쳐서 **CRUD**라고 부르며, 웹 개발자가 주로 사용하는 영역이다. DDL·DCL은 주로 DBA(데이터베이스 관리자)가 사용한다.

### 3. 오라클 자료형

| 자료형 | 의미 | 자바 대응 |
|---|---|---|
| `NUMBER` | 숫자 | `int` |
| `VARCHAR2(숫자)` | 문자열 — 괄호 안 숫자는 최대 글자수 | `String` |
| `DATE` | 날짜/시간 | - |
| `CLOB` | 긴 문자열(게시물 본글 등) | - |

### 4. 테이블 생성 · 데이터 입력 · 조회

```sql
-- 테이블 생성
CREATE TABLE emp (
    empno   NUMBER PRIMARY KEY,      -- 사원 ID (PK)
    ename   VARCHAR(50) NOT NULL,    -- 사원 이름
    job     VARCHAR(50) NOT NULL,    -- 직급
    hiredate DATE NOT NULL,          -- 입사일
    sal     NUMBER(10,2) NOT NULL,   -- 급여
    deptno  NUMBER NOT NULL          -- 부서 ID
);

-- 데이터 넣기 (숫자는 그대로, 문자열은 '' 필수, 컬럼 순서와 값 순서를 맞춰야 함)
INSERT INTO emp (empno, ename, job, hiredate, sal, deptno)
VALUES (1, '김민준', '사원', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 3000.00, 1);

-- 데이터 조회
SELECT * FROM emp;
```

### 5. JOIN

실무에서는 데이터를 한 테이블에 다 넣지 않는다(부서명이 바뀔 때마다 모든 행을 고쳐야 하고 중복도 늘어남). 그래서 사원 테이블과 부서 테이블처럼 나눠서 관리하다가, 화면에 "이름/부서명"처럼 같이 보여줘야 할 때 **JOIN**으로 테이블끼리 연결한다.

```sql
SELECT *
FROM emp
JOIN dept
ON emp.deptno = dept.deptno;
```

- `JOIN ~` : 테이블 연결 시작
- `ON ~` : 어떤 컬럼을 기준으로 이어붙일지 지정

**별칭(alias)**: 테이블명을 매번 쓰기 번거로우니 줄여서 부르는 것. 한 번 별칭을 쓰면 그 아래로는 계속 별칭으로 작성해야 한다.

```sql
SELECT e.ename, e.sal, d.dname     -- 필요한 컬럼만 선택
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE d.dname = '개발부';           -- JOIN + WHERE로 조건까지 함께 사용
```

> JOIN을 하려면 두 테이블 사이에 공통 컬럼(연결 컬럼, FK)이 있어야 한다.

### 6. PK (Primary Key)

데이터를 구분하는 유일한 번호(기본키, 대표키).

**PK의 특징**
- 중복 불가 — 번호가 중복되면 누가 누구인지 구분이 안 됨
- NULL 불가 — 값이 비어 있으면 그 행이 누구인지 보장할 수 없음

```sql
CREATE TABLE dept (
    deptno NUMBER PRIMARY KEY,   -- deptno를 PK로 지정하면 오라클이 자동으로 중복 금지·NULL 금지 처리
    dname  VARCHAR2(30)
);
```

</details>

<details>
<summary><b>Chapter03. 함수 · 집계함수 · GROUP BY</b></summary>

내장함수(라이브러리)는 크게 **단일행 함수**(row 단위로 계산)와 **집계함수**(컬럼 단위로 계산)로 나뉜다.

### 1. 문자함수

| 함수 | 기능 | 예시 |
|---|---|---|
| `UPPER()` | 대문자로 변환 | `SELECT UPPER(ENAME) FROM EMP;` |
| `LOWER()` | 소문자로 변환 | `SELECT LOWER(EMAIL) FROM MEMBER;` |
| `INITCAP()` | 첫 글자만 대문자로 변환 | `SELECT INITCAP(ENAME) FROM EMP;` |
| `LENGTH()` | 문자열의 글자 수 | `SELECT LENGTH(NAME) FROM BOARD;` |
| `SUBSTR()` | 문자 일부 추출 | `SUBSTR(PHONE,1,3)` |
| `INSTR()` | 문자 위치 찾기(처음 나오는 위치 반환) | `SELECT INSTR('SCOTT','O') FROM EMP;` |
| `REPLACE()` | 특정 문자를 다른 문자로 변경 | `SELECT REPLACE('010-1234-5678','-','') FROM DUAL;` |
| `TRIM()` | 앞뒤 공백 또는 특정 문자 제거 | `SELECT TRIM('  SCOTT  ') FROM dual;` |

**SUBSTR 상세**: `SUBSTR(컬럼명, 시작위치, 글자수)` — 몇 번째 글자부터 몇 글자를 자를지 지정.
- 글자수를 생략하면 시작위치부터 끝까지 추출: `SUBSTR('SCOTT',3)` → 3번째 글자부터 끝까지
- 시작위치에 음수를 주면 뒤에서부터 센다: `SUBSTR('SCOTT',-2)` → 뒤에서 2번째부터 끝까지

**TRIM 상세**: `TRIM(문자열)`은 공백만 제거, `TRIM(제거할문자 FROM 문자열)`은 특정 문자를 제거.
```sql
SELECT TRIM('A' FROM 'AAHELLOAA') FROM dual;  -- HELLO
```

> 문자열은 오라클에서 항상 작은따옴표(`' '`)로 감싸서 작성한다.

### 2. 숫자함수

| 함수 | 기능 | 예시 |
|---|---|---|
| `ROUND(숫자, 자리수)` | 반올림 | `ROUND(123.456, 2)` → `123.46` |
| `TRUNC(숫자, 자리수)` | 소수점 버림 | `TRUNC(123.456, 2)` → `123.45` |
| `MOD(숫자1, 숫자2)` | 숫자1을 숫자2로 나눈 나머지 | `MOD(10, 3)` → `1` |

### 3. 날짜함수

| 함수 | 기능 | 예시 |
|---|---|---|
| `SYSDATE` | 현재 시스템 날짜·시간 반환 | `SELECT SYSDATE FROM dual;` |
| `MONTHS_BETWEEN(날짜1, 날짜2)` | 두 날짜 사이의 개월 수(소수 포함 가능) | `MONTHS_BETWEEN(SYSDATE, hiredate)` |
| `ADD_MONTHS(날짜, 개월수)` | 날짜에 개월 수를 더함(음수 가능 — 음수면 이전 달) | `ADD_MONTHS(SYSDATE, 3)` |
| `NEXT_DAY(날짜, 요일)` | 기준 날짜 이후 가장 가까운 지정 요일 | `NEXT_DAY(SYSDATE,'MONDAY')` |

### 4. 변환함수

| 함수 | 기능 |
|---|---|
| `TO_CHAR` | 숫자·날짜를 문자열로 변환 (숫자 변환 시 `9,999,999` 형식 자주 사용) |
| `TO_NUMBER` | 문자를 숫자로 변환 |
| `TO_DATE` | 문자를 날짜로 변환 (생년월일, 예약날짜 등 문자열 입력을 DATE로 바꿀 때) |

### 5. NULL 처리 함수

| 함수 | 기능 | 예시 |
|---|---|---|
| `NVL(값, 대체값)` | 값이 NULL이면 대체값으로 출력 | `NVL(comm,0)` → comm이 NULL이면 0 |
| `NVL2(값, NULL아닐때값, NULL일때값)` | NULL 여부에 따라 다른 값 출력 | `NVL2(comm,'있음','없음')` |
| `COALESCE(값1, 값2, 값3...)` | NULL이 아닌 첫 번째 값 반환 | `COALESCE(phone, mobile, '없음')` |

### 6. 조건함수 (오라클 전용)

**CASE**: 조건을 다양하게(`<`, `>`, `BETWEEN ~ AND` 등) 사용할 수 있음

```sql
CASE
    WHEN 조건 THEN 값
    WHEN 조건 THEN 값
    ELSE 값
END AS 별칭
```

**DECODE vs CASE**

| 구분 | DECODE | CASE |
|---|---|---|
| 조건 처리 | 단순 값 비교(`=`) | 모든 조건 연산(`<`,`>`,`BETWEEN` 등 복잡한 조건 가능) |
| 가독성 | 낮음 | 높음 |

### 7. 집계함수

컬럼(column) 단위로 계산하는 함수. `GROUP BY`와 함께 자주 사용한다.

| 함수 | 기능 | 예시 |
|---|---|---|
| `COUNT()` | 행의 개수 반환(NULL은 세지 않음) | `COUNT(*)` → 전체 행, `COUNT(comm)` → comm이 NULL 아닌 행 수 |
| `SUM()` | 숫자 컬럼의 총합 | `SUM(sal)` |
| `AVG()` | 숫자 컬럼의 평균 | `AVG(sal)` |
| `MAX()` | 가장 큰 값 | `MAX(sal)` → 가장 높은 급여 |
| `MIN()` | 가장 작은 값 | `MIN(sal)` → 가장 낮은 급여 |

```sql
SELECT COUNT(*) FROM emp;        -- emp 테이블 전체 행 개수
SELECT COUNT(comm) FROM emp;     -- comm 값이 NULL이 아닌 행 개수
SELECT SUM(sal) FROM emp;
```

### 8. GROUP BY / HAVING

- **GROUP BY**: 같은 값을 가진 컬럼을 그룹화시켜서 따로 처리되게 만든다. 집계함수를 이용할 때 사용한다.
- **HAVING**: 그룹화된 결과에 조건을 거는 절.

**SQL 동작 순서**: `FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY`

</details>

<details>
<summary><b>Chapter04. SUBQUERY(서브쿼리)</b></summary>

### 1. 서브쿼리란

SQL 문장 여러 개를 한 번에 처리하기 위해, 쿼리 안에 또 다른 쿼리(SELECT문)를 넣어서 결과를 통합하는 것.

```sql
-- 예제) 급여가 전체 평균보다 작은 사원의 정보를 출력

-- 1) 평균부터 구하기
SELECT avg(sal) FROM emp;   -- 결과: 2073

-- 2) 그 값을 조건에 대입
SELECT * FROM emp WHERE sal < 2073;

-- 3) 두 단계를 서브쿼리로 한 번에 처리
SELECT *
FROM emp
WHERE sal < (SELECT avg(sal) FROM emp);
```

> 실행 순서는 항상 **서브쿼리 실행 → 결과값 전송 → 메인쿼리 실행** 순이다. 괄호 안(서브쿼리)의 결과값은 1개일 수도, 여러 개일 수도 있다.

**종류**

| 구분 | 의미 |
|---|---|
| 단일행 서브쿼리 | 서브쿼리 결과가 1개인 경우 — 일반 비교연산자(`=`, `<`, `>`)로 처리 |
| 다중행 서브쿼리 | 서브쿼리 결과가 여러 개인 경우 — `IN`, `ANY`, `ALL` 등으로 처리 |
| 다중 컬럼 서브쿼리 | 비교할 컬럼이 여러 개인 경우 — `(col1, col2)` 형태 (실무에서는 잘 안 씀) |

### 2. 단일행 서브쿼리

```sql
-- SCOTT가 근무하는 부서의 동료명단 출력하기
SELECT *
FROM emp
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE ename = 'SCOTT');

-- 급여를 가장 많이 받는 사원과 같은 부서의 사원 목록 출력하기 (서브쿼리 중첩)
SELECT *
FROM emp
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE sal = (SELECT max(sal) FROM emp));
```

> 서브쿼리를 안 쓰면 "최고 급여 조회 → 그 사람 부서 조회 → 그 부서 사원 조회" 이렇게 SQL 문장을 3개나 따로 실행해야 하는데, 서브쿼리로 한 번에 처리할 수 있다.

### 3. 다중행 서브쿼리

서브쿼리 결과가 여러 개일 때 처리하는 방법 세 가지가 있다.

| 방법 | 의미 |
|---|---|
| `IN` | 결과 전체를 대입해서 비교 (예: 10,20,30 → `in(10,20,30)`) |
| `ANY` / `SOME` | 부등호 방향에 따라 최솟값 또는 최댓값 기준으로 비교 (둘은 동일하게 동작) |
| `ALL` | 부등호 방향에 따라 최댓값 또는 최솟값 기준으로 비교 |

```sql
SELECT * FROM emp
WHERE deptno IN (SELECT DISTINCT deptno FROM emp);

SELECT * FROM emp
WHERE deptno > ANY (SELECT DISTINCT deptno FROM emp);  -- 최솟값(10)보다 큰 것

SELECT * FROM emp
WHERE deptno < ALL (SELECT DISTINCT deptno FROM emp);  -- 최솟값(10)보다 작은 것
```

> `ANY`/`ALL`은 부등호 방향에 따라 헷갈리기 쉬워서, 가독성을 위해 실무에서는 `MAX()`/`MIN()`을 직접 써서 처리하는 걸 더 선호한다.

```sql
-- ANY/ALL 대신 MAX/MIN으로 명확하게
SELECT * FROM emp WHERE deptno < (SELECT MAX(deptno) FROM emp);
SELECT * FROM emp WHERE deptno > (SELECT MIN(deptno) FROM emp);
```

**활용 예시**

```sql
-- 도서를 구매한 적 있는 고객의 이름 출력 (다중행 서브쿼리)
SELECT name
FROM customer
WHERE custid IN (SELECT DISTINCT custid FROM orders);

-- 대한미디어에서 출판한 도서를 구매한 고객의 이름 출력 (서브쿼리 다중 중첩)
SELECT name
FROM customer
WHERE custid = (SELECT custid
                FROM orders
                WHERE bookid IN (SELECT bookid
                                 FROM book
                                 WHERE publisher = '대한미디어'));
```

> 서브쿼리는 테이블이 달라도 사용할 수 있다 — 꼭 같은 테이블끼리만 서브쿼리를 쓸 수 있는 게 아니다.

### 4. ROWNUM / EXISTS

```sql
-- ROWNUM으로 상위 N개만 출력 (급여가 가장 많은 5명)
SELECT empno, ename, job, hiredate, sal, rownum
FROM (SELECT * FROM emp ORDER BY sal DESC)
WHERE rownum <= 5;
```

**EXISTS**: row가 존재하는지 여부만 확인(true/false). 값 자체를 가져오는 게 아니라 존재 확인만 하기 때문에 속도가 빠르다.

```sql
-- 부하직원이 있는 사원 출력
SELECT ename
FROM emp e                          -- 서브쿼리 속 emp와 구분하기 위해 별칭 사용
WHERE EXISTS (SELECT 1
              FROM emp
              WHERE mgr = e.empno);

-- 도서를 구매한 적 있는 고객 (IN 대신 EXISTS로 처리)
SELECT name, address
FROM customer cs
WHERE EXISTS (SELECT *
              FROM orders os
              WHERE cs.custid = os.custid);
```

### 5. 서브쿼리 vs JOIN — 요약

| 구분 | 의미 |
|---|---|
| JOIN | 테이블 + 테이블을 연결 → **컬럼을 확장**하는 것 |
| 서브쿼리 | SQL + SQL을 하나로 통합 → **쿼리 안의 결과값을 가져와서** 사용하는 것 |

**서브쿼리 종류 최종 정리**
- 단일행 서브쿼리: 결과 1개, 비교연산자(`=`) 기준
- 다중행 서브쿼리: 결과 여러 개, `IN`으로 집합 비교
- 다중 컬럼 서브쿼리: `(col1, col2)` 복합조건 — 실무에서는 잘 사용하지 않음
- `EXISTS`: 존재 여부만 체크 — 속도가 빠름

</details>

<details>
<summary><b>Chapter05. DDL 상세 · 데이터형 · 제약조건</b></summary>

### 1. DDL 명령어 정리

| 명령어 | 기능 |
|---|---|
| `CREATE TABLE` | 테이블(저장 공간) 생성 |
| `CREATE SEQUENCE` | 자동 증가 번호 생성 (예: 게시판 고유번호) |
| `CREATE VIEW` | 가상 테이블 생성 (테이블 안에 SELECT문 결과가 저장됨) |
| `CREATE INDEX` | 검색 최적화·정렬 역할 |
| `ALTER` | 컬럼 추가/수정/삭제 (`ADD`/`MODIFY`/`DROP`) |
| `DROP` | 테이블 전체 삭제 (파일 자체가 사라짐) |
| `RENAME` | 테이블 이름 변경 |
| `TRUNCATE` | 테이블은 유지하고 데이터만 삭제 |

> DDL은 실행하면 **AutoCommit**이라 자동으로 저장(반영)된다.

**테이블/컬럼 이름 규칙**
- 문자(알파벳·한글)로 시작 — 단 AWS 서버가 리눅스일 경우 한글이 깨질 수 있어 알파벳 사용을 권장
- 이름 길이는 30바이트까지 가능(한글 기준 약 10글자), 실무에서는 보통 7~15자 사용
- 같은 데이터베이스 안에서 테이블명은 유일해야 함
- `SELECT`, `ORDER`, `BY` 같은 키워드는 이름으로 사용 불가
- 숫자 사용 가능(단, 맨 앞에는 불가), 특수문자는 `_`, `$`만 가능

```sql
CREATE TABLE table_name (
    컬럼명 데이터형 [제약조건],
    컬럼명 데이터형 [제약조건]
);
```

### 2. 오라클 데이터형

**문자형**

| 자료형 | 특징 |
|---|---|
| `CHAR` | 고정 길이(1~2000바이트) — 지정한 크기만큼 저장되고 남는 공간은 공백 처리. 성별처럼 항상 같은 길이의 값에 사용 |
| `VARCHAR2` | 가변 길이(1~4000바이트) — 입력된 글자 수만큼만 메모리 할당(공백 낭비 없음). 문자열 저장 시 가장 많이 사용, 반드시 길이를 지정해야 함 |
| `CLOB` | 가변, 최대 4GB — 자기소개, 게시판 본문처럼 글자 수가 많은 경우 |

**숫자형**

| 자료형 | 특징 |
|---|---|
| `NUMBER` | 기본값 `NUMBER(8,2)`(정수 8자리, 소수 2자리). 최대 `NUMBER(38,128)`까지 사용 가능. `NUMBER(10,2)`는 소수점 2자리를 빼고 정수부는 8자리까지 사용 가능 |

**날짜형**

| 자료형 | 특징 |
|---|---|
| `DATE` | `SYSDATE`와 함께 사용, 자바의 `java.util.Date`와 매칭 |
| `TIMESTAMP` | 기록 경과 시간 등에 사용 |

**기타(파일)**

| 자료형 | 특징 |
|---|---|
| `BFILE` | 최대 4GB, 파일 형식으로 저장 |
| `BLOB` | 최대 4GB, binary 형식 저장, 자바에서는 `InputStream`으로 받음 |

**자바 자료형과의 매칭**

| Oracle | Java |
|---|---|
| `CHAR`, `VARCHAR2`, `CLOB` | `String` |
| `NUMBER` | `int`, `double` |
| `DATE` | `java.util.Date` |
| `BFILE`, `BLOB` | `InputStream` |

### 3. 제약조건 (Constraint)

데이터가 규칙에 맞게 저장되도록(정형화되도록) 컬럼에 거는 규칙. 한 컬럼에 여러 개의 제약조건을 걸 수도 있다.

**데이터 정형화 수준**

| 구분 | 설명 |
|---|---|
| 정형화된 데이터 | 규칙에 맞게 저장되어 바로 사용 가능 — 데이터베이스에서 주로 다루는 형태 |
| 반정형화 데이터 | XML/HTML/JSON처럼 구분은 되어 있음 — 크롤링하기 좋은 형태 |
| 비정형화 데이터 | 구분·규칙이 없는 데이터(SNS에 올라오는 데이터 등) — 분석 후 필요한 부분만 정형화하여 사용 |

**제약조건 종류**

| 제약조건 | 의미 |
|---|---|
| `NOT NULL` | 반드시 값이 입력되어야 함 (예: `name VARCHAR2(20) NOT NULL`) |
| `UNIQUE` | 중복 없는 값(NULL은 허용) — 이메일, 전화번호 같은 후보키에 사용 |
| `PRIMARY KEY` | `NOT NULL` + `UNIQUE` — 행을 구분하는 대표키, 테이블당 반드시 1개 이상 설정 |
| 외래키(FK) | 다른 테이블과 연결할 때 사용, 반드시 그 테이블의 `PRIMARY KEY`와 연결되어야 함 |
| `CHECK` | 지정된 값만 입력되도록 제한 (라디오버튼·콤보박스처럼 정해진 값만 받는 부서명, 근무지, 장르 등에 사용) |
| `DEFAULT` | 제약조건은 아니지만, 값을 입력하지 않았을 때 자동으로 들어갈 기본값 지정 (예: `regdate DATE DEFAULT SYSDATE`, `hit NUMBER DEFAULT 0`) |

</details>

<details>
<summary><b>JDBC 연동 프로젝트</b></summary>

### 1. JDBC란

자바 프로그램에서 오라클(데이터베이스)에 접속해서 SQL을 전송하고 결과를 받아오기 위한 연결 방식.

```java
private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
// thin : 연결만 해주는 드라이버(무료)

public FoodDAO() {
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");  // 드라이버 설정 - 최초 한 번만
    } catch (Exception ex) {
        ex.printStackTrace();
    }
}
```

**필요한 객체**

| 객체 | 역할 |
|---|---|
| `Connection` | 오라클과의 연결 객체 |
| `PreparedStatement` | SQL 문장을 오라클로 전송(송수신) |
| `ResultSet` | `SELECT` 실행 결과(조회 데이터)를 받는 객체 |

```java
private Connection conn;
private PreparedStatement ps;

public void getConnection() {
    try {
        conn = DriverManager.getConnection(URL, "hr", "happy");
    } catch (Exception ex) {}
}

public void disConnection() {
    try {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    } catch (Exception ex) {}
}
```

> 한 사람(요청)당 1개의 Connection을 사용하고, 처리가 끝나면 반드시 `close()`로 닫아줘야 한다.

### 2. VO (Value Object)

테이블의 컬럼을 그대로 자바 변수로 옮겨 담는 클래스. 컬럼 하나 = 변수 하나로 매핑한다.

```java
// NO NAME TYPE PHONE ADDRESS SCORE PARKING POSTER TIME CONTENT THEME PRICE
@Data                       // lombok - getter/setter 자동 생성
public class FoodVO {
    private int no;
    private String name, type, phone, address, parking,
            poster, time, content, theme, price;
    private double score;
}
```

### 3. DAO (Data Access Object)

사용자의 요청을 받아서 실제로 오라클에 연결하고 SQL을 처리하는 클래스. 한 프로젝트에서 DAO 객체를 하나만 쓰도록 **싱글턴 패턴**으로 관리한다.

```java
private static FoodDAO dao;  // 싱글턴

public static FoodDAO newInstance() {
    if (dao == null)
        dao = new FoodDAO();
    return dao;
}
```

**INSERT 처리**

```java
public void foodInsert(FoodVO vo) {
    try {
        getConnection();                         // 1. 연결
        String sql = "INSERT INTO food VALUES(" +
                     "?,?,?,?,?,?,?,?,?,?,?,?)";  // 2. SQL 문장(? = 자리표시자)
        ps = conn.prepareStatement(sql);
        ps.setInt(1, vo.getNo());                // 3. ?에 값 채우기
        ps.setString(2, vo.getName());
        ps.setString(3, vo.getType());
        // ... 나머지 컬럼도 순서대로 set
        ps.executeUpdate();                       // 4. 실행 (commit)
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        disConnection();                          // 5. 연결 닫기
    }
}
```

**SELECT 처리 (검색 결과를 리스트로 반환)**

```java
public List<FoodVO> foodFindData(String type) {
    List<FoodVO> list = new ArrayList<FoodVO>();
    try {
        getConnection();
        String sql = "SELECT no,name,type,address,phone " +
                     "FROM food " +
                     "WHERE type LIKE '%" + type + "%'" +
                     "ORDER BY no ASC";
        ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();          // 실행 후 결과값을 받아옴
        while (rs.next()) {
            FoodVO vo = new FoodVO();
            vo.setNo(rs.getInt(1));                // 컬럼 순서대로 값 추출
            vo.setName(rs.getString(2));
            vo.setType(rs.getString(3));
            vo.setAddress(rs.getString(4));
            vo.setPhone(rs.getString(5));
            list.add(vo);                          // VO를 하나씩 리스트에 담음
        }
        rs.close();
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        disConnection();
    }
    return list;
}
```

**흐름 정리**

```plain text
사용자 요청 → DAO(getConnection) → PreparedStatement로 SQL 전송
   → INSERT/UPDATE/DELETE는 executeUpdate() / SELECT는 executeQuery()
   → SELECT 결과는 ResultSet에 담겨 오고, rs.next()로 한 행씩 꺼내 VO에 담아 List로 반환
   → 작업이 끝나면 disConnection()으로 자원 반납
```

</details>
