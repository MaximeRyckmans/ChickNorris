package be.chickNorris.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.chickNorris.models.User;
import be.chickNorris.services.UserService;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/Home.htm")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VIEW = "WEB-INF/JSP/index.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		User user = new User();

		user.setUsername("testAccount");
		userService.create(user, "testPassword");

		RequestDispatcher dispatcher = request.getRequestDispatcher(VIEW);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(VIEW);
		dispatcher.forward(request, response);
	}

}
