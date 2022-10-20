package user.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService {

	@Override
	public void execute() {
Scanner scan = new Scanner(System.in);
		
		System.out.print("수정할 아이디 입력 : ");
		String id = scan.next();
		
		UserDAO userDAO = UserDAO.getInstanse();
		UserDTO userDTO = userDAO.getUser(id);
		
		if(userDTO!=null) {
			
			int su = userDAO.delete(id);
			
			System.out.println(su+"개의 데이터 삭제 완료");
			
		}else System.out.println("삭제 하고자 하는 아이디가 없습니다");
		
	}

}
