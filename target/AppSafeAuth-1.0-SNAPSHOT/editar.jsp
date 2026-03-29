<%-- 
    Document   : editar
    Created on : 25/03/2026, 8:15:19 p. m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.UsuarioDao, modelo.Usuario" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulario Usuario</title>

    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <%
            String id = request.getParameter("id");
            Usuario u = null;

            // si viene id -> editar
            if (id != null && !id.isEmpty()) {
                UsuarioDao dao = new UsuarioDao();
                u = dao.buscar(Integer.parseInt(id));
            }
        %>

        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">
                    <%= (u != null) ? "Editar Usuario" : "Nuevo Usuario" %>
                </h4>
            </div>

            <div class="card-body">
                Formulario de Edicion
                <form action="UsuarioServlet" method="post">
                    <!-- id oculto -->
                    <input type="hidden" name="id" value="<%= (u != null) ? u.getId() : "" %>">

                    <div class="mb-3">
                        <label class="form-label">Usuario</label>
                        <input type="text" name="usuario" class="form-control"
                               value="<%= (u != null) ? u.getUsuario() : "" %>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control"
                               value="<%= (u != null) ? u.getEmail() : "" %>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Contraseña</label>
                        <input type="password" name="contrasena" class="form-control"
                               value="<%= (u != null) ? u.getContrasena() : "" %>" required>
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="index.jsp" class="btn btn-secondary">Volver</a>

                        <button type="submit" class="btn btn-success">
                            <%= (u != null) ? "Actualizar" : "Guardar" %>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>