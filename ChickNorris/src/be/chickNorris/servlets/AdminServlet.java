package be.chickNorris.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.chickNorris.models.Calendar;
import be.chickNorris.models.Location;
import be.chickNorris.services.CalendarService;
import be.chickNorris.services.LocationService;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/Admin.htm")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VIEW = "WEB-INF/JSP/Admin.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (session.getAttribute("loggedIn") == null) {
			response.sendRedirect("/Login.htm");
		} else {
			LocationService locationService = new LocationService();
			CalendarService calendarService = new CalendarService();
			List<Calendar> calendarList = calendarService.selectAllReservedCalendars(true);
			List<Location> listTrucks = new ArrayList<Location>();
			List<String> trucks = locationService.getAllTrucks();
			List<String> dateList = calendarService.returnDates(calendarList);

			request.setAttribute("dateList", dateList);
			for (String i : trucks) {
				listTrucks.add(locationService.getLatestLocationByTruckNumber(i));
			}
			request.setAttribute("listTrucks", listTrucks);

			RequestDispatcher dispatcher = request.getRequestDispatcher(VIEW);
			dispatcher.forward(request, response);
			session.removeAttribute("listCust");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// EmailSender emailSender = new EmailSender();
		// emailSender.sendEmail(sender, addresses, subject, templateName, mailBody);

		String locationId = request.getParameter("locationId");

		LocationService locationService = new LocationService();
		if (locationId != null) {
			int ID = Integer.parseInt(locationId);
			locationService.delete(ID);
		} else {
			locationService.deleteAllLocations();
		}

	}

}
