<%-- 
    Document   : zprueba_navbar
    Created on : 2025. 9. 24., 오후 9:26:10
    Author     : JairoHz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
  
    <%
    //String p1 = (String) session.getAttribute("p1");
    //String p2 = (String) session.getAttribute("p2");
    String p3n = (String) session.getAttribute("p3");
    //String p4 = (String) session.getAttribute("p4");
    //String p5 = (String) session.getAttribute("p5");
    String p6n = (String) session.getAttribute("p6");
    %>
  </head>
  <body>
    
     <div id="contenidoPrincipal" class="col-md-12">
         <!-- navbar -->
         
         <div class="container-fluid">
          <div class="container-fluid">
                 <nav class="d-flex justify-content-between align-items-center p-3 border-bottom bg-white">
                        <div class="d-flex align-items-center flex-wrap gap-3">
                            <span> </span>
                            <span class="fw-semibold text-dark" style="margin-left: 1rem;" id="codigo">Código <%=p6n%> Bienvenido <%=p3n%></span>
                            <span class="badge bg-success">Activo</span>
                            <span class="badge bg-warning text-dark">Sistema BETA</span>
                        </div>

                        <!-- Sección derecha -->
                        <div>
                            <button class="btn btn-outline-primary btn-sm" onclick="toggleFullscreen()">⛶</button>
                        </div>

                    </nav>
          </div>    
            
          </div> 
                                
                          
          
          </div>
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
  </body>
</html>