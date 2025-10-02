<%-- 
    Document   : datatables
    Created on : 2025. 9. 27., 오후 3:55:48
    Author     : JairoHz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tabla institucional</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <!-- DataTables + Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/datatables.net-bs5@1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/datatables.net@1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/datatables.net-bs5@1.13.6/js/dataTables.bootstrap5.min.js"></script>

    <!-- Estilo personalizado para fondo blanco -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .table-container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        .dataTables_wrapper .dataTables_filter input {
            border-radius: 0.25rem;
            border: 1px solid #ced4da;
        }
    </style>
</head>
<body>

<div class="container mt-4 table-container">

    <table id="tablaUsuarios" class="table table-bordered table-hover table-striped align-middle">
        <thead class="table-light">
            <tr>
                <th>Fecha</th>
                <th>Usuario</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>27/09/2025 14:03</td>
                <td>Maria</td>
                <td>Registro nuevo Docente</td>
            </tr>
            <tr>
                <td>27/09/2025 14:14</td>
                <td>Maria</td>
                <td>Registro nuevo Docente</td>
            </tr>
            <tr>
                <td>27/09/2025 14:25</td>
                <td>Maria</td>
                <td>Registro nuevo Administrativo</td>
            </tr>
            <tr>
                <td>27/09/2025 15:20</td>
                <td>Maria</td>
                <td>Registro nuevo Docente</td>
            </tr>
        </tbody>
    </table>
</div>

<!-- Inicializar DataTables -->
<script>
    $(document).ready(function () {
        $('#tablaUsuarios').DataTable({
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
            }
        });
    });
</script>

</body>
</html>
