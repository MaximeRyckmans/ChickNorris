package be.chickNorris.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import be.chickNorris.models.Subscriber;

public class SubscriberDAO extends AbstractDAO {

	public void create(Subscriber subscriber) {
		getEntityManager().persist(subscriber);
	}

	public Subscriber read(int ID) {
		return getEntityManager().find(Subscriber.class, ID);
	}

	public void delete(int ID) {
		Subscriber subscriber = getEntityManager().find(Subscriber.class, ID);
		if (subscriber != null) {
			getEntityManager().remove(subscriber);
		}
	}

	/**
	 * Returns a list of Subscriber objects.
	 *
	 * @return
	 */
	public List<Subscriber> getAllSubscribers() {
		TypedQuery<Subscriber> query = getEntityManager().createNamedQuery("selectAllSubscribers", Subscriber.class);

		return query.getResultList();
	}

}
