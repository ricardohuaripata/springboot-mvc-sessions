package com.project.objects;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.regex.Pattern;

public class Pedido {

	private int id;
	private int idUsuario;
	private String direccion;
	private String municipio;
	private String provincia;
	private String codigopostal;
	private String telefono;
	private Timestamp fecha;
	private double total;

	public Pedido() {

	}

	public Pedido(int id, int idUsuario, String direccion, String municipio, String provincia, String codigopostal,
			String telefono, Timestamp fecha, double total) {
		this.id = id;
		this.idUsuario = idUsuario;
		this.direccion = direccion;
		this.municipio = municipio;
		this.provincia = provincia;
		this.codigopostal = codigopostal;
		this.telefono = telefono;
		this.fecha = fecha;
		this.total = total;
	}

	// constructor sin id y sin fecha
	public Pedido(int idUsuario, String direccion, String municipio, String provincia, String codigopostal,
			String telefono, double total) {
		this.idUsuario = idUsuario;
		this.direccion = direccion;
		this.municipio = municipio;
		this.provincia = provincia;
		this.codigopostal = codigopostal;
		this.telefono = telefono;
		this.total = total;
	}

	// TODO
	public HashMap<String, String> hashmapErrores() {
		HashMap<String, String> errores = new HashMap<String, String>();

		if (validarCodigoPostal(this.codigopostal) == false) {
			errores.put("CODIGOPOSTAL", "El código postal introducido no es válido");
		}

		if (validarTelefono(this.telefono) == false) {
			errores.put("TELEFONO", "El teléfono introducido no es válido");
		}
		return errores;
	}

	public boolean esValido() {
		boolean valido = false;
		if (this.hashmapErrores().isEmpty()) {
			valido = true;
		}
		return valido;
	}

	private boolean validarCodigoPostal(String codigoPostal) {
		return Pattern.matches("[0-9]{5}", codigoPostal);
	}

	private boolean validarTelefono(String telefono) {
		Pattern pattern = Pattern.compile("^(\\+\\d{1,3}( )?)?((\\(\\d{1,3}\\))|\\d{1,3})[- .]?\\d{3,4}[- .]?\\d{4}$");
		return pattern.matcher(telefono).matches();
	}

	public int getId() {
		return id;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public String getDireccion() {
		return direccion;
	}

	public String getMunicipio() {
		return municipio;
	}

	public String getProvincia() {
		return provincia;
	}

	public String getCodigopostal() {
		return codigopostal;
	}

	public String getTelefono() {
		return telefono;
	}

	public Timestamp getFecha() {
		return fecha;
	}

	public double getTotal() {
		return total;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public void setCodigopostal(String codigopostal) {
		this.codigopostal = codigopostal;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public void setFecha(Timestamp fecha) {
		this.fecha = fecha;
	}

	public void setTotal(double total) {
		this.total = total;
	}

}
