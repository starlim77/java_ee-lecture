package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertMain {

	private Connection conn;
	private PreparedStatement pstmt;

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	public InsertMain() {
		//driver loading
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("driver loading success");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("connection success");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insertArticle() {
		//데이터
		Scanner scan = new Scanner(System.in);
		System.out.print("이름 입력 : ");
		String name = scan.next();
		System.out.print("나이 입력 : ");
		int age = scan.nextInt();
		System.out.print("키 입력 : ");
		double height = scan.nextDouble();
		
		
		//접속
		this.getConnection();
		
		try {
			pstmt = conn.prepareStatement("insert into dbtest values(?, ?, ?, sysdate)");//생성
			//웹보안을 위해 데이터가 들어갈 자리를 ? 로 만들어둔다.
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setDouble(3, height);
			int su = pstmt.executeUpdate();//실행 - 개수 리턴
			//자바로 처리하면 자동으로 commit 됨.
			System.out.println(su+"개의  행이(가) 삽입되었습니다.");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	
	public static void main(String[] args) {

		InsertMain insertMain = new InsertMain();
		insertMain.insertArticle();
		
		
	}

}
