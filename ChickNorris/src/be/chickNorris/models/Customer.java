package be.chickNorris.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Customers")
public class Customer {

	@Id
	@GeneratedValue
	private int ID;
	private String email;

	public Customer() {
		// TODO Auto-generated constructor stub
	}

	public Customer(String email) {
		setEmail(email);
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getID() {
		return ID;
	}

}
