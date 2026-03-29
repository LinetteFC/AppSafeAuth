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
        
        <!-- Bootstrap 5.3-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
        <div class="container mt-4">
            <h1 class="text-center mb-4">Lista de Usuarios</h1>

            <!-- botón nuevo -->
            <a href="editar.jsp" class="btn btn-primary mb-3">Nuevo Usuario</a>

            <!-- tabla -->
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Usuario</th>
                        <th>Email</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    UsuarioDao dao = new UsuarioDao();
                    List<Usuario> lista = dao.listar();

                    for (Usuario u : lista) {
                %>
                    <tr>
                        <td><%= u.getId() %></td>
                        <td><%= u.getUsuario() %></td>
                        <td><%= u.getEmail() %></td>
                        <td>
                            <a href="editar.jsp?id=<%=u.getId()%>" class="btn btn-success btn-sm">Editar</a>

                            <a href="UsuarioServlet?accion=eliminar&id=<%=u.getId()%>" 
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Seguro que deseas eliminar este usuario?')">
                               Eliminar
                            </a>
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </body>
</html>
