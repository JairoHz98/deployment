<%-- 
    Document   : zprueba_correo
    Created on : 30 sep 2025, 4:00:33 p.m.
    Author     : BUSINESS CONNECT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Notificación de Acceso</title>
  <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
  <script>
    // Inicializa EmailJS con tu clave pública
    emailjs.init("SoAA0xtt3fVHPQ9Rj"); // ← Reemplaza con tu Public Key real
  </script>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      padding: 2rem;
    }
    .container {
      max-width: 500px;
      margin: auto;
      background-color: #fff;
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    h2 {
      text-align: center;
      margin-bottom: 1.5rem;
    }
    .form-group {
      margin-bottom: 1rem;
    }
    label {
      font-weight: bold;
      display: block;
      margin-bottom: 0.5rem;
    }
    input {
      width: 100%;
      padding: 0.6rem;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    button {
      background-color: #007bff;
      color: white;
      padding: 0.7rem 1.2rem;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      width: 100%;
      font-size: 1rem;
    }
    button:hover {
      background-color: #0056b3;
    }
    .success {
      color: green;
      text-align: center;
      margin-top: 1rem;
    }
    .error {
      color: red;
      text-align: center;
      margin-top: 1rem;
    }
  </style>
</head>
<body>

  <div class="container">
    <h2>Enviar Notificación de Acceso</h2>
    <form id="notificacionForm">
      <div class="form-group">
        <label for="email">Correo del destinatario:</label>
        <input type="email" id="email" name="email" placeholder="Ej. padre@correo.com" required>
      </div>
      <div class="form-group">
        <label for="unidad">Unidad Educativa:</label>
        <input type="text" id="unidad" name="unidad" placeholder="Ej. Unidad Educativa San Martín" required>
      </div>
      <div class="form-group">
        <label for="hora">Hora de ingreso/salida:</label>
        <input type="text" id="hora" name="hora" placeholder="Ej. 07:45" required>
      </div>
      <div class="form-group">
        <label for="representante">Nombre del responsable:</label>
        <input type="text" id="representante" name="representante" placeholder="Ej. Sr. Juan Pérez" required>
      </div>
      <button type="submit">Enviar correo</button>
      <div id="mensajeEstado"></div>
    </form>
  </div>

  <script>
    document.getElementById("notificacionForm").addEventListener("submit", function(e) {
      e.preventDefault();

      const params = {
        estado: 'ingreso',
        unidad_educativa: document.getElementById("unidad").value,
        fecha_actual: '',
        NombreEstudiante: '',
        hora: '',
        email: document.getElementById("email").value,
        representante: document.getElementById("representante").value
      };

      emailjs.send("service_2tpdg28", "template_i92facm", params)
        .then(() => {
          document.getElementById("mensajeEstado").innerHTML = "<p class='success'>Correo enviado correctamente.</p>";
        })
        .catch((error) => {
          console.error("Error al enviar:", error);
          document.getElementById("mensajeEstado").innerHTML = "<p class='error'>Error al enviar el correo: " + error.text + "</p>";
        });
    });
  </script>

</body>
  
  
</html>
