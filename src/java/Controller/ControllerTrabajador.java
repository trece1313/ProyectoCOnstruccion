/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.ConectaDB;
import Model.Trabajador;
import ModelDAO.TrabajadorDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trece
 */
public class ControllerTrabajador implements TrabajadorDAO
{

    PreparedStatement ps = null;
    ResultSet rs = null;
    ConectaDB conDB = null;
    Connection con = null;
    Trabajador tra=null;
    
    @Override
    public ArrayList<Trabajador> showAll() {
        ArrayList<Trabajador>saveWorkers = new ArrayList<>();
        try {
            conDB = new ConectaDB();
            con = conDB.conexionDB();
            
            String sqlWorkers = "SELECT p.id_Persona,p.nombre_Persona,\n" +
                                "p.apellidoPeterno_Persona,p.apellidoMaterno_Persona,\n" +
                                "t.id_Trabajador \n" +
                                "FROM Trabajador t INNER JOIN Persona p\n" +
                                "ON p.id_Persona=t.id_PersonaTabajador";
            
            
            ps=con.prepareStatement(sqlWorkers);
            rs=ps.executeQuery();
            
            while(rs!=null && rs.next())
            {
                tra=new Trabajador();
                tra.getPerTrabajador().setId_Primary(rs.getInt(1));
                tra.getPerTrabajador().setNombre_Persona(rs.getString(2));
                tra.getPerTrabajador().setPaterno_Persona(rs.getString(3));
                tra.getPerTrabajador().setMaterno_Persona(rs.getString(4));
                tra.setId_Trabajador(rs.getInt(5));
                saveWorkers.add(tra);
            }
            
            
        } catch (SQLException ex) {
            System.out.println("err 44" + ex.getMessage());
            Logger.getLogger(ControllerTrabajador.class.getName()).log(Level.SEVERE, null, ex);
        }
    return saveWorkers;    
    }

    @Override
    public ArrayList showDataCliente(String f) {
                ArrayList<Trabajador>saveWorkers = new ArrayList<>();
                            String sqlWorkers = "SELECT p.id_Persona,p.nombre_Persona,\n" +
                                "p.apellidoPeterno_Persona,p.apellidoMaterno_Persona,\n" +
                                "t.id_Trabajador \n" +
                                "FROM Trabajador t INNER JOIN Persona p\n" +
                                "ON p.id_Persona=t.id_PersonaTabajador";

                            String sqlOneWorker = "SELECT p.id_Persona,p.nombre_Persona,\n" +
                                "p.apellidoPeterno_Persona,p.apellidoMaterno_Persona,\n" +
                                "t.id_Trabajador \n" +
                                "FROM Trabajador t INNER JOIN Persona p\n" +
                                "ON p.id_Persona=t.id_PersonaTabajador WHERE p.nombre_Persona LIKE ?";
        try {
            conDB = new ConectaDB();
            con = conDB.conexionDB();
            if(f.equals(""))
            {
                ps=con.prepareStatement(sqlWorkers);
            }else
            {
                ps = con.prepareStatement(sqlOneWorker);
                ps.setString(1, "%"+f+"%");
            }

            rs=ps.executeQuery();
            
            while(rs!=null && rs.next())
            {
                tra=new Trabajador();
                tra.getPerTrabajador().setId_Primary(rs.getInt(1));
                tra.getPerTrabajador().setNombre_Persona(rs.getString(2));
                tra.getPerTrabajador().setPaterno_Persona(rs.getString(3));
                tra.getPerTrabajador().setMaterno_Persona(rs.getString(4));
                tra.setId_Trabajador(rs.getInt(5));
                saveWorkers.add(tra);
            }
            
            
        } catch (SQLException ex) {
            System.out.println("err 44" + ex.getMessage());
            Logger.getLogger(ControllerTrabajador.class.getName()).log(Level.SEVERE, null, ex);
        }
    return saveWorkers;    
    
    }

