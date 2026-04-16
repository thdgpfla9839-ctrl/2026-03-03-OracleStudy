
public class 서브쿼리_다중행서브쿼리 {

}
//-- 다중행 서브커리 : 서브쿼리의 값이 여러개이다
//SELECT *
//FROM emp
//where deptno=(SELECT DISTINCT deptno from emp); -- 어떻게 처리할까
//
//-- 다중행 서브쿼리의 처리방법
///*
//    고려해야할 세가지
//    1. 전체 대입 예) 10 20 30 -> in(10,20,30)으로 처리한다
//    2. 최소값
//    3. 최대값 
//    
//    any,some
//    deptno > any(10,20,30) --> 10 (최소값이 출력된다)
//    deptno < any(10,20,30) --> 30 (최대값이 출력된다)
//    => any는 부등호의 방향에 따라 처리값이 달라진다
//    all
//    deptno > all(10,20,30) --> 30 (최대값이 출력된다)
//    deptno < all(10,20,30) --> 10 (최소값이 출력된다)
//    => all도 마찬가지로 부등호의 방향에 따라 값이 다르게 처리된다
//    
//    => 우리는 가독성을 위해 max / min을 주고 처리한다
//       전체를 대입할 때는 in을 쓰는게 좋고 그외에는 min / max가 좋다
//*/
//
//-- 다중행 서브쿼리 처리방법 세가지
//SELECT *
//from emp
//where deptno in(SELECT DISTINCT deptno from emp);
//
//SELECT *
//from emp
//where deptno > any(SELECT DISTINCT deptno from emp);  -- 최소값인 10보다 큰 deptno값을 출력해라
//
//SELECT *
//from emp
//where deptno < any(SELECT DISTINCT deptno from emp);
//
//SELECT *
//from emp
//where deptno < some (SELECT DISTINCT deptno from emp); -- some과 any는 동일하다
//
//SELECT *
//from emp
//where deptno < all(SELECT DISTINCT deptno from emp);
//
//SELECT *
//from emp
//where deptno > all(SELECT DISTINCT deptno from emp);
//-- 이둘은 데이터가 없는 이유가 있어 데이터가 30보다 큰거가 없고 10보다 작은 값이 없으니 출력이 안돼
//-- 그래서 <=/>=를 해주면 됨
//
//SELECT *
//from emp
//where deptno >= all(SELECT DISTINCT deptno from emp);
//-- 근데 이거보다는 min / max 해주는게 더 편함 이걸 쓰자 *****8
//-------------------------------------------------------------------------------
//--max 이용
//SELECT *
//from emp
//where deptno < all(SELECT MAX (deptno) from emp);
//
//-- min 이용
//SELECT *
//from emp
//where deptno > all(SELECT MIN (deptno) from emp);
//------------------------------------------------------------------------------
//-- p.178 예제
//--가장 비싼 가격의 책 제목 출력 p.170
//
//--  1. 가장 비싼 가격 얼마인지 파악
//SELECT max(price) 
//FROM book;
//
//--  2. 책제목 출력
//SELECT bookame 
//FROM book
//where price = 350000;
//
//-- 둘을 통합시킴 -> 서브쿼리 이용
//SELECT bookame 
//FROM book
//where price = (SELECT MAX (price));
//
//-- 예제2) 서울 강남구에서 근무하는 사원의 목록을 출력
//SELECT *
//FROM emp
//where deptno = (SELECT deptno FROM dept
//                where loc ='서울 강남구');
//-- 테이블이 달라도 서브쿼리는 가능하다
//-- 테이블이 반드시 동일해야만 서브쿼리를 쓸 수 있다는 건 아니다!
//
//-- 예제3) 도서를 구매한 적 있는 고객의 이름을 출력 => 다중형 서브쿼리를 이용했다
//SELECT DISTINCT custid -- 중복이 많으니 처리해버리자
//from  orders;
//SELECT name
//from customer
//where custid in(SELECT DISTINCT custid 
//                from  orders);
//
//
//-- 예제4) 대한미디어에서 출판한 도서를 구매한 고객의 이름을 출력
//-- 책번호 확인
//SELECT bookid
//FROM book
//where publisher='대한미디어';
//
//SELECT * from  orders;
//-- 책번호 3번과 4번을 산사람은 누구
//SELECT custid
//FROM orders
//where bookid in(3,4);
//
//--1번의 이름은
//SELECT name
//from customer
//where custid=1;
//
//---------------------너무 길어서 한줄로 출력하자 세개의 커리를 하나의 커리로 통합했다
//--p.172
//SELECT name
//FROM customer
//where custid=(SELECT custid
//              FROM orders
//              where bookid in(SELECT bookid
//                               FROM book
//                               where publisher='대한미디어')); -- 책번호가 3번이랑 4번 두개가 있으니 문장이 두개가 오겠지 그래서 in연산자로 합쳐줬어
//-- 괄호안에 있는 문장이 서브쿼리인데 두개 이상이면 in,any,all를 써줘야 한다                               
//
//--------------------------------------------------------------------------------
//select empno,ename,job,hiredate,sal,rownum
//from emp;
//
//--rownum을 이용해 5명 출력
//select empno,ename,job,hiredate,sal,rownum
//from emp
//where rownum <=5;
//
//-- 급여가 가장 많은 사람 5명만
//SELECT empno,ename,job,hiredate,sal,rownum
//from (select * from emp order by sal desc)
//where rownum <=5;
//
//
//-----------------------------------------
//-- exists를 이용해 row의 존재확인
//select *
//from emp e
//where exists( select 1 -- 1이나2줘도 상관없음 
//              from emp 
//              where deptno =10);
//-- where 1=2 -> false 이다 => 데이터 복사에서 많이 사용              
//-- false가 되면 데이터 출력하지 않음
//
//-- 부하직원이 있는 사원 출력
//-- mgr : 상사
//SELECT ename
//from emp e  -- 서브쿼리 속 emp와 구분짓기 위해 별칭줌
//where exists(select 1
//             from emp
//             where mgr = e.empno
//             );
//             
//--p.177 예제
//SELECT name,address
//from customer
//where custid in(SELECT DISTINCT custid
//                 FROM orders);
//         
//--exists 이용
//SELECT name, address
//FROM customer cs
//where EXISTS ( select *
//               FROM orders os
//               where cs.custid = os.custid);
