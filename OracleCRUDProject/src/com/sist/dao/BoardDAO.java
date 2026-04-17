package com.sist.dao;
// 여기 다시 보기
// 리플렉션 정리하기
// 오라클과 연결해주는 사용자 요청을 받는 클래스
// 웹에서도 안 변해
import java.util.*; //데이터를 묶어서 윈도우나 브라우저에 보냄
// 묶을 때 쓰는게 List<BoardVO>
// List<BoardVO> => 게시물 한개에 대한 정보

import com.sist.vo.BoardVO;

import java.sql.*; // 오라클 연결하는 부분
// Connection / prepareStatement / ResultSet 각각 뭘 의미하는지 찾기

public class BoardDAO {
 private Connection conn; // 오라클 연결하는 부분
 private PreparedStatement ps; // sql 결과값 읽는 부분
 //ResultSet : sql문장에 따라 메모리 크기가 다르다
 
 private static BoardDAO dao; // 싱글턴 만들기 -> 커넥션 생성을 조절
 
 private static final String URL="jdbc:oracle:thin:@localhost:1521:XE";
 
 // 드라이버 등록 -> 생성자에서 한번만 호출 후 한번만 수행한다
    public BoardDAO()
    {
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		// 리플렉션-> 클래스이름으로 제어(메모리 할당, 메소드 호출, 변수값 추가....)
    		// 스프링 -> invoke()
    	}
    	catch (Exception ex)
    	{
			ex.printStackTrace();
		}
    }
 // 연결
    public void getConnection()
    {
    	try
    	{
    		// 괄호 내용이 바뀔 수 있어서 인터페이스로 쓰인다
    		conn = DriverManager.getConnection(URL,"hr","happy");
    	}
    	catch (Exception ex) {}
			
		
    }
 // 닫기
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close();
    	}catch (Exception ex) {
			// TODO: handle exception
		}
    }
 // 싱글턴 만들기
    public static BoardDAO newInstance()
    {
    	if(dao==null)
    		dao=new BoardDAO();
    	return dao;
    }
 //-------------------------여기까지가 디비연결시 항상 나오는 과정
 
 // 여기서는 추가사항
 // 기능
 //1. 목록 -> 페이징 여부
    public List<BoardVO> boardListData(int page)
    {
    	List<BoardVO> list = new ArrayList<BoardVO>();
    	try
    	{
    		// 연결
    		getConnection();
    		//sql 문장 제작
    		String sql ="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD')as dbday,hit "
    				    +"From board "
    				    +"ORDER BY no DESC " // 뒤에 공백을 줘야 에러가 안나 명령어가 죄다 붙어서 말도 안 됨 오류나
    				    +"OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY"; // 페이지 나누기 
    		ps=conn.prepareStatement(sql);
    		// ?에 값을 채운다
    		int rowSize=10;
    		int start =(page * rowSize)-rowSize;
    		// 1페이지면 0부터 시작 / 2페이지면 10
    		ps.setInt(1, start);
    		
    		// 실행 후 결과값 받기
    		ResultSet rs = ps.executeQuery();
    		while (rs.next()) // 넥스트는 순차적으로 값을 가져오게 해줘
    		{
    			// getInt() -> getString()
    			//getDouble() -> getDate()
    			//get         -> get         
    			BoardVO vo = new BoardVO();
    			vo.setNo(rs.getInt(1));
    			vo.setSubject(rs.getString(2));
    			vo.setName(rs.getString(3));
    			vo.setDbday(rs.getString(4));
    			vo.setHit(rs.getInt(5));
    			list.add(vo);
    			
    		}
    		rs.close();
    		
    	}
    	catch (Exception e) {
			// TODO: handle exception
		}
    	finally
    	{
    		disConnection();
    	}
    	return list;
    }
    
 //1-1 총페이지 구하기
    public int boardTotalPage()
    {
    	int total=0;
    	try
    	{
    		// 연결
    		getConnection();
    		
    		//sql 문장
    		String sql="SELECT CEIL(COUNT(*)/10.0) FROM board"; //총페이지 구할 CEIL()
    		ps=conn.prepareStatement(sql);
    		ResultSet rs =ps.executeQuery();
    		rs.next(); // 커서가 값이 있는 위치로 이동, 커서가 위치가 바껴서 옮겨야 값을 가져올 수 있어/ 값이 여러개면 while문 *** 너무 중요한 코드야 절대 빠지면 안됨!!!!!!!!!!!
    		           // 값이 한개면 next() 한개만 주면됨
    		           
    		total=rs.getInt(1);
    		rs.close();
    		
    	}
    	catch (Exception ex) {
    		ex.printStackTrace();
			// TODO: handle exception
    		
		}
    	finally
    	{
    		// 오라클 닫기
    		disConnection();
    	}
    	return total; // 리턴 먼저 잡고 시작해
    }
 //2. 상세보기 -> 조건문  where / 조회수 증가가 가능한지
 //3. 글쓰기 -> insert 사용가능한지
 //4. 수정 -> update 사용이 가능한지
 //5. 삭제 -> delete 사용이 가능한지
 //6. 찾기 -> like 문장 사용할 수 있는지
 
}
