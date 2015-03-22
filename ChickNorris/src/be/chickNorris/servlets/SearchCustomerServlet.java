package be.chickNorris.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.chickNorris.models.Customer;
import be.chickNorris.services.CustomerService;

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
		System.out.println(name + " " + surName);
		CustomerService customerService = new CustomerService();
		List<Customer> listCust = customerService.getCustomersByNameOrSurname(name, surName);

		request.setAttribute("listCust", listCust);
		for (Customer c : listCust) {
			System.out.println(c.getName());
		}
		// request.setAttribute("currentTab", 2);
		request.getRequestDispatcher("/Admin.htm").forward(request, response);

	}
}
