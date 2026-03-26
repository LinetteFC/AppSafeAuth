package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionDB {

    private static final String URL = "jdbc:mysql://localhost:3306/safeauth?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "mysql";

    public static Connection getConnection() {

        try {
            // 🔥 FORZAR DRIVER
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("✅ CONEXIÓN EXITOSA");
            return conn;

        } catch (Exception e) {
            e.printStackTrace(); // 🔥 AQUÍ DEBE SALIR EL ERROR REAL
        }

        return null;
    }
}