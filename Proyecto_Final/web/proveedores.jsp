<%@page import="modelo.Proveedor" %>
<%@page import="java.util.HashMap" %>
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
        <h1>Proveedores</h1>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_proveedores" onclick="limpiar()">Agregar</button>

        <div class="modal fade" id="modal_cliente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                       <h1 class="modal-title fs-5" id="exampleModalLabel">Proveedores</h1>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="sr_proveedores" method="get" class="form-group">
                             <form action="sr_proveedores" method="get" class="form-group"> 
                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control"  value="0" readonly>
                <label for="lbl_proveedor"><b>Proveedor:</b></label>
                <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" placeholder="Ingrese el Nombre" required>
                <label for="lbl_nit"><b>Nit:</b></label>
                <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ingrese la Direccion" required>
                <label for="lbl_direccion"><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ingrese el Apellido" required>
                <label for="lbl_telefono"><b>Telefono:</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ingrese la fecha de nacimiento" required>
                <br>
                 <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Guardar</button>
                        <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                        
                <!-- <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('Desea Eliminar?'))return false">Eliminar</button>
                %-->
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
                    <th scope="col">Proveedor</th>
                    <th scope="col">Nit</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Telefono</th>
                </tr>
            </thead>
            <tbody id="tbl_proveedor">
                <%
                    Proveedor proveedor = new Proveedor();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = proveedor.leer();
                    for(int t = 0; t < tabla.getRowCount(); t++){
                        out.println("<tr data-id_proveedores=" + tabla.getValueAt(t, 0) +">");
                        out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                        out.println("</tr>");
                    }
                    %>

               <script type="text/javascript">
                   
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_proveedor").val('');
                $("#txt_nit").val('');
                $("#txt_direccion").val('');
                $("#txt_telefono").val('');
                
            }
            
        $(document).ready(function() {
            cargarProveedores();
        });
               
            $('#tbl_proveedor').on('click', 'tr td', function(evt) {
                console.log("Clic en una celda");
                var target, id_proveedores, proveedor, nit, direccion, telefono;
                target = $(event.target);
                id_proveedores = target.parent().data('id_proveedores');
                proveedor = target.parent("tr").find("td").eq(0).html();
                nit = target.parent("tr").find("td").eq(1).html();
                direccion = target.parent("tr").find("td").eq(2).html();
                telefono = target.parent("tr").find("td").eq(3).html();
                $("#txt_id").val(id_proveedores);
                $("#txt_proveedor").val(proveedor);
                $("#txt_nit").val(nit);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#modal_proveedores").modal('show');
                
            });
        </script>
            </tbody>
        </table>
    </div>
</body>
</html>
