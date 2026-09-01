# 🗄️ Oracle 스터디 정리

## 📌 목차

- [x] Chapter01~02 : 데이터베이스 개념, SQL 종류, 테이블/JOIN/PK
- [x] Chapter03 : 함수 (문자함수·숫자함수·날짜함수·변환함수·기타함수), GROUP BY·HAVING
- [ ] Chapter04 : SUBQUERY
- [ ] PL/SQL : FUNCTION · PROCEDURE · TRIGGER
- [ ] JDBC 연동 프로젝트

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
