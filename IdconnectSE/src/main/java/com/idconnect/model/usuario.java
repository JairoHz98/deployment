/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.model;

/**
 *
 * @author JairoHz
 */
public class usuario {
    private String Usuario, Contra, Position, nombres, Cedula, id, uid;

    public usuario(String Cedula, String Usuario, String Contra, String Position, String nombres, String id, String uid) {
        this.Cedula = Cedula;
        this.Usuario = Usuario;
        this.Contra = Contra;
        this.Position = Position;
        this.nombres = nombres;
        this.id = id;
        this.uid = uid;
        
      
    }

    
    
    
    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getPosition() {
        return Position;
    }

    public void setPosition(String Position) {
        this.Position = Position;
    }

    public usuario() {
    }

    public String getCedula() {
        return Cedula;
    }

    public void setCedula(String Cedula) {
        this.Cedula = Cedula;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getContra() {
        return Contra;
    }

    public void setContra(String Contra) {
        this.Contra = Contra;
    }
    
    public void setid(String id) {
        this.id = id;
    }

    public void setuid(String uid) {
        this.uid = uid;
    }
    
    public String getid() {
        return id;
    }

    public String getuid() {
        return uid;
    }
}
