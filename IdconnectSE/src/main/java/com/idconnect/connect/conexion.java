/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author JairoHz
 */
public class conexion {
         // Puedes llamar este método directamente desde tu Servlet o Controller
    public static Connection getConnection(){
         try {
String url = "jdbc:mysql://localhost:3306/bconnectv3?useUnicode=true&characterEncoding=UTF-8";
        String usuario = "root";
        String clave = "";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, usuario, clave);
    } catch (ClassNotFoundException | SQLException e) {
        System.err.println("Error de conexión: " + e.getMessage());
        return null;
    }

    }

        
    
     public static void setConnection(Connection conn) throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
            System.out.println("🔒 Conexión cerrada exitosamente");
        }
    }


}
