package com.project.objects;

import java.util.HashMap;

// objeto usuariocarrito el cual tiene metodos propios para manejar el hashmap carrito
public class UsuarioCarrito {

	private HashMap<Integer, ProductoCarrito> carrito = new HashMap<Integer, ProductoCarrito>();

	public UsuarioCarrito() {
	}

	public HashMap<Integer, ProductoCarrito> getCarrito() {
		return carrito;
	}
	
	public void vaciarCarrito() {
		this.carrito.clear();
	}

	public void agregarProducto(Product producto, int cantidad) {

		int idProducto = producto.getId();

		if (cantidad > 0) {
			ProductoCarrito productoCarrito = new ProductoCarrito(producto, cantidad);
			this.carrito.put(idProducto, productoCarrito);

		} else {
			this.carrito.remove(idProducto);
		}

	}

	public double getPrecioTotal() {
		double precioTotal = 0.0;
		
		for (Integer idProducto : this.carrito.keySet()) {
			precioTotal += this.carrito.get(idProducto).getPrice() * this.carrito.get(idProducto).getCantidad();

		}
		return precioTotal;
	}

}
