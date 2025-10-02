<%-- 
    Document   : xpruebarfid
    Created on : 30 sep 2025, 4:23:21 p.m.
    Author     : BUSINESS CONNECT
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
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
</head>
<body class="bg-light">

  <div class="container py-5">
      <style>
    #rfidInputn {
      opacity: 0;
      position: absolute;
      top: -1000px;
    }
  </style>
    <div class="card shadow">
      <div class="card-body">
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

        <div id="respuesta" class="text-center mt-3"></div>
      </div>
    </div>
    
<%
    // Obtener fecha y hora actual
    LocalDateTime denviar = LocalDateTime.now();
    String fecha = denviar.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    String hora = denviar.format(DateTimeFormatter.ofPattern("HH:mm"));
    
    DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd MMMM yyyy");
    String fechaHora = denviar.format(formato);                                        
%>  
<input type="hidden"  id="fecha" name="datehistory" value="<%=fecha%> "/>
<input type="hidden" id="hora" value="<%=hora%>"/>                                          
<input type="hidden" id="fechacom" value="<%=fechaHora%>">
    

    
<div style="display: none;" id="mensajeEstado"></div>
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
      rfid: rfid,th,tf,
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
          document.getElementById("mensajeEstado").innerHTML = "<p class='error'>Error al enviar el correo: " + error.text + "</p>";
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


    
    
    <script>
           document.getElementById("rfidInput").addEventListener("input", function(e) {
      const rfid = e.target.value.trim();
      if (rfid.length >= 10) { // ajusta según tu formato real
        document.getElementById("rfidDisplay").value = rfid;
        document.getElementById("estado").textContent = "Procesando...";
        enviarRFID(rfid);
        e.target.value = "";
      }
           
        });

    </script>
    

    



</body>
</html>