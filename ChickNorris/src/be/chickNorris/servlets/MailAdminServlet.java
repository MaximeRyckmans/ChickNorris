package be.chickNorris.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.chickNorris.helper.EmailSender;
import be.chickNorris.models.Subscriber;
import be.chickNorris.services.SubscriberService;

/**
 * Servlet implementation class MailAdminServlet
 */
@WebServlet("/Mail.htm")
public class MailAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MailAdminServlet() {
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
		EmailSender emailSender = new EmailSender();
		ServletContext context = getServletContext();
		String checked = null;
		String sender = request.getParameter("senderAddress");
		String password = request.getParameter("passwordSender");
		checked = request.getParameter("mailAllUsers");
		String title = request.getParameter("emailTitle");
		String body = request.getParameter("emailBody");
		String emailAddress = request.getParameter("emailAddress");
		List<String> addresses = new ArrayList<String>();
		if (checked != null) {
			SubscriberService subscriberService = new SubscriberService();
			List<Subscriber> subscribers = new ArrayList<Subscriber>();
			subscribers = subscriberService.getAllSubscribers();
			for (Subscriber s : subscribers) {
				addresses.add(s.getEmailAddress());
			}
		} else {

			String delims = "[;]";
			String[] tokens = emailAddress.split(delims);
			for (int i = 0; i < tokens.length; i++) {
				addresses.add(tokens[i]);
			}
		}

		emailSender.sendEmail(context, sender, password, addresses, title, "template.ftl", body);
		response.sendRedirect("/ChickNorris/Admin.htm#sendMail");
	}

}
