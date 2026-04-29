//package com.sist.dao;
//// 오라클과 연결
///*
// *  자바에서 변수 잡을 때는 VO
// *         필요시에는 매개변수 / 지역변수
// *         연산자 : 산술연산자 / 대입연산자
// *         제어문 : if /for / while
// *         배열과 List(VO를 모아서 전송해줌)
// *         객체지향프로그램에서 캡슐화 :VO / 포함 : Connection, PrepareStatement / 오버라이딩
// *                        class 클래스 / 메소드(리턴형, 매개변수)
// *                        예외처리 try ~ catch
// *                        라이브러리 String / Math(ceil) / StringTokenizer / Date -> 이 키워드 위주로 공부
// *                                 
// *         
// *         
// */
//import java.util.*; // 데이터 모아주는 리스트 라이브러리
//
//import com.sist.vo.MovieVO;
//
//import java.sql.*; // 오라클과 연결해주는 데이터베이스 라이브러리
// /*-- 데이터베이스 준비 --
//  * 
//  * 드라이버 등록
//  *  : 연결할 준비 -> Class.forName("oracle.jdbc.driver.OracleDriver")
//  *                             참고) com.mysql.cj.driver.Driver -> mysql, mariadb에서 연결할 때
//  * 오라클과 연결
//  *  : Connection conn = DriverManager.getConnection(URL,username,password)
//  *    -> conn hr / happy
//  *       URL을 줄때는
//  *       ->  jdbc : 업체명 : 드라이버종류 : @IP : PORT : 데이터베이스명
//  *       예)         oracle   thin   localhost 1521  XE
//  *                                    공용디비면 IP 쓴다 (IP 사용했을 시 깃허브에 올리면 안 도ㅐ)
//  * sql 문장 만들기
//  *  : String sql ="SELECT / INSERT / UPDATE / DELETE .... " -> 여기는 뭐가 올지 몰라
//  *           참고) mybatis : XML 
//  *           
//  * sql 문장을 오라클에 전송
//  *  : PrepareStatement ps = conn.prepareStatement(sql)
//  *  
//  * 오라클에서 실행 요청 -> 끝나고 난 후 결과값 받기
//  *  : 1) ResultSet rs = ps.executeQuery() -> select문장 실행할 때 사용
//  *    2) int a = ps.executeUpdate()  -> insert / update / delete 실행할 때 사용
//  * List / VO 에 값을 채운다
//  *  : list.add()
//  *  
//  * 닫기
//  *  : ps.close() / conn.close()
//  *  
//  *  -- 기능 설정 -- 
//  *  -> 예를들어 movie를 갖고 작성한다 했을 때
//  *  목록 
//  *   : 사용자가 페이지를 요청해야한다 -> 사용자가 넘겨준 페이지가 매개변수에 해당됨
//  *      예) 1 row 당 VO 1개
//  *         -> 20개같이 여러개를 주면 객체를 모아서 저장한 후 한번에 전송해주는 List 이용하자
//  *            리턴형은 List<MovieVo>
//  *            매개변수 (int page)
//  *  상세보기
//  *   : 사용자가 번호를 요청 -> 해당 번호를 보여달라
//  *                        단, 중복 없는 데이터로 이때는 primary Key
//  *                        리턴형 : MovieVO
//  *                        매개변수 : 영화번호 -> int mno
//  *                        
//  *  
//  *  검색
//  *   : 리턴형 -> List<MovieVO>
//  *     매개변수 -> 2개가 나옴(검색어랑 컬럼)
//  *               String fd, String column
//  *               
//  *  
//  */
//public class MovieDAO {
//   // 1. 연결 객체
//	private Connection conn;
//	
//	// 2. 오라클과 송신과 수신을 해주는 역할
//	private PreparedStatement ps;
//	
//	// ressulSet은 sql에 따라 저장되는 결과값(데이터)이 달라 -> 지역변수로 사용
//	
//	//3. URL 긴문장 저장, URL은 final처리 
//	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
//	
//	// 포트번호 찾을 때 : dbhome - listener.ora에서 포트번호 확인가능
//   // mysql, mariadb -> 포트번호 3306
//   // mssql -> 포트번호 1433	
//	
//	// 1. 드라이버 등록 -> 한번만 설정하면 됨 -> 생성자 이용
//	public MovieDAO()
//	{
//		try
//		{
//			// 연결만 담당 : thin드라이버
//			// 오라클에 있는 데이터를 드라이버에 설정하는 것은 -> OCI
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//		}
//		catch (Exception ex) {
//			ex.printStackTrace();
//		}
//	}
//	
//	// 2. 오라클 연결(연동) -> SQLPlus
//	public void getConnection()
//	{
//		try
//		{
//			conn = DriverManager.getConnection(URL,"hr","happy");
//		}
//		catch (Exception ex) {
//			// TODO: handle exception
//		}
//	}
//	
//	// 3. 오라클 닫기
//	public void disConnection()
//	{
//		try
//		{
//			//ps : 연결 / conn : 통신
//			if(ps!=null) ps.close();
//			if(conn!=null) conn.close();
//			
//		}
//		catch (Exception ex) {}
//			
//		
//	} // 여기까지 공통사항
//	
//	// 이제부터는 기능을 추가할 거야
//	
//	// 1. 목록
//	public List<MovieVO> movieListData(int page)
//	{
//		List<MovieVO> list = new ArrayList<MovieVO>();
//		try
//		{
//			
//		}
//		catch (Exception ex) {
//			ex.printStackTrace();
//			
//		}
//		finally
//		{
//			disConnection();
//			
//		}
//		return list;
//	}
//	
//	// 2. 상세보기
//	public MovieVO movieDetailData(int mno)
//	{
//		MovieVO vo = new MovieVO();
//		try
//		{
//			
//		}
//		catch (Exception ex) {
//			ex.printStackTrace();
//			
//		}
//		finally
//		{
//			disConnection();
//			
//		}
//		return vo;
//	}
//	// 3. 검색
//	public List<MovieVO> moiveFindData(String col,String fd)
//	{
//
//		MovieVO = new MovieVO();
//		try
//		{
//			
//		}
//		catch (Exception ex) {
//			ex.printStackTrace();
//			
//		}
//		finally
//		{
//			disConnection();
//			
//		}
//		return vo;
//	}
//	
//}

