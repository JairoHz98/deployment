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
public interface GI_modify {
     public boolean modify_admin(usuario us);
    public boolean modify_company(company c);
    public boolean modify_uniqueSchedule(e3uesmhorario eh3);
}
