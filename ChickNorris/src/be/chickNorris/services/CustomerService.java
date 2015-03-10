package be.chickNorris.services;

import java.util.List;

import be.chickNorris.dao.CustomerDAO;
import be.chickNorris.models.Customer;

public class CustomerService {
	private final CustomerDAO customerDAO = new CustomerDAO();

	public void create(Customer customer) {
		customerDAO.beginTransaction();
		customerDAO.create(customer);
		customerDAO.commit();
	}

	public Customer read(int ID) {
		return customerDAO.read(ID);
	}

	public void delete(int ID) {
		customerDAO.beginTransaction();
		customerDAO.delete(ID);
		customerDAO.commit();
	}

	public List<Customer> getAllCustomers() {
		return customerDAO.getAllCustomers();
	}

	public List<Customer> getCustomersByName(String surName) {
		return customerDAO.getCustomersByName(surName);
	}
}
