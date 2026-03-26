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
    </head>

    <body>
        <%
            String id = request.getParameter("id");
            //Usuario u = new Usuario();
            Usuario u = null;

            if (id != null) {
                UsuarioDao dao = new UsuarioDao();
                u = dao.buscar(Integer.parseInt(id));
            }
        %>

        <h1>FORMULARIO DE USUARIO</h1>

        <form action="UsuarioServlet" method="post">

            <input type="hidden" name="id" value="<%= (u != null) ? u.getId() : "" %>">

            <label>Usuario:</label><br>
            <input type="text" name="usuario" value="<%= (u != null) ? u.getUsuario() : ""%>" required>
            <br><br>

            <label>Email:</label><br>
            <input type="email" name="email" value="<%= (u != null) ? u.getEmail() : ""%>" required>
            <br><br>

            <label>Contraseña:</label><br>
            <input type="text" name="contrasena" value="<%= (u != null) ? u.getContrasena() : ""%>" required>
            <br><br>

            <input type="submit" value="Guardar">

        </form>
        <br>

        <a href="index.jsp">Volver a la lista</a>
    </body>
</html>
