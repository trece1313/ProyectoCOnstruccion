/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Model.ConectaDB;
import Model.Obra;
import Model.Trabajador;

import ModelDAO.ObraDAO;
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
public class ControllerObra implements ObraDAO
{
    PreparedStatement ps = null;
    ResultSet rs = null;
    ConectaDB conDB = null;
    Connection con = null;
    Trabajador tra=null;

    @Override
    public ArrayList<Obra> showDataCliente(String f) {
       
                ArrayList<Obra>saveObra = new ArrayList<>();
        try {
            conDB = new ConectaDB();
            con = conDB.conexionDB();
            
                            String sqlMostrarObra = "SELECT o.id_Obra,\n" +
                            "pc.nombre_Persona,pc.apellidoPeterno_Persona,dirPerCliente.pais_Direccion,dirPerCliente.estado_Direccion,\n" +
                            "\n" +
                            "pt.nombre_Persona,pt.apellidoPeterno_Persona,dirPerTrabajador.pais_Direccion,dirPerTrabajador.estado_Direccion,\n" +
                            "pu.nombre_Persona,pu.apellidoPeterno_Persona,dirPerUsuario.pais_Direccion,dirPerUsuario.estado_Direccion\n" +
                            "FROM Obra o\n" +
                            "\n" +
                            "INNER JOIN Cliente c \n" +
                            "ON o.id_ClienteObraFK = c.id_Cliente \n" +
                            "INNER JOIN Persona pc\n" +
                            "ON pc.id_Persona  = c.id_PersonaClienteFK\n" +
                            "INNER JOIN Direccion dirPerCliente\n" +
                            "ON dirPerCliente.id_Direccion = pc.id_DireccionPersonaFK \n" +
                            "\n" +
                            "INNER JOIN Trabajador t \n" +
                            "ON t.id_Trabajador = o.id_TrabajadorObraFK\n" +
                            "INNER JOIN Persona pt\n" +
                            "ON pt.id_Persona = t.id_PersonaTabajador\n" +
                            "INNER JOIN Direccion dirPerTrabajador\n" +
                            "ON dirPerTrabajador.id_Direccion = pt.id_DireccionPersonaFK \n" +
                            "\n" +
                            "INNER JOIN Usuario u \n" +
                            "ON u.id_Usuario = o.id_UsuarioObra \n" +
                            "INNER JOIN Persona pu\n" +
                            "ON u.id_PersonaFK = pu.id_Persona\n" +
                            "INNER JOIN Direccion dirPerUsuario\n" +
                            "ON dirPerUsuario.id_Direccion = pu.id_DireccionPersonaFK ";

                            String sqlMostrarUnaObra = "SELECT o.id_Obra,\n" +
                            "pc.nombre_Persona,pc.apellidoPeterno_Persona,dirPerCliente.pais_Direccion,dirPerCliente.estado_Direccion,\n" +
                            "\n" +
                            "pt.nombre_Persona,pt.apellidoPeterno_Persona,dirPerTrabajador.pais_Direccion,dirPerTrabajador.estado_Direccion,\n" +
                            "pu.nombre_Persona,pu.apellidoPeterno_Persona,dirPerUsuario.pais_Direccion,dirPerUsuario.estado_Direccion\n" +
                            "FROM Obra o\n" +
                            "\n" +
                            "INNER JOIN Cliente c \n" +
                            "ON o.id_ClienteObraFK = c.id_Cliente \n" +
                            "INNER JOIN Persona pc\n" +
                            "ON pc.id_Persona  = c.id_PersonaClienteFK\n" +
                            "INNER JOIN Direccion dirPerCliente\n" +
                            "ON dirPerCliente.id_Direccion = pc.id_DireccionPersonaFK \n" +
                            "\n" +
                            "INNER JOIN Trabajador t \n" +
                            "ON t.id_Trabajador = o.id_TrabajadorObraFK\n" +
                            "INNER JOIN Persona pt\n" +
                            "ON pt.id_Persona = t.id_PersonaTabajador\n" +
                            "INNER JOIN Direccion dirPerTrabajador\n" +
                            "ON dirPerTrabajador.id_Direccion = pt.id_DireccionPersonaFK \n" +
                            "\n" +
                            "INNER JOIN Usuario u \n" +
                            "ON u.id_Usuario = o.id_UsuarioObra \n" +
                            "INNER JOIN Persona pu\n" +
                            "ON u.id_PersonaFK = pu.id_Persona\n" +
                            "INNER JOIN Direccion dirPerUsuario\n" +
                            "ON dirPerUsuario.id_Direccion = pu.id_DireccionPersonaFK  WHERE pc.nombre_Persona LIKE ?";
            if(f.equals(""))
            {
                ps = con.prepareStatement(sqlMostrarObra);
                
            }else
            {
                ps = con.prepareStatement(sqlMostrarUnaObra);
                ps.setString(1, "%"+f+"%");
            }
            rs = ps.executeQuery();
            while(rs != null && rs.next())
            {
                Obra obr = new Obra();
                obr.setId_Obra(rs.getInt("id_Obra"));
                obr.getClienteObra().getPersonaCliente().setNombre_Persona(rs.getString(2));
                obr.getClienteObra().getPersonaCliente().setPaterno_Persona(rs.getString(3));
                obr.getClienteObra().getPersonaCliente().getDireccionPersona().setPais_Direccion(rs.getString(4));
                obr.getClienteObra().getPersonaCliente().getDireccionPersona().setEstado_Direccion(rs.getString(5));
                
                obr.getTrabObra().getPerTrabajador().setNombre_Persona(rs.getString(6));
                obr.getTrabObra().getPerTrabajador().setPaterno_Persona(rs.getString(7));
                obr.getClienteObra().getPersonaCliente().getDireccionPersona().setPais_Direccion(rs.getString(8));
                obr.getClienteObra().getPersonaCliente().getDireccionPersona().setEstado_Direccion(rs.getString(9));
                
                obr.getUsrObra().getPersonaUsuario().setNombre_Persona(rs.getString(10));
                obr.getUsrObra().getPersonaUsuario().setPaterno_Persona(rs.getString(11));
                obr.getClienteObra().getPersonaCliente().getDireccionPersona().setPais_Direccion(rs.getString(12));
                obr.getClienteObra().getPersonaCliente().getDireccionPersona().setEstado_Direccion(rs.getString(13));
                saveObra.add(obr);
            }
            
        } catch (SQLException ex) {
            System.out.println("Cual error " + ex.getMessage());
            Logger.getLogger(ControllerPresupuesto.class.getName()).log(Level.SEVERE, null, ex);
        }finally
        {
            try {
                con.close();
                ps.close();
                ps.close();
            } catch (SQLException ex) {
                System.out.println("cerrar conexion Obra " + ex.getMessage());
                Logger.getLogger(ControllerObra.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        return saveObra;
    }

    @Override
    public ArrayList<Obra> showAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Obra t) {
      
        conDB = new ConectaDB();
        con = conDB.conexionDB();
        
        String sqlObra = "INSERT INTO Obra(id_TrabajadorObraFK,id_ClienteObraFK,"
               + "id_UsuarioObra,fechaInicio_Obra,fechaFin_Obra,total_Obra,pagoInicial,"
               + "pagoFinal,fechaCotizacionObra)VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sqlObra);
            ps.setInt(1, t.getTrabObra().getId_Trabajador());
            ps.setInt(2, t.getClienteObra().getId_Cliente());
            ps.setInt(3, t.getUsrObra().getId());
            ps.setString(4, t.getFechaInicio_Obra());
            ps.setString(5, t.getFechaFin_Obra());
            ps.setDouble(6, t.getTotal_Obra());
            ps.setDouble(7, t.getPagoInicioObra());
            ps.setDouble(8, t.getPagoFinalObra());
            ps.setString(9, t.getFechaCotizacionObra());
            ps.executeUpdate();
            return true;
            
            
        } catch (SQLException ex) {
            System.out.println("err Obra Add "+ex.getMessage());
            Logger.getLogger(ControllerObra.class.getName()).log(Level.SEVERE, null, ex);
        }finally
        {
            try {
                con.close();
                ps.close();
            } catch (SQLException ex) {
                System.out.println("cerrar conexion Obra " + ex.getMessage());
                Logger.getLogger(ControllerObra.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        return false;
    }

    @Override
    public boolean update(Obra t) {
       throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Obra t) {
          throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
         
    }

    @Override
    public Obra adds(Obra t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
