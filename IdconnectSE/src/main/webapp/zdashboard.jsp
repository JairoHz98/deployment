<%-- 
    Document   : zdashboard
    Created on : 1 oct 2025, 12:53:58 p.m.
    Author     : BUSINESS CONNECT
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Dashboard del Padre</title></head>
<body>
    <h2>Notificaciones en tiempo real</h2>
    <div id="notificaciones"></div>

    <script>
        const socket = new WebSocket("ws://localhost:8080/IdconnectSE/notificacion");

        socket.onmessage = function(event) {
            const div = document.getElementById("notificaciones");
            div.innerHTML += "<p>" + event.data + "</p>";
        };
    </script>
</body>
</html>
