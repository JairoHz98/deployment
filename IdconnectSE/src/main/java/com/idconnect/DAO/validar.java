/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.DAO;

import com.idconnect.connect.Encript;
import com.idconnect.connect.conexion;
import com.idconnect.interfaces.GI_verify;
import com.idconnect.model.e3uesm;
import com.idconnect.model.usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author JairoHz
 */
public class validar implements GI_verify{
     @Override
    public boolean credentials(usuario u) {
        
        String sql = "SELECT COUNT(*) FROM administradores WHERE user = ?";
       
            try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, u.getUsuario());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String hashGuardado = Encript.obtenerHashPorUsuario(u.getUsuario()); 
                String hashIngresado = Encript.hashSHA256(u.getContra());

                System.out.println("🧠 Hash ingresado: " + hashIngresado);
                System.out.println("🗄️ Hash guardado: " + hashGuardado);

                return hashIngresado.equalsIgnoreCase(hashGuardado);
                
            } else {
                System.out.println("🚫 Usuario no encontrado.");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("❌ Error SQL: " + e.getMessage());
            e.printStackTrace();
            return false;
        }   
    }

    @Override
    public boolean credential_personal(e3uesm e3) {
       String sql = "SELECT COUNT(*) FROM e3uesm WHERE Card = ?";
       try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, e3.getCard());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String hashGuardado = Encript.obtenerHashPorCedula(e3.getCard()); 
                String hashIngresado = Encript.hashSHA256(e3.getPass());

                System.out.println("🧠 Hash ingresado: " + hashIngresado);
                System.out.println("🗄️ Hash guardado: " + hashGuardado);

                return hashIngresado.equalsIgnoreCase(hashGuardado);
                
            } else {
                System.out.println("🚫 Usuario no encontrado.");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("❌ Error SQL: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

}
