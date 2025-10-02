/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.DAO;

import com.idconnect.connect.conexion;
import com.idconnect.interfaces.GI_delete;
import com.idconnect.model.company;
import com.idconnect.model.e3uesmhorario;
import com.idconnect.model.usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author JairoHz
 */
public class delete implements GI_delete{
     @Override
    public boolean delete_admin(usuario us) {
   String consulta = "DELETE FROM administradores WHERE id=?";
    
    try (Connection conn = conexion.getConnection();
         PreparedStatement pst = conn.prepareStatement(consulta)) {
        
        pst.setString(1, us.getid());
        int filasAfectadas = pst.executeUpdate();
        
        if (filasAfectadas == 1) {
            System.out.println("Registro Eliminado Correctamente");
            return true;
        }
        
    } catch (Exception ex) {
        System.err.println("Error: " + ex);
    }
    return false;
    }

    @Override
    public boolean delete_comp(company c) {
String consulta = "DELETE FROM companies WHERE id=?";
    
    try (Connection conn = conexion.getConnection();
         PreparedStatement pst = conn.prepareStatement(consulta)) {
        
        pst.setString(1, c.getId());
        int filasAfectadas = pst.executeUpdate();
        
        if (filasAfectadas == 1) {
            System.out.println("Registro Eliminado Correctamente");
            return true;
        }
        
    } catch (Exception ex) {
        System.err.println("Error: " + ex);
    }
    return false;
         
    }

    @Override
    public boolean delete_horario(e3uesmhorario e3h) {
   String consulta = "DELETE FROM e3uesmhorario WHERE id=?";
    
    try (Connection conn = conexion.getConnection();
         PreparedStatement pst = conn.prepareStatement(consulta)) {
        
        pst.setString(1, e3h.getIdj());
        int filasAfectadas = pst.executeUpdate();
        
        if (filasAfectadas == 1) {
            System.out.println("Registro Eliminado Correctamente");
            return true;
        }
        
    } catch (Exception ex) {
        System.err.println("Error: " + ex);
    }
    return false;

    }
   
}
