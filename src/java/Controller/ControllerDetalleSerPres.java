/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Model.ConectaDB;
import Model.DetalleServicioPresupuesto;
import Model.Servicio;

import ModelDAO.DetalleServPresDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trece
 */
public class ControllerDetalleSerPres implements DetalleServPresDAO{
    PreparedStatement ps = null;
    ResultSet rs = null;
    ConectaDB conDB = null;
    Connection con = null;
    @Override
    public DetalleServicioPresupuesto consulta(String buscar) {
       DetalleServicioPresupuesto dtSer = new DetalleServicioPresupuesto();
        try {
            conDB = new ConectaDB();
            con = conDB.conexionDB();
            String sqlBuscarServicio = "SELECT id_Servicio,nombre_Servicio,descripcion_Servicio,"
                    + "precioPorMetro_Servicio WHERE nombre_Servicio = ?";
            ps = con.prepareStatement(sqlBuscarServicio);
            rs = ps.executeQuery();
            if(rs !=null && rs.next())
            {
                Servicio ser = new Servicio();
                ser.setId_Servicio(rs.getInt(1));
                ser.setNombre_Servicio(rs.getString(2));
                ser.setDescipcion_Servicio(rs.getString(3));
                ser.setPrecioPorMetro(rs.getDouble(4));
                dtSer.setServicioDetalle(ser);
                dtSer.setSubtotalDetalle(0);
                dtSer.setPrecioMetro(ser.getPrecioPorMetro());
                dtSer.setMetrosCuadradoDetalle(0);
                
            }
            
            
        } catch (SQLException ex) {
            System.out.println("Error setalle " + ex.getMessage());
            Logger.getLogger(ControllerDetalleSerPres.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
           try {
               con.close();
               rs.close();
               ps.close();
           } catch (SQLException ex) {
               System.out.println("Error setalle 2 " + ex.getMessage());
               Logger.getLogger(ControllerDetalleSerPres.class.getName()).log(Level.SEVERE, null, ex);
           }
        }
        return dtSer;
    }

}
