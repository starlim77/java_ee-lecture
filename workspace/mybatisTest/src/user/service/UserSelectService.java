package user.service;

import user.dao.UserDAO;

public class UserSelectService implements UserService {

	@Override
	public void execute() {
		
		UserDAO userDAO = UserDAO.getInstanse();
		userDAO.select();
		
	}

}