    @Override
    public boolean add(Trabajador tra) {
        try {
            conDB = new ConectaDB();
            con = conDB.conexionDB();

            String sqlDireccion = "INSERT INTO Direccion"
                    + "(pais_Direccion,estado_Direccion,municipio_Direccion,calle_Direccion,colonia_Direccion,"
                    + "codigoPostal_Direccion,numeroExterior_Direccion,numeroInterior_Direccion)VALUES(?,?,?,?,?,?,?,?)";

            String sqlPersona = "INSERT INTO Persona"
                    + "(nombre_Persona,apellidoPeterno_Persona,apellidoMaterno_Persona,fechaNacimiento_Persona,sexo_Persona,"
                    + "telefono_Persona,correo_Persona,id_DireccionPersonaFK)VALUES(?,?,?,?,?,?,?,?)";

            String sqlTrabajador = "INSERT INTO Trabajador(id_PersonaTabajador,Especialidad,diasTrabajoSemanaTrabajador,"
                                                        + "horasPorDiaTrabajadas,precioPorDiaTrabajado)VALUES(?,?,?,?,?)";

            

            ps = con.prepareStatement(sqlDireccion);
            ps.setString(1, tra.getPerTrabajador().getDireccionPersona().getPais_Direccion());
            ps.setString(2, tra.getPerTrabajador().getDireccionPersona().getEstado_Direccion());
            ps.setString(3, tra.getPerTrabajador().getDireccionPersona().getMunicipio_Direccion());
            ps.setString(4, tra.getPerTrabajador().getDireccionPersona().getCalle_Direccion());
            ps.setString(5, tra.getPerTrabajador().getDireccionPersona().getColonia_Direccion());
            ps.setString(6, tra.getPerTrabajador().getDireccionPersona().getCodigoPostal_Direccion());
            ps.setString(7, tra.getPerTrabajador().getDireccionPersona().getNumeroExterior_Direccion());
            ps.setString(8, tra.getPerTrabajador().getDireccionPersona().getNumeroInterior_Direccion());
            ps.executeUpdate();
//            esperarXsegundos();

            ps = con.prepareStatement("select last_insert_id() as ultimoDireccion");
            rs = ps.executeQuery();
            if (rs != null && rs.next()) {
                tra.getPerTrabajador().getDireccionPersona().setid_Direccion(Integer.parseInt(rs.getString("ultimoDireccion")));
            }

            ps = con.prepareStatement(sqlPersona);
            ps.setString(1, tra.getPerTrabajador().getNombre_Persona());
            ps.setString(2, tra.getPerTrabajador().getPaterno_Persona());
            ps.setString(3, tra.getPerTrabajador().getMaterno_Persona());
            ps.setString(4, tra.getPerTrabajador().getFechaNacimiento_Persona());
            ps.setString(5, tra.getPerTrabajador().getSexo_Persona());
            ps.setString(6, tra.getPerTrabajador().getTelefono_Persona());
            ps.setString(7, tra.getPerTrabajador().getCorreo_Persona());
            ps.setInt(8, tra.getPerTrabajador().getDireccionPersona().getid_Direccion());
            ps.executeUpdate();
//            esperarXsegundos();

            ps = con.prepareStatement("select last_insert_id() as ultimaPerson");
            rs = ps.executeQuery();
            if (rs != null && rs.next()) {
                tra.getPerTrabajador().setId_Primary(Integer.parseInt(rs.getString("ultimaPerson")));
            }

            ps = con.prepareStatement(sqlTrabajador);
            ps.setInt(1, tra.getPerTrabajador().getId_Primary());
            ps.setString(2, tra.getEspecialidad_Trabajador());
            ps.setInt(3, tra.getDiasTrabajoSemanaTrabajador());
            ps.setInt(4, tra.getHorasPorDiaTrabajadas());
            ps.setDouble(5, tra.getPrecioPorDiaTrabajado());
            ps.executeUpdate();
//            esperarXsegundos();

            return true;

        } catch (SQLException ex) {
            System.out.println("Err add User " + ex.getMessage());
            Logger.getLogger(ControllerUsuario.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            try {
                con.close();
                ps.close();
                rs.close();
            } catch (SQLException ex) {
                System.out.println("Err conexiones cerradas " + ex.getMessage());
                Logger.getLogger(ControllerUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    @Override
    public boolean update(Trabajador t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Trabajador t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Trabajador adds(Trabajador t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
