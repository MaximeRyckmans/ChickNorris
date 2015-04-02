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

		if (request.getParameter("removeDate") != null) {

		} else if (request.getParameter("addDate") != null) {

			DateFormat format = new SimpleDateFormat("yyyy-MMMM-dd");
			Date startDate;
			Date endDate;
			try {
				startDate = format.parse(calendarStartDate);
				endDate = format.parse(calendarEndDate);
				Calendar cal = new Calendar();
				cal.setStartDate(startDate);
				cal.setEndDate(endDate);
				cal.setReserved(true);
				calendarService.create(cal);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
}
