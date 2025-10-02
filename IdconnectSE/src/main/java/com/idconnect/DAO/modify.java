/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.DAO;

import com.idconnect.connect.conexion;
import com.idconnect.interfaces.GI_modify;
import com.idconnect.model.company;
import com.idconnect.model.e3uesmhorario;
import com.idconnect.model.usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author JairoHz
 */
public class modify implements GI_modify{
     @Override
    public boolean modify_admin(usuario us) {
    String sql = "UPDATE administradores SET name = ?, user = ?, card = ? WHERE id = ?";

        try (Connection con = conexion.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, us.getNombres());
            pst.setString(2, us.getUsuario());
            pst.setString(3, us.getCedula());
            pst.setString(4, us.getid());
            
            int filasAfectadas = pst.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            System.err.println("Error al modificar usuario: " + e.getMessage());
            return false;
        }
 
    }

    @Override
    public boolean modify_company(company c) {
         String sql = "UPDATE companies SET ruc = ?, Name = ?, reason = ?, mail = ?, contact = ?, renewal = ? WHERE id = ?";

        try (Connection con = conexion.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, c.getRuc());
            pst.setString(2, c.getName());
            pst.setString(3, c.getReason());
            pst.setString(4, c.getMail());
            pst.setString(5, c.getContact());
            pst.setString(6, c.getRenewal());
            pst.setString(7, c.getId());
            
            int filasAfectadas = pst.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            System.err.println("Error al modificar usuario: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean modify_uniqueSchedule(e3uesmhorario eh3) {
   String sql = "UPDATE e3uesmhorario SET  hentrada = ?, hsalida = ? WHERE id = ?";

        try (Connection con = conexion.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
          
            pst.setString(1, eh3.getHentrada());
            pst.setString(2, eh3.getHsalida());
            pst.setString(3, eh3.getIdj());
            
            int filasAfectadas = pst.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            System.err.println("Error al modificar horario: " + e.getMessage());
            return false;
        }
 
    }
    
}
