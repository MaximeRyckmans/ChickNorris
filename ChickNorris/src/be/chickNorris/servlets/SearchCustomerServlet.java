package be.chickNorris.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.chickNorris.models.Order;
import be.chickNorris.services.OrderService;

/**
 * Servlet implementation class SearchCustomerServlet
 */
@WebServlet("/SearchCustomer.htm")
public class SearchCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchCustomerServlet() {
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
		String name = request.getParameter("form_name");
		String surName = request.getParameter("form_surName");

		OrderService orderService = new OrderService();
		List<Order> listCust = orderService.selectOrdersByNameAndSurname(name, surName);

		HttpSession session = request.getSession(true);
		session.setAttribute("listCust", listCust);

		response.sendRedirect("/Admin.htm#search");

		/*
		 * RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin.htm"); dispatcher.forward(request,
		 * response);
		 */

	}
}
