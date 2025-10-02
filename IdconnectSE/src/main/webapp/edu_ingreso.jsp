<%-- 
    Document   : dashboard_docente
    Created on : 25 sept 2025, 12:27:30 p. m.
    Author     : BUSINESS CONNECT
--%>

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
       <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
  
        <script>
    // Inicializa EmailJS con tu clave pública
    emailjs.init("SoAA0xtt3fVHPQ9Rj"); // ← Reemplaza con tu Public Key real
  </script>
  <style>
    #rfidInputn {
      opacity: 0;
      position: absolute;
      top: -1000px;
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
                        <div class="container py-4">
                            <div class="row g-4 mt-3">

                                <div class="row justify-content-center">

                                    <div class="card shadow-sm mb-4">
                                        <div class="card-header bg-white text-center">
                                            <h4 class="text-dark"><i class="bi bi-person-plus"></i> Registro de Ingreso</h4>
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
                                                    alerta.classList.add("fade"); // Asegura transición suave
                                                    alerta.remove(); // Elimina del DOM
                                                }
                                            }, 2000); // 30,000 milisegundos = 30 segundos
                                        </script>
                                        <%
                                            }
                                        %>


                                        <div class="card-body">

                                            <style>
                                                #rfidInputn {
                                                    opacity: 0;
                                                    position: absolute;
                                                    top: -1000px;
                                                }
                                            </style>


                                            <p class="text-muted text-center">Escanea la tarjeta o Huella</p>

                                            <div class="text-center mb-3">
                                                <span class="badge bg-primary" id="estado">Esperando escaneo...</span>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Último código detectado:</label>
                                                <input type="text" class="form-control" id="rfidDisplay" readonly>
                                            </div>

                                            <!-- Campo oculto que recibe el escaneo -->
                                            <input type="text" id="rfidInput" autofocus>

                                            <div style="display: none;" id="respuesta" class="text-center mt-3"></div>



                                            <%
                                                // Obtener fecha y hora actual
                                                LocalDateTime denviar = LocalDateTime.now();
                                                String fecha = denviar.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                                                String hora = denviar.format(DateTimeFormatter.ofPattern("HH:mm"));

                                                DateTimeFormatter formatos = DateTimeFormatter.ofPattern("dd MMMM yyyy");
                                                String fechaHoras = denviar.format(formatos);
                                            %>  
                                            <input type="hidden"  id="fecha" name="datehistory" value="<%=fecha%> "/>
                                            <input type="hidden" id="hora" value="<%=hora%>"/>                                          
                                            <input type="hidden" id="fechacom" value="<%=fechaHoras%>">



                                            <div style="display: none;" id="mensajeEstado"></div>


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

            function enviarRFID(rfid) {
                const th = document.getElementById("hora").value;
                const tf = document.getElementById("fecha").value;
                fetch("/IdconnectSE/fech", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        rfid: rfid, th, tf,
                        g: "rfid"
                    })
                })
                        .then(response => response.json())
                        .then(data => {
                            if (data.estado === "ok") {
                                if (!data.name || data.name.trim() === "undefined") {
                                    document.getElementById("estado").textContent = "No se encuentra registrado en la Institucion";
                                    return; // ← detiene el proceso
                                } else {
                                    // Continuar con el proceso
                                    const params = {
                                        estado: 'ingreso',
                                        unidad_educativa: 'Unidad Educativa Particular Bconnect',
                                        fecha_actual: document.getElementById("fechacom").value,
                                        NombreEstudiante: data.name,
                                        hora: document.getElementById("hora").value,
                                        email: data.emailr,
                                        representante: data.renom
                                    };
                                    emailjs.send("service_2tpdg28", "template_i92facm", params)
                                            .then(() => {
                                                console.log("Campos enviados:", params);
                                                document.getElementById("mensajeEstado").innerHTML = "<p class='success'>Correo enviado correctamente.</p>";
                                            })
                                            .catch((error) => {
                                                console.error("Error al enviar:", error);
                                                document.getElementById("mensajeEstado").innerHTML = "<p cla ss='error'>Error al enviar el correo: " + error.text + "</p>";
                                            });
                                    document.getElementById("estado").textContent = "Escaneado Correctamente";
                                }
                            } else {
                                document.getElementById("estado").textContent = "No se encuentra registrado en la Institucion";
                                alert(data.mensaje || "Código no reconocido");
                            }
                        })
                        .catch(error => {
                            console.error("Error en la petición:", error);
                        });
            }






        </script>
        
          <script>


            document.getElementById("rfidInput").addEventListener("input", function (e) {
                const rfid = e.target.value.trim();
                if (rfid.length >= 10) { // ajusta según tu formato real
                    document.getElementById("rfidDisplay").value = rfid;
                    document.getElementById("estado").textContent = "Procesando...";
                    enviarRFID(rfid);
                    e.target.value = "";
                }

            });
            </script>
        
        
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


    </body>
</html>
