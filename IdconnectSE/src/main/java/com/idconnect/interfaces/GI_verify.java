/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.idconnect.interfaces;

import com.idconnect.model.e3uesm;
import com.idconnect.model.usuario;

/**
 *
 * @author JairoHz
 */
public interface GI_verify {
     public boolean credentials(usuario u);
     public boolean credential_personal (e3uesm e3);
}
