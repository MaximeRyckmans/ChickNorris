package be.chickNorris.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.chickNorris.models.Calendar;
import be.chickNorris.services.CalendarService;

/**
 * Servlet implementation class CalendarServlet
 */
@WebServlet("/Calendar.htm")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VIEW = "WEB-INF/JSP/calendar.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CalendarServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(VIEW);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String calendarStartDate = request.getParameter("calendarStartDate");
		String calendarEndDate = request.getParameter("calendarEndDate");
		CalendarService calendarService = new CalendarService();
		DateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		Date startDate = new Date();
		Date endDate = new Date();
		try {
			startDate = format.parse(calendarStartDate);
			endDate = format.parse(calendarEndDate);
		} catch (ParseException e1) {
			response.sendRedirect("/Admin.htm#calendarTab");
		}
		if (request.getParameter("removeDate") != null) {
			Calendar cal = calendarService.selectCalendarsByStartDate(startDate);
			calendarService.delete(cal.getID());
			response.sendRedirect("/Admin.htm#calendarTab");
		} else if (request.getParameter("addDate") != null) {

			try {

				Calendar cal = new Calendar();
				cal.setStartDate(startDate);
				cal.setEndDate(endDate);
				cal.setReserved(true);
				calendarService.create(cal);

				response.sendRedirect("/Admin.htm#calendarTab");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("/Admin.htm#calendarTab");
			}

		}
	}
}
