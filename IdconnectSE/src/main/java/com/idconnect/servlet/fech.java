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
import com.idconnect.model.NotificacionSocket;
import com.idconnect.model.e3uesm;
import com.idconnect.model.e3uesmaula;
import com.idconnect.model.e3uesmclases;
import com.idconnect.model.e3uesmhistory;
import com.idconnect.model.e3uesmhorario;
import com.idconnect.model.e3uesmingreso;
import com.idconnect.model.e3uesmrepresentante;
import com.idconnect.model.e3uesmsalida;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
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
public class fech extends HttpServlet {

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
            out.println("<title>Servlet fech</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet fech at " + request.getContextPath() + "</h1>");
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
        e3uesmsalida e3sal = new e3uesmsalida();

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

        /* code use cases offline any rechange page */
        BufferedReader reader = request.getReader();
        StringBuilder jsonBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuilder.append(line);
        }

        JSONObject respuesta = new JSONObject();
        /*con json ingresa al switch*/
        JSONObject json = new JSONObject(jsonBuilder.toString());
        String ac;
        ac = json.getString("g"); // ← aquí sí funciona con JSON

        switch (ac) {
            case "rfid":
                /*esta recibiendo los datos de json fech*/
                String rfid = json.getString("rfid");
                String hora = json.getString("th");
                String fecha = json.getString("tf");

                /*Porcesando datos de la lista */
                e3.setRecognitions(rfid);
                
                if (l.listpersonalcode(e3) != null && l.listpersonalcode(e3).getId() != null) {
                e3repre.setId_estu(l.listpersonalcode(e3).getId());
                l.listactrepre(e3repre);

                /*registrar en la base de datos  */
                e3ing.setId_est(l.listpersonalcode(e3).getId());
                e3ing.setId_h(l.listactrepre(e3repre).getId_horario());
                e3ing.setRing(hora);
                e3ing.setRfe(fecha);
                e3ing.setRepresentante(l.listactrepre(e3repre).getName_r());
                ag.insert_register_start(e3ing);


                /*Enviando la respuesta en json*/
                if (l.listpersonalcode(e3) != null && l.listactrepre(e3repre) != null) {
                    respuesta.put("estado", "ok");
                    respuesta.put("id", l.listpersonalcode(e3).getId());
                    respuesta.put("name", l.listpersonalcode(e3).getName());
                    respuesta.put("horario", l.listpersonalcode(e3).getId_horario());
                    respuesta.put("renom", l.listactrepre(e3repre).getName_r());
                    respuesta.put("emailr", l.listactrepre(e3repre).getEmail());
                } else {
                    respuesta.put("estado", "no_encontrado");
                    respuesta.put("mensaje", "No se encontró el código RFID");
                }
                }else{
                    
                }

                
                NotificacionSocket.broadcast("El representante: " + l.listactrepre(e3repre).getName_r() + " llego con " + l.listpersonalcode(e3).getName() +" a la Unidad Educativa Particular Bconnect a las "+ hora + " del " +fecha);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(respuesta.toString());

                break;
                 case "rfidsal":
                /*esta recibiendo los datos de json fech*/
                rfid = json.getString("rfid");
                hora = json.getString("th");
                fecha = json.getString("tf");

                /*Porcesando datos de la lista */
                e3.setRecognitions(rfid);
                
                if (l.listpersonalcode(e3) != null && l.listpersonalcode(e3).getId() != null) {
                e3repre.setId_estu(l.listpersonalcode(e3).getId());
                l.listactrepre(e3repre);

                /*registrar en la base de datos  */
                e3sal.setId_est(l.listpersonalcode(e3).getId());
                e3sal.setId_h(l.listactrepre(e3repre).getId_horario());
                e3sal.setRing(hora);
                e3sal.setRfe(fecha);
                e3sal.setRepresentante(l.listactrepre(e3repre).getName_r());
                ag.insert_register_end(e3sal);


                /*Enviando la respuesta en json*/
                if (l.listpersonalcode(e3) != null && l.listactrepre(e3repre) != null) {
                    respuesta.put("estado", "ok");
                    respuesta.put("id", l.listpersonalcode(e3).getId());
                    respuesta.put("name", l.listpersonalcode(e3).getName());
                    respuesta.put("horario", l.listpersonalcode(e3).getId_horario());
                    respuesta.put("renom", l.listactrepre(e3repre).getName_r());
                    respuesta.put("emailr", l.listactrepre(e3repre).getEmail());
                } else {
                    respuesta.put("estado", "no_encontrado");
                    respuesta.put("mensaje", "No se encontró el código RFID");
                }
                }else{
                    
                }

                
                 NotificacionSocket.broadcast("El representante: " + l.listactrepre(e3repre).getName_r() + " salio con " + l.listpersonalcode(e3).getName() +" de la Unidad Educativa Particular Bconnect a las "+ hora + " del " +fecha);
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(respuesta.toString());

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
