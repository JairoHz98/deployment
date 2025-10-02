/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.idconnect.interfaces;

import com.idconnect.model.company;
import com.idconnect.model.e3uesmhorario;
import com.idconnect.model.usuario;

/**
 *
 * @author JairoHz
 */
public interface GI_delete {
    public boolean delete_admin(usuario us);
    public boolean delete_comp(company c);
    public boolean delete_horario(e3uesmhorario e3h);
}
