<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Iniciar sesión</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
</head>

<body>

	<%
	Cookie[] requestCookies = request.getCookies();
	HashMap<String, String> hashmapCookies = new HashMap<String, String>();

	for (int i = 0; i < requestCookies.length; i++) {
		hashmapCookies.put(requestCookies[i].getName(), requestCookies[i].getValue());
	}
	%>

	<div class="container">
		<div class="modal modal-signin d-block py-5">
			<div class="modal-dialog">
				<div class="modal-content rounded-4 shadow">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<h1 class="fw-bold mb-0 fs-2">Iniciar sesión</h1>
					</div>
					<div class="modal-body p-5 pt-0">
						<form action="session-login-validate" method="get">
							<div class="form-floating mb-3">
								<%
								if (hashmapCookies.containsKey("username")) {
								%>
								<input type="text" class="form-control rounded-3"
									name="username" placeholder="username"
									value=<%=hashmapCookies.get("username")%> required />

								<%
								} else {
								%>
								<input type="text" class="form-control rounded-3"
									name="username" placeholder="username" required />
								<%
								}
								%>
								<label for="username">Nombre de usuario</label>
							</div>

							<div class="form-floating mb-3">
								<%
								if (hashmapCookies.containsKey("password")) {
								%>
								<input type="password" class="form-control rounded-3"
									name="password" placeholder="password"
									value=<%=hashmapCookies.get("password")%> required />

								<%
								} else {
								%>
								<input type="password" class="form-control rounded-3"
									name="password" placeholder="password" required />
								<%
								}
								%>

								<label for="password">Contraseña</label>
							</div>

							<%
							if (request.getParameter("mensajeError") != null) {
							%>
							<div class="alert alert-danger"><%=request.getParameter("mensajeError")%></div>
							<%
							}
							%>

							<button class="w-100 mb-2 btn btn-lg rounded-3 btn-dark"
								type="submit">Entrar</button>

							<button class="w-100 btn btn-lg rounded-3 btn-link">
								<a href="session-register">¿No estás registrado?</a>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>

</html>