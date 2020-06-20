/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Cliente;
import Model.ConectaDB;
import Model.Obra;
import Model.Trabajador;
import Model.Usuario;
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
