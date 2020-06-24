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
                ArrayList<Trabajador>guardarTrabajadores = new ArrayList<>();
                            String sqlTrabajadores = "SELECT p.id_Persona,p.nombre_Persona,p.apellidoPeterno_Persona,p.apellidoMaterno_Persona,\n" +
"p.fechaNacimiento_Persona ,p.sexo_Persona ,p.telefono_Persona ,p.correo_Persona,\n" +
"d.id_Direccion,d.pais_Direccion ,d.estado_Direccion ,d.municipio_Direccion,d.calle_Direccion ,\n" +
"d.colonia_Direccion,d.codigoPostal_Direccion ,d.numeroExterior_Direccion ,d.numeroInterior_Direccion ,\n" +
"t.id_Trabajador,t.Especialidad,t.diasTrabajoSemanaTrabajador, t.horasPorDiaTrabajadas,t.precioPorDiaTrabajado \n" +
"FROM Trabajador t INNER JOIN Persona p\n" +
"ON p.id_Persona=t.id_PersonaTabajador\n" +
"INNER JOIN Direccion d\n" +
"ON d.id_Direccion = p.id_DireccionPersonaFK";

                            String sqlTrabajador = "SELECT p.id_Persona,p.nombre_Persona,p.apellidoPeterno_Persona,p.apellidoMaterno_Persona,\n" +
