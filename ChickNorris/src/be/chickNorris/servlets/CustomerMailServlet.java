package be.chickNorris.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.chickNorris.models.Subscriber;
import be.chickNorris.services.SubscriberService;

/**
 * Servlet implementation class CustomerMailServlet
 */
@WebServlet("/registreerMail.htm")
public class CustomerMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerMailServlet() {
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
		try {
			String email = request.getParameter("form_email");

			SubscriberService subscriberService = new SubscriberService();
			Subscriber subscriber = subscriberService.getSubscribersByEmailAddress(email);
			if (subscriber != null) {
				response.sendRedirect("/Home.htm");
			} else {
				Subscriber newSubscriber = new Subscriber();
				newSubscriber.setEmailAddress(email);
				subscriberService.create(newSubscriber);
				response.sendRedirect("/Home.htm");
			}
		} catch (Exception e) {
			response.sendRedirect("/Home.htm");
		}
	}

}
