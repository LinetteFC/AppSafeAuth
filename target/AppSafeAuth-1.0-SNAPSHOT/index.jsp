<%-- 
    Document   : index
    Created on : 25/03/2026, 8:14:15 p. m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dao.UsuarioDao, modelo.Usuario" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Usuarios</title>
    </head>

    <body>
        <h1> LISTA DE USUARIOS</h1>

        <a href="editar.jsp">Nuevo Usuario</a>
        <br><br>

        <hr>

        <table border="1" cellpadding="5">
            <tr>
                <th>ID</th>
                <th>Usuario</th>
                <th>Email</th>
                <th>Acciones</th>
            </tr>

            <%
                UsuarioDao dao = new UsuarioDao();
                List<Usuario> lista = dao.listar();

                for (Usuario u : lista) {
            %>
            <tr>
                <td><%= u.getId()%></td>
                <td><%= u.getUsuario()%></td>
                <td><%= u.getEmail()%></td>
                <td>
                    <a href="editar.jsp?id=<%=u.getId()%>">Editar</a> |
                    <a href="UsuarioServlet?accion=eliminar&id=<%=u.getId()%>">Eliminar</a>
                </td>
            </tr>
            <% }%>
        </table>
    </body>
</html>
