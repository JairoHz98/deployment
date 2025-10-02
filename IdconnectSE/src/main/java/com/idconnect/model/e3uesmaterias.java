/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.model;

/**
 *
 * @author BUSINESS CONNECT
 */
public class e3uesmaterias {
    
    String id_materia, nombre, codigo, nivel, creditos, estado;

    public e3uesmaterias() {
    }

    public e3uesmaterias(String id_materia, String nombre, String codigo, String nivel, String creditos, String estado) {
        this.id_materia = id_materia;
        this.nombre = nombre;
        this.codigo = codigo;
        this.nivel = nivel;
        this.creditos = creditos;
        this.estado = estado;
    }

    public String getId_materia() {
        return id_materia;
    }

    public void setId_materia(String id_materia) {
        this.id_materia = id_materia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public String getCreditos() {
        return creditos;
    }

    public void setCreditos(String creditos) {
        this.creditos = creditos;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
    
}
