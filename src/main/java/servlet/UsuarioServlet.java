package servlet;

import dao.UsuarioDao;
import modelo.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {

    UsuarioDao dao = new UsuarioDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
        }

        response.sendRedirect("index.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String usuario = request.getParameter("usuario");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");

        Usuario u = new Usuario();
        u.setUsuario(usuario);
        u.setEmail(email);
        u.setContrasena(contrasena);
        u.setEstado(1);

        if (id == null || id.isEmpty()) {
            dao.insertar(u);
        } else {
            u.setId(Integer.parseInt(id));
            dao.actualizar(u);
        }

        response.sendRedirect("index.jsp");
    }
}