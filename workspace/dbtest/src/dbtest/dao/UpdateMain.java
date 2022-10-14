package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class UpdateMain {
	
	private Connection conn;
	private PreparedStatement pstmt;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	public UpdateMain() throws Exception {
		Class.forName(driver);
	}
	public void getConnection() throws Exception {
		conn = DriverManager.getConnection(url,username,password);
	}
	public void updateArticle() throws Exception {
		Scanner scan = new Scanner(System.in);
		System.out.print("수정할 이름 입력 : ");
		String name = scan.next();
		
		this.getConnection();
		pstmt = conn.prepareStatement("update dbtest set age=age+1, height=height+1 where name like ?");
		// ? 와 % 는 같이 못 쓰인다. 같은 와일드 카드이므로..
		pstmt.setString(1, "%"+name+"%");
		System.out.println("수정완료");
		int su = pstmt.executeUpdate();
		System.out.println(su);
		if(pstmt!=null) pstmt.close();
		if(conn!=null)conn.close();
	}
	public static void main(String[] args) throws Exception {

		UpdateMain updateMain = new UpdateMain();
		updateMain.updateArticle();
		
	}

}
