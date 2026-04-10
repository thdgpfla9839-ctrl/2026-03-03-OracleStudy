package com.sist.db;
import java.sql.*; 
import java.util.Scanner;
// 키워드는 대문자, 그리고 대문자 앞에는 항상 공백을 준다
// 오라클sql에서 정보 불러와서 필요한 값만 출력하는 예제
public class EmpMain { 
 
	public static void main(String[] args)throws Exception 
	{ 
		Scanner scan = new Scanner(System.in);
		System.out.println("직위 입력: ");
		String name = scan.next();
		// 오라클 연결하는 드라이버
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@localhost:1521:XE"; //XE : 오라클에서 디폴트 폴더, 소문자든 대문자든 xe 상관 없음
		
		// 오라클에 연결
		Connection conn = DriverManager.getConnection(url,"hr","happy");
		// 커넥션이 소켓
		
		// 명령문 보내기
		String sql="SELECT empno,ename,job FROM emp WHERE job LIKE '%"+name+"%'"; // 프롬다음에 반드시 테이블명 적기
		
		PreparedStatement ps = conn.prepareStatement(sql);// 이 메소드 안에 OutputStream있다
		
		// 실행결과값 가져오기
		ResultSet rs = ps.executeQuery();
		
		// 출력
		while(rs.next()) // 값이 있을 때까지 가져와라
		{
			System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3));
		}
		rs.close();
		ps.close();
		conn.close();
		// 닫을 때는 역순으로 
		
         
	}

}
