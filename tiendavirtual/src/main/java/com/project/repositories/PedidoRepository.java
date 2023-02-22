package com.project.repositories;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.project.entities.PedidoMapper;
import com.project.entities.ProductoCarritoMapper;
import com.project.objects.Pedido;
import com.project.objects.ProductoCarrito;
import com.project.objects.UsuarioCarrito;

@Repository
public class PedidoRepository {

	@Autowired
	protected JdbcTemplate template;

	public List<Pedido> getAllOrders() {
		String sql = "select id, idUsuario, direccion, municipio, provincia, codigopostal, telefono, fecha, total "
				+ "from pedidos order by fecha desc";
		return template.query(sql, new PedidoMapper());
	}

	public void registrarPedido(Pedido pedido, UsuarioCarrito usuarioCarrito) {
		String sql_insertar_pedido = "insert into pedidos(idUsuario, direccion, municipio, provincia, codigopostal, telefono, fecha, total) "
				+ "values(" + pedido.getIdUsuario() + ",'" + pedido.getDireccion() + "','" + pedido.getMunicipio()
				+ "','" + pedido.getProvincia() + "','" + pedido.getCodigopostal() + "','" + pedido.getTelefono()
				+ "',now()," + pedido.getTotal() + ");";

		template.update(sql_insertar_pedido);

		int idPedido = template.queryForObject("SELECT LAST_INSERT_ID();", Integer.class);

		String sql_insertar_detalle;

		for (Integer idProducto : usuarioCarrito.getCarrito().keySet()) {
			ProductoCarrito productoCarrito = usuarioCarrito.getCarrito().get(idProducto);
			sql_insertar_detalle = "insert into detalle_pedido(idPedido, idProducto, cantidad) " + "values(" + idPedido
					+ ", " + productoCarrito.getId() + ", " + productoCarrito.getCantidad() + ");";
			template.update(sql_insertar_detalle);
		}

	}

	public List<Pedido> getUserOrders(int idUsuario) {
		String sql = "select id, idUsuario, direccion, municipio, provincia, codigopostal, telefono, fecha, total "
				+ "from pedidos where idUsuario=" + idUsuario + ";";
		return template.query(sql, new PedidoMapper());
	}

	public List<ProductoCarrito> getOrderProducts(int idPedido) {
		String sql = "select p.id, p.tittle, p.description, p.price, p.imageLink, dp.cantidad "
				+ "from products p inner join detalle_pedido dp on p.id = dp.idProducto where dp.idPedido=" + idPedido;
		return template.query(sql, new ProductoCarritoMapper());
	}

	public Pedido getOrder(int idPedido) {
		String sql = "select id, idUsuario, direccion, municipio, provincia, codigopostal, telefono, fecha, total "
				+ "from pedidos where id=" + idPedido + ";";
		return template.query(sql, new PedidoMapper()).get(0);
	}

}
