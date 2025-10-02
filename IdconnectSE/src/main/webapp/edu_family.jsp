<%-- 
    Document   : dashboard_docente
    Created on : 25 sept 2025, 12:27:30 p. m.
    Author     : BUSINESS CONNECT
--%>

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
        <title>Familia y Responsables</title>
        <link rel="icon" type="image/png" href="https://i.imgur.com/qJI2Aqf.png">
        <!-- boptstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <!-- style font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

        <link href="css/doce_panelcontrol.css" rel="stylesheet" type="text/css"/>


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
        <style>
            .ancho-80 {
                width: 81%;
            }
        </style>


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
                                    <div class="">
                                        <div class="card shadow-sm">
                                            <div class="card-header bg-white text-white text-center">
                                                <h4 class="text-dark"><i class="bi bi-calendar-check-fill"></i> Registrar Famiias y Responsaables</h4>
                                            </div>
                                            <%                                                 String status = (String) request.getAttribute("status");
                                                String mensaje = (String) request.getAttribute("mensaje");
                                                if (status != null && mensaje != null) {
                                            %>
                                            <div id="alert" class="alert alert-<%= status%> mt-2 show" role="alert">
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
                                            <div class="card-body">
                                                <form  method="post" action="create"class="row g-3 mt-2">
                                                    <!-- Nombre de la familia -->
                                                    <div class="mb-3">
                                                        <label for="nombreFamilia" class="form-label">Cedula de Identidad:</label>
                                                        <input type="text" name="ced" id="ced" class="form-control" placeholder="Ej. Familia Torres">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="nombreFamilia" class="form-label">Nombre del presentante:</label>
                                                        <input type="text" name="nombreFamilia" id="nombreFamilia" class="form-control" placeholder="Ej. Familia Torres">
                                                    </div>
                                                     <div class="mb-3">
                                                                    <label class="form-label">Teléfono de contacto:</label>
                                                                    <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Ej. 0991234567">
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label class="form-label">Correo electrónico:</label>
                                                                    <input type="email" class="form-control" id="correo" name="correo" placeholder="Ej. maria@example.com">
                                                                </div>



                                                    <div class="col-12">

                                                        <div class="card card-responsable shadow-sm">
                                                            <div class="card-body">
                                                                <h5 class="card-title"></h5>
                                                                <div class="mb-3">
                                                                    <label for="estudiante" class="form-label">Seleccione el Estudiante</label>
                                                                    <select id="estudiante" name="estudiante" class="form-select">
                                                                        <option value="">-- Selecciona --</option>
                                                                        <%
                                                                            list li = new list();
                                                                            for (e3uesm l : li.get_liststudent()) {
                                                                        %>     
                                                                        <option value="<%=l.getId()%>"><%=l.getName()%></option>

                                                                        <%}%>
                                                                    </select>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label class="form-label">Relación con el estudiante:</label>
                                                                    <select class="form-select" id="relacion" name="relacion">
                                                                        <option value="">-- Selecciona --</option>
                                                                        <option value="Padre">Padre</option>
                                                                        <option value="Madre">Madre</option>
                                                                        <option value="Hermanos">Hermanos</option>

                                                                    </select>
                                                                </div>
                                                                    <div class="mb-3">
                                                                    <label for="estudiante" class="form-label">Seleccione la Jornada</label>
                                                                    <select id="Jornada" name="Jornada" class="form-select">
                                                                        <option value="">-- Selecciona --</option>
                                                                        <%
                                                                            li = new list();
                                                                            for (e3uesmhorario l : li.get_listgeneralshedule()) {
                                                                        %>     
                                                                        <option value="<%=l.getIdj()%>"><%=l.getJornada()%></option>

                                                                        <%}%>
                                                                    </select>
                                                                </div>
                                                               
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <!-- Botones -->
                                                    <div class="mt-4 text-center">
                                                        <button style="display: none;" class="btn btn-success" onclick="generarResponsables()">Generar responsables</button>
                                                        <button class="btn btn-primary ms-2" name="g" value="representante_regis">Guardar familia</button>
                                                        <div id="mensajeValidacion" class="mt-3 fw-bold"></div>
                                                    </div>
                                                </form>
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

        <!-- JavaScript -->
        <script>
            function generarResponsables() {
                const num = parseInt(document.getElementById("numResponsables").value);
                const container = document.getElementById("responsablesContainer");
                container.innerHTML = "";

                if (isNaN(num) || num < 1 || num > 5) {
                    container.innerHTML = "<p class='text-danger'>Ingresa un número válido entre 1 y 5.</p>";
                    return;
                }

                for (let i = 1; i <= num; i++) {
                    container.innerHTML += `
           
              `;
                }
            }

            function validarFormulario() {
                const familia = document.getElementById("nombreFamilia").value.trim();
                const num = parseInt(document.getElementById("numResponsables").value);
                let mensaje = "";

                if (!familia) {
                    mensaje = "Ingresa el nombre de la familia.";
                } else if (isNaN(num) || num < 1 || num > 5) {
                    mensaje = "Ingresa un número válido de responsables.";
                } else {
                    for (let i = 1; i <= num; i++) {
                        const nombre = document.getElementById(`nombre-${i}`).value.trim();
                        const relacion = document.getElementById(`relacion-${i}`).value;
                        const telefono = document.getElementById(`telefono-${i}`).value.trim();
                        const correo = document.getElementById(`correo-${i}`).value.trim();

                        if (!nombre || !relacion || !telefono || !correo) {
                            mensaje = `Completa todos los campos del responsable ${i}.`;
                            break;
                        }
                    }
                }

                const mensajeDiv = document.getElementById("mensajeValidacion");
                mensajeDiv.textContent = mensaje || "✅ Familia registrada correctamente.";
                mensajeDiv.className = mensaje ? "text-danger fw-bold" : "text-success fw-bold";
            }
        </script>


        <script src="js/edu_time.js" type="text/javascript"></script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

        <!-- Code propio -->
        <script src="js/doce_panelcontrol.js" type="text/javascript"></script>
        <script src="js/dashboard_docente.js" type="text/javascript"></script>
        <script src="js/edu_timeteacher.js" type="text/javascript"></script>

    </body>
</html>
