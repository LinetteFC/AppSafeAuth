package dao;

import conexion.ConexionDB;
import modelo.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {

    // INSERTAR
    public boolean insertar(Usuario u) {
        String sql = "INSERT INTO usuarios(usuario, email, contrasena, estado) VALUES(?,?,?,1)";

        try {
            Connection conn = ConexionDB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, u.getUsuario());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getContrasena());

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // LISTAR
    public List<Usuario> listar() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";

        try (Connection conn = ConexionDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setUsuario(rs.getString("usuario"));
                u.setEmail(rs.getString("email"));
                u.setContrasena(rs.getString("contrasena"));
                u.setEstado(rs.getInt("estado"));

                lista.add(u);
            }

        } catch (SQLException e) {
            System.out.println("Error listar: " + e.getMessage());
        }

        return lista;
    }

    // ELIMINAR
    public void eliminar(int id) {
        String sql = "DELETE FROM usuarios WHERE id=?";

        try (Connection conn = ConexionDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error eliminar: " + e.getMessage());
        }
    }

    // BUSCAR POR ID
    public Usuario buscar(int id) {
        Usuario u = null;
        String sql = "SELECT * FROM usuarios WHERE id=?";

        try (Connection conn = ConexionDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setUsuario(rs.getString("usuario"));
                u.setEmail(rs.getString("email"));
                u.setContrasena(rs.getString("contrasena"));
                u.setEstado(rs.getInt("estado"));
            }

        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }

        return u;
    }

    // ACTUALIZAR
    public void actualizar(Usuario u) {
        String sql = "UPDATE usuarios SET usuario=?, email=?, contrasena=?, estado=? WHERE id=?";

        try (Connection conn = ConexionDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, u.getUsuario());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getContrasena());
            ps.setInt(4, u.getEstado());
            ps.setInt(5, u.getId());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error actualizar: " + e.getMessage());
        }
    }

}
