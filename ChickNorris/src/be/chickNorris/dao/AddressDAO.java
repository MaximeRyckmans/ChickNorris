package be.chickNorris.dao;

import be.chickNorris.models.Address;

public class AddressDAO extends AbstractDAO {

	public void create(Address address) {
		getEntityManager().persist(address);
	}

	public Address read(int ID) {
		return getEntityManager().find(Address.class, ID);
	}

	public void delete(int ID) {
		Address address = getEntityManager().find(Address.class, ID);
		if (address != null) {
			getEntityManager().remove(address);
		}
	}
}
