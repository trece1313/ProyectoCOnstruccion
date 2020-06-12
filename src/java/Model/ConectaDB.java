/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;



/**
 *
 * @author trece
 */
public class ConectaDB 
{
    Connection con=null;
    public Connection conexionDB()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConectaDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/PresupuestosConstruccion","root","");
        } catch (SQLException ex) {
            Logger.getLogger(ConectaDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
//    public static void main(String[] args) {
//        System.out.println(new ConectaDB().conexionDB());
//    }
    
}
