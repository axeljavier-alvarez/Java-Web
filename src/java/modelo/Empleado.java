/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author axel5
 */
public class Empleado extends Persona {
    private String codigo;
    private int id, id_puesto;

    Conexion cn;
    public Empleado() {
    }

    public Empleado(String nombres,  int id, int id_puesto, String codigo, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        super(nombres, apellidos, direccion, telefono, fecha_nacimiento);
        
        this.codigo = codigo;
        this.id = id;
        this.id_puesto = id_puesto;
        
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public Conexion getCn() {
        return cn;
    }

    public void setCn(Conexion cn) {
        this.cn = cn;
    }
    
    
    
    @Override
    public int crear(){
        int retorno = 0;
         try {
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "INSERT INTO empleados (codigo, nombres, apellidos, direccion, telefono, fecha_nacimiento, id_puesto) VALUES(?,?,?,?,?,?,?);";
            

// String query = "INSERT INTO clientes (nit, nombres, apellidos, direccion, telefono, fecha_nacimiento) VALUES ( ?, ?, ?, ?, ?, ?);";
            parametro = (PreparedStatement) cn.conexionDB.prepareStatement(query);
            parametro.setString(1, getCodigo());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getFecha_nacimiento());
            parametro.setInt(7, getId_puesto());

            int executar = parametro.executeUpdate();
            retorno = executar;
            //System.out.println("Ingreso exitoso..." + Integer.toString(executar));
           // ESTA MALO @author balvarezJOptionPane.show("Ingreso exitoso..." + Integer.toString(executar));
             JOptionPane.showMessageDialog(null,"Ingreso Exitoso"  + Integer.toString(executar));
            cn.cerrar_conexion();
        }catch(SQLException ex){
            retorno = 0;
            JOptionPane.showMessageDialog(null,"Ingreso Exitoso"  + ex.getMessage());
            //System.out.println("Error en crear: "+ ex.getMessage());
        }
        return retorno;
    }
    
}
