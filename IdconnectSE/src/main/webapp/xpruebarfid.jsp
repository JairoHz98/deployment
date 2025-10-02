<%-- 
    Document   : xpruebarfid
    Created on : 30 sep 2025, 4:23:21 p.m.
    Author     : BUSINESS CONNECT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Registro RFID</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap 5 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
  <script>
    emailjs.init("TU_PUBLIC_KEY"); // ← reemplaza con tu clave pública
  </script>
  <style>
    #rfidInput {
      opacity: 0;
      position: absolute;
      top: -1000px;
    }
  </style>
</head>
<body class="bg-light">

  <div class="container py-5">
    <div class="card shadow">
      <div class="card-body">
        <h3 class="card-title text-center mb-4">Registro de Ingreso por RFID</h3>
        <p class="text-muted text-center">Escanea la tarjeta RFID para registrar el ingreso</p>

        <div class="text-center mb-3">
          <span class="badge bg-primary" id="estado">Esperando escaneo...</span>
        </div>

        <div class="mb-3">
          <label class="form-label">Último código RFID detectado:</label>
          <input type="text" class="form-control" id="rfidDisplay" readonly>
        </div>

        <!-- Campo oculto que recibe el escaneo -->
        <input type="text" id="rfidInput" autofocus>

        <div id="respuesta" class="text-center mt-3"></div>
      </div>
    </div>
  </div>

  <script>
    document.getElementById("rfidInput").addEventListener("input", function(e) {
      const rfid = e.target.value.trim();
      if (rfid.length >= 10) { // ajusta según tu formato real
        document.getElementById("rfidDisplay").value = rfid;
        document.getElementById("estado").textContent = "Procesando...";
        enviarDatosRFID(rfid);
        e.target.value = "";
      }
    });

    function enviarDatosRFID(rfid) {
      const datos = {
        rfid: rfid,
        evento: "ingreso",
        hora: new Date().toLocaleTimeString()
      };

      fetch("/registroRFID", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(datos)
      })
      .then(res => res.json())
      .then(data => {
        document.getElementById("estado").textContent = "Ingreso registrado";
        document.getElementById("respuesta").innerHTML = `<div class="alert alert-success">RFID ${rfid} registrado correctamente.</div>`;
      })
      .catch(err => {
        console.error("Error:", err);
        document.getElementById("estado").textContent = "Error al registrar";
        document.getElementById("respuesta").innerHTML = `<div class="alert alert-danger">Error al registrar RFID.</div>`;
      });
    }
  </script>

</body>
</html>