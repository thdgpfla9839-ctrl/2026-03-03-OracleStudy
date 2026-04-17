--4.16 
--JOIN
select * FROM customer;
SELECT * FROM book;
SELECT * FROM orders;

--같은 컬럼이면 반드시 구분한다
--bookid를 구분해줘야돼
select orderid,name,orders.bookid,bookname,saleprice,orderdate
from orders,customer,book
where orders.custid=customer.custid
and orders.bookid=book.bookid;

select * FROM emp; --사원 정보
select *FROM dept; --부서 정보
--오라클 조인
SELECT empno,ename,job,hiredate,sal,dname,loc
from emp,dept
where emp.deptno=dept.deptno;

--ANSI 조인(표준화된 조인)
SELECT empno,ename,job,hiredate,sal,dname,loc
from emp join dept --INNER는 디폴트라 생략이 돼있음 원래는 INNER JOIN임
on emp.deptno=dept.deptno; -- 이너조인 증 이큐이조인인 동등 조인이 사용됨

--자연 조인
SELECT empno,ename,job,hiredate,sal,dname,loc
from emp natural join dept;
-- 자연조인은 조건을 걸지 않은다

--JOIN USING
SELECT empno,ename,job,hiredate,sal,dname,loc
from emp join dept using(deptno); -- 괄호 안에는 동일하게 쓰는 컬럼명이 들어가야 한다

--salgrade 테이블 만들기
create table salgrade(
   grade number,
   losal number,
   hisal number
   );
   INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

commit;

--오라클 조인
SELECT empno,ename,sal,job,hiredate,grade
from emp e,salgrade s --별칭사용
where sal between losal and hisal;

--안시조인 (JOIN ~ ON(조건문) )
SELECT empno,ename,sal,job,hiredate,grade
from emp e join salgrade s
on sal between losal and hisal;

-- 이름 , 직위, 입사일, 급여, 사번,/ 부서명, 근무지/, 급여등급을 출력 => 테이블 3개 동시연결
SELECT empno,ename,job,hiredate,sal,dname,loc,grade
from emp,dept,salgrade -- 테이블 세가지
where emp.deptno = dept.deptno
and sal BETWEEN losal and hisal; -- 조인조건 두개

--안시조인
SELECT empno,ename,job,hiredate,sal,dname,loc,grade
from emp join dept 
on emp.deptno = dept.deptno
join salgrade  -- 안시조인에서 조인이 여러개 걸릴 때는 나눠서 이중조인 만들어주기
on sal BETWEEN losal and hisal;

--상세보기
select empno,ename,job,hiredate,sal,comm,dname,loc
from emp, dept
where emp.deptno = dept.deptno --1차 조인(조인 하나만 건다)
and empno=&사번;--or연산자는 오라클에서 안 쓴다

--안시조인
select empno,ename,job,hiredate,sal,comm,dname,loc
from emp join dept
on emp.deptno = dept.deptno 
and empno=&사번;

--테이블의 모든 컬럼 불러오기
select * -- *을 주면 프롬 뒤에 있는 테이블의 컬럼을 모두 가져올 수 있다
from emp join dept
on emp.deptno = dept.deptno 
and empno=&사번;

--한테이블 값 불러오는 방법 => table.*
select emp.*, dname,loc -- 한테이블의 컬럼만 모두 불러오는 방법
from emp join dept
on emp.deptno = dept.deptno 
and empno=&사번;

-- inner join의 null 해결
-- 셀프조인 => 컬럼명이 달라도 조인이 가능하다 / 단 저장된 값만 같으면 조인이 가능해
-- 예) 게시판  --- 댓글  => 게시물 번호로 구분
--    회원정보 --- 예약  => 아이디로 구분(회원정보 통채로 구분해줌) 
--    회원정보 --- 예약 --- 맛집정보 => 예약과 맛집정보는 맛집번호로 구분해줌

select * FROM orders;
SELECT * FROM book;
SELECT * FROM customer;

--self join
SELECT e1.ename "본인", e2.ename "사수"
FROM emp e1, emp e2
where e1.mgr=e2.empno(+); -- null이면 처리가 안되는 경우가 빠졌자농 ->(+) 아우터조인을 해준다

-- 1. ename 과 dname 출력
SELECT distinct deptno FROM emp;
select deptno from dept; -- 누락이 발생할 수 있음 그러므로 아우터 조인 사용

SELECT ename, dname
from emp , dept
where emp.deptno(+) = dept.deptno; 
-- 부서가 더 많은데 다 출력이 안 됐어 테이블 둘 중 어디가 더 출력될게 많은지 기준을 잡아
-- 기준을 잡은 테이블로 레프트일지 롸이트일지 결정한다


