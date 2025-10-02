/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.idconnect.servlet;

import com.idconnect.DAO.delete;
import com.idconnect.DAO.insert;
import com.idconnect.DAO.list;
import com.idconnect.DAO.modify;
import com.idconnect.DAO.search;
import com.idconnect.DAO.validar;
import com.idconnect.connect.Encript;
import com.idconnect.model.e3uesm;
import com.idconnect.model.e3uesmaula;
import com.idconnect.model.e3uesmclases;
import com.idconnect.model.e3uesmhistory;
import com.idconnect.model.e3uesmhorario;
import com.idconnect.model.e3uesmingreso;
import com.idconnect.model.e3uesmrepresentante;
import com.idconnect.model.indexrepresent;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author JairoHz
 */
public class create extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet create</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet create at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ac = request.getParameter("g");
        String js;
        /* e3uesm */
        String id = "", name = "", card = "", role = "", uid = "", recognitions = "", pass = "", date = "", email = "";
        String id_ri, id_est, id_h, Ring, Rfe, Repre;

        /*model */
        e3uesmhistory eh3 = new e3uesmhistory();
        e3uesm e3 = new e3uesm();
        e3uesm e31;
        e3uesmhorario e3h = new e3uesmhorario();
        e3uesmaula e3a = new e3uesmaula();
        e3uesmclases e3m = new e3uesmclases();
        e3uesmrepresentante e3repre = new e3uesmrepresentante();
        e3uesmrepresentante e3reprem;
        e3uesmingreso e3ing = new e3uesmingreso();
        indexrepresent inx = new indexrepresent();
        indexrepresent linx;

        /* DAO */
        insert ag = new insert();
        validar val = new validar();
        search se = new search();
        list l = new list();
        modify mo = new modify();
        delete eli = new delete();

        /*boleean*/
        boolean success;
        
        boolean value;

        /*Servlet*/
        RequestDispatcher dispatcher;
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        switch (ac) {
            case "verify":
                e3.setCard(request.getParameter("usuario"));
                e3.setPass(request.getParameter("clave"));
                
                value = val.credential_personal(e3);
                if (value) {
                    role = se.Rol_personal(e3);
                    e31 = l.list_personal(e3);
                    switch (role) {
                        case "1":
                            /*traer las varible por el contructor*/
                            inx.setId_estudiante(e31.getId());
                           linx = l.listinfotado(inx);
                            
                            e31.setRole("Estudiante");
                            session.setAttribute("e3uesm", e31);
                            session.setAttribute("general", linx);
                            dispatcher = request.getRequestDispatcher("dashboard_representative.jsp");
                            dispatcher.forward(request, response);
                            
                            break;
                        case "2":
                            e31 = l.list_personal(e3);
                            e31.setRole("Docente");
                            session.setAttribute("e3uesm", e31);
                            dispatcher = request.getRequestDispatcher("dashboard_docente.jsp");
                            dispatcher.forward(request, response);
                            
                            break;
                        case "3":
                            e31 = l.list_personal(e3);
                            e31.setRole("Administrativo");
                            session.setAttribute("e3uesm", e31);
                            dispatcher = request.getRequestDispatcher("dashboard_educacion.jsp");
                            dispatcher.forward(request, response);
                            
                            break;
                        default:
                            throw new AssertionError();
                    }
                    
                }
                
                break;
            case "register":
                
                role = request.getParameter("rol");
                
                e3.setCard(request.getParameter("cedula"));
                e3.setName(request.getParameter("n"));
                e3.setDate(request.getParameter("date"));
                
                switch (role) {
                    case "1":
                        int uids = l.ultimoidpersonal();
                        int sum = uids + 1;
                        e3.setUid("E00" + sum + "0");
                        e3.setRole(request.getParameter("rol"));
                        break;
                    case "2":
                        uids = l.ultimoidpersonal();
                        sum = uids + 1;
                        e3.setUid("D00" + sum + "0");
                        e3.setRole(request.getParameter("rol"));
                        break;
                    case "3":
                        uids = l.ultimoidpersonal();
                        sum = uids + 1;
                        e3.setUid("A00" + sum + "0");
                        e3.setRole(request.getParameter("rol"));
                        break;
                    default:
                        throw new AssertionError();
                }
                e3.setRecognitions(request.getParameter("code"));
                e3.setPass("0");
                eh3.setUser(request.getParameter("iduser"));
                eh3.setDatehystory(request.getParameter("datehistory"));
                eh3.setDetail(request.getParameter("mensajeRegistro"));
                
                success = ag.insert_personal(e3);
                ag.insert_historye(eh3);
                if (success) {
                    request.setAttribute("status", "success");
                    request.setAttribute("mensaje", "¡Registro exitoso!");
                    dispatcher = request.getRequestDispatcher("edu_register.jsp");
                    dispatcher.forward(request, response);
                    
                } else {
                    // Supongamos que hubo un error al registrar
                    request.setAttribute("status", "danger");
                    request.setAttribute("mensaje", "Error al registrar los datos.");
                    dispatcher = request.getRequestDispatcher("edu_register.jsp");
                    dispatcher.forward(request, response);
                    
                }
                
                out.close();
                
                break;
            case "createworkday":
                /*Trayendo los valores y verificando ue esten llenos y vacios*/
                e3h.setJornada(request.getParameter("jornada"));
                e3h.setLu(request.getParameter("d1") != null && !request.getParameter("d1").isEmpty() ? request.getParameter("d1") : "3");
                e3h.setMa(request.getParameter("d2") != null && !request.getParameter("d2").isEmpty() ? request.getParameter("d2") : "3");
                e3h.setMi(request.getParameter("d3") != null && !request.getParameter("d3").isEmpty() ? request.getParameter("d3") : "3");
                e3h.setJu(request.getParameter("d4") != null && !request.getParameter("d4").isEmpty() ? request.getParameter("d4") : "3");
                e3h.setVi(request.getParameter("d5") != null && !request.getParameter("d5").isEmpty() ? request.getParameter("d5") : "3");    // Viernes
                e3h.setSa("3");                               // No está en el formulario
                e3h.setDom("3");                              // No está en el formulario
                e3h.setHentrada(request.getParameter("entrada"));
                e3h.setHsalida(request.getParameter("salida"));
                /*cogiendo el proximo id que se registrara*/
                success = ag.insert_jornadaIns(e3h);
                int uids,
                 sum;
                
                uids = l.ultimoidpersonal();
                sum = uids + 1;

                /* obteniendo el ultimo id para el proximo jsp*/
                e3h.setIdj(String.valueOf(sum));
                List<e3uesmhorario> listaHorarios = new ArrayList<>();
                listaHorarios.add(l.listhorario(e3h));
                session.setAttribute("horarios", listaHorarios);
                
                if (success) {
                    request.setAttribute("status", "success");
                    request.setAttribute("mensaje", "Se registraron correctamente los días seleccionados");
                    dispatcher = request.getRequestDispatcher("edu_time_preview.jsp");
                } else {
                    request.setAttribute("status", "error");
                    request.setAttribute("mensaje", "Hubo un problema al registrar los días");
                    dispatcher = request.getRequestDispatcher("edu_time.jsp");
                }
                
                dispatcher.forward(request, response);
                
                break;
            case "modifyworkday":
                String idj = request.getParameter("idj");
                String entrada = request.getParameter("entrada_" + idj);
                String salida = request.getParameter("salida_" + idj);
                
                e3h.setHentrada(entrada);
                e3h.setHsalida(salida);
                
                e3h.setIdj(idj);
                success = mo.modify_uniqueSchedule(e3h);
                if (success) {
                    request.setAttribute("status", "success");
                    request.setAttribute("mensaje", "Se modifico correctamente el ingreso y la salida");
                    dispatcher = request.getRequestDispatcher("edu_timelist.jsp");
                } else {
                    request.setAttribute("status", "error");
                    request.setAttribute("mensaje", "Hubo un problema al al modificar el ingreso y la salida");
                    dispatcher = request.getRequestDispatcher("edu_timelist.jsp");
                }
                
                dispatcher.forward(request, response);
                
                break;
            case "deleteschedule":
                e3h.setIdj(request.getParameter("idj"));
                success = eli.delete_horario(e3h);
                if (success) {
                    request.setAttribute("status", "success");
                    request.setAttribute("mensaje", "Se elimino correctamente");
                    dispatcher = request.getRequestDispatcher("edu_timelist.jsp");
                } else {
                    request.setAttribute("status", "error");
                    request.setAttribute("mensaje", "Hubo un problema al eliminar el horario");
                    dispatcher = request.getRequestDispatcher("edu_timelist.jsp");
                }
                
                dispatcher.forward(request, response);
                
                break;
            case "infohorario":
                /* obteniendo el ultimo id para el proximo jsp*/
                e3h.setIdj(request.getParameter("idj"));
                List<e3uesmhorario> listaHorario = new ArrayList<>();
                listaHorario.add(l.listhorario(e3h));
                session.setAttribute("horarios", listaHorario);
                request.setAttribute("status", "success");
                request.setAttribute("mensaje", "Se registraron correctamente los días seleccionados");
                dispatcher = request.getRequestDispatcher("edu_time_preview2.jsp");
                
                dispatcher.forward(request, response);
                
                break;
            case "register_aula":
                e3a.setNombre(request.getParameter("nombre"));
                e3a.setTipo(request.getParameter("tipo"));
                e3a.setUbicacion(request.getParameter("ubicacion"));
                e3a.setEstado(request.getParameter("estado"));
                success = ag.insert_aulas(e3a);
                if (success) {
                    request.setAttribute("status", "success");
                    request.setAttribute("mensaje", "Se registro correctamente");
                    dispatcher = request.getRequestDispatcher("edu_aulas.jsp");
                } else {
                    request.setAttribute("status", "error");
                    request.setAttribute("mensaje", "Hubo un problema al eliminar el horario");
                    dispatcher = request.getRequestDispatcher("edu_aulas.jsp");
                }
                
                dispatcher.forward(request, response);
                break;
            case "register_issue":
                e3m.setId_teacher(request.getParameter("iddocente"));
                e3m.setId_aula(request.getParameter("idaula"));
                e3m.setId_materias(request.getParameter("idmaterias"));
                e3m.setMingreso(request.getParameter("entrada"));
                e3m.setMsalida(request.getParameter("salida"));
                e3m.setId_estudiante("0");
                success = ag.insert_clases(e3m);
                if (success) {
                    request.setAttribute("status", "success");
                    request.setAttribute("mensaje", "Se registro correctamente");
                    dispatcher = request.getRequestDispatcher("edu_timeteacher.jsp");
                } else {
                    request.setAttribute("status", "error");
                    request.setAttribute("mensaje", "Hubo un problema al eliminar el horario");
                    dispatcher = request.getRequestDispatcher("edu_timeteacher.jsp");
                }
                
                dispatcher.forward(request, response);
                break;
            case "representante_regis":
                e3repre.setName_r(request.getParameter("nombreFamilia"));
                e3repre.setCedula(request.getParameter("ced"));
                e3repre.setId_estu(request.getParameter("estudiante"));
                e3repre.setRelacion_re(request.getParameter("relacion"));
                e3repre.setPhone(request.getParameter("telefono"));
                e3repre.setEmail(request.getParameter("correo"));
                e3repre.setId_horario(request.getParameter("Jornada"));
                
                success = ag.insertar_representante(e3repre);
                if (success) {
                    request.setAttribute("status", "success");
                    request.setAttribute("mensaje", "Se registro correctamente");
                    dispatcher = request.getRequestDispatcher("edu_family.jsp");
                } else {
                    request.setAttribute("status", "error");
                    request.setAttribute("mensaje", "Hubo un problema al eliminar el horario");
                    dispatcher = request.getRequestDispatcher("edu_family.jsp");
                }
                dispatcher.forward(request, response);
                break;
            
            default:
                
                throw new AssertionError();
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
