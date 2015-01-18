package be.chickNorris.dao;

import javax.persistence.EntityManager;

import be.chickNorris.filters.JPAFilter;

/**
 * @author maxime.ryckmans Methods that every DAO class needs. Every DAO Class extends this class.
 */
public abstract class AbstractDAO {

	public AbstractDAO() {
		super();
	}

	/**
	 * Return an entitymanager created by the entityManager factory.
	 * 
	 * @return
	 */
	public EntityManager getEntityManager() {
		return JPAFilter.getEntityManager();
	}

	/**
	 * Starts a transaction for the current entitymanager.
	 */
	public void beginTransaction() {
		getEntityManager().getTransaction().begin();
	}

	/**
	 * Commits the actions that happened in the transaction.
	 */
	public void commit() {
		getEntityManager().getTransaction().commit();
	}

	/**
	 * Reverts all the actions that happened in the transaction.
	 */
	public void rollback() {
		getEntityManager().getTransaction().rollback();
	}

}
