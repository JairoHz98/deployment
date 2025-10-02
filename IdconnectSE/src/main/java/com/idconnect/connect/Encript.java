/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.connect;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author JairoHz
 */
public class Encript {
     // Encripta un texto con MD5
    public static String hashSHA256(String clave) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(clave.getBytes(StandardCharsets.UTF_8));

            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error al generar SHA-256", e);
        }



    
}
    
    public static String obtenerHashPorUsuario(String usuario) {
        String sql = "SELECT pass FROM administradores WHERE user = ?";
        
        try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, usuario);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String hash = rs.getString("pass");
                System.out.println("🗄️ Hash obtenido para " + usuario + ": " + hash);
                return hash;
            } else {
                System.out.println("🚫 Usuario no encontrado: " + usuario);
                return null;
            }

        } catch (SQLException e) {
            System.out.println("❌ Error al obtener hash: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
   
    public static String obtenerHashPorCedula(String Card) {
        String sql = "SELECT pass FROM e3uesm WHERE Card = ?";
        
        try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, Card);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String hash = rs.getString("pass");
                System.out.println("🗄️ Hash obtenido para " + Card + ": " + hash);
                return hash;
            } else {
                System.out.println("🚫 Usuario no encontrado: " + Card);
                return null;
            }

        } catch (SQLException e) {
            System.out.println("❌ Error al obtener hash: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
