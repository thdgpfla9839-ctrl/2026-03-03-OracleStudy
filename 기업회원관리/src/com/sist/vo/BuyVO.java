package com.sist.vo;
/*
 * 이름      널?       유형           
------- -------- ------------ 
NO      NOT NULL NUMBER       
ID               VARCHAR2(20) 
TYPE    NOT NULL NUMBER       
GNO     NOT NULL NUMBER       
ACCOUNT          NUMBER       
PRICE            NUMBER       
REGDATE          DATE
 */
import java.util.*;

import lombok.Data;
// 웹이서 장바구니. 예약 만들 때 거의 유사하니 많이 공부해놓자
@Data

public class BuyVO {
  private int no, type,gno,account,price;
  private String id,dbday;
  private Date redgate;
  private GoodsVO gvo = new GoodsVO(); // 굿즈dao에서 buy 값을 가져와야하니 여기에 추가

  // 조인 처리해주는 부분 -> 조인할 때는 반드시 클래스를 포함해서 들어간다
  // List<GoodsVO,BuyVO> 이렇게 쓸 수 없으니 바이vo 안에 굿즈vo 넣어준거야

}
