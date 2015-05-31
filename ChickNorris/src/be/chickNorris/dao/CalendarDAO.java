package be.chickNorris.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import be.chickNorris.models.Calendar;

public class CalendarDAO extends AbstractDAO {

	public void create(Calendar calendar) {
		getEntityManager().persist(calendar);
	}

	public Calendar read(int ID) {
		return getEntityManager().find(Calendar.class, ID);
	}

	public void delete(int ID) {
		Calendar calendar = getEntityManager().find(Calendar.class, ID);
		if (calendar != null) {
			getEntityManager().remove(calendar);
		}
	}

	/**
	 * Returns a list of Customer objects.
	 *
	 * @return
	 */
	public List<Calendar> getAllCalendars() {
		TypedQuery<Calendar> query = getEntityManager().createNamedQuery("selectAllCalenders", Calendar.class);

		return query.getResultList();
	}

	public List<Calendar> selectAllReservedCalendars(boolean isReserved) {
		TypedQuery<Calendar> query = getEntityManager().createNamedQuery("selectAllReservedCalendars", Calendar.class);
		Boolean b = new Boolean(isReserved);

		query.setParameter("isReserved", b);
		return query.getResultList();
	}

	public Calendar selectCalendarsByStartDate(Date startDate) {
		TypedQuery<Calendar> query = getEntityManager().createNamedQuery("selectCalendarsByStartDate", Calendar.class);
		query.setParameter("startDate", startDate);

		return query.getSingleResult();

	}

}
