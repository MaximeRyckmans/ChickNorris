package be.chickNorris.dao;

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

}