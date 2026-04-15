package com.sist.dao;
/*
 * 데이터베이스(오라클) 연결되는 클래스
 * 요청 데이터를 검색/ 수정 / 삭제 / 추가 하는 부분
 */
import java.util.*;
import java.security.PublicKey;
import java.sql.*;
public class SawonDAO {
          // 연결하는 객체
	 private Connection conn;
	      // 송수신하는 객체
	 private PreparedStatement ps;
	 // 싱글턴 처리
	 private static SawonDAO dao;
	 //오라클 주소
	 private static final String URL="ojdbc.jdbc:oracle:thin:@localhost:1521:XE";
	 //1. 드라이버 등록 -> 딱 한번만 수행 => 한번 부르는 건 생성자 뿐이잖아
	 public SawonDAO()
	 {
		 try
		 {
			 Class.forName(""); //메모리할당
			 //리플렉션 -> 클래스 이름으로 제어(메모리 저장, 변수값,메소드)
			 //ojdbc8.jar에 저장
		 }
		 catch (Exception ex) {
			// TODO: handle exception
			 ex.printStackTrace();
		}
	 }
	 // 2. 싱글턴 -> 사용자 한명이 Connection을 한개만 사용할 수 있게, 한사람당 하나씩
	 public static SawonDAO newInstance()
	 {
		 if(dao==null)
		 
			 dao=new SawonDAO();
			 return dao;
		 
		
	 }
	 // 3. 오라클 연결
	 public void getConnection()
	 {
		 try
		 {
			conn = DriverManager.getConnection(URL,"hr","happy");
		 }
		 catch (Exception ex) {
			// TODO: handle exception
			 ex.printStackTrace();
		}
	 }
	 // 4. 오라클 닫기
	 public void disConnection()
	 {
		 try
		 {
			 if(ps!=null) ps.close();
			 if(conn!=null) conn.close();
			 // exit
		 }catch (Exception ex) {
			// TODO: handle exception
		}
	 }
	 ////////////////////////////////// 모든 DAO의 공통이다
	 /// 로그임 -> count를 어떻게 이용할지
	 /// 사원목록 -> 페이징 100명이라 다 출력하기 많으니 일부만 / 페이징은 rownum
	 /// 상세보기 -> 사번을 어떻게 대입해서 들어갈건지
	 /// 통계처리 -> group by를 이용한다
	 
}
