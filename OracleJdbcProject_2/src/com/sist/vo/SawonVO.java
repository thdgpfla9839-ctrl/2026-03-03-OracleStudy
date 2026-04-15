package com.sist.vo;
/*
 * 변수 잡는 클래스
 * VO는 테이블 개수만큼 만들어야해
EMPNO     NOT NULL NUMBER(5)     
ENAME     NOT NULL VARCHAR2(30)  
GENDER             CHAR(1)       
ADDRESS            VARCHAR2(50)  
AGE                NUMBER(3)     
POSITION           VARCHAR2(20)  
LOCATION           VARCHAR2(30)  
SALARY             NUMBER(10,2)  
PHONE              VARCHAR2(20)  
INTRO              VARCHAR2(100) 
DEPTNO    NOT NULL NUMBER(2)     
HIRE_DATE          DATE 

     number === 매칭을 할 떄 자바에서는 int로 받는다
     date  ===== java.util.Date로 가져와야한다
     varchar2 
     char
     -------------// String으로 둘다 가져와야함
     
     TO_CHAR : String
     TO_DATE : Date로 받아야한다
     
     TO_CHAR(salary,'L999,999') => int라고 int로 받으면 안 되고 String으로 받아야해
 */
import java.util.*;

import lombok.Data;
@Data
//데이터베이스의 row와 매칭됨 => DTO(마이바티스) / Entity / Bean
public class SawonVO {
   private int rmpno,age,deptno,salary;
   private String ename,gender,address,position,location,phone,intro,dbday,pay;
   private Date hire_date; // 날짜를 데이트로 받으면 원하는 날짜가 안 들어와 그래서 to_char
  

   
   
}
