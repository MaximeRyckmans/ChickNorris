package be.chickNorris.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.chickNorris.models.Address;
import be.chickNorris.models.Customer;
import be.chickNorris.models.Order;
import be.chickNorris.services.AddressService;
import be.chickNorris.services.CustomerService;
import be.chickNorris.services.OrderService;

/**
 * Servlet implementation class PartyFormServlet
 */
@WebServlet("/Party-Form.htm")
public class PartyFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VIEW = "WEB-INF/JSP/party-form.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PartyFormServlet() {
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

		String surname = request.getParameter("form_name");

		String name = request.getParameter("form_firstname");
		String companyName = request.getParameter("form_firmname");

		String address = request.getParameter("form_address");
		String postalCode = request.getParameter("form_zip");
		String city = request.getParameter("form_city");

		String vatNumber = request.getParameter("form_taxnbr");
		String telNR = request.getParameter("form_phone");
		String email = request.getParameter("form_email");
		String occasion = request.getParameter("form_occasion");
		String eventDateString = request.getParameter("form_date");

		SimpleDateFormat dateFormat = new SimpleDateFormat("mm/dd/yyyy");
		Date eventDate = new Date();
		try {
			eventDate = dateFormat.parse(eventDateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String eventTimeString = request.getParameter("form_time");

		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
		Date eventTime = new Date();
		try {
			eventTime = timeFormat.parse(eventTimeString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int formula = Integer.parseInt(request.getParameter("optionsRadios"));

		try {
			Address fullAddress = new Address();
			fullAddress.setAddress(address);
			fullAddress.setPlace(city);
			fullAddress.setPostalCode(postalCode);
			AddressService addressService = new AddressService();
			addressService.create(fullAddress);

			Customer customer = new Customer();
			customer.setAddress(fullAddress);
			customer.setCompanyName(companyName);
			customer.setEmail(email);
			customer.setName(name);
			customer.setSurName(surname);
			customer.setTelNR(telNR);
			customer.setVATNumber(vatNumber);
			CustomerService customerService = new CustomerService();
			customerService.create(customer);
			Order order = new Order();
			order.setCustomer(customer);
			order.setEventDate(eventDate);
			order.setEventTime(eventTime);
			order.setOccasion(occasion);
			order.setFormula(formula);

			OrderService orderService = new OrderService();
			orderService.create(order);
			response.sendRedirect("/ChickNorris//Party-Form.htm");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
}
