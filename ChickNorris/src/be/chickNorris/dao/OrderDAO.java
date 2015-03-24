package be.chickNorris.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import be.chickNorris.models.Customer;
import be.chickNorris.models.Order;

public class OrderDAO extends AbstractDAO {

	public void create(Order order) {
		getEntityManager().persist(order);
	}

	public Customer read(int ID) {
		return getEntityManager().find(Customer.class, ID);
	}

	public void delete(int ID) {
		Customer customer = getEntityManager().find(Customer.class, ID);
		if (customer != null) {
			getEntityManager().remove(customer);
		}
	}

	public List<Order> selectOrdersByNameAndSurname(String name, String surName) {
		TypedQuery<Order> query = getEntityManager().createNamedQuery("selectOrdersByNameAndSurname", Order.class);

		query.setParameter("name", '%' + name + '%');
		query.setParameter("surName", '%' + surName + '%');
		return query.getResultList();
	}

}
