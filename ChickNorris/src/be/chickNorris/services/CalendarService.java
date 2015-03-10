package be.chickNorris.services;

import java.util.List;

import be.chickNorris.dao.CalendarDAO;
import be.chickNorris.models.Calendar;

public class CalendarService {

	private final CalendarDAO calendarDAO = new CalendarDAO();

	public void create(Calendar calendar) {
		calendarDAO.beginTransaction();
		calendarDAO.create(calendar);
		calendarDAO.commit();
	}

	public Calendar read(int ID) {
		return calendarDAO.read(ID);
	}

	public void delete(int ID) {
		calendarDAO.beginTransaction();
		calendarDAO.delete(ID);
		calendarDAO.commit();
	}

	public List<Calendar> getAllCalendars() {
		return calendarDAO.getAllCalendars();
	}
}
