package be.chickNorris.services;

import be.chickNorris.dao.UserDAO;
import be.chickNorris.models.User;

public class UserService {

	private final UserDAO userDAO = new UserDAO();

	public void create(User user) {
		userDAO.beginTransaction();
		userDAO.create(user);
		userDAO.commit();
	}

	public User read(int ID) {
		return userDAO.read(ID);
	}

	public void delete(int ID) {
		userDAO.beginTransaction();
		userDAO.delete(ID);
		userDAO.commit();
	}

	public User findUserByName(String username) {
		return userDAO.findUserByName(username);
	}

	public boolean checkAuthentication(User user, String username, String password) {

		if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
			return true;
		}
		return false;
	}

}
