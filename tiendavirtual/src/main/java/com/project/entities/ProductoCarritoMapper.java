package com.project.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.objects.ProductoCarrito;

public class ProductoCarritoMapper implements RowMapper<ProductoCarrito> {

	@Override
	public ProductoCarrito mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductoCarrito productoCarrito = new ProductoCarrito();

		productoCarrito.setId(rs.getInt("id"));
		productoCarrito.setTittle(rs.getString("tittle"));
		productoCarrito.setDescription(rs.getString("description"));
		productoCarrito.setPrice(rs.getDouble("price"));
		productoCarrito.setImageLink(rs.getString("imageLink"));
		productoCarrito.setCantidad(rs.getInt("cantidad"));

		return productoCarrito;
	}

}
