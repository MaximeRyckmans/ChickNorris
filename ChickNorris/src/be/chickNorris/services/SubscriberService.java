package be.chickNorris.services;

import java.util.List;

import be.chickNorris.dao.SubscriberDAO;
import be.chickNorris.models.Subscriber;

public class SubscriberService {

	private final SubscriberDAO subscriberDAO = new SubscriberDAO();

	public void create(Subscriber subscriber) {
		subscriberDAO.beginTransaction();
		subscriberDAO.create(subscriber);
		subscriberDAO.commit();
	}

	public Subscriber read(int ID) {
		return subscriberDAO.read(ID);
	}

	public void delete(int ID) {
		subscriberDAO.beginTransaction();
		subscriberDAO.delete(ID);
		subscriberDAO.commit();
	}

	public List<Subscriber> getAllSubscribers() {
		return subscriberDAO.getAllSubscribers();
	}

	public Subscriber getSubscribersByEmailAddress(String email) {

		try {
			return subscriberDAO.getSubscribersByEmailAddress(email);
		} catch (Exception e) {
			return null;
		}
	}
}
