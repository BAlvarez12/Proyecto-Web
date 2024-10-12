<%@page import="modelo.Productos" %>
<%@page import="modelo.Marcas" %>
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
        <h1>Productos</h1>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_productos" onclick="limpiar()">Agregar</button>

        <div class="modal fade" id="modal_productos" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                       <h1 class="modal-title fs-5" id="exampleModalLabel">Productos</h1>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                            <form action="sr_productos" method="post" enctype="multipart/form-data" class="form-group" id="form_cliente">
                            <label for="lbl_id"><b>ID:</b></label>
                            <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                            <label for="lbl_producto"><b>Producto:</b></label>
                            <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ingrese el producto" required>
                            <label for="lbl_puesto"><b>Marca:</b></label>
                            <select name="drop_marca" id="drop_marca" class="form-control">
                               <%
                                  Marcas marcas = new Marcas();
                                  HashMap<String,String> drop = marcas.drop_marcas();
                                  for(String i: drop.keySet()){
                                    out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                  }
                               %>
                            </select>
                            <label for="lbl_descripcion"><b>Descripcion:</b></label>
                            <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Ingrese el Apellido" required>
                            <label for="lbl_imagen"><b>Imagen:</b></label>
                            <input type="file" name="file_imagen" id="file_imagen" class="form-control" accept="image/*" required>
                            <label for="lbl_Precio"><b>Precio:</b></label>
                            <input type="number" name="txt_precio" id="txt_precio" class="form-control" placeholder="Ingrese el teléfono" required>
                            <label for="lbl_venta"><b>Precio Venta:</b></label>
                            <input type="number" name="txt_precio_v" id="txt_precio_v" class="form-control" placeholder="Ingrese el teléfono" required>
                            <label for="lbl_existencia"><b>Existencia:</b></label>
                            <input type="number" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ingrese el teléfono" required>
                            <br>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Guardar</button>
                                <button type="submit" name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                                <button type="button" class="btn btn-danger" id="btn_eliminar" data-bs-toggle="modal" data-bs-target="#modalConfirmacion">Eliminar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Producto</th>
                    <th scope="col">Marca</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Imagen</th>
                    <th scope="col">Precio Costo</th>
                    <th scope="col">Precio Venta</th>
                    <th scope="col">Existencia</th>
                </tr>
            </thead>
            <tbody id="tbl_productos">
                <%
                    Productos productos = new Productos();
                    DefaultTableModel tabla = productos.leer();
                    for (int t = 0; t < tabla.getRowCount(); t++) {
                        out.println("<tr data-id_producto='" + tabla.getValueAt(t, 0) + "' data-id_marca='" + tabla.getValueAt(t, 2) + "' data-fecha_ingreso='" + tabla.getValueAt(t, 9) + "'>");
                        out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                        out.println("<td><a href='#' class='ver-imagen' data-src=\"" + tabla.getValueAt(t, 5) + "\"><img src=\"" + tabla.getValueAt(t, 5) + "\" alt=\"Producto\" width=\"100\" height=\"100\"></a></td>");
                        out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
                        out.println("</tr>");
                    }
                %>
            </tbody>
        </table>

        <div class="modal fade" id="modalConfirmacion" tabindex="-1" aria-labelledby="modalConfirmacionLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalConfirmacionLabel">Confirmar Eliminar</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ¿Está seguro de que desea eliminar este producto?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" id="btnConfirmarEliminar">Eliminar</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="modalImagen" tabindex="-1" aria-labelledby="modalImagenLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalImagenLabel">Visualizacion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <img id="imagenAmpliada" src="" alt="Producto" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5/5hb7x1l5F3i5s0l4l7NME57K7lN5e5q5g5d6vA" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMN00AokAGBfS8f8k5PcUtx8RmgQ4Ly4Qo9VV7Si1LpD+plWTo+lFi4iA2cPw0J8" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGhv1BBm4rZr5f9EaZhl8y3tlF8ox8a4f4Y5WeUc0e6e/mGyf4gpPeUyG6g" crossorigin="anonymous"></script>

        <script type="text/javascript">
            function limpiar() {
                $("#txt_id").val(0);
                $("#txt_producto").val('');
                $("#drop_marca").val(1);
                $("#txt_descripcion").val('');
                $("#file_imagen").val('');
                $("#txt_precio").val('');
                $("#txt_precio_v").val('');
                $("#txt_existencia").val('');
            }

            $(document).ready(function() {
                // Clic en el boton eliminar
                $("#btnConfirmarEliminar").on("click", function() {
                    // envia el valor eliminar
                    $("#form_cliente").append('<input type="hidden" name="btn_eliminar" value="eliminar">');
                    // enviar formulario al confirmar
                    $("#form_cliente").submit();
                });

                // Clic en una fila para editar
                $('#tbl_productos').on('click', 'tr', function() {
                    var target = $(this);
                    var id_producto = target.data('id_producto');
                    var producto = target.find("td").eq(0).html();
                    var id_marca = target.data('id_marca');
                    var descripcion = target.find("td").eq(1).html();
                    var imagen = target.find("td").eq(3).html();
                    var precio_costo = target.find("td").eq(4).html();
                    var precio_venta = target.find("td").eq(5).html();
                    var existencia = target.find("td").eq(6).html();
                    
                    $("#txt_id").val(id_producto);
                    $("#txt_producto").val(producto);
                    $("#drop_marca").val(id_marca);
                    $("#txt_descripcion").val(descripcion);
                    $("#txt_precio").val(precio_costo);
                    $("#txt_precio_v").val(precio_venta);
                    $("#txt_existencia").val(existencia);
                    $("#modal_productos").modal('show');
                });
                
                 $('#tbl_productos').on('click', '.ver-imagen', function(e) {
                    e.preventDefault();
                    var imgSrc = $(this).data('src');
                    $('#imagenAmpliada').attr('src', imgSrc);
                    $('#modalImagen').modal('show');
                });
            });
        </script>
    </div>
</body>
</html>