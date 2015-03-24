package be.chickNorris.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import be.chickNorris.models.Calendar;
import be.chickNorris.models.Customer;

public class CalendarDAO extends AbstractDAO {

	public void create(Calendar calendar) {
		getEntityManager().persist(calendar);
	}

	public Calendar read(int ID) {
		return getEntityManager().find(Calendar.class, ID);
	}

	public void delete(int ID) {
		Customer customer = getEntityManager().find(Customer.class, ID);
		if (customer != null) {
			getEntityManager().remove(customer);
		}
	}

	/**
	 * Returns a list of Customer objects.
	 *
	 * @param projectCode
	 * @return
	 */
	public List<Calendar> getAllCalendars() {
		TypedQuery<Calendar> query = getEntityManager().createNamedQuery("selectAllCalenders", Calendar.class);

		return query.getResultList();
	}

	public List<Calendar> selectAllReservedCalendars(boolean isReserved) {
		TypedQuery<Calendar> query = getEntityManager().createNamedQuery("selectAllReservedCalendars", Calendar.class);
		Boolean b = new Boolean(isReserved);
		String bool = b.toString();

		query.setParameter("isReserved", b);
		return query.getResultList();
	}

}
