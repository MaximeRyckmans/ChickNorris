package be.chickNorris.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.chickNorris.models.Location;
import be.chickNorris.services.LocationService;

@WebServlet("/geoLocatie.htm")
public class GeoLocationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GeoLocationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String truckNumber = request.getParameter("truckId");
		String lat = request.getParameter("lat");
		String longitude = request.getParameter("long");
		String locAddress = request.getParameter("address");
		String region = request.getParameter("region");
		Date localDate = new Date();

		Location location = new Location();
		location.setLatitude(lat);
		location.setLongitude(longitude);
		location.setTruckNumber(truckNumber);
		location.setLocationDate(localDate);
		location.setLocAddress(locAddress);
		location.setRegion(region);

		LocationService locationService = new LocationService();
		locationService.create(location);

		response.sendRedirect("/ChickNorris/Admin.htm");

	}

}
