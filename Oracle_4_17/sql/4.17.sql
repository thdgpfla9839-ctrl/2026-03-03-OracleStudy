-- 1. 테이블 생성하기 전 개념적 설계를 한다 => 벤치마킹 후 필요한 데이터 추출
-- 2. 논리적 설계 => 어떤 데이터로 저장할지
-- 3. 물리적 설계 => 데이터 크기를 결정
-- 과정) 
-- 요구사항 분석하기(어떤 페이지 만들지 아이템 잡기) - 벤치마킹 - 기능설정 - 어떤 데이터가 필요한지 데이터 추출 - 데이터베이스 설계 - 화면 UI - 구현 - 테스트 : JUnit을 이용할 예정 - 배포
-- 예) 게시판 만들기
/*1. 개념적 설계

     게시물 번호
     이름
     제목
     내용
     비밀번호
     등록일 
     조회수
     
  2. 논리적 설계   
     
    CREATE TABLE board
    (
         no NUMBER,
         name VARCHAR2(51),
         subject VARCHAR2(2000),
         content CLOB,
         pwd VARCHAR2(10),
         regdate DATE,
         hit NUMBER
    )
    
   3. 물리적 설계 -> 실제 메모리에 저장됨 
   
      CREATE TABLE board
    (
         no NUMBER,
         name VARCHAR2(51),
         subject VARCHAR2(2000), -> 4000자 까지 가능하다
         content CLOB,
         pwd VARCHAR2(10),
         regdate DATE,
         hit NUMBER
    )
    
  4. 저장 전 규격 맞추기 -> 제약조건
    
     CREATE TABLE board
    (
         no NUMBER primary key,
         name VARCHAR2(51) not null,
         subject VARCHAR2(2000) not null,
         content CLOB not null,
         pwd VARCHAR2(10) not null,
         regdate DATE default sysdate,
         hit NUMBER default 0
    ) 
      -> 이렇게 간결하게 사용 시 수정이 어렵다, 제어가 어려워
         프라이머리 키는 인덱스를 자동생성하게 된다
         각 제약조건에 이름을 부여하도록 설정한다
    
    user_constraint : 오라클 테이블인데 이 안에 제약조건이 다 저장됨  
                      반드시 중복이 되면 안 됨
                      이름을 줄 때 중복이 안 되게 하는 방법은
                      =>   테이블명_컬럼명_명칭
                        명칭에는 nn
                                pk : primary key
                                fk : FOREIGN key
                                ck : check
                                uk : unique
    개선)                            
    CREATE TABLE board
    (
         no NUMBER ,
         name VARCHAR2(51)constraint board_name_nn NOT NULL ,
         subject VARCHAR2(2000)constraint board_subject_nn NOT NULL ,
         content CLOB constraint board_content_nn NOT NULL,
         pwd VARCHAR2(10)constraint board_pwd_nn NOT NULL,
         -------------------------------------------------------// 이렇게 작성하는 것을 컬럼 레벨이라고 함  => 컬럼과 동시에 제약조건 생성하는 것을 컬럼 레벨이라고 함(NOT NULL, DAFALUT)
         regdate DATE default sysdate,
         hit NUMBER default 0,
         constraint board_no_primary key(no)
         컬럼을 먼저 생성 후 나중에 제약 조건을 설정하는 방법 : 테이블 레벨
         테이블 레벨 : 프라이머리키, 외래키, 체크, 유니크 -> 테이블 레벨 생성이 기본이다
    )      
         
         
         
*/
--게시판 생성
CREATE table board(
    no NUMBER , -- 숫자로 자동증가, 중복없게, 숫자는 8자리까지 사용이 가능
    name VARCHAR2(51) CONSTRAINT board_name_nn NOT NULL,
    subject VARCHAR2(2000)CONSTRAINT board_subject_nn NOT NULL,
    content CLOB CONSTRAINT board_content_nn NOT NULL,
    pwd VARCHAR2(10)CONSTRAINT board_pwd_nn NOT NULL, -- 낫널은 반드시 컬럼 뒤에
    regdate DATE DEFAULT sysdate,
    hit NUMBER DEFAULT 0,
    CONSTRAINT board_no_pk primary key(no)
);

-- 구조확인
SELECT * 
FROM user_tables
where table_name ='BOARD'; -- '' 여기는 반드시 대문자

SELECT * FROM user_constraints
where table_name ='BOARD';

alter table board
drop constraint board_name_nn; 
alter table board 
modify name varchar2(51) constraint board_name_nn  not null;

-- alter :변경
-- add : 추가 -> 테이블 추가 시 테이터가 있는 경우에 NOT NULL 설정하기 어려움
-- modify : 수정
-- drop : 삭제

--p.179
-- 이메일 추가
-- add
alter table board
add email varchar2(100)
constraint board_email_uk unique;
/*
  constraint_type
  c : NOT NULL / CHECK
  u : UNIQUE
  p : PRIMARY KEY
  r : FOREIGN KEY
*/
-- 수정
alter table board
modify email varchar2(200);
desc board; -- 테이블 스키마 출력

-- 삭제
alter table board
drop column email;
desc board; 

-- 테이블 제작 삭제 :drop p.186
drop table board;
desc board;

-- 게시판에 댓글 만들기
-- foreign /check --> DML
-- check -> 회원의 성별(남자/여자)

CREATE table board(
    no NUMBER , 
    name VARCHAR2(51) CONSTRAINT board_name_nn NOT NULL,
    subject VARCHAR2(2000)CONSTRAINT board_subject_nn NOT NULL,
    content CLOB CONSTRAINT board_content_nn NOT NULL,
    pwd VARCHAR2(10)CONSTRAINT board_pwd_nn NOT NULL, 
    regdate DATE DEFAULT sysdate, -- 사용자가 날짜입력 안 하면 오늘 날짜 출력
    hit NUMBER DEFAULT 0, -- 0값 초기화
    CONSTRAINT board_no_pk primary key(no) -- 프라이머리키는 나중에 추가하는 것이 좋다
);

-- 참조키는 반드시 프라이머리키만 가능하다

CREATE table reply(
     no NUMBER,
     bno NUMBER, -- 참조 가능
     id VARCHAR2(20)CONSTRAINT reply_id_nn not null, -- 참조 가능
     name VARCHAR2(51)CONSTRAINT reply_name_nn not null,  -- 참조가 안됨, 외래키는 프라이머리키만 쓴다
     msg CLOB CONSTRAINT reply_msg_nn not null,
     regdate DATE DEFAULT sysdate,
     CONSTRAINT reply_no_pk primary key(no)     
);