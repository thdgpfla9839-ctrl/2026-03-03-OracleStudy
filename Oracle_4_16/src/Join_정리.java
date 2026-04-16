
public class Join_정리 {

}
/*
 * --4.16 
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
 */
