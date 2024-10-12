/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Bomiki
 */
public class Cliente {
    private String nombres, apellidos, correo_electronico, fecha_ingreso;
    private int id_cliente, nit, genero, telefono;
    private Conexion cn;

    
    
    public Cliente (){
        
    }
    
    public Cliente( int id_cliente, String nombres, String apellidos, int nit, int genero, int telefono, String correo_electronico, String fecha_ingreso) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo_electronico = correo_electronico;
        this.fecha_ingreso = fecha_ingreso;
        this.id_cliente = id_cliente;
        this.nit = nit;
        this.genero = genero;
        this.telefono = telefono;
    }
    
       public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo_electronico() {
        return correo_electronico;
    }

    public void setCorreo_electronico(String correo_electronico) {
        this.correo_electronico = correo_electronico;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
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
            String query = "select a.id_cliente, a.nombres, a.apellidos, a.nit, s.id_genero, s.genero, a.telefono, a.correo_electronico, a.fecha_ingreso from clientes a inner join genero s on s.id_genero = a.genero order by id_cliente asc;";
            ResultSet consulta = cn.conexionDB.createStatement().executeQuery(query);
            String encabezado [] = {"id_cliente", "nombres", "apellidos", "nit", "genero", "genero", "telefono", "correo_electronico", "fecha_ingreso"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[9];
            while (consulta.next()){
                datos[0] = consulta.getString("id_cliente");
                datos[1] = consulta.getString("nombres");
                datos[2] = consulta.getString("apellidos");
                datos[3] = consulta.getString("nit");
                datos[4] = consulta.getString("genero");
                datos[5] = consulta.getString("genero");
                datos[6] = consulta.getString("telefono");
                datos[7] = consulta.getString("correo_electronico");
                datos[8] = consulta.getString("fecha_ingreso");
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

 