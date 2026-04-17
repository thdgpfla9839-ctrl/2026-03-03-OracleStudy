package com.sist.vo;
/*
 * NO      NOT NULL NUMBER         
   NAME    NOT NULL VARCHAR2(51)   
   SUBJECT NOT NULL VARCHAR2(2000) 
   CONTENT NOT NULL CLOB           
   PWD     NOT NULL VARCHAR2(10)   
   REGDATE          DATE           
   HIT              NUMBER         

 */
// 웹에서도 안 변해
import java.util.*;

import lombok.Data;
@Data // 게터세터와 투스트링이 자동으로 만들어질거야, 캡슐화코딩 완료
public class BoardVO {
   private int no,hit;
   private String name,subject,content,pwd,dbday;
   private Date regdate; // 시큐어코딩 노출되는 데이터 감춤, 데이터가 변형되는 건 아니야
}
