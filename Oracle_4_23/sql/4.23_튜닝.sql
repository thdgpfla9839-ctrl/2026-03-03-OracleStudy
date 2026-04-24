SELECT
      형식)
          SELECT * | COILUMN_LIST
          FROM table_name|view_name|SELECT ~
          
          [  WHERE 연산자
             GROUP BY 컬럼 | 함수
             HAVING 집계함수
             ORDER BY 컬럼 | 함수
          ]
         
         
 1. SQL 튜닝 -> 최적화 / 오라클 부하가 덜 됨
            필요한 컬럼만 조회(SELECT *)
            I/O 감소, 네트워크 전송량이 감소