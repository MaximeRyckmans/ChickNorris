package be.chickNorris.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Orders")
public class Order {

	@Id
	@GeneratedValue
	private int ID;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customerID")
	private Customer customer;

	private String occasion;

	@Temporal(TemporalType.DATE)
	private Date eventDate;

	@Temporal(TemporalType.TIME)
	private Date eventTime;

	private int formula;

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getOccasion() {
		return occasion;
	}

	public void setOccasion(String occasion) {
		this.occasion = occasion;
	}

	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public Date getEventTime() {
		return eventTime;
	}

	public void setEventTime(Date eventTime) {
		this.eventTime = eventTime;
	}

	public int getFormula() {
		return formula;
	}

	public void setFormula(int formula) {
		this.formula = formula;
	}

}
