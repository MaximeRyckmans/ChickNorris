package be.chickNorris.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Customers")
public class Customer {

	@Id
	@GeneratedValue
	private int ID;

	private String name;

	private String surName;

	private String companyName;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "addressID")
	private Address address;

	private String VATNumber;

	private String telNR;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurName() {
		return surName;
	}

	public void setSurName(String surName) {
		this.surName = surName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getVATNumber() {
		return VATNumber;
	}

	public void setVATNumber(String vATNumber) {
		VATNumber = vATNumber;
	}

	public String getTelNR() {
		return telNR;
	}

	public void setTelNR(String telNR) {
		this.telNR = telNR;
	}

	public void setID(int iD) {
		ID = iD;
	}

}
