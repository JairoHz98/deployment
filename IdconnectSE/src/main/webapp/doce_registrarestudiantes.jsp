<%-- 
    Document   : dashboard_docente
    Created on : 25 sept 2025, 12:27:30 p. m.
    Author     : BUSINESS CONNECT
--%>


<%@page import="com.idconnect.model.e3uesm"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard Institucional</title>
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
        
        <style>
   
    .card {
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      transition: transform 0.2s ease;
    }
    .card:hover {
      transform: scale(1.01);
    }
    .card-header {
      background-color: #0d6efd;
      color: white;
      border-top-left-radius: 12px;
      border-top-right-radius: 12px;
      padding: 0.75rem 1rem;
      font-weight: 500;
      cursor: pointer;
    }
    .student-list {
      display: none;
      margin-top: 10px;
    }
    .student-list.active {
      display: block;
    }
    .student-item {
      display: flex;
      justify-content: space-between;
      padding: 6px 0;
      border-bottom: 1px solid #dee2e6;
    }
    .status {
      font-weight: bold;
    }
    .status.registered {
      color: green;
    }
    .status.absent {
      color: red;
    }
    .registro-msg {
      font-size: 0.9rem;
      margin-top: 5px;
    }
    .registro-msg.active {
      color: green;
    }
    .registro-msg.cancelled {
      color: red;
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
                                    "><p><%= ((e3uesm) session.getAttribute("e3uesm")).getRole() %></p></h5>
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
                            <span></span>
                             <span class="fw-semibold text-dark" style="margin-left: 1rem;" id="codigo">Código <%= ((e3uesm) session.getAttribute("e3uesm")).getUid() %> Bienvenido <%= ((e3uesm) session.getAttribute("e3uesm")).getName() %></span>
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

                                    <div class="card shadow-sm mb-4">
                                        <div class="card-header bg-white text-white text-center">
                                            <h4 class="text-dark"><i class="bi bi-person-plus"></i> Asistencia Curricular</h4>
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
                                            <div class="row g-3 mt-2">
                                                <div class="container my-5">
  
    <div class="row row-cols-1 row-cols-md-2 g-4">

      <!-- Clase 1 -->
      <div class="col">
        <div class="card">
          <div class="card-header" onclick="toggleEstudiantes(this)">
            <i class="bi bi-book"></i> Matemáticas - 10°A
          </div>
          <div class="card-body">
            <div class="d-flex gap-2 mb-2">
              <button class="btn btn-outline-primary" onclick="iniciarRegistro(this)">
                <i class="bi bi-play-circle"></i> Iniciar Registro
              </button>
              <button class="btn btn-outline-danger" onclick="cancelarRegistro(this)">
                <i class="bi bi-x-circle"></i> Cancelar Registro
              </button>
            </div>
            <div class="registro-msg d-none">🟢 Registro habilitado para estudiantes</div>
            <div class="student-list">
              <div class="student-item">
                <span>Juan Pérez</span>
                <span class="status registered">Registrado</span>
              </div>
              <div class="student-item">
                <span>María López</span>
                <span class="status absent">No registrado</span>
              </div>
              <div class="student-item">
                <span>Carlos Ruiz</span>
                <span class="status registered">Registrado</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Clase 2 -->
      <div class="col">
        <div class="card">
          <div class="card-header bg-success" onclick="toggleEstudiantes(this)">
            <i class="bi bi-flask"></i> Física - 11°B
          </div>
          <div class="card-body">
            <div class="d-flex gap-2 mb-2">
              <button class="btn btn-outline-success" onclick="iniciarRegistro(this)">
                <i class="bi bi-play-circle"></i> Iniciar Registro
              </button>
              <button class="btn btn-outline-danger" onclick="cancelarRegistro(this)">
                <i class="bi bi-x-circle"></i> Cancelar Registro
              </button>
            </div>
            <div class="registro-msg d-none">🟢 Registro habilitado para estudiantes</div>
            <div class="student-list">
              <div class="student-item">
                <span>Lucía Torres</span>
                <span class="status registered">Registrado</span>
              </div>
              <div class="student-item">
                <span>Andrés Gómez</span>
                <span class="status absent">No registrado</span>
              </div>
              <div class="student-item">
                <span>Valentina Ríos</span>
                <span class="status registered">Registrado</span>
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
                        

                                </div>
                            </div>
                        </div>
                    </div>
                          
          
          </div>
                    

            </div>
        </div>

                                        
                                        <!-- Lógica de interacción -->
  <script>
    function toggleEstudiantes(header) {
      const cardBody = header.nextElementSibling;
      const studentList = cardBody.querySelector('.student-list');
      studentList.classList.toggle('active');
    }

    function iniciarRegistro(button) {
      const msg = button.closest('.card-body').querySelector('.registro-msg');
      msg.textContent = '🟢 Registro habilitado para estudiantes';
      msg.classList.remove('d-none', 'cancelled');
      msg.classList.add('active');
    }

    function cancelarRegistro(button) {
      const msg = button.closest('.card-body').querySelector('.registro-msg');
      msg.textContent = '🔴 Registro cancelado. Los estudiantes no pueden registrarse.';
      msg.classList.remove('d-none', 'active');
      msg.classList.add('cancelled');
    }
  </script>
                                        
                                        
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
