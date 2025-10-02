<%-- 
    Document   : index_customer
    Created on : 24 sept 2025, 12:58:17 p. m.
    Author     : BUSINESS CONNECT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Acceso Administrativo</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body, html {
      height: 100%;
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
    }

    /* Fondo con imagen difuminada */
    .background {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: url('https://educacion.uniandes.edu.co/sites/default/files/imagen-institucional_0.png');
      background-size: cover;
      background-position: center;
      filter: blur(8px);
      z-index: -1;
    }

    /* Contenedor del login */
    .login-wrapper {
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .login-card {
      background-color: rgba(255, 255, 255, 0.85);
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0,0,0,0.2);
      max-width: 400px;
      width: 100%;
    }

    .login-card h4 {
      text-align: center;
      color: #0d6efd;
      margin-bottom: 1.5rem;
    }
  </style>
</head>
<body>

  <!-- Fondo difuminado -->
  <div class="background"></div>

  <!-- Contenido del login -->
  <div class="login-wrapper">
    <div class="login-card">
      <h4><i class="bi bi-person-badge"></i> Acceso Administrativo</h4>
      <form method="post" action="create">
        <div class="mb-3">
          <label for="usuarioRector" class="form-label">Usuario</label>
          <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ej. rector@institucion.edu.ec">
        </div>
        <div class="mb-3">
          <label for="claveRector" class="form-label">Contraseña</label>
          <input type="password" class="form-control" id="clave" name="clave" placeholder="Ingrese su contraseña">
        </div>
        <button type="submit" class="btn btn-primary w-100" name="g" value="verify">Ingresar</button>
      </form>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
