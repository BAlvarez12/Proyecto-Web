/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Bomiki
 */
public class Proveedor {
    private String proveedor, direccion;
    private int id_proveedor, nit,telefono;
    private Conexion cn;

    
    
    public Proveedor (){
        
    }
    
    public Proveedor( int id_proveedor, String proveedor, int nit,  String direccion, int telefono) {
        this.id_proveedor = id_proveedor;
        this.proveedor = proveedor;
        this.nit = nit;
        this.direccion = direccion;
        this.telefono = telefono;
    }
    
     public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public int getNit() {
        return nit;
    }

    public void setNit(int nit) {
        this.nit = nit;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    
    
    // METODO LEER DATOS DEL EMPLEADO
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "select * from proveedores order by id_proveedores asc;";
            ResultSet consulta = cn.conexionDB.createStatement().executeQuery(query);
            String encabezado [] = {"id_proveedores", "proveedor", "nit", "direccion", "telefono"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[5];
            while (consulta.next()){
                datos[0] = consulta.getString("id_proveedores");
                datos[1] = consulta.getString("proveedor");
                datos[2] = consulta.getString("nit");
                datos[3] = consulta.getString("direccion");
                datos[4] = consulta.getString("telefono");
                tabla.addRow(datos);
                
            }
            
            cn.cerrar_conexion();
        }catch(SQLException ex){
                System.out.println(ex.getMessage());
            
        }
        
        return tabla;
    }
    /*
     // METODO INSERTAR EMPLEADO
            @Override
        public int agregar() {
            int retorno = 0;
            try {
                PreparedStatement parametro;
                cn = new Conexion();
                String query = "INSERT INTO empleados ( nombres , apellidos , direccion , telefono , dpi , genero , fecha_nacimiento , id_puesto , fecha_inicio_labores , fecha_ingreso ) VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? );";
                cn.abrir_conexion(); 
                parametro = cn.conexionDB.prepareStatement(query);
                parametro.setString(1, getNombres()); 
                parametro.setString(2, getApellidos()); 
                parametro.setString(3, getDireccion()); 
                parametro.setString(4, getTelefono()); 
                parametro.setString(5, getDpi());
                parametro.setInt(6, getGenero()); 
                parametro.setString(7, getFecha_nacimiento()); 
                parametro.setInt(8, getId_puesto()); 
                parametro.setString(9, getFecha_inicio_labores()); 
                parametro.setString(10, getFecha_ingreso()); 
                retorno = parametro.executeUpdate();
                cn.cerrar_conexion();
            } catch (SQLException ex) {
                System.out.println("Error al insertar el empleado: " + ex.getMessage()); 
                retorno = 0;
            }
            return retorno;
        }
            
         // METODO ACTUALIZAR EMPLEADO
                @Override
            public int modificar() {
            int retorno = 0;
            try {
                PreparedStatement parametro;
                cn = new Conexion();
                String query = "UPDATE empleados SET nombres=?, apellidos=?, direccion=?, telefono=?, fecha_nacimiento=?, id_puesto=?, dpi=?, genero=?, fecha_inicio_labores=?, fecha_ingreso=? WHERE id_empleados = ?;";
                cn.abrir_conexion();
                parametro = cn.conexionDB.prepareStatement(query);
                parametro.setString(1, getNombres());
                parametro.setString(2, getApellidos());
                parametro.setString(3, getDireccion());
                parametro.setString(4, getTelefono());
                parametro.setString(5, getFecha_nacimiento());
                parametro.setInt(6, getId_puesto());
                parametro.setString(7, getDpi());
                parametro.setInt(8, getGenero());
                parametro.setString(9, getFecha_inicio_labores()); 
                parametro.setString(10, getFecha_ingreso());       
                parametro.setInt(11, getId_empleados());           
                retorno = parametro.executeUpdate();
                cn.cerrar_conexion();
            } catch (SQLException ex) {
                System.out.println("Error al modificar: " + ex.getMessage());
                retorno = 0;
            }
            return retorno;
        }

                //METODO ELIMINAR EMPLEADO
            @Override
            public int eliminar(){
               int retorno = 0;
           try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "delete from empleados where id_empleados = ? ;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionDB.prepareStatement(query);
            parametro.setInt(1, getId_empleados());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();

            } catch (SQLException ex) {
             System.out.println("Error al eliminar el empleado: " + ex.getMessage());
              retorno = 0;
             }
             return retorno;*/

            }

 