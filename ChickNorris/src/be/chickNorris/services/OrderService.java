package be.chickNorris.services;

import java.util.List;

import be.chickNorris.dao.OrderDAO;
import be.chickNorris.models.Customer;
import be.chickNorris.models.Order;

public class OrderService {

	private final OrderDAO orderDAO = new OrderDAO();

	public void create(Order order) {
		orderDAO.beginTransaction();
		orderDAO.create(order);
		orderDAO.commit();
	}

	public Customer read(int ID) {
		return orderDAO.read(ID);
	}

	public void delete(int ID) {
		orderDAO.beginTransaction();
		orderDAO.delete(ID);
		orderDAO.commit();
	}

	public List<Order> selectOrdersByNameAndSurname(String name, String surName) {
		return orderDAO.selectOrdersByNameAndSurname(name, surName);
	}

}
