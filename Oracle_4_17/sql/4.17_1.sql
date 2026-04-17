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

INSERT INTO board VALUES(1,'홍','CRUD',
'DDL(),DML()','1234',SYSDATE,0); -- 디폴크가 무조건 들어가는 것은 아니다 SYSDATE,0을 해줘야함

INSERT INTO board VALUES(2,'홍','CRUD',
'DDL(),DML()','1234',SYSDATE,0); -- 디폴크가 무조건 들어가는 것은 아니다 SYSDATE,0을 해줘야함


INSERT INTO board VALUES(3,'홍',' ',
'DDL(),DML()','1234',SYSDATE,0); -- ''를 붙여써야 NULL이다 띄어쓰면 공백으로 인식

SELECT * FROM BOARD;

ROLLBACK; --  이전 상태로 돌아가는 
-- 한가지 COMMIT을 해주지 않으면 파일로 저장이 안 되고 임시로만 저장돼 있어서
-- 자바에서 파일을 불러올 수가 없게 돼


INSERT INTO board VALUES(1,'홍','CRUD',
'DDL(),DML()','1234',SYSDATE,0); 

INSERT INTO board VALUES(2,'홍','CRUD',
'DDL(),DML()','1234',SYSDATE,0); 

INSERT INTO board VALUES(3,'홍',' ',
'DDL(),DML()','1234',SYSDATE,0); 

SELECT * FROM BOARD;
COMMIT;

UPDATE board SET
NAME ='나나',SUBJECT ='오라클 배우는 중'
WHERE NO=2;
COMMIT;

SELECT * FROM BOARD;
DELETE FROM board;


---------------------------------------------------
INSERT INTO board VALUES(1,'홍','CRUD',
'DDL(),DML()','1234',SYSDATE,0); 
-- 이거 30개를 만들거야 

-- 서브쿼리를 이용 
INSERT INTO board 
VALUES((SELECT NVL(MAX(NO)+1,1)from board),
        '홍',
        'CRUD',
        'DDL(),DML()',
        '1234',
        SYSDATE,
        0
);  -- 실행할 때 중복이 거의 없다
-- 맨처음에 한번은 널값이라 1을 주고 시작한다 NVL(MAX(NO)+1,1
SELECT *FROM BOARD;
COMMIT;

-- ** 페이지 나누기 ** 중요하다
-- 0 부터 10개
SELECT * FROM board
ORDER BY NO DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

SELECT * FROM board
ORDER BY NO DESC
OFFSET 20 ROWS FETCH NEXT 10 ROWS ONLY;

SELECT * FROM board
ORDER BY NO DESC
OFFSET 30 ROWS FETCH NEXT 10 ROWS ONLY;



