<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <h2 class="text-center">Iniciar Sesión</h2>
                
                <form action="login" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Usuario:</label>
                        <input type="text" name="username" id="username" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Contraseña:</label>
                        <input type="password" name="password" id="password" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Iniciar Sesión</button>
                </form>

                <%-- Mostrar mensaje de error si la autenticación falla --%>
                <%
                    String error = request.getParameter("error");
                    if (error != null && error.equals("1")) {
                %>
                <div class="alert alert-danger mt-3">
                    Usuario o contraseña incorrectos. Inténtelo de nuevo.
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
