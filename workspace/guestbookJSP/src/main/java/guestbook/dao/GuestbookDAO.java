package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	private static GuestbookDAO guestbookDAO = new GuestbookDAO();
	public static GuestbookDAO  getIntense() {
		return guestbookDAO;
	}
	
	public GuestbookDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int guestbookWrite(GuestbookDTO guestbookDTO) {
		
		int su=0;
		
		String sql = "insert into guestbook values(seq_guestbook.nextval,?,?,?,?,?,sysdate)";
		
		getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, guestbookDTO.getName());
			pstmt.setString(2, guestbookDTO.getEmail());
			pstmt.setString(3, guestbookDTO.getHomepage());
			pstmt.setString(4, guestbookDTO.getSubject());
			pstmt.setString(5, guestbookDTO.getContent());
			
			su=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return su;
	}
	
	public ResultSet guestbookList() {
		
		String sql = "select * from guestbook order by seq desc";
		
		getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return rs;
		
	
	}
	
	
	
	
	
	
	public PreparedStatement getPstmt() {
		return pstmt;
	}
	public Connection getConn() {
		return conn;
	}
	//------------- ArrayList 사용
	
//	public void guestbookListArray(ArrayList<GuestbookDTO> arrayList) {
//		
//		String sql = "select name, email, homepage, subject, content, to_char(logtime, 'YYYY\".\"MM\".\"DD') as logtime from guestbook order by seq desc";
//		
//		GuestbookDTO guestbookDTO=null;
//		getConnection();
//		try {
//			pstmt=conn.prepareStatement(sql);
//			
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				guestbookDTO = new GuestbookDTO(rs.getString("name"), rs.getString("email"), rs.getString("homepage"), rs.getString("subject"), rs.getString("content"));
//				guestbookDTO.setLogtime(rs.getString("logtime"));
//				arrayList.add(guestbookDTO);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(rs!=null) rs.close();
//				if(pstmt!=null) pstmt.close();
//				if(conn!=null) conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//	
//	}
	
	public ArrayList<GuestbookDTO> guestbookListArray(Map<String, Integer> map) {
		
		ArrayList<GuestbookDTO> arraylist = new ArrayList<GuestbookDTO>();
		
		String sql = "select * from "
				+ " (select rownum rn, tt.* from "
				+ " (select name, email, homepage, subject, content, to_char(logtime, 'YYYY.MM.DD') as logtime "
				+ " from guestbook order by seq desc) tt) "
				+ " where rn>=? and rn<=? ";
		
		getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, map.get("startNum") );
			pstmt.setInt(2, map.get("endNum"));
			
			rs = pstmt.executeQuery();
			GuestbookDTO guestbookDTO = null;
			while(rs.next()) {
				guestbookDTO = new GuestbookDTO(rs.getString("name"), rs.getString("email"), rs.getString("homepage"), rs.getString("subject"), rs.getString("content"));
				guestbookDTO.setLogtime(rs.getString("logtime"));
				arraylist.add(guestbookDTO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			arraylist=null; //오류 났을 때 arraylist 의 값을 null 값으로 초기화 시켜서 listArray.jsp 파일에서 작동 하지 않게 설정 한다.
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}
		return arraylist;
	}
	
	public int getTotalA() {
		String sql = "select count(*) from guestbook";	
		getConnection();
		int totalA=0;
		try {
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totalA = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}
		return totalA;
	}
	
	
	
	
}
