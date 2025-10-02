/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.idconnect.interfaces;

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

/**
 *
 * @author JairoHz
 */
public interface GI_insert {
     public boolean insertar_admin(usuario u);
    public boolean guardarUsuario(usuario user);
    public boolean Insert_company(company c);
    public boolean insert_personal(e3uesm e3);
    public boolean insert_historye(e3uesmhistory eh);
    public boolean insert_jornadaIns(e3uesmhorario e3h);
    public boolean insert_aulas(e3uesmaula e3a);
    public boolean insert_clases(e3uesmclases e3c);
    public boolean insertar_representante(e3uesmrepresentante e3c);
    public boolean insert_register_start(e3uesmingreso e3ing);
    public boolean insert_register_end(e3uesmsalida e3sal);
}
