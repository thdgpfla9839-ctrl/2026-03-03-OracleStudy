--@c:\oracleDev\movie
--commit; movie;
--SELECT * FROM movie;
--drop TABLE
--
--@c:\oracleDev\music
--commit;
--SELECT * FROM genie_music;
--
--@c:\oracleDev\seoul_loc
--commit;
--SELECT * FROM seoul_location;
--
--
--@c:\oracleDev\seoul_nature
--commit;
--SELECT * FROM seoul_nature;
--
--
--@c:\oracleDev\seoul_shop
--commit;
--SELECT * FROM seoul_shop;
--
--
--@c:\oracleDev\seoul_hotel
--commit;
--SELECT * FROM seoul_hotel; 

-- 테이블 저장하는 방법/ 파일들은 모든파일 - utf-8로 변경한다 -> 한글이 깨지기 때문에
------------------------------------------------------------------------------------------------------------
select : 있는 데이터를 검색할 때 사용-> 변경을 하는 것이 아님
         목록출력, 상세보기, 검색 이런거 가져올 때 사용
         ------------------------------------------------
         목록 : 페이징 -> offset 시작번호 rows fetch next 10 rows only -> 시작번호 부터 시작해서 rows를 10개 가져오라(데이터 잘라옴)
         상세보기 : where primary key = 값 상세보기할 때 쓰는 방식
         검색 : where like / regexp_like를 이용해서 작성
         
   참고) 자바(JDBC)에서 목록을 갖고올 때 리턴형이 List<VO>
         매개변수는 페이지 요청, 사용자가 보내준 값이다
 ------------------------------------------------------------------------------------        
-- 페이지 출력
desc movie;
/*
이름       널? 유형            
-------- -- ------------- 
MNO         NUMBER(4)     
TITLE       VARCHAR2(100) 
GENRE       VARCHAR2(100) 
POSTER      VARCHAR2(200) 
ACTOR       VARCHAR2(300) 
REGDATE     VARCHAR2(100) 
GRADE       VARCHAR2(50)  
DIRECTOR    VARCHAR2(100) 

*/
---------------------------------------------------------------------------------
alter table movie add constraint movie_mno_pk primary key(mno);
-- 프라이머리키에서 constraint 추가할 때 pk,fk,uk,ck -> add를 쓴다
-- not null . default -> modify

select mno,title,grade,director
from movie
-- 페이지 나누기
offset 0 rows fetch next 20 rows only; 

-- VO를 20개씩 묶어서 전송 후 배열 / List를 이용
-- 0번부터 시작해서 20개씩 잘라서 가져온다 
-- -> 오라클은 1번/ 자바에서는 사용자로 부터 page를 받음 여기서 페이지는 매개변수
-- sql튜닝에서는 i/o를 최대한 감소시켜야 해서 * 보다는 컬럼을 나열해라(필요없는 컬럼은 제거)
-- 상세보기는 where 문장이 필요
-- 상세보기는 한개만 출력 -> mno(사용자가 선택한 매개변수)를 이용해서

select mno,title,grade,actor,director,genre
from movie
           where mno=100;
-- 사용자가 보내면 무조건 매개변수로 받는다
-- 전체 컬럼의 값을 받을 수 있게 클래스화 해야함 -> VO 혹은 DTO

--------------------------------------------------------------------------------
-- 검색 like 이용하기
select mno,title,grade,actor,director,genre
from movie
           where title like '%비밀%';

-- 데이터가 여러개인 경우에는 -> regexp_like 사용하기           
select mno,title,grade,actor,director,genre
from movie
           where regexp_like (title,'비밀'); -- 검색어가 사용자가 보낸 매개변수
           
--------------------------------------------------------------------------------
select mno,title,grade,actor,director,genre
from movie
           where genre like '%액션%';
           
select mno,title,grade,actor,director,genre
from movie
           where grade like '%12%';
           
select mno,title,grade,actor,director,genre
from movie
           where actor like '%송강호%';
-------------------------------------------------------------------------------
[연산자가 주로 사용되는 곳 정리]
= : 상세보기
>, <, >=, <= : 등급확인할 때 사용
between ~ and :범위가 포함된 상태, 예약기간이나 특가 기간같을 때 사용
in : 한번에 여러명, 여러개를 동시에 가져올 때 사용하는 연산자
like : 특정 문자를 검색할 때 사용
null : 예를 들어 회원인 경우에 
       상품구매 -> is not null , 예약이 없는 사람 -> is null을 사용한다
not : 반대값 구할 때

날짜 / 금액을 변경할때
: to_char
  nvl -> null 값을 대체하는 함수(substr/ instr/length)
  ceil -> 총페이지, round, trunc
  sysdate : 현재 날짜 -> insert / update에 많이 등장
  case -> trigger, procedure에 등장
                      
--------------------------------------------------------------------------------
자바에서는 문장을 실행하려면 반드시 값을 받아서 저장 - 저장된 값을 다른 클래스에 전송해야함
                                값 : VO
                                값이 한개 : VO / 여러개 : List<VO>로 받아서 처리하면 됨
----------------------------------------------------------------------------------------
join : 
      inner join / ansi join
    -> select A.col , B.col
       from A JOIN B
       on A.col = B.col;
    -> 테이블 간 컬럼명이 다른 경우에는 그냥인식
       테이블 간 컬럼명이 동일한 경우레는 반드시 구분해라
       => 테이블명.칼럼/ 별칭명.컬럼명
      
subquery : 인라인뷰 / 스칼라 서브쿼리
           인라인 뷰 : 보안이나 페이징 할때 -> 테이블을 대신 -> from 뒤에 작성
           스칼라 서브쿼리 : 조인 대신, 컬럼대신 -> select 뒤에 작성
           
           1) 서브쿼리는 반드시 ()안에 작성
           2) insert / update / delete에서 사용이 가능
           3) (select ~)
---------------------------------------------------------------------------------
통계 : group by
select grade, count(*)
from movie
           group by grade
           order by grade;
--------------------------------------------------------------------------------
group by는 주로 집계함수를 사용
집계함수 : 
          1) count -> row의 개수를 확인할 때
          2) max -> 자동 증가번호(create sequence)
          3) sum / avg -> 장바구니에서 
---------------------------------------------------------------------------------
연결된 테이블이 여러개 -> join / subquery 사용
   예) emp / dept
       book / orders
       customer / orders
       와 같이 테이블이 서로 연결이 돼있는 경우에 적용이 가능함
--------------------------------------------------------------------------------
[결론적으로 select에서 공부할 부분]
select 형식과 순서
group by / order by / join / subquery
--------------------------------------------------------------------------------
desc movie; 

desc genie_music;