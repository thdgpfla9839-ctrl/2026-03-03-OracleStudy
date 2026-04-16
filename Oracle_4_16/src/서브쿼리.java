
public class 서브쿼리 {

}
/*--예제) 급여가 전체 평균보다 작은 사원의 정보를 출력 
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

//-- 서브쿼리
//--SCOTT가 근무하는 부서의 동료명단 출력하기
//
//-- 스코드가 속한 부서 찾는다
//SELECT deptno
//from emp
//where ename='SCOTT'; -- 부서 20번
//
//--해당 부서의 사람 전부 불러온다
//SELECT *
//from emp
//where deptno = 20;
//
//-- 둘을 통합해 한번에 출력한 방식(단일행 서브쿼리)
//SELECT *
//from emp
//where deptno = (SELECT deptno
//                from emp
//                where ename='SCOTT');
//                
//--예제2) 급여를 가장 많이 받는 사원과 같이 근무하는 부서의 사원 목록 출력하기 
//
//-- 누가 급여가 가장 많은지 확인
//SELECT max(sal)
//from emp;
//
//SELECT deptno
//from emp
//where sal = 5000;
//
//SELECT *
//from emp
//where deptno = 10;
//--- 이렇게 하면 sql문장 3개나 만들어야 하니 힘들어
//
//-- 서브쿼리를 이용해 한번에 출력
//SELECT *
//from emp
//where deptno = (SELECT deptno
//                from emp
//                where sal = (SELECT max(sal)
//                             from emp));
//
//-- 실행순서는 항상 :  서브쿼리 실행 - 결과값 전송 - 메인쿼리 실행
//
//
// * 
//*/
