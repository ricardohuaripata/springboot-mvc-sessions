package com.project.entities;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.project.objects.Product;
import org.springframework.jdbc.core.RowMapper;

public class ProductMapper implements RowMapper<Product>{
	
	@Override
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
		Product product = new Product();
		product.setId(rs.getInt("id"));
		product.setTittle(rs.getString("tittle"));
		product.setDescription(rs.getString("description"));
		product.setPrice(rs.getDouble("price"));
		product.setImageLink(rs.getString("imageLink"));
		
		return product;
	}

}
