package be.chickNorris.dao;

import javax.persistence.TypedQuery;

import be.chickNorris.models.User;

public class UserDAO extends AbstractDAO {

	public void create(User user) {
		getEntityManager().persist(user);
	}

	public User read(int ID) {
		return getEntityManager().find(User.class, ID);
	}

	public void delete(int ID) {
		User user = getEntityManager().find(User.class, ID);
		if (user != null) {
			getEntityManager().remove(user);
		}
	}

	public User findUserByName(String username) {
		try {
			TypedQuery<User> query = getEntityManager().createNamedQuery("findUserByName", User.class);

			query.setParameter("name", username);

			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}

	}

}
