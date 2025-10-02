<%-- 
    Document   : dashboard_docente
    Created on : 25 sept 2025, 12:27:30 p. m.
    Author     : BUSINESS CONNECT
--%>

<%@page import="com.idconnect.model.e3uesmhorario"%>
<%@page import="com.idconnect.model.e3uesmhistory"%>
<%@page import="com.idconnect.DAO.list"%>
<%@page import="com.idconnect.model.e3uesm"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Registro de Personal</title>
        <link rel="icon" type="image/png" href="https://i.imgur.com/qJI2Aqf.png">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Fuente Poppins -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

        <!-- DataTables CSS -->
        <link href="https://cdn.datatables.net/2.3.4/css/dataTables.bootstrap5.css" rel="stylesheet">


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



        <style>
            table, th, td {
                color: #212529 !important; /* Color Bootstrap para texto oscuro */
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
                        <div class="container py-4">
                            <div class="row g-4 mt-3">

                                <div class="row justify-content-center">


                                    <div class="card shadow-sm">
                                        <div class="card-header bg-white text-center mb-4">
                                            <h4 class="text-dark"><i class="bi bi-clock-history"></i> Historial de Actividades</h4>
                                            <div class="card-body mb-4">

                                                <form action="create" method="post">
                                                    <table id="tablahistorica" class="table table-bordered table-hover table-striped align-middle">
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th>Jornada</th>
                                                                <th>Ingreso</th>
                                                                <th>Salida</th>
                                                                <th>Acciones</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                list ls = new list();
                                                                for (e3uesmhorario l : ls.get_listgeneralshedule()) {
                                                            %>
                                                            <tr>

                                                                <td><input type="checkbox" name="idj" value="<%= l.getIdj()%>"></td>
                                                                <td>
                                                                    <select class="form-control" disabled>
                                                                        <option selected><%= l.getJornada()%></option>
                                                                        <option value="m">Matutina</option>
                                                                        <option value="t">Vespertina</option>
                                                                        <option value="n">Nocturna</option>
                                                                    </select>
                                                                </td>
                                                                <td>
                                                                    <input type="time" name="entrada_<%= l.getIdj() %>" class="form-control" placeholder="" value="<%= l.getHentrada()%>">
                                                                </td>
                                                                <td>
                                                                    <input type="time" name="salida_<%= l.getIdj() %>" class="form-control" value="<%= l.getHsalida()%>">
                                                                </td>
                                                                <td>
                                                                    
                                                                    <button type="submit" name="g" value="modifyworkday" class="btn btn-sm btn-outline-primary me-1" title="Modificar">
                                                                        <i class="bi bi-pencil-square"></i>
                                                                    </button>
                                                                    <button type="submit" name="g" value="deleteschedule" class="btn btn-sm btn-outline-danger" title="Eliminar">
                                                                        <i class="bi bi-trash3"></i>
                                                                    </button>
                                                                    <button type="submit" class="btn btn-sm btn-outline-info" name="g" value="infohorario" title="Ver información">
                                                                        <i class="bi bi-info-circle"></i>
                                                                    </button>

                                                                </td>

                                                            </tr>
                                                            <% }%>
                                                        </tbody>
                                                    </table>
                                                </form>
                                                        
                                                        
                                                        
                                                        
                                                        
                                                <!-- Tabla con Bootstrap + DataTables -->








                                                </script>
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

        <script src="js/edu_register.js" type="text/javascript"></script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>


        <!-- Code propio -->
        <script src="js/doce_panelcontrol.js" type="text/javascript"></script>
        <script src="js/dashboard_docente.js" type="text/javascript"></script>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

        <!-- Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>

        <!-- DataTables core -->
        <script src="https://cdn.datatables.net/2.3.4/js/dataTables.js"></script>

        <!-- DataTables Bootstrap 5 integration -->
        <script src="https://cdn.datatables.net/2.3.4/js/dataTables.bootstrap5.js"></script>

        <!-- DataTables RowGroup plugin -->
        <script src="https://cdn.datatables.net/rowgroup/1.1.4/js/dataTables.rowGroup.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#tablahistorica').DataTable({
                    language: {
                        lengthMenu: "Mostrar _MENU_ registros por página",
                        zeroRecords: "No se encontraron resultados",
                        info: "Mostrando _START_ a _END_ de _TOTAL_ registros",
                        infoEmpty: "Sin registros disponibles",
                        infoFiltered: "(filtrado de _MAX_ registros totales)",
                        search: "Buscar:",
                        paginate: {
                            first: "Primero",
                            last: "Último",
                            next: "Siguiente",
                            previous: "Anterior"
                        }
                    }
                });
            });


        </script>

    </body>
</html>
