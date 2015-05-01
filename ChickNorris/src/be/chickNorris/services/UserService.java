package be.chickNorris.services;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import be.chickNorris.dao.UserDAO;
import be.chickNorris.helper.Hasher;
import be.chickNorris.models.User;

public class UserService {

	private final UserDAO userDAO = new UserDAO();

	public void create(User user, String password) {
		userDAO.beginTransaction();
		Hasher hasher = new Hasher();
		byte[] salt = hasher.generateSalt();
		byte[] encryptedPassword = hasher.getEncryptedPassword(password, salt);
		user.setPassword(encryptedPassword);
		user.setSalt(salt);
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
		Hasher hasher = new Hasher();
		boolean validLogin = false;

		try {
			validLogin = hasher.authenticate(password, user.getPassword(), user.getSalt());
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (validLogin) {
			return true;
		}
		return false;
	}

}
