<%-- 
    Document   : das_docente
    Created on : 25 sept 2025, 11:20:37 a. m.
    Author     : BUSINESS CONNECT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link href="css/dashboard_docente.css" rel="stylesheet" type="text/css"/>
    <style>
         /* Clase que lo empuja hacia la derecha */
    .mover-derecha {
      transform: translateX(20%);
    }
    
    #toggleMenuBtn span {
  opacity: 0;
  transition: opacity 0.3s ease;
}

#toggleMenuBtn.expandido span {
  opacity: 1;
}
    </style>
  </head>
  <body>
    
    
    <%@include file="navbar.jsp" %>
    <%@include file="zprueba_panel.jsp" %>
    
    
    <script>
          /* <!-- Script para ajustar el layout -->*/
 function toggleMovimiento() {
      const contenido = document.getElementById('contenido');
      contenido.classList.toggle('mover-derecha');
    }
function expandirBoton() {
  const boton = document.querySelector('.btn');
  boton.classList.toggle('expandido');
}

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <script src="js/dashboard_docente.js" type="text/javascript"></script>
  </body>
</html>
