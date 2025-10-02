/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.model;

/**
 *
 * @author JairoHz
 */
public class e3uesm {
    
    String id, name, card, role, uid, recognitions, pass, date, email, id_horario;

    public e3uesm() {
    }

    public e3uesm(String id, String name, String card, String role, String uid, String recognitions, String pass, String date, String email) {
        this.id = id;
        this.name = name;
        this.card = card;
        this.role = role;
        this.uid = uid;
        this.recognitions = recognitions;
        this.pass = pass;
        this.date = date;
        this.email = email;
    }

    public e3uesm(String id, String name, String card, String role, String uid, String recognitions, String pass, String date, String email, String id_horario) {
        this.id = id;
        this.name = name;
        this.card = card;
        this.role = role;
        this.uid = uid;
        this.recognitions = recognitions;
        this.pass = pass;
        this.date = date;
        this.email = email;
        this.id_horario = id_horario;
    }
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getRecognitions() {
        return recognitions;
    }

    public void setRecognitions(String recognitions) {
        this.recognitions = recognitions;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId_horario() {
        return id_horario;
    }

    public void setId_horario(String id_horario) {
        this.id_horario = id_horario;
    }
    
    
    
    
    
    
    
    
}
