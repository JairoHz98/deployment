<%-- 
    Document   : index
    Created on : 2025. 9. 26., 오전 10:41:33
    Author     : JairoHz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Business Connect - Accesos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style>
    body {
      background-image: url('https://tuservidor.com/ruta/fondo.jpg'); /* Reemplaza con tu imagen */
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      min-height: 100vh;
      font-family: 'Segoe UI', sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .dashboard-container {
      background-color: rgba(255, 255, 255, 0.85);
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 0 20px rgba(0,0,0,0.3);
      max-width: 600px;
      width: 100%;
      text-align: center;
    }
    .btn-login {
      width: 100%;
      margin-bottom: 20px;
      padding: 15px;
      font-size: 1.1rem;
      border-radius: 8px;
    }
    .admin { background-color: #007bff; color: white; }
    .docente { background-color: #28a745; color: white; }
    .familia { background-color: #ffc107; color: black; }
    .btn-login:hover {
      opacity: 0.9;
    }
  </style>
</head>
<body>
  <div class="dashboard-container">
    <h2 class="mb-4"><i class="bi bi-lock-fill"></i> Roles de Acceso</h2>
    <a href="index_customer.jsp" class="btn btn-login admin">Acceso Administrativo</a>
    <a href="index_customer.jsp" class="btn btn-login docente">Acceso Docente</a>
    <a href="index_idconnect.jsp" class="btn btn-login familia">Acceso Familia</a>
  </div>
</body>
</html>