package com.sist.dao;
/*
 *   자바 
 *    => 변수 (VO) , 필요시 => 매개변수 / 지역변수 
 *                          | => 사용자 요청값 
 *    => 연산자 : 산술연산자 , 대입연산자 
 *    => 제어문 : if / for / while 
 *    => 배열 / List
 *             ---- VO를 모아서 전송 
 *    => 객체지향 프로그램 
 *       => 캡슐화 : VO 
 *       => 포함 =>  Connction / PreparedStatement
 *       => 오버라이딩
 *       => class 클래스 / 메소드
 *                       => 리턴형 / 매개변수 
 *    => 예외처리 
 *       try ~ catch 
 *    => 라이브러리 
 *       String / Math(ceil) / StringTokenizer
 *       Date / FileInputStream / FileOutputStream
 *       BufferedReader 
 *       Connection / PreparedStatement / ResultSet 
 *       *** List / Map 
 *    ----------------------------------------------
 *    J2EE : 브라우저에서 값 받기 / 브라우저로 값 전송 
 *    
 */
import java.util.*; // List

import com.sist.vo.MovieVO;

import java.sql.*; // 오라클 (데이터베이스) 
/*
 *   1. 드라이버 등록 
 *      연결할 준비 
 *      Class.forName("oracle.jdbc.driver.OracleDriver")
 *                     com.mysql.cj.driver.Driver
 *                     => mysql , mariadb 
 *   2. 오라클 연결 
 *      Connection conn=
 *        DriverManager.getConnection(URL,username,password)
 *        => conn hr/happy
 *        URL 
 *         jdbc:업체명:드라이버종류:@IP:PORT:데이터베이스명
 *              oracle thin     localhost 1521 XE 
 *                              => IP
 *                              => GIT
 *                              localhost 
 *                              => 127.0.0.1
 *   3. SQL문장 제작 (*****)
 *      String sql="SELECT/INSERT/UPDATE/DELETE"
 *                => mybatis : XML 
 *                => jpa : 메소드로 만든다 
 *   4. SQL문장을 오라클 전송 
 *      PreparedStatement ps=conn.preparedStatement(sql)
 *   5. 오라클 실행 => 결과값 받기 (*****)
 *      ResultSet rs=ps.executeQuery() // SELECT
 *      int a=ps.executeUpdate() // INSERT ,UPDATE, DELETE
 *   6. List/VO에 값을 채운다 (*****) list.add()
 *   7. 닫기  ps.close() / conn.close()
 *   
 *   == 기능 
 *   목록 : 사용자가 페이지 요청 
 *         ---------------- 매개변수
 *         20개 
 *         1 ROW => VO => while 
 *                 객체 저장 => List 
 *         리턴형 List<MovieVO>
 *         매개변수 (int page)
 *   상세보기 : 사용자가 영화번호
 *                   ------ 중복없는 데이터 => PRIMARY KEY
 *            리턴형 : MovieVO
 *            매개변수 : 영화번호 =>  int mno
 *   검색 : 리턴형 : List<MovieVO>
 *         매개변수 : 2개 
 *                  String fd , String column
 */
public class MovieDAO {
   //1. 연결 객체 
   private Connection conn;
   //2. 송수신 
   private PreparedStatement ps;
   // ResultSet -> SQL문장따라 저장되는 데이터가 틀리다 => 지역변수
   //3. URL 
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   // MySQL / MariaDB => 3306
   // MSSQL => 1433 => pub 
   // 단점 : 포트가 다를 수 있다 
   
