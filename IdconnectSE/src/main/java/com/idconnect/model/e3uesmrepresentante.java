/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.model;

/**
 *
 * @author BUSINESS CONNECT
 */
public class e3uesmrepresentante {
    
    String id_repre, name_r, phone, email, id_estu, relacion_re, extra, id_horario, cedula, status;

    public e3uesmrepresentante() {
    }

    public e3uesmrepresentante(String id_repre, String name_r, String phone, String email, String id_estu, String relacion_re, String extra, String id_horario, String cedula) {
        this.id_repre = id_repre;
        this.name_r = name_r;
        this.phone = phone;
        this.email = email;
        this.id_estu = id_estu;
        this.relacion_re = relacion_re;
        this.extra = extra;
        this.id_horario = id_horario;
        this.cedula = cedula;
    }

    public e3uesmrepresentante(String id_repre, String name_r, String phone, String email, String id_estu, String relacion_re, String extra, String id_horario, String cedula, String status) {
        this.id_repre = id_repre;
        this.name_r = name_r;
        this.phone = phone;
        this.email = email;
        this.id_estu = id_estu;
        this.relacion_re = relacion_re;
        this.extra = extra;
        this.id_horario = id_horario;
        this.cedula = cedula;
        this.status = status;
    }
    
    

    public String getId_repre() {
        return id_repre;
    }

    public void setId_repre(String id_repre) {
        this.id_repre = id_repre;
    }

    public String getName_r() {
        return name_r;
    }

    public void setName_r(String name_r) {
        this.name_r = name_r;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId_estu() {
        return id_estu;
    }

    public void setId_estu(String id_estu) {
        this.id_estu = id_estu;
    }

    public String getRelacion_re() {
        return relacion_re;
    }

    public void setRelacion_re(String relacion_re) {
        this.relacion_re = relacion_re;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }

    public String getId_horario() {
        return id_horario;
    }

    public void setId_horario(String id_horario) {
        this.id_horario = id_horario;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    

}
