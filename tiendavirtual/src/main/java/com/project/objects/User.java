package com.project.objects;

import java.sql.Date;

public class User {

	private int id;
	private String username;
	private String password;
	private String name;
	private String lastname;
	private Date birthdate;
	private boolean isAdmin;

	public User() {
	}

	public User(int id, String username, String password, String name, String lastname, Date birthdate, boolean isAdmin) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.lastname = lastname;
		this.birthdate = birthdate;
		this.isAdmin = isAdmin;
	}

	// constructor sin id
	public User(String username, String password, String name, String lastname, Date birthdate) {
		this.username = username;
		this.password = password;
		this.name = name;
		this.lastname = lastname;
		this.birthdate = birthdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
}
