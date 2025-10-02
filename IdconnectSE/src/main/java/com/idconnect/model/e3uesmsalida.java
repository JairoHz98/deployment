/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.model;

/**
 *
 * @author BUSINESS CONNECT
 */
public class e3uesmsalida {
    
    String id_ri, id_est, id_h, Ring, Rfe, representante;

    public e3uesmsalida() {
    }

    public e3uesmsalida(String id_ri, String id_est, String id_h, String Ring, String Rfe, String representante) {
        this.id_ri = id_ri;
        this.id_est = id_est;
        this.id_h = id_h;
        this.Ring = Ring;
        this.Rfe = Rfe;
        this.representante = representante;
    }

    public String getId_ri() {
        return id_ri;
    }

    public void setId_ri(String id_ri) {
        this.id_ri = id_ri;
    }

    public String getId_est() {
        return id_est;
    }

    public void setId_est(String id_est) {
        this.id_est = id_est;
    }

    public String getId_h() {
        return id_h;
    }

    public void setId_h(String id_h) {
        this.id_h = id_h;
    }

    public String getRing() {
        return Ring;
    }

    public void setRing(String Ring) {
        this.Ring = Ring;
    }

    public String getRfe() {
        return Rfe;
    }

    public void setRfe(String Rfe) {
        this.Rfe = Rfe;
    }

    public String getRepresentante() {
        return representante;
    }

    public void setRepresentante(String representante) {
        this.representante = representante;
    }
    
    
    
}
