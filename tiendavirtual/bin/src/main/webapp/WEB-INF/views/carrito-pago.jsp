<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.project.objects.User"%>
<%@page import="com.project.objects.Product"%>
<%@page import="com.project.objects.UsuarioCarrito"%>
<%@page import="com.project.objects.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Realizar pago</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>

	<%
	User user = (User) session.getAttribute("session_user");
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
							<li><a class="dropdown-item" href="#">Ver perfil</a></li>
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

	<div class="container">
		<div class="d-block py-5">
			<div class="modal-dialog">
				<div class="modal-content rounded-4 shadow">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<h1 class="fw-bold mb-0 fs-2">Realizar pago</h1>
					</div>

					<div class="modal-body p-5 pt-0">
						<form action="carrito-pago-validacion" method="get">
							<%
							if (request.getAttribute("errores") != null) {
								HashMap<String, String> errores = (HashMap) request.getAttribute("errores");
								for (String clave : errores.keySet()) {
							%>
							<div class="alert alert-danger"><%=errores.get(clave)%></div>
							<%
							}
							}
							%>
							<div class="mb-3">
								<label for="direccion" class="form-label">* Dirección</label>
								<textarea class="form-control" name="direccion" required></textarea>
							</div>

							<div class="mb-3">
								<label for="municipio" class="form-label">* Municipio</label> <input
									type="text" class="form-control" name="municipio" required />
							</div>

							<div class="mb-3">
								<label for="provincia" class="form-label">* Provincia</label> <input
									type="text" class="form-control" name="provincia" required />
							</div>

							<div class="mb-3">
								<label for="codigopostal" class="form-label">* Codigo
									postal</label> <input type="text" class="form-control"
									name="codigopostal" required />
							</div>

							<div class="mb-3">
								<label for="telefono" class="form-label">* Teléfono</label> <input
									type="text" class="form-control" name="telefono" required />
							</div>

							<div class="form-check mb-3">
								<input type="checkbox" class="form-check-input"
									name="aceptar_condiciones" required /> <label
									class="form-check-label">Acepto los términos y
									condiciones</label>
							</div>

							<button class="mb-2 btn btn-lg rounded-3 btn-dark" type="submit">Comprar</button>
						</form>
					</div>
				</div>
			</div>
		</div>
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