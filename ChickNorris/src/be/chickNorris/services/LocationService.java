package be.chickNorris.services;

import java.util.List;

import be.chickNorris.dao.LocationDAO;
import be.chickNorris.models.Location;

public class LocationService {
	private final LocationDAO locationDAO = new LocationDAO();

	public void create(Location location) {
		locationDAO.beginTransaction();
		locationDAO.create(location);
		locationDAO.commit();
	}

	public Location read(int ID) {
		return locationDAO.read(ID);
	}

	public void delete(int ID) {
		locationDAO.beginTransaction();
		locationDAO.delete(ID);
		locationDAO.commit();
	}

	public Location getLatestLocationByTruckNumber(String truckNumber) {
		return locationDAO.getLatestLocationByTruckNumber(truckNumber);
	}

	public List<String> getAllTrucks() {

		return locationDAO.getAllTrucks();
	}

	public int deleteAllLocations() {
		locationDAO.beginTransaction();
		int numberOfDeletes = locationDAO.deleteAllLocations();
		locationDAO.commit();
		return numberOfDeletes;
	}

}
