<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #20b46c;
            padding-top: 20px;
        }

        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }

        .sidebar a:hover {
            background-color: #1a73e8;
            color: white;
        }

        .sidebar a i {
            margin-right: 5px;
            vertical-align: middle;
            position: relative;
            top: -2px;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-black text-center">Sains Mall</h3>
        <a href="javascript:void(0);" id="empleados-link"><i class="material-icons">person</i> Empleados</a>
        <a href="javascript:void(0);" id="Puestos-link"><i class="material-icons">switch_account</i> Puestos</a>
        <a href="javascript:void(0);" id="clientes-link"><i class="material-icons">person_pin</i> Clientes</a>
        <a href="javascript:void(0);"><i class="material-icons">group</i> Proveedores</a>
        <a href="javascript:void(0);"><i class="material-icons">add_box</i> Marcas</a>
        <a href="javascript:void(0);"><i class="material-icons">local_shipping</i> Productos</a>
        <a href="javascript:void(0);"><i class="material-icons">account_circle</i> Usuarios</a>
    </div>
   
    <div class="content">
        <div id="contenido-dinamico">
            
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            //cargar el contenido de empleados 
            $('#empleados-link').click(function(){
                $('#contenido-dinamico').load('empleados.jsp');
            });
            //cargar el contenido de puestos
            $('#Puestos-link').click(function(){
        $('#contenido-dinamico').load('Puestos.jsp');
    });
                $('#clientes-link').click(function(){
        $('#contenido-dinamico').load('clientes.jsp');
    });
         
            });
    </script>
</body>
</html>