# 2026-03-03-OracleStudy
# 🗄️ Oracle 스터디 정리

## 📌 목차

- [x] Chapter01~02 : 데이터베이스 개념, SQL 종류, 테이블/JOIN/PK
- [ ] Chapter03 : 함수 (문자함수·숫자함수·날짜함수·변환함수·기타함수), GROUP BY·HAVING
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
