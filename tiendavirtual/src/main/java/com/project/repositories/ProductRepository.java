package com.project.repositories;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.project.entities.ProductMapper;
import com.project.entities.UserMapper;
import com.project.objects.Product;
import com.project.objects.User;

@Repository
public class ProductRepository {

	@Autowired
	protected JdbcTemplate template;

	public List<Product> getAllProducts() {
		String sql = "select id, tittle, description, price, imageLink from products";
		return template.query(sql, new ProductMapper());
	}

	public Product getProduct(int id) {
		Product producto = new Product();
		String sql = "select id, tittle, description, price, imageLink from products where id=" + id + ";";
		producto = template.query(sql, new ProductMapper()).get(0);
		return producto;

	}

	public List<Product> buscarProductos(String tittle) {
		String sql = "select id, tittle, description, price, imageLink from products where tittle like '%" + tittle
				+ "%' order by tittle;";
		return template.query(sql, new ProductMapper());
	}

}
