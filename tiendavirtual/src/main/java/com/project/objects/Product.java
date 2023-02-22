package com.project.objects;

public class Product {
	
	private int id;
	private String tittle;
	private String description;
	private double price;
	private String imageLink;
	
	public Product() {
		
	}
	
	public Product(int id, String tittle, String description, double price, String imageLink) {
		this.id = id;
		this.tittle = tittle;
		this.description = description;
		this.price = price;
		this.imageLink = imageLink;
	}

	public int getId() {
		return id;
	}
	public String getTittle() {
		return tittle;
	}
	public String getDescription() {
		return description;
	}
	public double getPrice() {
		return price;
	}
	public String getImageLink() {
		return imageLink;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

}
