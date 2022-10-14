package student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Student {
	Scanner scan = new Scanner(System.in);
	
	public void menu() throws Exception {
		while(true) {
			System.out.println("****************");
			System.out.println(" 1.입력");
			System.out.println(" 2.검색");
			System.out.println(" 3.삭제");
			System.out.println(" 4.종료");
			System.out.println("****************");
			System.out.print(" 번호선택 : ");
			int menuNum = scan.nextInt();
			
			if(menuNum==4) break;
			else if(menuNum==1) insertArticle();
			else if(menuNum==2) selectArticle();
			else if(menuNum==3) deleteArticle();
		}//while
	}//menu()
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	private String sql;
	
	public Student() throws Exception {
		Class.forName(driver);
	}
	public void getConnection() throws Exception {
		conn = DriverManager.getConnection(url,username,password);
	}
	private void insertArticle() throws Exception {
		System.out.println("****************");
		System.out.println(" 1.학생");
		System.out.println(" 2.교수");
		System.out.println(" 3.관리자");
		System.out.println(" 4.이전메뉴");
		System.out.println("****************");
		System.out.print(" 번호선택 : ");
		int insertNum = scan.nextInt();
		
		if(insertNum==4)
			return;
		
		String name = null, value = null;
	
		getConnection();
		sql = "insert into student values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		System.out.print("이름 입력 : ");
		name = scan.next();
		
		if(insertNum==1) {
			System.out.print("학번 입력 : ");
		}
		else if(insertNum==2) {
			System.out.print("과목 입력 : ");
		}
		else if(insertNum==3) {
			System.out.print("부서 입력 : ");
		}
		value = scan.next();
		pstmt.setString(1, name);
		pstmt.setString(2, value);
		pstmt.setInt(3, insertNum);
		pstmt.executeUpdate();
		System.out.println("입력 완료");
		pstmt.close();
		conn.close();
	}//insert
	private void selectArticle() throws Exception {
		System.out.println("****************");
		System.out.println(" 1.이름 검색");
		System.out.println(" 2.전체 검색");
		System.out.println(" 3.이전메뉴");
		System.out.println("****************");
		System.out.print(" 번호선택 : ");
		int selectNum = scan.nextInt();
		
		if(selectNum==3) return;
		
		getConnection();
		String name = null;
		if(selectNum==1) {
			System.out.print("검색할 이름 입력 : ");
			name = scan.next();
			sql = "select*from student where name like ?";
		}
		if(selectNum==2) {
			sql = "select*from student";
		}
		pstmt = conn.prepareStatement(sql);
		if(selectNum==1) pstmt.setString(1, "%"+name+"%");
		rs=pstmt.executeQuery();
		while(rs.next()) {
			System.out.print("이름 = "+rs.getString("name")+"\t");
			if(rs.getInt("code")==1)
				System.out.print("학번 = " + rs.getString("value"));
			else if(rs.getInt("code")==2)
				System.out.print("과목 = " + rs.getString("value"));
			else if(rs.getInt("code")==3)
				System.out.print("부서 = " + rs.getString("value"));
			System.out.println();
		}//while
		rs.close();
		pstmt.close();
		conn.close();
	}//select
	private void deleteArticle() throws Exception {
		System.out.print("삭제를 원하는 이름 입력 : ");
		String name = scan.next();
		
		sql = "select*from student where name = ?";
		getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		if(rs.next()==true) {
			sql = "delete student where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.executeUpdate();
			System.out.println("삭제 완료");
		}
		else System.out.println("일치하는 이름이 없습니다");
	
		pstmt.close();
		conn.close();
	}//delete

	public static void main(String[] args) throws Exception {
		
		Student student = new Student();
		student.menu();
		System.out.println("프로그램 종료~~~");
	}

}
