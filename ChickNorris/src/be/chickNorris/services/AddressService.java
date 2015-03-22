package be.chickNorris.services;

import be.chickNorris.dao.AddressDAO;
import be.chickNorris.models.Address;

public class AddressService {

	private final AddressDAO addressDAO = new AddressDAO();

	public void create(Address address) {
		addressDAO.beginTransaction();
		addressDAO.create(address);
		addressDAO.commit();
	}

	public Address read(int ID) {
		return addressDAO.read(ID);
	}

	public void delete(int ID) {
		addressDAO.beginTransaction();
		addressDAO.delete(ID);
		addressDAO.commit();
	}

}