-- 다시 보기 right outer join
SELECT ename, dname
from emp right outer join dept
on emp.deptnon= dept.deptno;

-- 다시 보기 left outer join
SELECT ename, dname
from emp left outer join dept
on emp.deptno = dept.deptno;

-------------------------------------------

SELECT * FROM sawon;
update sawon set
deptno = 85
where empno = 1100;

SELECT ename,dname
-- 서버가 돌아가는 동안은 데이터는 임시로 저장됨 완전히 저장하려면 commit 날리면 됨
from sawon,dept
where sawon.deptno = dept.deptno(+) -- outer join
order by empno asc; -- 100명이 있는데 한명이 널값이라 출력이 안됐음
--부서에 85를 줘서 부서가 없어서 못나온 사람이 있다 -> (+) gownaus ehla


--예제) 급여가 전체 평균보다 작은 사원의 정보를 출력 
--        -> 평균을 먼저 구하기 - 조건을 건다
--평균
SELECT avg(sal)
from emp;

--조건대입
SELECT *
from emp
where sal<2073;

-- 평균과 조건을 한번에 합치기 => sql문장 통합(서브쿼리)
SELECT *
from emp
where sal<(SELECT avg(sal)
           from emp); -- 괄호안의 값이 한개일 수 있지만 여러개 일  수 있지
/*
   1. 단일행 서브쿼리 : 서브쿼리의 결과가 1개인 경우
   2. 다중행 서브쿼리 : 서브쿼리의 결과가 여러개인 경우
   3. 다중 컬럼 서브쿼리 : 컬럼이 여러개인 경우
  => 오라클의 기본단위는 row(record) 
  
*/

-- 서브쿼리
--SCOTT가 근무하는 부서의 동료명단 출력하기

-- 스코드가 속한 부서 찾는다
SELECT deptno
from emp
where ename='SCOTT'; -- 부서 20번

--해당 부서의 사람 전부 불러온다
SELECT *
from emp
where deptno = 20;

-- 둘을 통합해 한번에 출력한 방식(단일행 서브쿼리)
SELECT *
from emp
where deptno = (SELECT deptno
                from emp
                where ename='SCOTT');
                
--예제2) 급여를 가장 많이 받는 사원과 같이 근무하는 부서의 사원 목록 출력하기 

-- 누가 급여가 가장 많은지 확인
SELECT max(sal)
from emp;

SELECT deptno
from emp
where sal = 5000;

SELECT *
from emp
where deptno = 10;
--- 이렇게 하면 sql문장 3개나 만들어야 하니 힘들어

-- 서브쿼리를 이용해 한번에 출력
SELECT *
from emp
where deptno = (SELECT deptno
                from emp
                where sal = (SELECT max(sal)
                             from emp));

-- 실행순서는 항상 :  서브쿼리 실행 - 결과값 전송 - 메인쿼리 실행


-- 다중행 서브커리 : 서브쿼리의 값이 여러개이다
SELECT *
FROM emp
where deptno=(SELECT DISTINCT deptno from emp); -- 어떻게 처리할까

-- 다중행 서브쿼리의 처리방법
/*
    고려해야할 세가지
    1. 전체 대입 예) 10 20 30 -> in(10,20,30)으로 처리한다
    2. 최소값
    3. 최대값 
    
    any,some
    deptno > any(10,20,30) --> 10 (최소값이 출력된다)
    deptno < any(10,20,30) --> 30 (최대값이 출력된다)
    => any는 부등호의 방향에 따라 처리값이 달라진다
    all
    deptno > all(10,20,30) --> 30 (최대값이 출력된다)
    deptno < all(10,20,30) --> 10 (최소값이 출력된다)
    => all도 마찬가지로 부등호의 방향에 따라 값이 다르게 처리된다
    
    => 우리는 가독성을 위해 max / min을 주고 처리한다
       전체를 대입할 때는 in을 쓰는게 좋고 그외에는 min / max가 좋다
*/

-- 다중행 서브쿼리 처리방법 세가지
SELECT *
from emp
where deptno in(SELECT DISTINCT deptno from emp);

SELECT *
from emp
where deptno > any(SELECT DISTINCT deptno from emp);  -- 최소값인 10보다 큰 deptno값을 출력해라

SELECT *
from emp
where deptno < any(SELECT DISTINCT deptno from emp);

SELECT *
from emp
where deptno < some (SELECT DISTINCT deptno from emp); -- some과 any는 동일하다

