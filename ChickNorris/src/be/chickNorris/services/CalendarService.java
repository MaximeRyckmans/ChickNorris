package be.chickNorris.services;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
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

	public List<Calendar> selectAllReservedCalendars(boolean isReserved) {
		return calendarDAO.selectAllReservedCalendars(isReserved);
	}

	public List<String> returnDates(List<Calendar> calendars) {

		List<String> stringDates = new ArrayList<String>();
		for (Calendar c : calendars) {

			Instant instant = Instant.ofEpochMilli(c.getStartDate().getTime());
			Instant instant2 = Instant.ofEpochMilli(c.getEndDate().getTime());

			LocalDate start = LocalDateTime.ofInstant(instant, ZoneId.systemDefault()).toLocalDate();
			LocalDate end = LocalDateTime.ofInstant(instant2, ZoneId.systemDefault()).toLocalDate();
			List<LocalDate> totalDates = new ArrayList<>();
			while (!start.isAfter(end)) {
				totalDates.add(start);

				start = start.plusDays(1);
			}
			for (LocalDate l : totalDates) {
				stringDates.add(l.toString());
			}

		}
		return stringDates;
	}
}
