package be.chickNorris.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import be.chickNorris.models.Customer;

public class CustomerDAO extends AbstractDAO {

	public void create(Customer customer) {
		getEntityManager().persist(customer);
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

	/**
	 * Returns a list of Customer objects.
	 *
	 * @param projectCode
	 * @return
	 */
	public List<Customer> getAllCustomers() {
		TypedQuery<Customer> query = getEntityManager().createNamedQuery("selectAllCustomers", Customer.class);

		return query.getResultList();
	}

}
