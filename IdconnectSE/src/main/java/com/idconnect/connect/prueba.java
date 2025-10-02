/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.connect;

import com.idconnect.connect.Encript;

import com.idconnect.DAO.insert;
import com.idconnect.DAO.list;
import com.idconnect.DAO.modify;
import com.idconnect.model.e3uesm;
import com.idconnect.model.e3uesmaula;
import com.idconnect.model.e3uesmclases;
import com.idconnect.model.e3uesmhorario;
import com.idconnect.model.e3uesmingreso;
import com.idconnect.model.e3uesmrepresentante;
import com.idconnect.model.e3uesmsalida;
import com.idconnect.model.indexrepresent;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author JairoHz
 */
public class prueba {

    /*   public static void main(String[] args) {
      try {
          Connection conn = conexion.getConnection();
            conexion.setConnection(conn);
            
            if (conn != null && !conn.isClosed()) {
                System.out.println("✅ Conexión exitosa a la base de datos");
                conn.close(); // buena práctica: cerrar la conexión al final
            } else {
                System.out.println("⚠️ No se pudo establecer la conexión");
            }
        } catch (Exception e) {
            System.err.println("💥 Error al conectar: " + e.getMessage());
        }
}*/

 /*   public static void main(String[] args) {
        // Crear instancia del DAO o clase de modificación
        e3uesmhorario ls = new e3uesmhorario();
    modify i =new modify();
        

        // Crear y poblar el objeto company
      ls.setIdj("115");
      ls.setHentrada("21:06");
      ls.setHsalida("22:06");
        
        
        // Ejecutar el método de registro
        boolean registrado = i.modify_uniqueSchedule(ls);

        // Mostrar resultado
        if (registrado) {
            System.out.println("✅ Empresa registrada correctamente.");
        } else {
            System.out.println("❌ Error al registrar la empresa.");
        }
    } */
 /*   public static void main(String[] args) {
 e3uesmingreso e3h = new e3uesmingreso();
 insert l = new insert();
 e3h.setId_est("5");
e3h.setId_h("1");       // Lunes seleccionado000000
e3h.setRing("11:28");       // Martes seleccionado
e3h.setRfe("28/09/2025");
e3h.setRepresentante("marlon");

boolean coorrecto;
 coorrecto = l.insert_register_start(e3h);
        if (coorrecto) {
            System.out.println("✅registrada correctamente.");
        }else {
            System.out.println("❌ Error al registrar.");
        }


    } */
    public static void main(String[] args) {
        // Crear instancia del DAO o clase de modificación
        e3uesmingreso ls = new e3uesmingreso();
        list i = new list();
        ls.setId_est("5");
        List<e3uesmingreso> p = new ArrayList<>();
        p = i.listinregresos(ls);

        for (e3uesmingreso horario : p) {
            System.out.println(horario.getId_est());
            System.out.println(horario.getId_h());
            System.out.println(horario.getId_ri());
            System.out.println(horario.getRepresentante());
            System.out.println(horario.getRfe());
            System.out.println(horario.getRing());

        }

    }
}
