package com.project.objects;

public class ProductoCarrito extends Product {
	private int cantidad;

	public ProductoCarrito() {
	}

	public ProductoCarrito(int id, String tittle, String description, double price, String imageLink, int cantidad) {
		super(id, tittle, description, price, imageLink);
		this.cantidad = cantidad;
	}

	public ProductoCarrito(Product p, int cantidad) {
		super(p.getId(), p.getTittle(), p.getDescription(), p.getPrice(), p.getImageLink());
		this.cantidad = cantidad;

	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
}
