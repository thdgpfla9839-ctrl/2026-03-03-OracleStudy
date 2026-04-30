package com.sist.dao;
import java.util.*;
/*
 * 문자나 날짜 검색할 때는 '' 필요해 그러니까 ?를 써주면 대체됨
 * 정수나 실수는 대입하면 됨
 * 날짜를 검색할 떄는 sysdate마다 값이 틀리잖아 시간,분,초까지 포함돼 있어 소수점이 틀리게 돼 long형이야
 * 그래서 trunc(sysdate) 처리해주자 뒤에거 다 버리고 시작(소수점)
 */
import com.sist.vo.EmpVO;

import java.sql.*;
public class EmpDAO {
	private Connection conn; // Socket => 연결 담당 
	  private PreparedStatement ps; // BufferedReader , OutputStream 
	  // 송(SQL문장) 수신(오라클에서 결과값 받기)
	  private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	  
	  // 1. 드라이버 등록 
	  public EmpDAO()
	  {
		  try
		  {
			  Class.forName("oracle.jdbc.driver.OracleDriver");
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
	  }
	  // 2. 오라클 연결 
	  public void getConnection()
	  {
		  try
		  {
			  conn=DriverManager.getConnection(URL,"hr",
					         "happy");
			  // conn => SQL PLus
		  }catch(Exception ex) {}
	  }
	  // 3. 오라클 연결 해제 
	  public void disConnection()
	  {
		  try
		  {
			  if(ps!=null) ps.close();
			  if(conn!=null) conn.close();
		  }catch(Exception ex) {}
	  }
	  
	  // 기능
	  // 1. 사원 목록에서 추가, 수정, 삭제
	  public List<EmpVO> empListData(int page)
	  {
		  List<EmpVO> list = new ArrayList<EmpVO>();
		  try
		  {
			  getConnection();
			  String sql ="SELECT empno,ename,job,TO_CHAR(hiredate,'YYYY-MM-DD') "
			  		      +"emp2.deptno,dname,loc "
					      +"FROM emp2 JOIN dept "
			  		      +"ON emp2.deptno=dept.deptno "
					      +"ORDER BY hiredate ASC "
			  		      +"OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
			    // 문장 전송
			  ps = conn.prepareStatement(sql);
			  ps.setInt(1, (page*20)-20);
			  
			  // 실행 후 결과값 읽어오기
			  ResultSet rs = ps.executeQuery();
			  while(rs.next())
			  {
				  EmpVO vo=new EmpVO();
				  vo.setEmpno(rs.getInt(1));
				  vo.setEname(rs.getString(2));
				  vo.setJob(rs.getString(3));
				  vo.setDbday(rs.getString(4));
				  vo.setDeptno(rs.getInt(5));
				  vo.getDvo().setDname(rs.getString(6));
				  vo.getDvo().setLoc(rs.getString(7));
				  list.add(vo);
			  }
			  rs.close();
		  }
		  catch (Exception ex) {
			  ex.printStackTrace();
			// TODO: handle exception
		}
		  finally {
			disConnection();
		}
		  return list;
	  }
	  public List<String> empGetDeptno()
	  {
		  List<String> list=new ArrayList<String>();
		  try
		  {
			  getConnection();
			  String sql="SELECT DISTINCT dname "
					    +"FROM dept "
					    +"ORDER BY deptno ASC";
			  ps=conn.prepareStatement(sql);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				  list.add(rs.getString(1));
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
	  // 2. 사원 검색 -> 부서별 검색 / 이름으로 검색
	  
	  public List<EmpVO> empFindData(String dname)
	  {
		  List<EmpVO> list=
				  new ArrayList<EmpVO>();
		  try
		  {
			  getConnection();
			  String sql="SELECT empno,ename,job,TO_CHAR(hiredate,'YYYY-MM-DD'),"
					    +"emp2.deptno,dname,loc "
					    +"FROM emp2 JOIN dept "
					    +"ON emp2.deptno=dept.deptno "
					    +"AND dept.dname=?";
			  // "AND dept.dname="+dname => 오류 
			  // "AND dept.dname='"+dname+"'"
			  // 문장 전송
			  // => 정수 / 실수 => 대입 
			  // => 문자 / 날짜 => ''가 필요 => ?
			  // 날짜 검색 
			  // => SYSDATE => 값이 틀리다 
			  // => TRUNC(SYSDATE) 소수점 (시간,분,초)
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, dname);
			  // 실행 후 결과값 
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				  EmpVO vo=new EmpVO();
				  vo.setEmpno(rs.getInt(1));
				  vo.setEname(rs.getString(2));
				  vo.setJob(rs.getString(3));
				  vo.setDbday(rs.getString(4));
				  vo.setDeptno(0);
				  vo.getDvo().setDname(rs.getString(6));
				  vo.getDvo().setLoc(rs.getString(7));
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
	  public List<String> empGetDeptno()
	  {
		  List<String> list=new ArrayList<String>();
		  try
		  {
			  getConnection();
			  String sql="SELECT DISTINCT dname "
					    +"FROM dept "
					    +"ORDER BY deptno ASC";
			  ps=conn.prepareStatement(sql);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				  list.add(rs.getString(1));
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
	  
	  // 로그인처리
	  public String isLogin(int empno, String ename)
	  {
		  String result="";
	  }
	  
	  // 3. 부서 이동(기업관리에서 등급처리한 거 참고) ->combo이용해서 이동
	  // 4. 출퇴근 관리 -> 출근 버튼 누르면 출근 /  퇴근도 동일 => 최종적으로 통계
	  // 5. 급여
	  // 도서관리는 대출 / 도서 검색 / 도서 수정 / 추가 삭제,,,
	  // 상품구매는 구매 / 상품 검색 / 상품 수정 / 통계 -> 회원 등급 결정
}
