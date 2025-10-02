<%-- 
    Document   : panel prueba
    Created on : 2025. 9. 24., 오후 8:37:50
    Author     : JairoHz
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Dashboard Institucional</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link href="css/doce_panelcontrol.css" rel="stylesheet" type="text/css"/>
  
 <%
String p1 = (String) session.getAttribute("p1");
String p2 = (String) session.getAttribute("p2");
String p3 = (String) session.getAttribute("p3");
String p4 = (String) session.getAttribute("p4");
String p5 = (String) session.getAttribute("p5");
String p6 = (String) session.getAttribute("p6");
%>
            <%
    //String p1 = (String) session.getAttribute("p1");
    //String p2 = (String) session.getAttribute("p2");
  //  String p3n = (String) session.getAttribute("p3");
    //String p4 = (String) session.getAttribute("p4");
    //String p5 = (String) session.getAttribute("p5");
   // String p6n = (String) session.getAttribute("p6");
    %>
</head>
<body>

  <!-- Botón para mostrar/ocultar menú -->
  <button id="toggleMenuBtn" onclick="toggleMovimiento(); expandirBoton();" class="btn btn-light">
    <i class="bi bi-list"></i>
  </button>

  <!-- Contenedor principal -->
  <div class="container-fluid">
    <div class="row">
      <!-- Barra lateral -->
      <div id="menuIzquierdo" class=" collapse" style="max-width: 250px;">
        <div class="bg-light border-end vh-100 p-3">
          <h5 class="text-primary">Panel de Opciones</h5>
          <div class="card shadow-sm border-0" style="max-width: 220px;">
                    <div class="card-body text-center">
                        <div class="d-flex justify-content-center">
                            <div class="rounded-circle overflow-hidden" style="width: 80px; height: 80px;">
                                <img src="https://i.imgur.com/qJI2Aqf.png" alt="Logo" class="img-fluid w-100 h-100" style="object-fit: cover;">
                            </div>
                        </div>

                        <h5 class="card-title fw-bold" style="font-family: 'Poppins', sans-serif;
                            "><p><%= p5%></p></h5>
                        <%
                            LocalDateTime ahora = LocalDateTime.now();
                            DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd MMMM yyyy, HH:mm");
                            String fechaHora = ahora.format(formato);
                        %>

                        <p><strong><%= fechaHora%></strong></p>
                        <div class="d-flex justify-content-between mt-3  align-items-center">
                            <button class="btn btn-outline-danger btn-sm text-center w-100">Cerrar Sesión</button>
                        </div>
                    </div>
                </div>
          <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-house-door-fill"></i> Inicio</a></li>
            <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-person-badge-fill"></i> Perfil</a></li>
            <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-calendar-check-fill"></i> Asistencia</a></li>
            <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-people-fill"></i> Estudiantes</a></li>
            <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-bar-chart-fill"></i> Reportes</a></li>
            <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-gear-fill"></i> Configuración</a></li>
            <li style="display: none;" class="nav-item mt-3"><a class="nav-link text-danger" href="#"><i class="bi bi-box-arrow-right"></i> Cerrar sesión</a></li>
          </ul>
        </div>
      </div>

      <!-- Contenido principal -->
      
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Code propio -->
  <script src="js/doce_panelcontrol.js" type="text/javascript"></script>

</body>
</html>
