package com.project.controllers;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.repositories.PedidoRepository;
import com.project.repositories.ProductRepository;
import com.project.repositories.UserRepository;
import com.project.objects.Pedido;
import com.project.objects.Product;
import com.project.objects.ProductoCarrito;
import com.project.objects.User;
import com.project.objects.UsuarioCarrito;

@Controller
public class Controller1 {

	@Autowired
	protected UserRepository table_users;

	@Autowired
	protected ProductRepository table_products;

	@Autowired
	protected PedidoRepository table_pedidos;

	UsuarioCarrito usuarioCarrito = new UsuarioCarrito();

	@GetMapping("/session-login")
	public ModelAndView session_login(HttpSession session, HttpServletRequest request) {
		return new ModelAndView("session-login");
	}

	@GetMapping("/session-login-validate")
	public ModelAndView session_login_validate(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// si no ha pasado antes por el login
		if (username == null || password == null) {
			return new ModelAndView("redirect:/session-login");
		}
		// si el usuario no existe
		if (table_users.getUser(username, password) == null) {
			return new ModelAndView("redirect:/session-login").addObject("mensajeError",
					"Usuario o contraseña incorrectos");
		}
		// vacio el carrito por si accede al login sin cerrar sesion(mediante url)
		usuarioCarrito.vaciarCarrito();
		// se guarda la usuario en sesion
		User user = table_users.getUser(username, password);
		session.setAttribute("session_user", user);

		// guardo en cookies el username y password del ultimo inicio de sesion
		Cookie cookie_username = new Cookie("username", username);
		Cookie cookie_password = new Cookie("password", password);
		response.addCookie(cookie_username);
		response.addCookie(cookie_password);

		return new ModelAndView("redirect:/index");
	}

	@GetMapping("/index")
	public ModelAndView index(HttpSession session, HttpServletRequest request) {

		if (session.getAttribute("session_user") == null) {
			return new ModelAndView("redirect:/session-login");
		}
		// cerrar sesion
		if (request.getParameter("logout") != null && request.getParameter("logout").equals("1")) {
			session.invalidate();
			usuarioCarrito.vaciarCarrito();
			return new ModelAndView("redirect:/session-login");
		}

		List<Product> listaProductos = table_products.getAllProducts();

		return new ModelAndView("index").addObject("listaProductos", listaProductos);
	}

	@GetMapping("/session-register")
	public ModelAndView session_register(HttpSession session, HttpServletRequest request) {
		return new ModelAndView("session-register");
	}

	@GetMapping("/session-register-process")
	public ModelAndView session_register_sucess(HttpSession session, HttpServletRequest request) {

		// si no ha completado el formulario
		if (request.getParameter("name") == null || request.getParameter("lastname") == null
				|| request.getParameter("birthdate") == null || request.getParameter("username") == null
				|| request.getParameter("password") == null || request.getParameter("confirm_password") == null
				|| request.getParameter("aceptar_condiciones") == null) {
			return new ModelAndView("redirect:/session-register");
		}
		// si no ha confirmado bien la contraseña
		if (request.getParameter("password").equals(request.getParameter("confirm_password")) == false) {
			return new ModelAndView("redirect:/session-register").addObject("mensajeError",
					"Error al confirmar la contraseña");
		}
		// si el nombre de usuario introducido ya esta cogido por otro usuario
		if (table_users.existingUsername(request.getParameter("username")) == true) {
			return new ModelAndView("redirect:/session-register").addObject("mensajeError",
					"El nombre de usuario ya está cogido");
		}

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String lastname = request.getParameter("lastname");
		Date birthdate = Date.valueOf(request.getParameter("birthdate"));

		User nuevoUsuario = new User(username, password, name, lastname, birthdate);
		table_users.registerUser(nuevoUsuario);

		return new ModelAndView("redirect:/index");
	}

	@GetMapping("/carrito")
	public ModelAndView carrito(HttpSession session, HttpServletRequest request) {

		if (session.getAttribute("session_user") == null) {
			return new ModelAndView("redirect:/session-login");
		}
		// si añade un producto al carrito
		if (request.getParameter("idProducto") != null && request.getParameter("cantidad") != null) {
			int idProducto = Integer.parseInt(request.getParameter("idProducto"));
			int cantidad = Integer.parseInt(request.getParameter("cantidad"));

			Product producto = table_products.getProduct(idProducto);
			usuarioCarrito.agregarProducto(producto, cantidad);
		}
		session.setAttribute("carrito", usuarioCarrito);

		return new ModelAndView("carrito");
	}

	@GetMapping("/carrito-pago")
	public ModelAndView carrito_pago(HttpSession session, HttpServletRequest request) {

		if (session.getAttribute("session_user") == null) {
			return new ModelAndView("redirect:/session-login");
		}
		if (session.getAttribute("carrito") == null
				|| ((UsuarioCarrito) session.getAttribute("carrito")).getCarrito().isEmpty()) {
			return new ModelAndView("redirect:/carrito").addObject("mensajeError",
					"No tienes ningún producto para pagar");
		}

		return new ModelAndView("carrito-pago");
	}

