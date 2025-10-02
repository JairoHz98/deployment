/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.idconnect.model;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 *
 * @author BUSINESS CONNECT
 */
@ServerEndpoint("/notificacion")
public class NotificacionSocket {
    private static final Set<Session> sesiones = new CopyOnWriteArraySet<>();

    @OnOpen
    public void onOpen(Session session) {
        sesiones.add(session);
    }

    @OnClose
    public void onClose(Session session) {
        sesiones.remove(session);
    }

    public static void broadcast(String mensaje) {
        for (Session s : sesiones) {
            s.getAsyncRemote().sendText(mensaje);
        }
    }
}

