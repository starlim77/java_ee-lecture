package user.service;

import java.util.List;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {

	@Override
	public void execute() {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("1. 이름 검색");
		System.out.println("2. 아이디 검색");
		System.out.print("검색 조건 입력 : ");
		int num = scan.nextInt();
		
		if(num==1) System.out.print("찾는 이름 입력 : ");
		else System.out.print("찾는 아이디 입력 : ");
		String search = scan.next();
		
		UserDAO userDAO = UserDAO.getInstanse();
		List<UserDTO> list = userDAO.search(num, search);
		
		if(list.toString()!="[]") {// list.size()==0 
			for(UserDTO userDTO : list) {
				System.out.println(userDTO.getName() + "\t"
				          +userDTO.getId() + "\t"
				          +userDTO.getPwd());
			}
			
		}//if
		else System.out.println("검색 결과가 없습니다");
		
	}

}
