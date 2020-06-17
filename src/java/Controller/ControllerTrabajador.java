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
            
            String sqlWorkers = "SELECT p.id_Persona,p.nombre_Persona,"
                    + "p.apellidoPeterno_Persona,p.apellidoMaterno_Persona "
                    + "FROM Trabajador t INNER JOIN Persona p "
                    + "ON p.id_Persona=t.id_Trabajador ";
            ps=con.prepareStatement(sqlWorkers);
            rs=ps.executeQuery();
            
            while(rs!=null && rs.next())
            {
                tra=new Trabajador();
                tra.getPerTrabajador().setId_Primary(rs.getInt(1));
                tra.getPerTrabajador().setNombre_Persona(rs.getString(2));
                tra.getPerTrabajador().setPaterno_Persona(rs.getString(3));
                tra.getPerTrabajador().setMaterno_Persona(rs.getString(4));
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Object t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Object t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Object t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
