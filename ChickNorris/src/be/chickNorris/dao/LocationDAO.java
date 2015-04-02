package be.chickNorris.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

import be.chickNorris.models.Location;

public class LocationDAO extends AbstractDAO {

	public void create(Location location) {
		getEntityManager().persist(location);
	}

	public Location read(int ID) {
		return getEntityManager().find(Location.class, ID);
	}

	public void delete(int ID) {
		Location location = getEntityManager().find(Location.class, ID);
		if (location != null) {
			getEntityManager().remove(location);
		}
	}

	public int deleteAllLocations() {
		Query query = getEntityManager().createNamedQuery("deleteAllLocations");

		return query.executeUpdate();
	}

	/**
	 * Returns a list of Customer objects.
	 *
	 * @param projectCode
	 * @return
	 */
	public Location getLatestLocationByTruckNumber(String truckNumber) {
		TypedQuery<Location> query = getEntityManager().createNamedQuery("getLatestLocationByTruckNumber", Location.class);

		query.setParameter("truckNumber", truckNumber);
		return query.getSingleResult();
	}

	public List<String> getAllTrucks() {
		TypedQuery<String> query = getEntityManager().createNamedQuery("getAllTrucks", String.class);
		return query.getResultList();
	}

}
