package service;

import dao.UsuarioDao;
import modelo.Usuario;

// clase que maneja la logica antes de ir al dao
public class UsuarioService {

    UsuarioDao dao = new UsuarioDao();

    // metodo para guardar usuario (crear o editar)
    public boolean guardar(Usuario u) {

        // validar que el usuario no este vacio
        if (u.getUsuario() == null || u.getUsuario().trim().isEmpty()) {
            System.out.println("usuario vacio");
            return false;
        }

        // validar email
        if (u.getEmail() == null || !u.getEmail().contains("@")) {
            System.out.println("email invalido");
            return false;
        }

        // validar contraseña
        if (u.getContrasena() == null || u.getContrasena().length() < 4) {
            System.out.println("contraseña muy corta");
            return false;
        }

        // si el id es 0 o no existe, inserta
        if (u.getId() == 0) {
            return dao.insertar(u);
        } else {
            // si tiene id, actualiza
            dao.actualizar(u);
            return true;
        }
    }
}