package com.project.entities;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.project.objects.Pedido;

public class PedidoMapper implements RowMapper<Pedido>{

	@Override
	public Pedido mapRow(ResultSet rs, int rowNum) throws SQLException {
		Pedido pedido = new Pedido();
		pedido.setId(rs.getInt("id"));
		pedido.setIdUsuario(rs.getInt("idUsuario"));
		pedido.setDireccion(rs.getString("direccion"));
		pedido.setMunicipio(rs.getString("municipio"));
		pedido.setProvincia(rs.getString("provincia"));
		pedido.setCodigopostal(rs.getString("codigopostal"));
		pedido.setTelefono(rs.getString("telefono"));
		pedido.setFecha(rs.getTimestamp("fecha"));
		pedido.setTotal(rs.getDouble("total"));
	
		return pedido;
	}

}
