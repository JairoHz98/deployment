<%-- 
    Document   : index_idconnect
    Created on : 24 sept 2025, 1:01:07 p. m.
    Author     : BUSINESS CONNECT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Portal Educativo - Acceso Padre de Familia</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      background-color: #e9edf2;
      font-family: 'Segoe UI', sans-serif;
    }
    .login-box {
      max-width: 420px;
      margin: 80px auto;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0,0,0,0.1);
      padding: 2rem;
    }
    .login-box img {
      width: 80px;
      display: block;
      margin: 0 auto 1rem;
    }
    .login-box h5 {
      text-align: center;
      color: #0d6efd;
      margin-bottom: 1rem;
    }
    .footer-text {
      text-align: center;
      font-size: 0.85rem;
      color: #6c757d;
      margin-top: 2rem;
    }
  </style>
</head>
<body>

  <div class="login-box">
    <!-- Logo institucional -->
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/MinEduc_Ecuador_logo.svg/512px-MinEduc_Ecuador_logo.svg.png" alt="Logo Institucional">

    <h5><i class="bi bi-person"></i> Acceso Padre de Familia</h5>
    <p class="text-muted text-center mb-4">Bienvenido al portal educativo. Por favor ingrese sus credenciales para acceder al seguimiento académico de su representado.</p>

    <form method="post" action="create">
      <div class="mb-3">
        <label for="cedulaPadre" class="form-label">Cédula</label>
        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingrese su cédula">
      </div>
      <div class="mb-3">
        <label for="clavePadre" class="form-label">Contraseña</label>
        <input type="password" class="form-control" id="clave" name="clave" placeholder="Ingrese su contraseña">
      </div>
      <button type="submit" class="btn btn-primary w-100" name="g" value="verify">Ingresar</button>
    </form>

    <div class="footer-text">
      Idconnect · Sistema Académico Institucional<br>
      © 2025 Todos los derechos reservados
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
