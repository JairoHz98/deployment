<%-- 
    Document   : dashboard_docente
    Created on : 25 sept 2025, 12:27:30 p. m.
    Author     : BUSINESS CONNECT
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.idconnect.model.e3uesmhorario"%>
<%@page import="com.idconnect.DAO.list"%>
<%@page import="com.idconnect.model.e3uesm"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Horario Institucional</title>
        <link rel="icon" type="image/png" href="https://i.imgur.com/qJI2Aqf.png">
        <!-- boptstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <!-- style font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

        <link href="css/doce_panelcontrol.css" rel="stylesheet" type="text/css"/>
<style>
  .input-wrapper {
    position: relative;
    display: inline-block;
    margin-bottom: 10px;
  }

  .input-wrapper input {
    pointer-events: none; /* evita que el input bloquee el clic */
  }

  .input-overlay {
    position: absolute;
    top: 0; left: 0;
    width: 100%; height: 100%;
    cursor: pointer;
    z-index: 1;
  }
</style>
        <style>
            .ancho-80 {
                width: 81%;
            }
        </style>
        <style>
            .modulo-card {

                border-radius: 12px;
                background-color: #ffffff;
                text-align: center;
                padding: 1.5rem;
                transition: transform 0.2s ease, box-shadow 0.2s ease;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
            }

            .modulo-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 4px 10px rgba(0,0,0,0.1);
                cursor: pointer;
            }

            .modulo-card i {
                font-size: 2rem;
                color: #0d6efd;
                margin-bottom: 0.5rem;
            }

            .modulo-title {
                font-weight: bold;
                font-size: 1.1rem;
                color: #0d6efd;
            }





            /* Tarjeta de presentar Informacion */


            .modern-card {
                border: none;
                border-radius: 16px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .modern-card:hover {
                transform: translateY(-6px);
                box-shadow: 0 12px 24px rgba(0, 0, 0, 0.12);
            }

            .modern-card .card-header {
                font-size: 1.2rem;
                font-weight: 600;
                border-bottom: none;
                background: transparent;
            }

            .modern-card .card-body {
                font-size: 0.95rem;
                opacity: 0.95;
            }

            .modern-icon {
                font-size: 2rem;
                margin-bottom: 8px;
            }

            .card-title {
                font-weight: 700;
                font-size: 1.1rem;
            }



        </style>




<%
List<e3uesmhorario> listaHorario = (List<e3uesmhorario>) session.getAttribute("horarios");
%>


    </head>
    <body>

        <!-- Botón para mostrar/ocultar menú -->
        <button id="toggleMenuBtn" onclick="toggleMovimiento()" class="btn btn-light">
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
                                    "><p><%= ((e3uesm) session.getAttribute("e3uesm")).getRole()%></p></h5>

                                <%
                                    LocalDateTime ahora = LocalDateTime.now();
                                    DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd MMMM yyyy, HH:mm");
                                    String fechaHora = ahora.format(formato);
                                %>

                                <p><strong><%= fechaHora%></strong></p>
                                <form action="administrator" method="post">

                                    <div class="d-flex justify-content-between mt-3  align-items-center">
                                        <button class="btn btn-outline-danger btn-sm text-center w-100" name="a" value="logoutrector">Cerrar Sesión</button>

                                    </div>
                                </form>
                            </div>
                        </div>

                        <ul class="nav flex-column">

                            <a href="dashboard_educacion.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-house-door-fill"></i> Inicio</li></a>
                            <a href="#" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-person-badge-fill"></i> Perfil</li></a>
                            <a href="edu_register.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-person-plus-fill"></i> Registro de Personal</li></a>
                            <a href="edu_time.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-calendar-check-fill"></i> Horario intitucional</li></a>
                            <a href="edu_timelist.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-calendar-check-fill"></i> Listado de Horarios</li></a>
                            <a href="edu_timeteacher.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-person-workspace"></i> Docencia</li></a>
                            <a href="edu_family.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-people-fill"></i> Familia y Responsables</li></a>
                            <a href="edu_reports.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-bar-chart-line-fill"></i> Reportes</li></a>
                           </ul>
                    </div>
                </div>

                <!-- Contenido principal -->
                <div id="contenidoPrincipal" class="col-md-12" >
                    <!-- navbar -->
                    <div class="container-fluid">
                        <nav class="d-flex justify-content-between align-items-center p-3 border-bottom bg-white">
                            <div class="d-flex align-items-center flex-wrap gap-3">

                                <span class="fw-semibold text-dark" style="margin-left: 1rem;" id="codigo">Código <%= ((e3uesm) session.getAttribute("e3uesm")).getUid()%> Bienvenido <%= ((e3uesm) session.getAttribute("e3uesm")).getName()%></span>
                                <span class="badge bg-success">Activo</span>
                                <span class="badge bg-warning text-dark">Sistema BETA</span>
                            </div>

                            <!-- Sección derecha -->
                            <div>
                                <button class="btn btn-outline-primary btn-sm" onclick="toggleFullscreen()"><i class="bi bi-aspect-ratio"></i></button>
                            </div>
                            <script>
                                function toggleFullscreen() {
                                    if (!document.fullscreenElement) {
                                        document.documentElement.requestFullscreen();
                                    } else {
                                        document.exitFullscreen();
                                    }
                                }
                            </script>

                        </nav>
                    </div>    

                    <!-- contendio de la pagina -->
                    <div class="container-fluid">
                        <div class="container py-4">
                            <div class="row g-4 mt-3">

                                <div class="row justify-content-center">
                                   

                                    <form method="post" action="create">
                                        <div class="card shadow-sm mt-4 py-4">
                                            
                                             <%
                                                
                                                for (e3uesmhorario l : listaHorario) {
                                            %> 
                                            <div class="card-header bg-white text-white text-center">
                                                <h4 class="text-dark"><i class="bi bi-calendar-check-fill"></i> Horario <%=l.getJornada()%> </h4>
                                            </div>

                                           



                                            <div class="container-fluid">
                                                <div class="day-card">
                                                    <input name="idj" value="<%=l.getIdj()%>" style="display: none;"/>

                                                    <div id="<%=l.getLu()%>" class="mb-3 mt-3 form-label text-center">
                                                        <h5><%=l.getLu()%></h5>
                                                    </div>
                                                    <div class="row g-3" id="campo1">
                                                        <div class="col-md-6">
                                                            <label for="lunes-inicio" class="form-label time-label">Ingreso</label>
                                                            <input  type="time" class="form-control"  name="hsalida" id="lunes-inicio" value="<%=l.getHentrada()%>" disabled>

                                                        </div>
                                                            
                                                        <div class="col-md-6">
                                                            <label for="lunes-inicio" class="form-label time-label">Salida</label>
                                                            <input type="time" class="form-control"  name="hsalida" id="lunes-inicio" value="<%=l.getHsalida()%>" disabled>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div>
                                                    <div id="<%=l.getMa()%>" class="mb-3 mt-3 form-label text-center">
                                                        <h5><%=l.getMa()%></h5>
                                                    </div>
                                                    
                                                    <div  class="day-title"></div>
                                                    <div class="row g-3" id="campo2">
                                                        <div class="col-md-6">
                                                            <label for="lunes-inicio" class="form-label time-label">Entrada</label>
                                                            <input type="time" class="form-control" name="hentrada" id="lunes-inicio" value="<%=l.getHentrada()%>" disabled>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="lunes-inicio" class="form-label time-label">Salida</label>
                                                            <input type="time" class="form-control" name="hsalida" id="lunes-inicio" value="<%=l.getHsalida()%>" disabled>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div>

                                                  <div id="<%=l.getMi()%>" class="mb-3 mt-3 form-label text-center">
                                                        <h5><%=l.getMi()%></h5>
                                                    </div>
                                                    <div class="row g-3" id="campo3">
                                                        <div class="col-md-6">
                                                            <label for="lunes-inicio" class="form-label time-label">Entrada</label>
                                                            <input type="time" class="form-control" name="hentrada" id="lunes-inicio" value="<%=l.getHentrada()%>" disabled>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="lunes-inicio" class="form-label time-label">Salida</label>
                                                            <input type="time" class="form-control"  name="hsalida" id="lunes-inicio" value="<%=l.getHsalida()%>" disabled>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div>

                                                    <div id="<%=l.getJu()%>" class="mb-3 mt-3 form-label text-center">
                                                        <h5><%=l.getJu()%></h5>
                                                    </div>
                                                    <div class="row g-3" id="campo4">
                                                        <div class="col-md-6">
                                                            <label for="lunes-inicio" class="form-label time-label">Entrada</label>
                                                            <input type="time" class="form-control" name="hentrada" id="lunes-inicio" value="<%=l.getHentrada()%>" disabled>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="lunes-inicio" class="form-label time-label">Salida</label>
                                                            <input type="time" class="form-control"  name="hsalida" id="lunes-inicio" value="<%=l.getHsalida()%>" disabled>

                                                        </div>

                                                    </div>
                                                    <div id="<%=l.getVi()%>" class="mb-3 mt-3 form-label text-center">
                                                        <h5><%=l.getVi()%></h5>
                                                    </div>
                                                    <div class="row g-3" id="campo5">
                                                        <div class="col-md-6">
                                                            <label for="lunes-inicio" class="form-label time-label">Entrada</label>
                                                            <input type="time" class="form-control" name="hentrada" id="lunes-inicio" value="<%=l.getHentrada()%>" disabled>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="lunes-inicio" class="form-label time-label">Salida</label>
                                                            <input type="time" class="form-control"  name="hsalida" id="lunes-inicio" value="<%=l.getHsalida()%>" disabled>

                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                            <%}%>

 



                                        </div>
                                            <%                                                 String status = (String) request.getAttribute("status");
                                        String mensaje = (String) request.getAttribute("mensaje");
                                        if (status != null && mensaje != null) {
                                    %>
                                    <div id="alert" class="alert alert-<%= status%> mt-2 show text-center" role="alert">
                                        <%= mensaje%>
                                    </div>
                                    <script>
                                        // ⏳ Ocultar el mensaje después de 30 segundos
                                        setTimeout(function () {
                                            const alerta = document.getElementById("alert");
                                            if (alerta) {
                                                alerta.classList.remove("show"); // Oculta con animación Bootstrap
                                                alerta.classList.add("fade");    // Asegura transición suave
                                                alerta.remove();                 // Elimina del DOM
                                            }
                                        }, 2000); // 30,000 milisegundos = 30 segundos
                                    </script>
                                    <%
                                        }
                                    %>
                                        <div class="card shadow-sm mt-4 py-3 ">
                                            <div class="d-grid gap-2 col-6 mx-auto" >
                                                <button class="btn btn-success" type="button" name="g" value="modifyworkday">listado Horarios</button>
                                             
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
                                        
                                        
                                        <script>
  function activarInput(id) {
    const input = document.getElementById(id);
    if (input) {
      input.disabled = false;
      input.style.pointerEvents = "auto"; // reactiva el input
      setTimeout(() => input.focus(), 0);
    }
  }
</script>

        <script>
            function toggleMovimiento() {
                const contenido = document.getElementById('contenido');
                contenido.classList.toggle('mover-derecha');


            }
        </script>
        <script>
            window.addEventListener("DOMContentLoaded", function () {
                const lunesDiv = document.getElementById("Lunes");
                const campo1 = document.getElementById("campo1");

                if (!lunesDiv || lunesDiv.textContent.trim() === "") {
                    campo1.style.display = "none";
                }
                const martesDiv = document.getElementById("Martes");
                const campo2 = document.getElementById("campo2");

                if (!martesDiv || martesDiv.textContent.trim() === "") {
                    campo2.style.display = "none";
                }
                const miercolesDiv = document.getElementById("Miércoles");
                const campo3 = document.getElementById("campo3");

                if (!miercolesDiv || miercolesDiv.textContent.trim() === "") {
                    campo3.style.display = "none";
                }
                const juevesDiv = document.getElementById("Jueves");
                const campo4 = document.getElementById("campo4");

                if (!juevesDiv || juevesDiv.textContent.trim() === "") {
                    campo4.style.display = "none";
                }
                const viernesDiv = document.getElementById("Viernes");
                const campo5 = document.getElementById("campo5");

                if (!viernesDiv || viernesDiv.textContent.trim() === "") {
                    campo5.style.display = "none";
                }
            });

        </script>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

        <!-- Code propio -->
        <script src="js/doce_panelcontrol.js" type="text/javascript"></script>
        <script src="js/dashboard_docente.js" type="text/javascript"></script>


    </body>
</html>
