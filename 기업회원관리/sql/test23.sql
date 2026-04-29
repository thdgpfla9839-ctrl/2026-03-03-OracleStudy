4.29 
6장 데이터베이스 설계(ER-MODEL)

데이터 추출(크롤링) : web에서 ->우리는 위키북스의 상세보기에서 추출함
books : 
           이미지
           책제목
           저자
           가격
           출판일
           ISBN
           책소개
           태그
           isbn 너무 길어서 임의로 번호를 매김 -> 구분자, 결정자 : PK

View : 여러개의 조인이 있는 경우에 sql문장을 저장해 재사용하는 방식이다
PROCEDURE : View가 여러개인 경우에는 프로시저를 사용한다

가장 많이 사용하는 제약조건 : PRIMARY KEY ** -> 회원이나 사원같은 경우를 제외하고는 숫자로 돼있어 자동증가를 만드는게 기본
                                          FOREIGN KEY **  -> 관계가 나왔을 때 사용
                                                                        예)  BOOKS  ----<대출>----  회원 
                                                                               |                 |
                                                                               ---------------
                                                                                -> books-no : fk
                                                                               -> 대출과 회원 사이는 id가 fk
                                                                      => loan(no,bno,id,대출일,반납일,상태) : 대출에 필요한 내용
                                                                  ---------------------------------------------------------------------------
                                                                        예) sawon    -----------------------  출근 / 퇴근 / 조퇴 / 외출 / 휴가
                                                                                                       |
                                                                                                  sabun : fk
                                                                                         
                                          CHECK
                                          UNIQUE
                                          NOT NULL **



books(no,bookname,poster,author,price,regdate,pubdate,isbn,content,tag) -> no : pk

-- 테이블 설계 - 시퀀스 - 인덱스 순으로 만들어준다

-- 테이블 설계
CREATE TABLE books
(
   no NUMBER,
   bookname VARCHAR(2000) CONSTRAINT books_bn_nn NOT NULL,
   poster VARCHAR2(260) CONSTRAINT poster_bn_nn NOT NULL,
   author VARCHAR2(1000) CONSTRAINT author_bn_nn NOT NULL,
   price VARCHAR2(100) CONSTRAINT price_bn_nn NOT NULL,
   pubdate VARCHAR2(100) CONSTRAINT pub_bn_nn NOT NULL,
   isbn VARCHAR2(100) CONSTRAINT isbn_bn_nn NOT NULL,
   content CLOB,
   tag CLOB
   CONSTRAINT books_no_pk PRIMARY KEY(no)
);

-- 시퀀스
CREATE SEQUENCE books_no_seq
     START WITH 1
     INCREMENT BY 1
     NOCYCLE
     NOCACHE

-- 인덱스 잡기
CREATE INDEX idx_books_bn ON books(bookname);
CREATE INDEX idx_books_bn ON books(tag); // 검색이 많은 컬럼에 대해 인덱스를 만들어 준다, pk,uk는 자동으로 인덱시 만들어짐