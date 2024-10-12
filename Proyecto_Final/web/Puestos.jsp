<%@page import="modelo.Puesto" %>
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
        <h1>Puestos</h1>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_puesto" onclick="limpiar()">Agregar</button>
        <div class="modal fade" id="modal_puesto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                       <h1 class="modal-title fs-5" id="exampleModalLabel">Puestos</h1>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="sr_puesto" method="post" class="form-group">
                             <form action="sr_puesto" method="post" class="form-group"> 
                                 
                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control"  value="0" readonly>                 
                <label for="lbl_puesto"><b>Puesto:</b></label>
                <input type="text" name="txt_puesto" id="txt_puesto" class="form-control" placeholder="Ejemplo" required>
                <br>
                 <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button name="btn_agregarp" id="btn_agregarp" value="agregarp" class="btn btn-primary">Guardar</button>
                        <button name="btn_modificarp" id="btn_modificarp" value="modificarp" class="btn btn-success">Modificar</button>
                        <button name="btn_eliminarp" id="btn_eliminarp" value="eliminarp" class="btn btn-danger" onclick="javascript:if(!confirm('Desea Eliminar?'))return false">Eliminar</button>
                        
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
                    <th scope="col">Puesto</th>
                </tr>
            </thead>
            <tbody id="tbl_puesto">
                <%
                    Puesto puesto = new Puesto();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = puesto.leer();
                    for(int t = 0; t < tabla.getRowCount(); t++){
                        out.println("<tr data-id_puesto=" + tabla.getValueAt(t, 0) +">");
                        out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                        out.println("</tr>");
                    }
                    %>

               <script type="text/javascript">
                   
            function limpiar(){
                $("#txt_puesto").val('');
                
            }
            
        $(document).ready(function() {
            cargarPuesto();
        });
               
            $('#tbl_puesto').on('click', 'tr td', function(evt) {
                console.log("Clic en una celda");
                var target, id_puesto, puesto;
                target = $(event.target);
                id_puesto = target.parent().data('id_puesto');
                puesto = target.parent("tr").find("td").eq(0).html();
                $("#txt_puesto").val(puesto);
                $("#txt_id").val(id_puesto);
                $("#modal_puesto").modal('show');
                
            });
        </script>
            </tbody>
        </table>
    </div>
</body>
</html>