	@GetMapping("/carrito-pago-validacion")
	public ModelAndView carrito_pago_validacion(HttpSession session, HttpServletRequest request) {

		if (session.getAttribute("session_user") == null) {
			return new ModelAndView("redirect:/session-login");
		}
		if (session.getAttribute("carrito") == null
				|| ((UsuarioCarrito) session.getAttribute("carrito")).getCarrito().isEmpty()) {
			return new ModelAndView("redirect:/carrito").addObject("mensajeError",
					"No tienes ningún producto para pagar");
		}
		if (request.getParameter("direccion") == null || request.getParameter("municipio") == null
				|| request.getParameter("provincia") == null || request.getParameter("codigopostal") == null
				|| request.getParameter("telefono") == null || request.getParameter("aceptar_condiciones") == null) {
			return new ModelAndView("redirect:/carrito-pago");
		}

		int idUsuario = ((User) session.getAttribute("session_user")).getId();
		String direccion = request.getParameter("direccion");
		String municipio = request.getParameter("municipio");
		String provincia = request.getParameter("provincia");
		String codigopostal = request.getParameter("codigopostal");
		String telefono = request.getParameter("telefono");
		double total = usuarioCarrito.getPrecioTotal();

		Pedido pedido = new Pedido(idUsuario, direccion, municipio, provincia, codigopostal, telefono, total);

		// si tiene campos invalidos
		if (pedido.esValido() == false) {
			return new ModelAndView("carrito-pago").addObject("errores", pedido.hashmapErrores());
		}

		table_pedidos.registrarPedido(pedido, usuarioCarrito);
		
		// se vacia el carrito despues de cada compra
		usuarioCarrito.vaciarCarrito();

		return new ModelAndView("redirect:/ver-perfil").addObject("mensajeCompraExito", "Gracias por tu compra!!");
	}

	@GetMapping("/listado-ventas")
	public ModelAndView listado_ventas(HttpSession session, HttpServletRequest request) {

		if (session.getAttribute("session_user") == null) {
			return new ModelAndView("redirect:/session-login");
		}
		// si el usuario no es admin se le redirige al inicio
		if (((User) session.getAttribute("session_user")).isAdmin() == false) {
			return new ModelAndView("redirect:/index");
		}
		// si es admin se obtienen todos los pedidos registrado en la base de datos
		List<Pedido> pedidos = table_pedidos.getAllOrders();

		return new ModelAndView("listado-ventas").addObject("pedidos", pedidos);

	}

	@GetMapping("/buscar-producto")
	public ModelAndView buscar_producto(HttpSession session, HttpServletRequest request) {

		if (session.getAttribute("session_user") == null) {
			return new ModelAndView("redirect:/session-login");
		}

		if (request.getParameter("search") == null) {
			return new ModelAndView("redirect:/index");
		}

		List<Product> productos = table_products.buscarProductos(request.getParameter("search"));

		return new ModelAndView("buscar-producto").addObject("busqueda_productos", productos);

	}

	@GetMapping("/ver-perfil")
	public ModelAndView ver_perfil(HttpSession session, HttpServletRequest request) {

		if (session.getAttribute("session_user") == null) {
			return new ModelAndView("redirect:/session-login");
		}

		ModelAndView mv = new ModelAndView("ver-perfil");
		// en caso de que el usuario realize una compra y los datos sean validos
		if (request.getParameter("mensajeCompraExito") != null) {
			mv.addObject("mensajeCompraExito", request.getParameter("mensajeCompraExito"));
		}
		// se obtiene una lista de todos los pedidos del usuario para mostrarlo en su
		// perfil, en el apartado "Mis pedidos"
		int idUsuario = ((User) session.getAttribute("session_user")).getId();
		List<Pedido> userOrders = table_pedidos.getUserOrders(idUsuario);
		mv.addObject("userOrders", userOrders);

		return mv;

	}

	@GetMapping("/usuario-pedido")
	public ModelAndView usuario_pedido(HttpSession session, HttpServletRequest request) {

		if (session.getAttribute("session_user") == null) {
			return new ModelAndView("redirect:/session-login");
		}

		if (request.getParameter("idPedido") == null) {
			return new ModelAndView("redirect:/index");
		}

		int idPedido = Integer.parseInt(request.getParameter("idPedido"));
		User user = (User) session.getAttribute("session_user");
		Pedido pedido = table_pedidos.getOrder(idPedido);

		// para controlar que un usuario no acceda ha pedidos de otros usuarios, ha
		// excepcion del administrador
		if (pedido.getIdUsuario() != user.getId() && user.isAdmin() == false) {
			return new ModelAndView("redirect:/index");
		}
		// se extrae de las base da datos los productos que ha seleccionado el usuario
		// para su pedido
		ModelAndView mv = new ModelAndView("usuario-pedido");
		List<ProductoCarrito> orderProducts = table_pedidos.getOrderProducts(idPedido);
		mv.addObject("pedido", pedido);
		mv.addObject("orderProducts", orderProducts);

		return mv;

	}

}