SELECT *
from emp
where deptno < all(SELECT DISTINCT deptno from emp);

SELECT *
from emp
where deptno > all(SELECT DISTINCT deptno from emp);
-- 이둘은 데이터가 없는 이유가 있어 데이터가 30보다 큰거가 없고 10보다 작은 값이 없으니 출력이 안돼
-- 그래서 <=/>=를 해주면 됨

SELECT *
from emp
where deptno >= all(SELECT DISTINCT deptno from emp);
-- 근데 이거보다는 min / max 해주는게 더 편함 이걸 쓰자 *****8
-------------------------------------------------------------------------------
--max 이용
SELECT *
from emp
where deptno < all(SELECT MAX (deptno) from emp);

-- min 이용
SELECT *
from emp
where deptno > all(SELECT MIN (deptno) from emp);
------------------------------------------------------------------------------
-- p.178 예제
--가장 비싼 가격의 책 제목 출력 p.170

--  1. 가장 비싼 가격 얼마인지 파악
SELECT max(price) 
FROM book;

--  2. 책제목 출력
SELECT bookame 
FROM book
where price = 350000;

-- 둘을 통합시킴 -> 서브쿼리 이용
SELECT bookame 
FROM book
where price = (SELECT MAX (price));

-- 예제2) 서울 강남구에서 근무하는 사원의 목록을 출력
SELECT *
FROM emp
where deptno = (SELECT deptno FROM dept
                where loc ='서울 강남구');
-- 테이블이 달라도 서브쿼리는 가능하다
-- 테이블이 반드시 동일해야만 서브쿼리를 쓸 수 있다는 건 아니다!

-- 예제3) 도서를 구매한 적 있는 고객의 이름을 출력 => 다중형 서브쿼리를 이용했다
SELECT DISTINCT custid -- 중복이 많으니 처리해버리자
from  orders;
SELECT name
from customer
where custid in(SELECT DISTINCT custid 
                from  orders);


-- 예제4) 대한미디어에서 출판한 도서를 구매한 고객의 이름을 출력
-- 책번호 확인
SELECT bookid
FROM book
where publisher='대한미디어';

SELECT * from  orders;
-- 책번호 3번과 4번을 산사람은 누구
SELECT custid
FROM orders
where bookid in(3,4);

--1번의 이름은
SELECT name
from customer
where custid=1;

---------------------너무 길어서 한줄로 출력하자 세개의 커리를 하나의 커리로 통합했다
--p.172
SELECT name
FROM customer
where custid=(SELECT custid
              FROM orders
              where bookid in(SELECT bookid
                               FROM book
                               where publisher='대한미디어')); -- 책번호가 3번이랑 4번 두개가 있으니 문장이 두개가 오겠지 그래서 in연산자로 합쳐줬어
-- 괄호안에 있는 문장이 서브쿼리인데 두개 이상이면 in,any,all를 써줘야 한다                               

--------------------------------------------------------------------------------
select empno,ename,job,hiredate,sal,rownum
from emp;

--rownum을 이용해 5명 출력
select empno,ename,job,hiredate,sal,rownum
from emp
where rownum <=5;

-- 급여가 가장 많은 사람 5명만
SELECT empno,ename,job,hiredate,sal,rownum
from (select * from emp order by sal desc)
where rownum <=5;


-----------------------------------------
-- exists를 이용해 row의 존재확인
select *
from emp e
where exists( select 1 -- 1이나2줘도 상관없음 
              from emp 
              where deptno =10);
-- where 1=2 -> false 이다 => 데이터 복사에서 많이 사용              
-- false가 되면 데이터 출력하지 않음

-- 부하직원이 있는 사원 출력
-- mgr : 상사
SELECT ename
from emp e  -- 서브쿼리 속 emp와 구분짓기 위해 별칭줌
where exists(select 1
             from emp
             where mgr = e.empno
             );
             
--p.177 예제
SELECT name,address
from customer
where custid in(SELECT DISTINCT custid
                 FROM orders);
         
--exists 이용
SELECT name, address
FROM customer cs
where EXISTS ( select *
               FROM orders os
               where cs.custid = os.custid);
               
-- 컬럼 2개 이상 비교 : 다중 컬럼 서브쿼리 
SELECT ename, sal,deptno
from emp
where (deptno,sal) in(select deptno, max(sal)
                      from emp
                      group by deptno);
                      
-- 부서별로 최고 급여자 출력같은 경우에도 다중 컬럼 서브쿼리 사용하면 된다
