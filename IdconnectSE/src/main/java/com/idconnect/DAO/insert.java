/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.DAO;

import com.idconnect.connect.Encript;
import com.idconnect.connect.conexion;
import com.idconnect.interfaces.GI_insert;
import com.idconnect.model.company;
import com.idconnect.model.e3uesm;
import com.idconnect.model.e3uesmaula;
import com.idconnect.model.e3uesmclases;
import com.idconnect.model.e3uesmhistory;
import com.idconnect.model.e3uesmhorario;
import com.idconnect.model.e3uesmingreso;
import com.idconnect.model.e3uesmrepresentante;
import com.idconnect.model.e3uesmsalida;
import com.idconnect.model.usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author JairoHz
 */
public class insert implements GI_insert {

    @Override
    public boolean insertar_admin(usuario u) {
        String sql = "INSERT INTO administradores(card, name, user, position, pass, uid) VALUES (?,?,?,?,?,?)";
        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, u.getCedula());
            ps.setString(2, u.getNombres());
            ps.setString(3, u.getUsuario());
            ps.setString(4, u.getPosition());
            ps.setString(5, Encript.hashSHA256(u.getContra()));
            ps.setString(6, u.getuid());
            int resultado = ps.executeUpdate();
            return resultado > 0; // true si se insertó correctamente
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public boolean guardarUsuario(usuario user) {
        String sql = "INSERT INTO usuarios (usuario, password) VALUES (?, ?);";
        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getNombres());
            ps.setString(2, user.getContra()); // ⚠ En producción usar hash
            int resultado = ps.executeUpdate();
            return resultado > 0; // true si se insertó correctamente
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean Insert_company(company c) {
        String sql = "INSERT INTO companies(ruc, Name, reason, mail, contact, renewal, position, uid) VALUES (?,?,?,?,?,?,?,?)";
        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getRuc());
            ps.setString(2, c.getName());
            ps.setString(3, c.getReason());
            ps.setString(4, c.getMail());
            ps.setString(5, c.getContact());
            ps.setString(6, c.getRenewal());
            ps.setString(7, c.getPosition());
            ps.setString(8, c.getUid());
            int resultado = ps.executeUpdate();
            return resultado > 0; // true si se insertó correctamente
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean insert_personal(e3uesm e3) {
        String sql = "INSERT INTO e3uesm(Name, Card, role, UID, Recognitions, pass, date) VALUES (?,?,?,?,?,?,?)";
        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, e3.getName());
            ps.setString(2, e3.getCard());
            ps.setString(3, e3.getRole());
            ps.setString(4, e3.getUid());
            ps.setString(5, e3.getRecognitions());
            ps.setString(6, Encript.hashSHA256(e3.getPass()));
            ps.setString(7, e3.getDate());

            int resultado = ps.executeUpdate();
            return resultado > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean insert_historye(e3uesmhistory eh) {
        String sql = "INSERT INTO e3uesmhistory(datehystory, User, Detail) VALUES (?,?,?)";
        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, eh.getDatehystory());
            ps.setString(2, eh.getUser());
            ps.setString(3, eh.getDetail());
            int resultado = ps.executeUpdate();
            return resultado > 0; // true si se insertó correctamente
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean insert_jornadaIns(e3uesmhorario e3h) {
        String sql = "INSERT INTO e3uesmhorario(jornada, lu,ma,mi,ju,vi,sa,do,hentrada, hsalida) VALUES (?,?,?,?,?,?,?,?,?,?)";
        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, e3h.getJornada());
            ps.setString(2, e3h.getLu());
            ps.setString(3, e3h.getMa());
            ps.setString(4, e3h.getMi());
            ps.setString(5, e3h.getJu());
            ps.setString(6, e3h.getVi());
            ps.setString(7, e3h.getSa());
            ps.setString(8, e3h.getDom());
            ps.setString(9, e3h.getHentrada());
            ps.setString(10, e3h.getHsalida());
            int resultado = ps.executeUpdate();
            return resultado > 0; // true si se insertó correctamente
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean insert_aulas(e3uesmaula e3a) {
        String sql = "INSERT INTO e3uesmaula(nombre, tipo, ubicacion, estado) VALUES (?,?,?,?)";
        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, e3a.getNombre());
            ps.setString(2, e3a.getTipo());
            ps.setString(3, e3a.getUbicacion());
            ps.setString(4, e3a.getEstado());

            int resultado = ps.executeUpdate();
            return resultado > 0; // true si se insertó correctamente
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean insert_clases(e3uesmclases e3c) {
        String sql = "INSERT INTO representantes(id_repre, name_r, phone, email, id_estu, relacion_re, extra, id_horario) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, e3c.getId_teacher());
             ps.setString(2, e3c.getId_aula());
             ps.setString(3, e3c.getId_materias());
             ps.setString(4, e3c.getMingreso());
             ps.setString(5, e3c.getMsalida());
             ps.setString(6, e3c.getId_estudiante());

            int resultado = ps.executeUpdate();
            return resultado > 0; // true si se insertó correctamente
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean insertar_representante(e3uesmrepresentante e3c) {
  String sql = "INSERT INTO e3uesmrepresentante(name_r, phone, email, id_estu, relacion_re, extra, id_horario, Cedula) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, e3c.getName_r());
             ps.setString(2, e3c.getPhone());
             ps.setString(3, e3c.getEmail());
             ps.setString(4, e3c.getId_estu());
             ps.setString(5, e3c.getRelacion_re());
             ps.setString(6, e3c.getExtra());
             ps.setString(7, e3c.getId_horario());
              ps.setString(8, e3c.getCedula());
             
            int resultado = ps.executeUpdate();
            return resultado > 0; // true si se insertó correctamente
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean insert_register_start(e3uesmingreso e3ing) {
    String sql = "INSERT INTO e3uesmingreso(id_est, id_h, Ring, Rfe, representante) VALUES (?,?,?,?,?)";
        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, e3ing.getId_est());
            ps.setString(2, e3ing.getId_h());
            ps.setString(3, e3ing.getRing());
            ps.setString(4, e3ing.getRfe());
            ps.setString(5, e3ing.getRepresentante());
            int resultado = ps.executeUpdate();
            return resultado > 0; // true si se insertó correctamente
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public boolean insert_register_end(e3uesmsalida e3sal) {
 String sql = "INSERT INTO e3uesmsalida(id_est, id_h, Rsal, Rfe, representante) VALUES (?,?,?,?,?)";
        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, e3sal.getId_est());
            ps.setString(2, e3sal.getId_h());
            ps.setString(3, e3sal.getRing());
            ps.setString(4, e3sal.getRfe());
            ps.setString(5, e3sal.getRepresentante());
            int resultado = ps.executeUpdate();
            return resultado > 0; // true si se insertó correctamente
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
