-- trigger
--자동 이벤트 처리 -> DML(insert / update / delete)을 이용
--               -> 미리 설정된 조건에 맞는 경우에 자동 실행
--               -> 테이블이 다른 경우에만 적용됨
--                  예) 맛집사이트에서 좋아요버튼을 누르면 자동증가시킬 때 트리거 사용
-- 형식)
--CREATE [OR REPLACE] TRIGGER trigger_name
--before | after [insert|update|delete] on table_name / -before -> 먼저 적용, after -> 나중에 적용
--each row
--declare
--       변수선언
--begin
--end;
--/

-- 삭제
--drop trigger tri_name
--------------------------------------------------------------------------------
-- 트리거는 오라클 자체에서 실행됨 -> 가독성이 떨어진다
--------------------------------------------------------------------------------
CREATE TABLE 상품(
  품번 NUMBER,
  상품명 VARCHAR2(100),
  단가 NUMBER
);

CREATE TABLE 입고(
    품번 NUMBER,
    수량 NUMBER,
    금액 NUMBER
);

CREATE TABLE 출고(
    품번 NUMBER,
    수량 NUMBER,
    금액 NUMBER
);

CREATE TABLE 재고(
    품번 NUMBER,
    수량 NUMBER,
    금액 NUMBER,
    누적금액 NUMBER 
);

DELETE FROM 상품;
------------------sql 튜닝을 하게 되면 delete 말고 truncate 사용하면 속도가 더 빨라
INSERT INTO 상품 VALUES (100,'새우깡',1500);
INSERT INTO 상품 VALUES (200,'초코칩',1300);
INSERT INTO 상품 VALUES (300,'허니버터',1700);
INSERT INTO 상품 VALUES (400,'포카칩',1250);
INSERT INTO 상품 VALUES (500,'나초',2200);
COMMIT;


-- insert into 입고 values(100,3,1500)
--:new -> 인서트 해서 들어오는 괄호의 값이 new가 되는 것
--:old -> 이전에 등록된 값을 나타낼 때

CREATE or REPLACE TRIGGER 입고_trigger
AFTER INSERT ON 입고 -- 이렇게 된다면 밑에 문장을 실행
for EACH ROW -- 전체를 대상으로 처리
DECLARE 
       v_cnt NUMBER;
BEGIN
      -- 상품 재고가 있는지 확인
      SELECT COUNT(*) INTO v_cnt
      FROM 재고
      WHERE 품번 =:new.품번; -- new 품번은 입고 시 들어오는(insert) 값 
      -- 재고에서의 품번과 인서트된 품번이 같냐
      
      if v_cnt = 0 THEN
         INSERT INTO 재고 VALUES (:new.품번,
                                  :new.수량,
                                  :new.금액,
                                  :new.수량*:new.금액);
     else
        UPDATE 재고 SET
        수량 = 수량+:new.수량,
        누적금액 = 누적금액+(:new.수량*:new.금액)
        WHERE 품번=:new.품번;
        -- > autoCommit이라 commit을 날리면 오류
        end if;
end;
/

INSERT INTO 입고 VALUES (100,5,1500);
SELECT * FROM 입고;
SELECT * FROM 재고;

-- 출고

CREATE OR REPLACE TRIGGER 출고_trigger
AFTER INSERT ON 출고
FOR EACH ROW
DECLARE
   v_cnt NUMBER;
BEGIN
    SELECT 수량 INTO v_cnt
    FROM 재고
    WHERE 품번 = :new.품번;
    
    IF :new.수량= v_cnt THEN -- 출고하는 개수와 수량이 같으면 0/ else라면 업데이트
        DELETE FROM 재고
        WHERE 품번 =:new.품번;
    else
        UPDATE  재고 SET
        수량 = 수량-:new.수량,
        누적금액 = 누적금액-(:new.수량*:new.금액)
        WHERE 품번 =:new.품번;

    end if;
end;
/

INSERT INTO 출고 VALUES (100,5,1500);
SELECT * FROM 출고;
SELECT * FROM 재고;