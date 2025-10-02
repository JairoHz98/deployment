<%-- 
    Document   : zprueba_contenido
    Created on : 25 sept 2025, 9:42:38 a. m.
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
  <style>
   

   

    /* Clase que lo empuja hacia la derecha */
    .mover-derecha {
      transform: translateX(20%);
    }
    
    
  </style>
  </head>
  <body>
    <!-- 🔗 Navbar institucional -->
    
    <!-- 🔗 Panel principal -->
    <jsp:include page="zprueba_panel.jsp" />
    
    
    
    <div id="contenido" class="container-fluid">
         <jsp:include page="navbar.jsp" />
    <h3>Panel dinámico</h3>
    <p>Este contenido se desliza hacia la derecha al hacer clic.</p>
  </div>

    
 <!-- Script para ajustar el layout -->
  <script>
    function toggleMovimiento() {
      const contenido = document.getElementById('contenido');
      const toggleMenuBtn =document.getElementById('toggleMenuBtn');
      contenido.classList.toggle('mover-derecha');
       boton.classList.toggle('expandido');
       toggleMenuBtn.classList.toggle('expandidob');
    }
  </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
  </body>
</html>
