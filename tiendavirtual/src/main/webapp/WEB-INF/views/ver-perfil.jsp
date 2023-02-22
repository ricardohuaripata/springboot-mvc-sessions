<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.project.objects.User"%>
<%@page import="com.project.objects.Pedido"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<title>Perfil de usuario</title>
</head>

<body>
	<%
	User user = (User) session.getAttribute("session_user");
	List<Pedido> userOrders = (List<Pedido>) request.getAttribute("userOrders");
	%>
	<nav class="navbar navbar-expand-lg bg-light">

		<div class="container-fluid">

			<a class="navbar-brand" href="index">Tienda</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarScroll">

				<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
					style="-bs-scroll-height: 100px;">

					<li class="nav-item"><a class="nav-link" href="index">Inicio</a></li>

					<li class="nav-item"><a class="nav-link" href="carrito">Ver
							carrito</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <%=user.getUsername()%>
					</a>

						<ul class="dropdown-menu">
							<%
							if (user.isAdmin()) {
							%>
							<li><a class="dropdown-item" href="listado-ventas">Listado
									de ventas</a></li>
							<li><hr class="dropdown-divider"></li>

							<%
							}
							%>
							<li><a class="dropdown-item" href="ver-perfil">Ver
									perfil</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="index?logout=1">Cerrar
									sesion</a></li>
						</ul></li>

				</ul>

				<form action="buscar-producto" class="d-flex" role="search">
					<input class="form-control me-2" name="search" type="search"
						placeholder="Buscar" aria-label="Search">
					<button class="btn btn-outline-primary" type="submit">Buscar</button>
				</form>

			</div>
		</div>
	</nav>

	<div class="container" style="margin-top: 20px; min-height: 680px">

		<%
		if (request.getParameter("mensajeCompraExito") != null) {
		%>
		<div class="alert alert-success"><%=request.getParameter("mensajeCompraExito")%></div>
		<%
		}
		%>

		<h3>Mi perfil</h3>
		<hr>
		<p>
			Nombre de usuario:
			<%=user.getUsername()%></p>
		<p>
			Nombre:
			<%=user.getName()%></p>
		<p>
			Apellidos:
			<%=user.getLastname()%></p>
		<p>
			Fecha de nacimiento:
			<%=user.getBirthdate()%></p>

		<h3>Mis pedidos</h3>
		<hr>
		<%
		if (userOrders.isEmpty()) {
		%>
		<p>Aún no tienes ningún pedido</p>
		<%
		} else {
		for (Pedido pedido : userOrders) {
		%>
		<p>
			Número de pedido:
			<%=pedido.getId()%></p>
		<p>
			Fecha de pedido:
			<%=pedido.getFecha()%></p>
		<p>
			Total:
			<%=pedido.getTotal()%>€
		</p>

		<form action="usuario-pedido" class="d-flex">
			<input type="hidden" name="idPedido" value=<%=pedido.getId()%>>
			<button class="btn btn-outline-primary" type="submit">Ver
				detalles</button>
		</form>
		<hr>

		<%
		}
		}
		%>

	</div>

	<footer class="py-3 my-4">
		<ul class="nav justify-content-center border-bottom pb-3 mb-3">

			<li class="nav-item"><a class="nav-link px-2 text-muted"
				href="index">Inicio</a></li>

		</ul>

		<p class="text-center text-muted">&copy; Tienda, Inc</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