"p.fechaNacimiento_Persona ,p.sexo_Persona ,p.telefono_Persona ,p.correo_Persona,\n" +
"d.id_Direccion,d.pais_Direccion ,d.estado_Direccion ,d.municipio_Direccion,d.calle_Direccion ,\n" +
"d.colonia_Direccion,d.codigoPostal_Direccion ,d.numeroExterior_Direccion ,d.numeroInterior_Direccion ,\n" +
"t.id_Trabajador,t.Especialidad,t.diasTrabajoSemanaTrabajador, t.horasPorDiaTrabajadas,t.precioPorDiaTrabajado \n" +
"FROM Trabajador t INNER JOIN Persona p\n" +
"ON p.id_Persona=t.id_PersonaTabajador\n" +
"INNER JOIN Direccion d\n" +
"ON d.id_Direccion = p.id_DireccionPersonaFK WHERE p.nombre_Persona LIKE ?";
        try {
            conDB = new ConectaDB();
            con = conDB.conexionDB();
            if(f.equals(""))
            {
                ps=con.prepareStatement(sqlTrabajadores);
            }else
            {
                ps = con.prepareStatement(sqlTrabajador);
                ps.setString(1, "%"+f+"%");
            }

            rs=ps.executeQuery();
            
            while(rs!=null && rs.next())
            {
                tra=new Trabajador();
                tra.getPerTrabajador().setId_Primary(rs.getInt("id_Persona"));
                tra.getPerTrabajador().setNombre_Persona(rs.getString("nombre_Persona"));
                tra.getPerTrabajador().setPaterno_Persona(rs.getString("apellidoPeterno_Persona"));
                tra.getPerTrabajador().setMaterno_Persona(rs.getString("apellidoMaterno_Persona"));
                tra.getPerTrabajador().setFechaNacimiento_Persona(rs.getString("fechaNacimiento_Persona"));
                tra.getPerTrabajador().setSexo_Persona(rs.getString("sexo_Persona"));
                tra.getPerTrabajador().setTelefono_Persona(rs.getString("telefono_Persona"));
                tra.getPerTrabajador().setCorreo_Persona(rs.getString("correo_Persona"));
                
                tra.getPerTrabajador().getDireccionPersona().setid_Direccion(rs.getInt("id_Direccion"));
                tra.getPerTrabajador().getDireccionPersona().setPais_Direccion(rs.getString("pais_Direccion"));
                tra.getPerTrabajador().getDireccionPersona().setEstado_Direccion(rs.getString("estado_Direccion"));
                tra.getPerTrabajador().getDireccionPersona().setMunicipio_Direccion(rs.getString("municipio_Direccion"));
                tra.getPerTrabajador().getDireccionPersona().setCalle_Direccion(rs.getString("calle_Direccion"));
                tra.getPerTrabajador().getDireccionPersona().setColonia_Direccion(rs.getString("colonia_Direccion"));
                tra.getPerTrabajador().getDireccionPersona().setCodigoPostal_Direccion(rs.getString("codigoPostal_Direccion"));
                tra.getPerTrabajador().getDireccionPersona().setNumeroExterior_Direccion(rs.getString("numeroExterior_Direccion"));
                tra.getPerTrabajador().getDireccionPersona().setNumeroInterior_Direccion(rs.getString("numeroInterior_Direccion"));
                           
                
                tra.setId_Trabajador(rs.getInt("id_Trabajador"));
                tra.setEspecialidad_Trabajador(rs.getString("Especialidad"));
                tra.setDiasTrabajoSemanaTrabajador(rs.getInt("diasTrabajoSemanaTrabajador"));
                tra.setHorasPorDiaTrabajadas(rs.getInt("horasPorDiaTrabajadas"));
                tra.setPrecioPorDiaTrabajado(rs.getDouble("precioPorDiaTrabajado"));
                

                
                guardarTrabajadores.add(tra);
            }
            
            
        } catch (SQLException ex) {
            System.out.println("err 44" + ex.getMessage());
            Logger.getLogger(ControllerTrabajador.class.getName()).log(Level.SEVERE, null, ex);
        }
    return guardarTrabajadores;    
    
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
    public boolean update(Trabajador tra) {
        try {
            
            conDB = new ConectaDB();
            con = conDB.conexionDB();
            String sqlUpdateDirection = "UPDATE Direccion SET pais_Direccion = ?, estado_Direccion = ?, municipio_Direccion = ?, calle_Direccion = ?,"
                    + " colonia_Direccion = ?, codigoPostal_Direccion = ?, numeroExterior_Direccion = ?, numeroInterior_Direccion = ?  WHERE id_Direccion = ? ";
            
            String sqlUpdatePerson = "UPDATE Persona SET nombre_Persona = ?, apellidoPeterno_Persona = ?, apellidoMaterno_Persona = ?, fechaNacimiento_Persona = ?,"
                    + " sexo_Persona = ?, telefono_Persona = ?, correo_Persona = ?, id_DireccionPersonaFK = ? WHERE id_Persona = ?";
            
            String sqlUpdateWorker = "UPDATE Trabajador SET Especialidad = ?, diasTrabajoSemanaTrabajador = ?, "
                    + "horasPorDiaTrabajadas = ?, precioPorDiaTrabajado = ? WHERE id_Trabajador = ?";

            ps = con.prepareStatement(sqlUpdateDirection);
            ps.setString(1, tra.getPerTrabajador().getDireccionPersona().getPais_Direccion());
            ps.setString(2, tra.getPerTrabajador().getDireccionPersona().getEstado_Direccion());
            ps.setString(3, tra.getPerTrabajador().getDireccionPersona().getMunicipio_Direccion());
            ps.setString(4, tra.getPerTrabajador().getDireccionPersona().getCalle_Direccion());
            ps.setString(5, tra.getPerTrabajador().getDireccionPersona().getColonia_Direccion());
            ps.setString(6, tra.getPerTrabajador().getDireccionPersona().getCodigoPostal_Direccion());
            ps.setString(7, tra.getPerTrabajador().getDireccionPersona().getNumeroExterior_Direccion());
            ps.setString(8, tra.getPerTrabajador().getDireccionPersona().getNumeroInterior_Direccion());
            ps.setInt(9, tra.getPerTrabajador().getDireccionPersona().getid_Direccion());
            ps.executeUpdate();
//            esperarXsegundos();

//            ps = con.prepareStatement("select last_insert_id() as ultimoDireccion");
//            rs = ps.executeQuery();
//            if (rs != null && rs.next()) {
//                tra.getPerTrabajador().getDireccionPersona().setid_Direccion(Integer.parseInt(rs.getString("ultimoDireccion")));
//            }

            ps = con.prepareStatement(sqlUpdatePerson);
            ps.setString(1, tra.getPerTrabajador().getNombre_Persona());
            ps.setString(2, tra.getPerTrabajador().getPaterno_Persona());
            ps.setString(3, tra.getPerTrabajador().getMaterno_Persona());
            ps.setString(4, tra.getPerTrabajador().getFechaNacimiento_Persona());
            ps.setString(5, tra.getPerTrabajador().getSexo_Persona());
            ps.setString(6, tra.getPerTrabajador().getTelefono_Persona());
            ps.setString(7, tra.getPerTrabajador().getCorreo_Persona());
            ps.setInt(8, tra.getPerTrabajador().getDireccionPersona().getid_Direccion());
            ps.setInt(9, tra.getPerTrabajador().getId_Primary());
            ps.executeUpdate();
//            esperarXsegundos();

//            ps = con.prepareStatement("select last_insert_id() as ultimaPerson");
//            rs = ps.executeQuery();
//            if (rs != null && rs.next()) {
//                tra.getPerTrabajador().setId_Primary(Integer.parseInt(rs.getString("ultimaPerson")));
//            }

            ps = con.prepareStatement(sqlUpdateWorker);
           
            ps.setString(1, tra.getEspecialidad_Trabajador());
            ps.setInt(2, tra.getDiasTrabajoSemanaTrabajador());
            ps.setInt(3, tra.getHorasPorDiaTrabajadas());
            ps.setDouble(4, tra.getPrecioPorDiaTrabajado());
             ps.setInt(5, tra.getId_Trabajador());
            ps.executeUpdate();
//            esperarXsegundos();

            return true;
        } catch (SQLException ex) {
             System.out.println("Err Update Workers cerradas " + ex.getMessage());
            Logger.getLogger(ControllerTrabajador.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            try {
                con.close();
                ps.close();
                
            } catch (SQLException ex) {
                
                System.out.println("Err conexiones cerradas " + ex.getMessage());
                Logger.getLogger(ControllerUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
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
