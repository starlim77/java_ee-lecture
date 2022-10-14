package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectMain {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	public SelectMain() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectArticle() {
		String sql = "select*from dbtest";
		
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			//rs의 크기를 구해오는 함수가 없다. rs.length x  rs.size x
			//rs.next()-현재 위치에 항목이 있으면 T,없으면 F
			//rs.getString("name")   rs.getString(1)
			//rs.getInt("age")    rs.getInt(2)
			//rs.getDouble("height")   rs.getDouble(3)
			//rs.getDate("logtime")  rs.getString("logtime")  rs.getDate(4)
			while(rs.next()) {
				System.out.print(rs.getString("name")+"\t"
								+rs.getInt("age")+"\t"
								+rs.getDouble("height")+"\t"
								+rs.getDate("logtime"));
				System.out.println();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
				try {
					if(rs!=null)rs.close();  // 실행의 역순대로 종료
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
	}
	
	public static void main(String[] args) {

		SelectMain selectMain = new SelectMain();
		selectMain.selectArticle();
		
	}

}
