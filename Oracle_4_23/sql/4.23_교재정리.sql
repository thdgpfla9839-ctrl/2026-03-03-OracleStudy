교재정리
chapter 03

SQL :
     DML :
           1) SELECT : 데이터 검색
           2) INSERT : 데이터 추가
           3) UPDATE : 데이터 수정
           4) DELETE : 데이터 삭제 
           
     DDL : column 단위
           1) CREATE :생성(정의) -> table, view, sequence, index,
                                   procedure, function, trigger 생성됨 
           2) ALTER : 수정 -> ADD : 추가(컬럼, 제약조건)
                             MODIFY : 수정
                             DROP : 삭제
                             RENAME : 이름변경 후 리팩토링 반드시
           3) DROP : 테이블 완전삭제
           4) TRUNCATE : 데이터 잘라내기 -> 가급적이면 DELETE 한줄삭제 말고 TRUNCATE 이용하기
           5) RENAME : 테이블명 변경할 때
     DCL : 
           1) GRANT : 권한 부여할 때
           2) REVOKE : 권한 해제
           
     TCL : 
           1) COMMIT : 정상 저장
           2) ROLLBACK : 명령 취소 -> INSERT 문장이 취소된다
           3) SAVEPOINT : 지정한 위치에서부터 적용