/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.idconnect.interfaces;

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
import java.util.List;

/**
 *
 * @author JairoHz
 */
public interface GI_list {
     public usuario listuser(usuario u);
    public int ultimoid();
    public int ultimoidc();
    public List<e3uesmhorario> get_list_ultimohorario();
    public List<usuario> get_list_administradores();
    public List<company> get_list_companies();
    public e3uesm list_personal(e3uesm e3);
    public List<e3uesmhistory> get_list_history();
    public int ultimoidpersonal();
    public e3uesmhorario listhorario(e3uesmhorario ehor);
    public List<e3uesmhorario> get_listgeneralshedule();
    public List<e3uesm> get_listtecacher();
    public List<e3uesm> get_liststudent();
    public List<e3uesmaula> get_listaulas();
    public List<e3uesmaterias> get_listmaterias();
    public e3uesm listpersonalcode(e3uesm e3);
    public e3uesmrepresentante listactrepre(e3uesmrepresentante e3rep);
    public indexrepresent listinfotado(indexrepresent inrepre);
    public List<e3uesmingreso> listinregresos(e3uesmingreso e3in);
    
}
