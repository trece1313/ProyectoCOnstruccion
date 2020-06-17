/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Cliente;
import Model.ConectaDB;
import ModelDAO.ClienteDAO;
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
public class ControllerCliente implements ClienteDAO{
    
   
    PreparedStatement ps = null;
    ResultSet rs = null;
    ConectaDB conDB = null;
    Connection con = null; 
    
    @Override
    public ArrayList<Cliente> showDataCliente(String fil) {
        
        ArrayList<Cliente>saveDataCLient = new ArrayList<>();
        try {
            
            conDB = new ConectaDB();
            String sqlClient = "SELECT d.id_Direccion ,d.pais_Direccion ,d.estado_Direccion ,\n" +
                    "	   p.id_Persona,p.nombre_Persona,p.apellidoPeterno_Persona,p.apellidoMaterno_Persona,c.id_Cliente \n" +
                    "                    FROM Direccion d INNER JOIN Persona p \n" +
                    "                    ON d.id_Direccion =p.id_DireccionPersonaFK \n" +
                    "                    INNER JOIN Cliente c\n" +
                    "                    ON c.id_PersonaClienteFK = p.id_Persona ";
            
            String sqlClientFil = "SELECT d.id_Direccion ,d.pais_Direccion ,d.estado_Direccion ,\n" +
                    "	   p.id_Persona,p.nombre_Persona,p.apellidoPeterno_Persona,p.apellidoMaterno_Persona,c.id_Cliente \n" +
                    "                    FROM Direccion d INNER JOIN Persona p \n" +
                    "                    ON d.id_Direccion =p.id_DireccionPersonaFK \n" +
                    "                    INNER JOIN Cliente c\n" +
                    "                    ON c.id_PersonaClienteFK = p.id_Persona WHERE c.id_PersonaClienteFK = ? ";
            
            con = conDB.conexionDB();
            
            if(fil.equals(""))
            {
             ps = con.prepareStatement(sqlClient);
            }
            else
            {
            ps = con.prepareStatement(sqlClientFil);
            ps.setString(1, fil);
            }
            rs = ps.executeQuery();
            
            while(rs!=null && rs.next())
            {
                Cliente cli = new Cliente();
                cli.getPersonaCliente().getDireccionPersona().setid_Direccion(rs.getInt(1));
                cli.getPersonaCliente().getDireccionPersona().setPais_Direccion(rs.getString(2));
                cli.getPersonaCliente().getDireccionPersona().setEstado_Direccion(rs.getString(3));
                cli.getPersonaCliente().setId_Primary(rs.getInt(4));
                cli.getPersonaCliente().setNombre_Persona(rs.getString(5));
                cli.getPersonaCliente().setPaterno_Persona(rs.getString(6));
                cli.getPersonaCliente().setMaterno_Persona(rs.getString(7));
                cli.setId_Cliente(rs.getInt(8));
                saveDataCLient.add(cli);
                
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ControllerCliente.class.getName()).log(Level.SEVERE, null, ex);
        }finally
        {
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ControllerCliente.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
          return saveDataCLient;
 
    }

    @Override
    public ArrayList showAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Cliente t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Cliente t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Cliente t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
