package be.chickNorris.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.chickNorris.models.User;
import be.chickNorris.services.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login.htm")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VIEW = "WEB-INF/JSP/login.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		session.setAttribute("loggedIn", null);
		RequestDispatcher dispatcher = request.getRequestDispatcher(VIEW);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		User user = userService.findUserByName(username);
		boolean isValid;
		if (user == null) {
			isValid = false;
		} else {
			isValid = userService.checkAuthentication(user, username, password);
		}
		if (isValid) {
			HttpSession session = request.getSession(false);
			session.setAttribute("loggedIn", true);

			response.sendRedirect("/ChickNorris/Admin.htm");
		} else {
			request.setAttribute("error", "oepsie, niet goed. Probeer het nog eens!");
			RequestDispatcher dispatcher = request.getRequestDispatcher(VIEW);
			dispatcher.forward(request, response);
		}

	}

}
