<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Registrar usuario</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
</head>

<body>
	<div class="container">
		<div class="modal modal-signin d-block py-5">
			<div class="modal-dialog">
				<div class="modal-content rounded-4 shadow">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<h1 class="fw-bold mb-0 fs-2">Registrar usuario</h1>
					</div>
					<div class="modal-body p-5 pt-0">
						<form action="session-register-process" method="get">
							<div class="mb-3">
								<label for="name" class="form-label">Nombre</label> <input
									type="text" class="form-control" name="name"
									placeholder="Enter name" required />
							</div>

							<div class="mb-3">
								<label for="lastname" class="form-label">Apellidos</label> <input
									type="text" class="form-control" name="lastname"
									placeholder="Enter lastname" required />
							</div>

							<div class="mb-3">
								<label for="birthdate" class="form-label">Fecha de
									nacimiento</label> <input type="date" class="form-control"
									name="birthdate" placeholder="Enter birthdate" required />
							</div>

							<div class="mb-3">
								<label for="username" class="form-label">Nombre de
									usuario</label> <input type="text" class="form-control" name="username"
									placeholder="Enter username" maxlength="18" required />
							</div>

							<div class="mb-3">
								<label for="password" class="form-label">Crear
									contraseña</label> <input type="password" class="form-control"
									name="password" placeholder="Enter password" minlength="8"
									required />
							</div>

							<div class="mb-3">
								<label for="password" class="form-label">Confirmar
									contraseña</label> <input type="password" class="form-control"
									name="confirm_password" placeholder="Enter password again"
									required />
							</div>

							<%
							if (request.getParameter("mensajeError") != null) {
							%>
							<div class="alert alert-danger"><%=request.getParameter("mensajeError")%></div>
							<%
							}
							%>

							<div class="form-check mb-3">
								<input type="checkbox" class="form-check-input" name="aceptar_condiciones" required /> <label
									class="form-check-label">Acepto los términos y
									condiciones</label>
							</div>

							<button class="w-100 mb-2 btn btn-lg rounded-3 btn-dark"
								type="submit">Registrar</button>
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