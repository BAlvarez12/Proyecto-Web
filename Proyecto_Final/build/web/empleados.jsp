<%@page import="modelo.Puesto" %>
<%@page import="java.util.HashMap" %>
<%@page import="modelo.Empleado" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-4">
        <h1>Empleados</h1>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_empleado" onclick="limpiar()">Agregar</button>
        <div class="modal fade" id="modal_empleado" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                       <h1 class="modal-title fs-5" id="exampleModalLabel">Empleado</h1>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="sr_empleado" method="post" class="form-group">
                             <form action="sr_empleado" method="post" class="form-group"> 
                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control"  value="0" readonly>
                <label for="lbl_nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ingrese el Nombre" required>
                <label for="lbl_apellidos"><b>Apellidos:</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ingrese el Apellido" required>
                <label for="lbl_direccion"><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ingrese la Direccion" required>
                <label for="lbl_telefono"><b>Telefono:</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ingrese el numero de telefono" required>
                <label for="lbl_dpi"><b>Numero de Identificacion:</b></label>
                <input type="number" name="txt_dpi" id="txt_dpi" class="form-control" placeholder="Ingrese el numero de identificacion" required>
                <label for="txt_genero"><b>Género</b></label>
                <select name="txt_genero" id="txt_genero" class="form-control" required>
                <option value="">Seleccione un género</option>
                <option value="1">Masculino</option>
                <option value="0">Femenino</option>
                </select>
                <label for="lbl_fn"><b>Fecha Nacimiento:</b></label>
                <input type="date" name="txt_fn" id="txt_fn" class="form-control" placeholder="Ingrese la fecha de nacimiento" required>
                <label for="lbl_puesto"><b>Tipo de Puesto:</b></label>
                <select name="drop_puesto" id="drop_puesto" class="form-control">
                   <%
                      Puesto puesto = new Puesto();
                      HashMap<String,String> drop = puesto.drop_puesto();
                      for(String i: drop.keySet()){
                        out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                      }
                   %>
                </select>
                <label for="lbl_fn"><b>Fecha inico de labores</b></label>
                <input type="date" name="txt_fe_inicio" id="txt_fe_inicio" class="form-control" placeholder="Ingrese la fecha de nacimiento" required>
                <label for="lbl_fn"><b>Fecha ingreso</b></label>
                <input type="date" name="txt_fe_ingreso" id="txt_fe_ingreso" class="form-control" placeholder="Ingrese la fecha de nacimiento" required>
                <br>
                 <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Guardar</button>
                        <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                        <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('Desea Eliminar?'))return false">Eliminar</button>
                        
            </form>
                        </form>
                    </div>
                   
                    </div>
                </div>
            </div>
        </div>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Nombres</th>
                    <th scope="col">Apellidos</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Telefono</th>
                    <th scope="col">Dpi</th>
                    <th scope="col">Genero</th>
                    <th scope="col">Fecha Nacimiento</th>
                    <th scope="col">Puesto</th>
                    <th scope="col">Fecha inicio labores</th>
                    <th scope="col">Fecha ingreso</th>
                </tr>
            </thead>
            <tbody id="tbl_empleado">
                <%
                    Empleado empleado = new Empleado();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = empleado.leer();
                    for(int t = 0; t < tabla.getRowCount(); t++){
                        out.println("<tr data-id_empleados=" + tabla.getValueAt(t, 0) + " data-id_puesto=" + tabla.getValueAt(t, 9) +">");
                        out.println("<td>" + tabla.getValueAt(t, 1) + "</td>"); //Nombres
                        out.println("<td>" + tabla.getValueAt(t, 2) + "</td>"); // Apellidos
                        out.println("<td>" + tabla.getValueAt(t, 3) + "</td>"); //Direccion
                        out.println("<td>" + tabla.getValueAt(t, 4) + "</td>"); //Telefono
                        out.println("<td>" + tabla.getValueAt(t, 5) + "</td>"); // DPI
                        out.println("<td>" + tabla.getValueAt(t, 6) + "</td>"); // GENERO
                        out.println("<td>" + tabla.getValueAt(t, 7) + "</td>"); // fecha nacimiento
                        out.println("<td>" + tabla.getValueAt(t, 8) + "</td>"); // puesto
                        out.println("<td>" + tabla.getValueAt(t, 10) + "</td>"); // fecha inicio labores
                        out.println("<td>" + tabla.getValueAt(t, 11) + "</td>"); // fecha ingreso
                        out.println("</tr>");
                    }
                    %>

               <script type="text/javascript">
                   
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_nombres").val('');
                $("#txt_apellidos").val('');
                $("#txt_direccion").val('');
                $("#txt_telefono").val('');
                $("#txt_dpi").val('');
                $("#txt_genero").val('');
                $("#txt_fn").val('');
                $("#drop_puesto").val(1);
                $("#txt_fe_inicio").val('');
                $("#txt_fe_ingreso").val('');
                
                
            }
            
        $(document).ready(function() {
            cargarEmpleados();
        });
               
            $('#tbl_empleado').on('click', 'tr td', function(evt) {
                console.log("Clic en una celda");
                var target, id_empleados, id_puesto, nombres, apellidos, direccion, telefono, dpi, genero, nacimiento, fecha_inicio, fecha_ingreso;
                target = $(event.target);
                id_empleados = target.parent().data('id_empleados');
                id_puesto = target.parent().data('id_puesto');
                nombres = target.parent("tr").find("td").eq(0).html();
                apellidos = target.parent("tr").find("td").eq(1).html();
                direccion = target.parent("tr").find("td").eq(2).html();
                telefono = target.parent("tr").find("td").eq(3).html();
                dpi = target.parent("tr").find("td").eq(4).html();
                genero = target.parent("tr").find("td").eq(5).html();
                nacimiento = target.parent("tr").find("td").eq(6).html();
                fecha_inicio = target.parent("tr").find("td").eq(8).html();
                fecha_ingreso = target.parent("tr").find("td").eq(9).html();
                
                $("#txt_id").val(id_empleados);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#txt_dpi").val(dpi);
                if (genero === "Masculino") {
                $("#txt_genero").val(1);
                } else {
                $("#txt_genero").val(0);
                }
                $("#txt_fn").val(nacimiento);
                $("#drop_puesto").val(id_puesto);
                $("#txt_fe_inicio").val(fecha_inicio);
                $("#txt_fe_ingreso").val(fecha_ingreso);
                $("#modal_empleado").modal('show');
                
            });
        </script>
            </tbody>
        </table>
    </div>
</body>
</html>
