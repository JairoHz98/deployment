<%-- 
    Document   : dashboard_docente
    Created on : 25 sept 2025, 12:27:30 p. m.
    Author     : BUSINESS CONNECT
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <link rel="icon" type="image/png" href="https://i.imgur.com/qJI2Aqf.png">
        <!-- boptstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <!-- style font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

        <link href="css/doce_panelcontrol.css" rel="stylesheet" type="text/css"/>
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
            String p3n = (String) session.getAttribute("p3");
            //String p4 = (String) session.getAttribute("p4");
            //String p5 = (String) session.getAttribute("p5");
            String p6n = (String) session.getAttribute("p6");
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
                                    "><p><%= p5%></p></h5>
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

                            <a href="dashboard_docente.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-house-door-fill"></i> Inicio</li></a>
                            <a href="dashboard_docente.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-person-badge-fill"></i> Perfil</li></a>
                            <a href="doce_registrarasistencia.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-calendar-check-fill"></i> Asistencia</li></a>
                            <a href="doce_registrarasistencia.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-people-fill"></i> Estudiante</li></a>
                            <a href="dashboard_docente.jsp" class="nav-link d-flex align-items-center text-dark"><li class="nav-item"><i class="bi bi-bar-chart-fill"></i> Reportes</li></a>
                            <a href="dashboard_docente.jsp" class="nav-link d-flex align-items-center text-dark"><li style="display: none;" class="nav-item mt-3"><a class="nav-link text-danger" href="#"><i class="bi bi-box-arrow-right"></i> Cerrar sesión</a></li>
                        </ul>
                    </div>
                </div>

                <!-- Contenido principal -->
                <div id="contenidoPrincipal" class="col-md-12" >
                    <!-- navbar -->
                    <div class="container-fluid">
                        <nav class="d-flex justify-content-between align-items-center p-3 border-bottom bg-white">
                            <div class="d-flex align-items-center flex-wrap gap-3">

                                <span class="fw-semibold text-dark" style="margin-left: 1rem;" id="codigo">Código <%=p6n%> Bienvenido <%=p3n%></span>
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
                    <div class="container py-4">
                        <div class="row g-4">
                            <!-- Tarjeta módulo empleados -->
                            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                                <div class="modulo-card">
                                    <a class="text-decoration-none" href="doce_registrarasistencia.jsp">
                                        <div class="modulo-title">Clases Asignadas</div>
                                        <i class="bi bi-person-plus-fill"></i>
                                    </a>

                                </div>
                            </div>

                            <!-- Tarjeta módulo asistencia -->
                            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                                <div class="modulo-card">
                                    <a class="text-decoration-none" href="doce_registrarestudiantes.jsp">
                                        <div class="modulo-title">Asistencia Curricular</div>
                                        <i class="bi bi-calendar-check-fill"></i>
                                    </a>
                                </div>
                            </div>



                            <!-- Trahetas de Informacion -->
                            <div class="container mt-4" style="display: none;">
                                <div class="row">
                                    <!-- Tarjeta moderna: Información -->
                                    <div class="col-md-6 col-lg-3 mb-4">
                                        <div class="card text-white bg-info modern-card">
                                            <div class="card-header text-center">
                                                <div class="modern-icon"><i class="bi bi-building"></i></div>
                                                Empresas
                                            </div>
                                            <div class="card-body text-center">

                                                <p class="card-text">10</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Tarjeta moderna: Éxito -->
                                    <div class="col-md-6 col-lg-3 mb-4">




                                        <div class="card text-white bg-success modern-card">
                                            <div class="card-header text-center">
                                                <div class="modern-icon"><i class="bi bi-check-circle"></i>
                                                </div>
                                                Pagos A Tiempo
                                            </div>
                                            <div class="card-body text-center">

                                                <p class="card-text">8</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Tarjeta moderna: Advertencia -->
                                    <div class="col-md-6 col-lg-3 mb-4">
                                        <div class="card text-white bg-warning modern-card">
                                            <div class="card-header text-center">
                                                <div class="modern-icon">️<i class="bi bi-exclamation-triangle"></i></div>
                                                Pagos en Mora
                                            </div>
                                            <div class="card-body text-center">

                                                <p class="card-text">2</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Tarjeta moderna: Error -->
                                    <div class="col-md-6 col-lg-3 mb-4">
                                        <div class="card text-white bg-danger modern-card">
                                            <div class="card-header text-center">
                                                <div class="modern-icon"><i class="bi bi-x-circle"></i></div>
                                                Suscripciones Canceladas
                                            </div>
                                            <div class="card-body text-center">
                                                <p class="card-text">1</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>








                        </div>
                    </div>    


                </div>


            </div>
        </div>

        <script>
            function toggleMovimiento() {
                const contenido = document.getElementById('contenido');
                contenido.classList.toggle('mover-derecha');


            }
        </script>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

        <!-- Code propio -->
        <script src="js/doce_panelcontrol.js" type="text/javascript"></script>
        <script src="js/dashboard_docente.js" type="text/javascript"></script>


    </body>
</html>
