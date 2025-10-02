<%-- 
    Document   : registro
    Created on : 1 oct 2025, 12:53:00 p.m.
    Author     : BUSINESS CONNECT
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Registro de Ingreso</title></head>
<body>
    <h2>Registrar ingreso</h2>
    <form action="IngresoServlet" method="post">
        <input type="text" name="nombre" placeholder="Nombre del estudiante" required />
        <input type="submit" value="Registrar" />
    </form>
</body>
</html>

