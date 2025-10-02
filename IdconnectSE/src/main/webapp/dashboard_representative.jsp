<%-- 
    Document   : dashboard_representative
    Created on : 2025. 9. 22., 오후 8:52:48
    Author     : JairoHz
--%>

<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.idconnect.model.e3uesmingreso"%>
<%@page import="com.idconnect.model.indexrepresent"%>
<%@page import="com.idconnect.DAO.list"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Dashboard Familiar</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap 5.3.7 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
 
  <!-- DataTables CSS -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
 
    <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <!-- DataTables JS -->
  <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

  
  <style>
    body { background-color: #f8f9fa; }
    .card-icon { font-size: 1.5rem; margin-right: 10px; }
    .schedule-table th { background-color: #e9ecef; }
    .toast-container { position: fixed; top: 20px; right: 20px; z-index: 1055; }
  </style>
  
       <style>
    body {
      padding-top: 64px;
      background-color: #f8f9fa;
    }

    .navbar {
      background-color: #ffffff;
    }

    .navbar-brand {
      font-size: 1.25rem;
      color: #0d6efd;
    }

    .navbar-toggler {
      border: none;
    }

    .navbar-toggler-icon {
      background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%230d6efd' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(13,110,253, 0.7)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
    }

    .nav-link {
      font-size: 1rem;
      color: #212529;
    }

    .nav-link.active {
      font-weight: 600;
      color: #0d6efd !important;
    }

    .dropdown-menu {
      font-size: 0.95rem;
    }

    .form-control {
      font-size: 0.95rem;
    }

    .btn-outline-primary {
      font-size: 0.95rem;
    }

    .dropdown-toggle {
      font-size: 1.1rem;
    }

    @media (max-width: 576px) {
      .navbar-brand {
        font-size: 1.1rem;
      }

      .nav-link {
        padding-left: 1rem;
      }

      .form-control {
        width: 100%;
        margin-bottom: 0.5rem;
      }

      .btn-outline-primary {
        width: 100%;
      }

      .dropdown-toggle {
        padding: 0.25rem 0.5rem;
      }
    }
  </style>
  
</head>
<body>

    <nav class="navbar navbar-expand-lg bg-light fixed-top border-bottom shadow-sm">
  <div class="container-fluid">

    <!-- Logo centrado solo en móviles -->
    <a class="navbar-brand fw-bold text-primary mx-auto d-lg-none" href="#">
      <i class="bi bi-mortarboard-fill me-2"></i>IdConnect
    </a>

    <!-- Botón hamburguesa -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Logo alineado a la izquierda en escritorio -->
    <a class="navbar-brand fw-bold text-primary d-none d-lg-block" href="#">
      <i class="bi bi-mortarboard-fill me-2"></i>IdConnect
    </a>

    <!-- Menú colapsable -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active text-primary fw-semibold" aria-current="page" href="#">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Cursos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Representante</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
            aria-expanded="false">
            Recursos
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Historial de Ingreso</a></li>
            <li><a class="dropdown-item" href="#">Historial de Salida</a></li>
            <li><a class="dropdown-item" href="#">Descargar Horarios</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Soporte técnico</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Desactivado</a>
        </li>
      </ul>

      <!-- Buscador -->
      <form style="display: none;" class="d-flex flex-column flex-sm-row mt-3 mt-lg-0 me-lg-3" role="search">
        <input class="form-control me-sm-2" type="search" placeholder="Buscar contenido..." aria-label="Search">
        <button style="display: none; " class="btn btn-outline-primary mt-2 mt-sm-0" type="submit">Buscar</button>
      </form>

      <!-- Perfil del usuario -->
      <div class="dropdown">
        <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
          <i class="bi bi-person-circle"></i>
        </button>
        <ul class="dropdown-menu dropdown-menu-end">
          <li><a class="dropdown-item" href="#">Mi perfil</a></li>
          <li><a class="dropdown-item" href="#">Configuración</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="#">Cerrar sesión</a></li>
        </ul>
      </div>
    </div>
  </div>
</nav>
    
<!-- Notificaciones tipo toast -->
<div class="toast-container position-fixed top-0 end-0 p-3" id="toastContainer"></div>

<div class="container my-5">
  <h2 class="text-center mb-4"><i class="bi bi-house-door"></i> Panel Familiar</h2>
   <div id="notificaciones" ></div>

  <!-- Botones de simulación -->
  <div class="d-flex justify-content-center gap-3 mb-4 flex-wrap">
    </div>

  <!-- Información del estudiante -->
  <div class="accordion" id="listaEstudiantes ">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingValentina">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseValentina" aria-expanded="false" aria-controls="collapseValentina">
        Representados
      </button>
    </h2>
    <div id="collapseValentina" class="accordion-collapse collapse" aria-labelledby="headingValentina" data-bs-parent="#listaEstudiantes">
      <div class="accordion-body">
        <ul class="list-group list-group-flush">
            <div class="card mb-4 shadow-sm">
           
    <div class="card-body d-flex justify-content-between align-items-center flex-wrap">
        <div>
            
           
        <h5 class="card-title">Estudiante: <strong><%= ((indexrepresent) session.getAttribute("general")).getName_est()%></strong></h5>
        <p class="mb-0"><%= ((indexrepresent) session.getAttribute("general")).getNombreAula()%> | Nivel: <strong><%= ((indexrepresent) session.getAttribute("general")).getNivel_aula()%></strong></p>
      </div>
      <div>
        <span class="badge bg-primary">ID: <%= ((indexrepresent) session.getAttribute("general")).getUidest()%></span>
      </div>
    </div>
    <%%>
  </div>
        </ul>
      </div>
    </div>
  </div>
</div>
  


  <!-- Horario de acceso y salida -->
  <div class="row row-cols-1 row-cols-md-2 g-4 mb-4 mt-2">
    <div class="col">
      <div class="card shadow-sm h-100">
        <div class="card-body d-flex align-items-center justify-content-between">
          <div>
            <div class="card-icon text-success"><i class="bi bi-circle-fill text-success fs-4"></i>
</div>
            <h6 class="card-title">Hora de ingreso</h6>
          </div>
            <style>
                .puntos{
 padding-left: 114%;
}

            </style>
          <span class="fs-5 fw-bold text-success"><%= ((indexrepresent) session.getAttribute("general")).getRing()%>     <i class="bi bi-three-dots-vertical text-secondary fs-4 puntos"></i></span>
        </div>
      </div>

    </div>

    <div class="col">
      <div class="card shadow-sm h-100">
        <div class="card-body d-flex align-items-center justify-content-between">
          <div>
            <div class="card-icon text-danger"><i class="bi bi-circle-fill text-danger fs-4"></i></div>
            <h6 class="card-title">Hora de salida</h6>
          </div>
          <span class="fs-5 fw-bold text-danger"><%= ((indexrepresent) session.getAttribute("general")).getRsal()%></span>
        </div>
      </div>
    </div>
  </div>

  <!-- Horario de clases -->
  <div class="card shadow-sm mb-4">
    <div class="card-body">
      <h5 class="card-title mb-3"><i class="bi bi-journal-bookmark text-dark fs-5"></i>
 Horario de clases</h5>
      <div class="table-responsive ">
          <table id="horario" class="display table table-bordered schedule-table" style="width:100%">
    <thead>
      <tr>
        <th>Fecha</th>
        <th>Hora de Ingreso</th>
        <th>Atrasos</th>
      </tr>
    </thead>
    <tbody>

        <%
            
        e3uesmingreso ls = new e3uesmingreso();
        list i = new list();
        ls.setId_est("5");
        List<e3uesmingreso> p = new ArrayList<>();
        p = i.listinregresos(ls);

        for (e3uesmingreso h : p) {
        
        %>
        <%
  // Supongamos que ya tienes tu ResultSet llamado rs
 
  


  
    
    
%>

        
      <tr>
        <td><%=h.getRfe()%></td>
        <td><%=h.getRing()%></td>
        
        <%  try {
    String horaEntradaStr = h.getRing(); // Ej: "11:36"
    LocalTime horaEntrada = LocalTime.parse(horaEntradaStr);
    LocalTime horaProgramada = LocalTime.parse("07:30");
long minutosTarde = Duration.between(horaProgramada, horaEntrada).toMinutes();
   boolean tieneAtraso = minutosTarde > 15;
%>
        
        <td><%= tieneAtraso ? "Sí" : "No" %></td>
<%
} catch (Exception e) {
  out.println("<td>Error en hora</td><td>-</td>");
}%>

      </tr>
<%}%>
    </tbody>
  </table>

      </div>
    </div>
  </div>

  <!-- Clases en tiempo real -->
  <div style="display: none;" class="card shadow-sm mb-4">
    <div class="card-body">
      <h5 class="card-title mb-3"><i class="bi bi-clock"></i> Clases en tiempo real</h5>
      <div id="claseActual" class="mb-3">
        <p><strong>Materia:</strong> Matemáticas</p>
        <p><strong>Docente:</strong> Carlos Vélez</p>
        <p><strong>Horario:</strong> 07:30 - 08:15</p>
      </div>
    </div>
  </div>

  <!-- Acciones -->
  <div style="display: none;" class="text-center mb-4">
    <button class="btn btn-outline-primary me-2">Ver historial académico</button>
    <button class="btn btn-outline-success">Descargar horario</button>
  </div>

  <!-- Botones de redirección -->
  <div style="display: none;" class="card shadow-sm">
    <div class="card-body text-center">
      <h5 class="card-title mb-3"><i class="bi bi-link-45deg text-primary fs-4"></i> Opciones adicionales</h5>
      <div class="d-grid gap-3 col-12 col-md-6 mx-auto">
        <a href="#responsable" class="btn btn-info"><i class="bi bi-person fs-5"></i> Ver responsable registrado</a>
        <a href="#ingresos" class="btn btn-secondary"><i class="bi bi-eye text-light fs-4"></i>  Ver historial de ingresos</a>
        <a href="#salidas" class="btn btn-secondary"><i class="bi bi-eye text-light fs-4"></i>  Ver historial de salidas</a>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

<!-- JS para notificaciones y clases en tiempo real -->
<script>
  function obtenerHora() {
    return new Date().toLocaleTimeString();
  }

  function mostrarToast(mensaje) {
    const container = document.getElementById("toastContainer");
    const toast = document.createElement("div");
    toast.className = "toast align-items-center text-bg-dark border-0 show";
    toast.setAttribute("role", "alert");
    toast.innerHTML =
      '<div class="d-flex">' +
        '<div class="toast-body">' + mensaje + '</div>' +
        '<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>' +
      '</div>';
    container.appendChild(toast);

    setTimeout(() => {
      toast.classList.remove("show");
      toast.classList.add("hide");
      setTimeout(() => container.removeChild(toast), 500);
    }, 5000);
  }

  const clases = [
    { materia: "Matemáticas", docente: "Carlos Vélez", horario: "07:30 - 08:15" },
    { materia: "Lengua", docente: "María Salazar", horario: "08:20 - 09:05" },
    { materia: "Ciencias", docente: "Lucía Mendoza", horario: "09:10 - 09:55" },
    { materia: "Historia", docente: "Jorge Rivas", horario: "10:00 - 10:45" }
  ];
  let claseIndex = 0;

  function cambiarClase() {
    claseIndex = (claseIndex + 1) % clases.length;
    const clase = clases[claseIndex];
    document.getElementById("claseActual").innerHTML =
      '<p><strong>Materia:</strong> ' + clase.materia + '</p>' +
      '<p><strong>Docente:</strong> ' + clase.docente + '</p>' +
      '<p><strong>Horario:</strong> ' + clase.horario + '</p>';
    mostrarToast('<i class="bi bi-arrow-repeat text-warning"></i> Cambio de clase: ' + clase.materia + ' con ' + clase.docente);
  }
</script>

 <script>
    $(document).ready(function() {
      $('#horario').DataTable({
        language: {
          url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
        }
      });
    });
  </script>

    <script src="js/enviodiseño.js" type="text/javascript"></script>
</body>
</html>