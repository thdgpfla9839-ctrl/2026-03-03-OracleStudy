package com.sist.vo;

import lombok.Data;

/*
 * 변수와 컬럼 매칭시킨다
 * 
 *                       오라클      자바
 *                 컬럼:  CHAR
 *                       VARCHAR2
 *                       CLOB       String
 *                       ----------------------
 *                       NUMBER      int / double
 *                       --------------------------
 *                       DATE        java.util.Date
 *                       
 *                오라클에서 윈도우로
 *                오라클에서 브라우저(웹)으로 다이렉트 연결이 안 돼
 *                중간다리인 자바를 거쳐야 연결가능
 *                오라클 - 자바 - 윈도우 / 브라우저
 *                
 *                           
 *  이름       널?       유형            
-------- -------- ------------- 
MNO      NOT NULL NUMBER(4)     
TITLE             VARCHAR2(100) 
GENRE             VARCHAR2(100) 
POSTER            VARCHAR2(200) 
ACTOR             VARCHAR2(300) 
REGDATE           VARCHAR2(100) 
GRADE             VARCHAR2(50)  
DIRECTOR          VARCHAR2(100)      
                    
 */
@Data
public class MovieVO {
     private int mno;
     private String title,genre,poster,actor,regdate,grade,director;
     
}
