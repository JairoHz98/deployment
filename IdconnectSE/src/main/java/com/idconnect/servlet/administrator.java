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
import com.idconnect.connect.conexion;
import com.idconnect.model.usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author BUSINESS CONNECT
 */
@WebServlet(name = "administrator", urlPatterns = {"/administrator"})
public class administrator extends HttpServlet {

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
            out.println("<title>Servlet administrator</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet administrator at " + request.getContextPath() + "</h1>");
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
        String ac = request.getParameter("a");

        /*Variables reutilizables */
        String Nombres, Cedula, Id, Uid, correo, cargo, pass;

        /*database*/
        usuario user = new usuario();
        validar val = new validar();
        search se = new search();

        /*execute */
        list lis = new list();
        delete eli = new delete();
        modify mod = new modify();

        /*extras*/
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        switch (ac) {
            case "singup":
                Cedula = request.getParameter("cedula");
                Nombres = request.getParameter("nombres");
                correo = request.getParameter("correo");
                cargo = request.getParameter("cargo");
                String password = request.getParameter("password1");
                int uid = lis.ultimoid();
                int sum = uid + 1;

                user.setCedula(Cedula);
                user.setNombres(Nombres);
                user.setUsuario(correo);
                user.setPosition(cargo);
                user.setContra(password);
                user.setuid("A000" + sum);

                insert ag = new insert();

                response.setContentType("text/html;charset=UTF-8");

                boolean exito = ag.insertar_admin(user);

                if (exito) {
                    request.setAttribute("status", "success");
                    request.setAttribute("mensaje", "¡Registro exitoso!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("admin_registeruser.jsp");
                    dispatcher.forward(request, response);

                } else {
                    // Supongamos que hubo un error al registrar
                    request.setAttribute("status", "danger");
                    request.setAttribute("mensaje", "Error al registrar los datos.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("admin_registeruser.jsp");
                    dispatcher.forward(request, response);

                }

                out.close();
                break;
            case "verify":
                RequestDispatcher dispatcher;
                String usu = request.getParameter("usuario");
                String cla = request.getParameter("clave");
                String position;
                boolean value;
                user.setUsuario(usu);
                user.setContra(cla);

                value = val.credentials(user);
                if (value) {
                    position = se.positiongetuser(user);
                    switch (position) {
                        case "Administrador":
                            usuario luser = lis.listuser(user);
                            Id = luser.getid();
                            Cedula = luser.getCedula();
                            Nombres = luser.getNombres();
                            correo = luser.getUsuario();
                            cargo = luser.getPosition();
                            Uid = luser.getuid();

                            session.setAttribute("p1", Id);
                            session.setAttribute("p2", Cedula);
                            session.setAttribute("p3", Nombres);
                            session.setAttribute("p4", correo);
                            session.setAttribute("p5", cargo);
                            session.setAttribute("p6", Uid);

                            dispatcher = request.getRequestDispatcher("admin_dashboard.jsp");
                            dispatcher.forward(request, response);

                            break;
                        case "Empresa":

                            dispatcher = request.getRequestDispatcher("bc_dashboard.jsp");
                            dispatcher.forward(request, response);
                            break;
                        case "Rector":
                            luser = lis.listuser(user);
                            Id = luser.getid();
                            Cedula = luser.getCedula();
                            Nombres = luser.getNombres();
                            correo = luser.getUsuario();
                            cargo = luser.getPosition();
                            Uid = luser.getuid();

                            session.setAttribute("p1", Id);
                            session.setAttribute("p2", Cedula);
                            session.setAttribute("p3", Nombres);
                            session.setAttribute("p4", correo);
                            session.setAttribute("p5", cargo);
                            session.setAttribute("p6", Uid);

                            dispatcher = request.getRequestDispatcher("dashboard_educacion.jsp");
                            dispatcher.forward(request, response);
                            break;
                        case "Docente":
                            luser = lis.listuser(user);
                            Id = luser.getid();
                            Cedula = luser.getCedula();
                            Nombres = luser.getNombres();
                            correo = luser.getUsuario();
                            cargo = luser.getPosition();
                            Uid = luser.getuid();

                            session.setAttribute("p1", Id);
                            session.setAttribute("p2", Cedula);
                            session.setAttribute("p3", Nombres);
                            session.setAttribute("p4", correo);
                            session.setAttribute("p5", cargo);
                            session.setAttribute("p6", Uid);

                            dispatcher = request.getRequestDispatcher("dashboard_docente.jsp");
                            dispatcher.forward(request, response);
                            break;
                        case "Representante":
                            luser = lis.listuser(user);
                            Id = luser.getid();
                            Cedula = luser.getCedula();
                            Nombres = luser.getNombres();
                            correo = luser.getUsuario();
                            cargo = luser.getPosition();
                            Uid = luser.getuid();

                            session.setAttribute("p1", Id);
                            session.setAttribute("p2", Cedula);
                            session.setAttribute("p3", Nombres);
                            session.setAttribute("p4", correo);
                            session.setAttribute("p5", cargo);
                            session.setAttribute("p6", Uid);

                            dispatcher = request.getRequestDispatcher("dashboard_representative.jsp");
                            dispatcher.forward(request, response);
                            break;
                    }

                } else {
                    request.setAttribute("status", "danger");
                    request.setAttribute("mensaje", "Los datos ingresados son Incorrectos");
                    dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);
                    out.close();
                }

                break;
            case "lisadmin":
                List uad = lis.get_list_administradores();
                request.setAttribute("aud", uad);
                dispatcher = request.getRequestDispatcher("admin_registermodify.jsp");
                dispatcher.forward(request, response);
                break;
            case "deleteadmin":
                user.setid(request.getParameter("eid"));
                eli.delete_admin(user);
                dispatcher = request.getRequestDispatcher("admin_deleteuser.jsp");
                dispatcher.forward(request, response);
                break;
            case "modiadmin":
                user.setCedula(request.getParameter("cedula"));
                user.setNombres(request.getParameter("nombres"));
                user.setUsuario(request.getParameter("usuario"));
                user.setid(request.getParameter("mid"));
                mod.modify_admin(user);
                dispatcher = request.getRequestDispatcher("admin_registermodify.jsp");
                dispatcher.forward(request, response);
                break;
            case "logoutrector":
                session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }

                // Cerrar conexión si la tienes guardada
                Connection conn = (Connection) getServletContext().getAttribute("conexionActiva");
                try {
                    conexion.setConnection(conn);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                dispatcher = request.getRequestDispatcher("index_customer.jsp");
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
