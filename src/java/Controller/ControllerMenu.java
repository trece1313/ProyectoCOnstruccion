/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import ModelDAO.MenuDAO;
import Model.ConectaDB;
import Model.Menu;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trece
 */
public class ControllerMenu implements MenuDAO{
    PreparedStatement ps = null;
    ResultSet rs = null;
    ConectaDB conDB = null;
    Connection con = null;

    @Override
    public ArrayList<Menu> showAll() {
              ArrayList<Menu>saveMenu = new ArrayList<>();
        try 
        {
            conDB = new ConectaDB();
            con = conDB.conexionDB();
            
            String sQL="SELECT id_Menu,nombre_Menu,activo_Menu FROM Menu";
            ps = con.prepareStatement(sQL);
            rs = ps.executeQuery();
            
            while(rs !=null && rs.next())
            {
                Menu menu=new Menu();
                menu.setId_Menu(Integer.parseInt(rs.getString(1)));
                menu.setNombre_Menu(rs.getString(2));
                menu.setActivo_Menu(Integer.parseInt(rs.getString(3)));
                saveMenu.add(menu);
            }
            
        } catch (SQLException ex) 
        {
            System.out.println("err " +ex.getMessage());
            Logger.getLogger(ControllerMenu.class.getName()).log(Level.SEVERE, null, ex);
        }finally
        {
                  try {
                      rs.close();
                      ps.close();
                      con.close();
                  } catch (SQLException ex) {
                      System.out.println("error conexion Menu "+ex.getMessage());
                      Logger.getLogger(ControllerMenu.class.getName()).log(Level.SEVERE, null, ex);
                  }
        }
    return saveMenu;
    }
    
    public static void main(String[] args) {
        ArrayList<Menu>s;
        
        s=new ControllerMenu().showAll();
        
        for (Menu me : s) {
            System.out.println(me.getId_Menu());
            System.out.println(me.getNombre_Menu());
            System.out.println(me.getActivo_Menu());
        }
    }

    @Override
    public ArrayList<Menu> showDataCliente(String f) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Menu t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Menu t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Menu t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