   // 드라이버 등록 1 => 한번만 설정 
   public MovieDAO()
   {
	   // 연결만 : thin드라이버 
	   // 오라클에 있는 데이터를 드라이버에 설정 : OCI
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   
   // 2. 오라클 연동 => SQLPlus 
   public void getConnection()
   {
	   try
	   {
		   conn=
			DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex) {}
   }
   // 3. 오라클 닫기
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   // 공통 사항 => 오라클 반드시 열고 닫기
   // 기능 
   // 1. 목록
   public List<MovieVO> movieListData(int page)
   {
	   List<MovieVO> list=new ArrayList<MovieVO>();
	   try
	   {
		   // 1. 연결
		   getConnection();
		   // 2. SQL문장 
		   String sql="SELECT mno,title,genre,actor,regdate "
				     +"FROM movie "
				     +"ORDER BY mno "
				     +"OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
		   // 3. 오라클 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. ?에 값을 채운다 
		   int start=(page*20)-20; // 0 20 40...
		   ps.setInt(1, start);
		   
		   // 5. 실행후에 결과값 받기 
		   ResultSet rs=ps.executeQuery();
		   // new 
		   while(rs.next())
		   {
			   // ROW 1개당 => VO ==> 20개 
			   MovieVO vo=new MovieVO();
			   // ROW단위 => 저장 
			   vo.setMno(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setGenre(rs.getString(3));
			   vo.setActor(rs.getString(4));
			   vo.setRegdate(rs.getString(5));
			   // 전체 저장 
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return list;
   }
   // 1-1. 총페이지
   public int movieTotalPage()
   {
	   int total=0;
	   try
	   {
		   // 1. 연결 
		   getConnection();
		   // 2. SQL문장 만들기 
		   String sql="SELECT CEIL(COUNT(*)/20.0) "
				     +"FROM movie";
		   // 3. 오라클 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행후에 결과값을 가지고 온다 
		   ResultSet rs=ps.executeQuery();
		   // 5. 데이터가 출력된 위치에 커서를 올려둔다 
		   // 첫번째줄에 
		   rs.next();
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return total;
   }
   // 2. 상세보기 
   public MovieVO movieDetailData(int mno)
   {
	   MovieVO vo=new MovieVO();
	   try
	   {
		   // 1. 연결 
		   getConnection();
		   // 2. SQL문장 
		   String sql="SELECT mno,title,actor,genre,"
				     +"grade,regdate,director "
				     +"FROM movie "
				     +"WHERE mno=?";
		   //3. 오라클로 전송
		   ps=conn.prepareStatement(sql);
		   //4. ?에 값을 채운다 
		   ps.setInt(1, mno);
		   //5. 실행후 결과값 읽기
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   // 6. 데이터 저장 
		   vo.setMno(rs.getInt(1));
		   vo.setTitle(rs.getString(2));
		   vo.setActor(rs.getString(3));
		   vo.setGenre(rs.getString(4));
		   vo.setGrade(rs.getString(5));
		   vo.setRegdate(rs.getString(6));
		   vo.setDirector(rs.getString(7));
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return vo;
   }
   // 3. 검색 
   /*
    *   검색이 안됨 
    *   String sql="SELECT * FROM movie "
    *             +"WHERE "+col+" LIKE '%'||?||'%'" 
    *   
    *   #{} ${}
    *   ps.setString(1,col); => ''
    *   ps.setString(2,fd);
    *   ---------------------- 실제값만 ?
    *   table명 / 컬럼명은 문자열 결합 
    *   
    */
   public List<MovieVO> movieFindData(String col,String fd)
   {
	   List<MovieVO> list=new ArrayList<MovieVO>();
	   try
	   {
		   // 1. 연결
		   getConnection();
		   // 2. SQL 문장 제작 
		   String sql="SELECT mno,title,actor,regdate,genre "
				     +"FROM movie "
				     +"WHERE "+col+" LIKE '%'||?||'%'";
		   // "WHERE "+col+" LIKE '%"+'fd'+"%'" 
		   // 자바 => 오라클 SQL (LIKE)
		   // 3. 오라클로 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. ?에 값 채우기
		   ps.setString(1, fd);
		   // 5. 실행후에 결과값 읽기
		   ResultSet rs=ps.executeQuery();
		   // new 
		   while(rs.next())
		   {
			   // ROW 1개당 => VO ==> 20개 
			   MovieVO vo=new MovieVO();
			   // ROW단위 => 저장 
			   vo.setMno(rs.getInt("mno"));
			   vo.setTitle(rs.getString("title"));
			   vo.setGenre(rs.getString("genre"));
			   vo.setActor(rs.getString("actor"));
			   vo.setRegdate(rs.getString("regdate"));
			   // 전체 저장 
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return list;
   }
   // => 댓글 : CRUD 
}





