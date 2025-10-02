/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.DAO;

import com.idconnect.connect.conexion;
import com.idconnect.interfaces.GI_list;
import com.idconnect.model.company;
import com.idconnect.model.e3uesm;
import com.idconnect.model.e3uesmaterias;
import com.idconnect.model.e3uesmaula;
import com.idconnect.model.e3uesmhistory;
import com.idconnect.model.e3uesmhorario;
import com.idconnect.model.e3uesmingreso;
import com.idconnect.model.e3uesmrepresentante;
import com.idconnect.model.indexrepresent;
import com.idconnect.model.usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author JairoHz
 */
public class list implements GI_list {

    @Override
    public usuario listuser(usuario u) {
        String sql = "select * from administradores where user=?";
        usuario lus = new usuario();
        try {
            PreparedStatement ps = conexion.getConnection().prepareStatement(sql);
            ps.setString(1, u.getUsuario());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                lus.setid(rs.getString("id"));
                lus.setCedula(rs.getString("card"));
                lus.setUsuario(rs.getString("user"));
                lus.setPosition(rs.getString("position"));
                lus.setuid(rs.getString("uid"));
                lus.setNombres(rs.getString("name"));

            }

        } catch (SQLException ex) {
            System.err.println("Error:" + ex);
        }

        return lus;

    }

    @Override
    public int ultimoid() {
        int ultimoCodigo = -1;
        String sql = "SELECT id FROM administradores ORDER BY id DESC LIMIT 1";

        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                ultimoCodigo = rs.getInt("id");
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Puedes loguear o lanzar una excepción personalizada
        }

        return ultimoCodigo;
    }

    @Override
    public List<usuario> get_list_administradores() {
        List<usuario> admins = new ArrayList<>();
        String sql = "SELECT * FROM administradores";

        try (PreparedStatement ps = conexion.getConnection().prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                admins.add(new usuario(
                        rs.getString("card"),
                        rs.getString("user"),
                        rs.getString("pass"),
                        rs.getString("position"),
                        rs.getString("name"),
                        rs.getString("id"),
                        rs.getString("uid")
                ));
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }

        return admins;

    }

    @Override
    public int ultimoidc() {
        int ultimoCodigo = -1;
        String sql = "SELECT id FROM companies ORDER BY id DESC LIMIT 1";

        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                ultimoCodigo = rs.getInt("id");
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Puedes loguear o lanzar una excepción personalizada
        }

        return ultimoCodigo;
    }

    @Override
    public List<company> get_list_companies() {
        List<company> admins = new ArrayList<>();
        String sql = "SELECT * FROM companies";

        try (PreparedStatement ps = conexion.getConnection().prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String renewal = rs.getString("renewal");
                switch (renewal) {
                    case "1":
                        renewal = "Anual";
                        break;
                    case "2":
                        renewal = "Trimestral";
                        break;
                    case "3":
                        renewal = "Mensual";
                        break;
                }

                admins.add(new company(
                        rs.getString("id"),
                        rs.getString("ruc"),
                        rs.getString("Name"),
                        rs.getString("reason"),
                        rs.getString("mail"),
                        rs.getString("contact"),
                        renewal,
                        rs.getString("position"),
                        rs.getString("uid")
                ));
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }

        return admins;

    }

    @Override
    public e3uesm list_personal(e3uesm e3) {
        String sql = "select * from e3uesm where Card=?";
        e3uesm lus = new e3uesm();
        try {
            PreparedStatement ps = conexion.getConnection().prepareStatement(sql);
            ps.setString(1, e3.getCard());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                lus.setId(rs.getString("id"));                  // ID único
                lus.setName(rs.getString("Name"));             // Nombre completo
                lus.setCard(rs.getString("Card"));             // Cédula o tarjeta
                lus.setRole(rs.getString("role"));             // Rol del usuario
                lus.setUid(rs.getString("UID"));               // UID generado
                lus.setRecognitions(rs.getString("Recognitions")); // Reconocimientos (huellas, etc.)
                lus.setPass(rs.getString("pass"));             // Contraseña (encriptada)
                lus.setDate(rs.getString("date"));             // Fecha de nacimiento o registro
                lus.setEmail(rs.getString("email"));           // Correo electrónico

            }

        } catch (SQLException ex) {
            System.err.println("Error:" + ex);
        }

        return lus;

    }

    @Override
    public List<e3uesmhistory> get_list_history() {
        List<e3uesmhistory> admins = new ArrayList<>();
        String sql = "SELECT h.id, h.datehystory, h.User, h.Detail, u.Name FROM e3uesmhistory h LEFT JOIN e3uesm u ON h.User = u.id";

        try (PreparedStatement ps = conexion.getConnection().prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                e3uesmhistory item = new e3uesmhistory();
                item.setId_hystory(rs.getString("id"));
                item.setDatehystory(rs.getString("datehystory"));
                item.setUser(rs.getString("User"));
                item.setDetail(rs.getString("Detail"));
                item.setNameComplete(rs.getString("Name"));

                admins.add(item);
                System.out.println("Nombre completo: " + rs.getString("Name"));
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }

        return admins;
    }

    @Override
    public int ultimoidpersonal() {
        int ultimoCodigo = -1;
        String sql = "SELECT id FROM e3uesm ORDER BY id DESC LIMIT 1";

        try (Connection con = conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                ultimoCodigo = rs.getInt("id");
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Puedes loguear o lanzar una excepción personalizada
        }

        return ultimoCodigo;
    }

    @Override
    public e3uesmhorario listhorario(e3uesmhorario ehor) {
        String sql = "SELECT * FROM e3uesmhorario WHERE id=?";
        e3uesmhorario ehors = new e3uesmhorario();

        try {
            PreparedStatement ps = conexion.getConnection().prepareStatement(sql);
            ps.setString(1, ehor.getIdj());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                // Datos generales
                ehors.setIdj(rs.getString("id"));

                ehors.setHentrada(rs.getString("hentrada"));
                ehors.setHsalida(rs.getString("hsalida"));

                // Reemplazar "1" por nombre del día directamente
                String lu = "1".equals(rs.getString("lu")) ? "Lunes" : "";
                String ma = "1".equals(rs.getString("ma")) ? "Martes" : "";
                String mi = "1".equals(rs.getString("mi")) ? "Miércoles" : "";
                String ju = "1".equals(rs.getString("ju")) ? "Jueves" : "";
                String vi = "1".equals(rs.getString("vi")) ? "Viernes" : "";
                String sa = "1".equals(rs.getString("sa")) ? "Sábado" : "";
                String dom = "1".equals(rs.getString("do")) ? "Domingo" : "";
                String jornada = rs.getString("jornada");
                String tipoJornada = "";

                if ("m".equals(jornada)) {
                    tipoJornada = "Matutina";
                } else if ("t".equals(jornada)) {
                    tipoJornada = "Vespertina";
                } else if ("n".equals(jornada)) {
                    tipoJornada = "Nocturna";
                }

                // Verificar si al menos un día está activo
                boolean tieneDiaActivo = !lu.isEmpty() || !ma.isEmpty() || !mi.isEmpty()
                        || !ju.isEmpty() || !vi.isEmpty() || !sa.isEmpty() || !dom.isEmpty();

                if (tieneDiaActivo) {
                    ehors.setLu(lu);
                    ehors.setMa(ma);
                    ehors.setMi(mi);
                    ehors.setJu(ju);
                    ehors.setVi(vi);
                    ehors.setSa(sa);
                    ehors.setDom(dom);
                    ehors.setJornada(tipoJornada);

                } else {
                    // Si no hay días activos, limpiar el objeto
                    ehors = null;
                }
            }

        } catch (SQLException ex) {
            System.err.println("Error al consultar horario: " + ex.getMessage());
        }

        return ehors;
    }

    @Override
    public List<e3uesmhorario> get_list_ultimohorario() {
        List<e3uesmhorario> e3 = new ArrayList<>();
        String sql = "SELECT * FROM e3uesmhorario ORDER BY id DESC LIMIT 1";

        try (PreparedStatement ps = conexion.getConnection().prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                // Reemplazar "1" por nombre del día directamente
                String lu = "1".equals(rs.getString("lu")) ? "Lunes" : "";
                String ma = "1".equals(rs.getString("ma")) ? "Martes" : "";
                String mi = "1".equals(rs.getString("mi")) ? "Miércoles" : "";
                String ju = "1".equals(rs.getString("ju")) ? "Jueves" : "";
                String vi = "1".equals(rs.getString("vi")) ? "Viernes" : "";
                String sa = "1".equals(rs.getString("sa")) ? "Sábado" : "";
                String dom = "1".equals(rs.getString("do")) ? "Domingo" : "";
                String jornada = rs.getString("jornada");
                String tipoJornada = "";

                if ("m".equals(jornada)) {
                    tipoJornada = "Matutina";
                } else if ("t".equals(jornada)) {
                    tipoJornada = "Vespertina";
                } else if ("n".equals(jornada)) {
                    tipoJornada = "Nocturna";
                }

                // Verificar si al menos un día está activo
                boolean tieneDiaActivo = !lu.isEmpty() || !ma.isEmpty() || !mi.isEmpty()
                        || !ju.isEmpty() || !vi.isEmpty() || !sa.isEmpty() || !dom.isEmpty();

                if (tieneDiaActivo) {
                    e3uesmhorario ehors = new e3uesmhorario(
                            rs.getString("id"),
                            tipoJornada,
                            lu, ma, mi, ju, vi, sa, dom,
                            rs.getString("hentrada"),
                            rs.getString("hsalida")
                    );
                    e3.add(ehors);
                }
                // Si no hay días activos, no se agrega nada a la lista
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }

        return e3;
    }

    @Override
    public List<e3uesmhorario> get_listgeneralshedule() {
        List<e3uesmhorario> e3 = new ArrayList<>();
        String sql = "SELECT * FROM e3uesmhorario";

        try (PreparedStatement ps = conexion.getConnection().prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                // Reemplazar "1" por nombre del día directamente
                String lu = "1".equals(rs.getString("lu")) ? "Lunes" : "";
                String ma = "1".equals(rs.getString("ma")) ? "Martes" : "";
                String mi = "1".equals(rs.getString("mi")) ? "Miércoles" : "";
                String ju = "1".equals(rs.getString("ju")) ? "Jueves" : "";
                String vi = "1".equals(rs.getString("vi")) ? "Viernes" : "";
                String sa = "1".equals(rs.getString("sa")) ? "Sábado" : "";
                String dom = "1".equals(rs.getString("do")) ? "Domingo" : "";
                String jornada = rs.getString("jornada");
                String tipoJornada = "";

                if ("m".equals(jornada)) {
                    tipoJornada = "Matutina";
                } else if ("t".equals(jornada)) {
                    tipoJornada = "Vespertina";
                } else if ("n".equals(jornada)) {
                    tipoJornada = "Nocturna";
                }

                // Verificar si al menos un día está activo
                boolean tieneDiaActivo = !lu.isEmpty() || !ma.isEmpty() || !mi.isEmpty()
                        || !ju.isEmpty() || !vi.isEmpty() || !sa.isEmpty() || !dom.isEmpty();

                if (tieneDiaActivo) {
                    e3uesmhorario ehors = new e3uesmhorario(
                            rs.getString("id"),
                            tipoJornada,
                            lu, ma, mi, ju, vi, sa, dom,
                            rs.getString("hentrada"),
                            rs.getString("hsalida")
                    );
                    e3.add(ehors);
                }
                // Si no hay días activos, no se agrega nada a la lista
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }

        return e3;
    }

    @Override
    public List<e3uesm> get_listtecacher() {
        List<e3uesm> e3 = new ArrayList<>();
        String sql = "SELECT * FROM e3uesm WHERE role=2";

        try (PreparedStatement ps = conexion.getConnection().prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                e3.add(new e3uesm(
                        rs.getString("id"),
                        rs.getString("Name"),
                        rs.getString("Card"),
                        rs.getString("role"),
                        rs.getString("UID"),
                        rs.getString("Recognitions"),
                        rs.getString("pass"),
                        rs.getString("date"),
                        rs.getString("email")
                ));
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }

        return e3;
    }

    @Override
    public List<e3uesmaula> get_listaulas() {
        List<e3uesmaula> e3 = new ArrayList<>();
        String sql = "SELECT * FROM e3uesmaula";

        try (PreparedStatement ps = conexion.getConnection().prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                e3.add(new e3uesmaula(
                        rs.getString("id_aula"),
                        rs.getString("nombre"),
                        rs.getString("tipo"),
                        rs.getString("ubicacion"),
                        rs.getString("estado")
                ));
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }

        return e3;
    }

    @Override
    public List<e3uesmaterias> get_listmaterias() {
        List<e3uesmaterias> e3m = new ArrayList<>();
        String sql = "SELECT * FROM e3uesmaterias";

        try (PreparedStatement ps = conexion.getConnection().prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                e3m.add(new e3uesmaterias(
                        rs.getString("id_materia"),
                        rs.getString("nombre"),
                        rs.getString("codigo"),
                        rs.getString("nivel"),
                        rs.getString("creditos"),
                        rs.getString("estado")
                ));
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }

        return e3m;
    }

    @Override
    public List<e3uesm> get_liststudent() {
        List<e3uesm> e3 = new ArrayList<>();
        String sql = "SELECT * FROM e3uesm WHERE role=1";

        try (PreparedStatement ps = conexion.getConnection().prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                e3.add(new e3uesm(
                        rs.getString("id"),
                        rs.getString("Name"),
                        rs.getString("Card"),
                        rs.getString("role"),
                        rs.getString("UID"),
                        rs.getString("Recognitions"),
                        rs.getString("pass"),
                        rs.getString("date"),
                        rs.getString("email")
                ));
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }

        return e3;
    }

    @Override
    public e3uesm listpersonalcode(e3uesm e3) {
        String sql = "select * from e3uesm where Recognitions=?";
        e3uesm e3i = new e3uesm();
        try {
            PreparedStatement ps = conexion.getConnection().prepareStatement(sql);
            ps.setString(1, e3.getRecognitions());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                e3i.setId(rs.getString("id"));               // ← id
                e3i.setName(rs.getString("Name"));           // ← name
                e3i.setCard(rs.getString("Card"));           // ← card (cedula)
                e3i.setRole(rs.getString("role"));           // ← role (position)
                e3i.setUid(rs.getString("UID"));             // ← uid
                e3i.setRecognitions(rs.getString("Recognitions"));
                e3i.setPass(rs.getString("pass"));           // ← pass
                e3i.setDate(rs.getString("date"));           // ← date
                e3i.setEmail(rs.getString("email"));         // ← email
                e3i.setId_horario(rs.getString("id_horario"));
            }

        } catch (SQLException ex) {
            System.err.println("Error al consultar e3uesm: " + ex.getMessage());
            ex.printStackTrace();

        }

        return e3i;

    }

    @Override
    public e3uesmrepresentante listactrepre(e3uesmrepresentante e3rep) {
        String sql = "select * from e3uesmrepresentante where id_estu=? AND status=1";
        e3uesmrepresentante e3i = new e3uesmrepresentante();
        try {
            PreparedStatement ps = conexion.getConnection().prepareStatement(sql);
            ps.setString(1, e3rep.getId_estu());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                e3i.setId_repre(rs.getString("id_repre"));               // ← id
                e3i.setName_r(rs.getString("name_r"));           // ← name
                e3i.setPhone(rs.getString("phone"));           // ← card (cedula)
                e3i.setEmail(rs.getString("email"));           // ← role (position)
                e3i.setId_estu(rs.getString("id_estu"));             // ← uid
                e3i.setRelacion_re(rs.getString("relacion_re"));
                e3i.setExtra(rs.getString("extra"));           // ← pass
                e3i.setId_horario(rs.getString("id_horario"));           // ← date
                e3i.setCedula(rs.getString("Cedula"));         // ← email
                e3i.setStatus(rs.getString("status"));
            }

        } catch (SQLException ex) {
            System.err.println("Error al consultar e3uesm: " + ex.getMessage());
            ex.printStackTrace();

        }

        return e3i;

    }

    @Override
    public indexrepresent listinfotado(indexrepresent inrepre) {
        String sql = "SELECT MAX(u.name_r) AS name_r, MAX(e.Name) AS Name, MAX(a.id_estudiante) AS id_estudiante, MAX(a.id_aula) AS id_aula, MAX(a.id_materias) AS id_materias, MAX(b.nombre) AS nombre, MAX(c.nivel) AS nivel, MAX(e.UID) AS UID, MAX(d.Ring) AS Ring, MAX(d.representante) AS representanteen, MAX(f.Rsal) AS Rsal, MAX(f.representante) AS representantesa FROM e3uesmrepresentante u INNER JOIN e3uesm e ON u.id_estu = e.id INNER JOIN e3uesmclases a ON u.id_estu = a.id_estudiante INNER JOIN e3uesmaula b ON a.id_aula = b.id_aula INNER JOIN e3uesmaterias c ON a.id_materias = c.id_materia INNER JOIN e3uesmingreso d ON d.id_est = u.id_estu INNER JOIN e3uesmsalida f ON f.id_est = u.id_estu WHERE u.id_estu=?";
        indexrepresent lus = new indexrepresent();
        try {
            PreparedStatement ps = conexion.getConnection().prepareStatement(sql);
            ps.setString(1, inrepre.getId_estudiante());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                lus.setName_r(rs.getString("name_r"));
                lus.setName_est(rs.getString("Name"));
                lus.setId_estudiante(rs.getString("id_estudiante"));
                lus.setId_aula(rs.getString("id_aula"));
                lus.setId_materias(rs.getString("id_materias"));
                lus.setNombreAula(rs.getString("nombre"));
                lus.setNivel_aula(rs.getString("nivel"));
                lus.setUidest(rs.getString("UID"));
                lus.setNombreAula(rs.getString("nombre"));
                lus.setRing(rs.getString("Ring"));
                lus.setRepresentanteen(rs.getString("representanteen"));
                lus.setRsal(rs.getString("Rsal"));
                lus.setRepresentantesa(rs.getString("representantesa"));
            }

        } catch (SQLException ex) {
            System.err.println("Error:" + ex);
        }

        return lus;
    }

    @Override
    public List<e3uesmingreso> listinregresos(e3uesmingreso e3in) {
        String sql = "SELECT * FROM e3uesmingreso WHERE id_est=?";
        List<e3uesmingreso> lus = new ArrayList<>();
        try {
            PreparedStatement ps = conexion.getConnection().prepareStatement(sql);
            ps.setString(1, e3in.getId_est());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                e3uesmingreso i = new e3uesmingreso();
                i.setId_ri(rs.getString("id_ri"));
                i.setId_est(rs.getString("id_est"));
                i.setId_h(rs.getString("id_h"));
                i.setRing(rs.getString("Ring"));
                i.setRfe(rs.getString("Rfe"));
                i.setRepresentante(rs.getString("representante"));
                lus.add(i);
            }

        } catch (SQLException ex) {
            System.err.println("Error:" + ex);
        }

        return lus;
    }
}

