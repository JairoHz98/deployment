/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.DAO;

import com.idconnect.connect.conexion;
import com.idconnect.interfaces.GI_search;
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
public class search implements GI_search{
     @Override
    public String positiongetuser(usuario u) {
    String sql = "SELECT position FROM administradores WHERE user = ?";
        
        try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, u.getUsuario());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String position = rs.getString("position");
                return position;
            } else {
               
                return null;
            }

        } catch (SQLException e) {
            System.out.println("❌ Error al obtener hash: " + e.getMessage());
            e.printStackTrace();
            return null;
        }    
    }

    @Override
    public String Rol_personal(e3uesm e3) {
       String sql = "SELECT role FROM e3uesm WHERE Card = ?";
       try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, e3.getCard());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String position = rs.getString("role");
                return position;
            } else {
               
                return null;
            }

        } catch (SQLException e) {
            System.out.println("❌ Error al obtener hash: " + e.getMessage());
            e.printStackTrace();
            return null;
        }    
    }
   
}
