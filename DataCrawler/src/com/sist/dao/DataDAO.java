package com.sist.dao;
import java.util.*;

import com.sist.vo.FoodVO;

import java.sql.*;
public class DataDAO {

	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@:1521:xe";
	
	// 싱글턴이 필요함 => 메모리할당 때문에 해줬음
	private static DataDAO dao;
	
	public DataDAO()
	{
		// 드라이버 등록
		try
		{
		   Class.forName("oracle.jdbc.driver.OracleDriver");	
		}
		catch (Exception ex) 
		{
			
		}
	}
	
	// session=ssf.openSession 부분
	public void getConnection()
	{
		try
		{
			conn = DriverManager.getConnection(URL,"hr","happy");
		}
		catch (Exception ex) 
		{
			
		}
	}
	
	// 싱글턴 부분
	public static DataDAO newInstance()
	{
		if(dao==null)
			dao=new DataDAO();
		return dao;
	}
	
	// session.close()
	public void disConnection()
	{
		try
		{
			if(ps!=null)
				ps.close();
			if(conn!=null)
				conn.close();
		}
		catch (Exception ex) 
		{
			
		}
	}
	
	// session.insert(id명,no)
	public void foodInsert(FoodVO vo)
	{
		try
		{
			getConnection();
			// 디비 컬럼 순서대로 적어야함
			String sql = "INSERT INTO food(no,cno,name,type,phone,"
			+"address,price,score,theme,time,reserve,"
			+ "parking,content,poster,images) "
			+"VALUES(food_no_seq.nextval,?,?,?,?,?,?,?,"
			+ "?,?,?,?,?,?,?)";
			
			
			/*
			 *  이 밑에 ps. ~ 는
			 *  SqlSession session = ssf.openSession(true)
			 *  session.insert("foodInsert",vo)
			 *  session.close()
			 *  부분이다
			 */
			// 디비에 넣는 부분은 꼭 변수순서 지켜야 한다
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getCno());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getType());
			ps.setString(4, vo.getPhone());
			ps.setString(5, vo.getAddress());
			ps.setString(6, vo.getPrice());
			ps.setDouble(7, vo.getScore());
			
			ps.setString(8, vo.getTheme());
			ps.setString(9, vo.getTime());
			ps.setString(10, vo.getReserve());
			ps.setString(11, vo.getParking());
			ps.setString(12, vo.getContent());
			ps.setString(13, "https://www.menupan.com"+vo.getPoster()); // 주소 반드시 붙이기
			ps.setString(14, vo.getImages());
			
		
			ps.executeUpdate();
			
			
			
		}
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		finally 
		{
		   disConnection();	
		}
		
	}
	
}
