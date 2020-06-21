/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.ConectaDB;
import Model.Servicio;
import ModelDAO.ServicioDAO;
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
public class ControllerServicio implements ServicioDAO{
    PreparedStatement ps = null;
    ResultSet rs = null;
    ConectaDB conDB = null;
    Connection con = null;
    
    @Override
    public ArrayList<Servicio> showDataCliente(String f) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Servicio> showAll() {
        ArrayList<Servicio> saveService = new ArrayList<>();
        try {
            conDB = new ConectaDB();
            con = conDB.conexionDB();
            
            String sqlSaveService = "SELECT id_Servicio,nombre_Servicio,descripcion_Servicio,precioPorMetro_Servicio "
                    + " FROM Servicio";
            ps = con.prepareStatement(sqlSaveService);
            rs = ps.executeQuery();
            while(rs!=null && rs.next())
            {
                Servicio serv = new Servicio();
                serv.setId_Servicio(rs.getInt("id_Servicio"));
                serv.setNombre_Servicio(rs.getString("nombre_Servicio"));
                serv.setDescipcion_Servicio(rs.getString("descripcion_Servicio"));
                serv.setPrecioPorMetro(rs.getDouble("precioPorMetro_Servicio"));
                saveService.add(serv);
            }
            
            
        } catch (SQLException ex) {
            System.out.println("Error save Service line 56 method showALl ArrayList ControllerService "+ ex.getMessage());
            
            Logger.getLogger(ControllerServicio.class.getName()).log(Level.SEVERE, null, ex);
        }finally
        {
            try {
                con.close();
                ps.close();
                rs.close();
            } catch (SQLException ex) {
                 System.out.println("Error closed connection Service line 65 method showALl ArrayList ControllerService "+ ex.getMessage());
                Logger.getLogger(ControllerServicio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return saveService;
    }

    @Override
    public boolean add(Servicio ser) {
        try {
            String sqlServicio = "INSERT INTO Servicio(nombre_Servicio,descripcion_Servicio,precioPorMetro_Servicio)VALUES(?,?,?)";
            conDB = new ConectaDB();
            con = conDB.conexionDB();
            
            ps= con.prepareStatement(sqlServicio);
            ps.setString(1, ser.getNombre_Servicio());
            ps.setString(2, ser.getDescipcion_Servicio());
            ps.setDouble(3, ser.getPrecioPorMetro());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
             System.out.println("Error save Service line 44 method showALl ArrayList ControllerService "+ ex.getMessage());
            Logger.getLogger(ControllerServicio.class.getName()).log(Level.SEVERE, null, ex);
        }finally
        {
            try {
                con.close();
                ps.close();
            } catch (SQLException ex) {
                 System.out.println("Error closed connection line 71 method showALl ArrayList ControllerService "+ ex.getMessage());
                Logger.getLogger(ControllerServicio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
        
    }

    @Override
    public boolean update(Servicio serUpdate) {
       
        try {
            String sqlServicio = "UPDATE Servicio SET nombre_Servicio = ? ,descripcion_Servicio = ? ,precioPorMetro_Servicio = ? WHERE id_Servicio = ?";
            conDB = new ConectaDB();
            con = conDB.conexionDB();
            
            ps= con.prepareStatement(sqlServicio);
            ps.setString(1, serUpdate.getNombre_Servicio());
            ps.setString(2, serUpdate.getDescipcion_Servicio());
            ps.setDouble(3, serUpdate.getPrecioPorMetro());
            ps.setDouble(4, serUpdate.getId_Servicio());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
             System.out.println("Error save Service line 44 method showALl ArrayList ControllerService "+ ex.getMessage());
            Logger.getLogger(ControllerServicio.class.getName()).log(Level.SEVERE, null, ex);
        }finally
        {
            try {
                con.close();
                ps.close();
            } catch (SQLException ex) {
                 System.out.println("Error closed connection line 71 method showALl ArrayList ControllerService "+ ex.getMessage());
                Logger.getLogger(ControllerServicio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    @Override
    public boolean delete(Servicio serUpdate) {
       
         throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Servicio adds(Servicio t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

     
}
