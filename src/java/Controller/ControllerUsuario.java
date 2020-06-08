/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.ConectaDB;
import Model.Direccion;
import Model.Persona;
import Model.Rol;
import Model.Usuario;
import ModelDAO.UsuarioDAO;
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
public class ControllerUsuario implements UsuarioDAO
{

    PreparedStatement ps = null;
    ResultSet rs = null;
    ConectaDB conDB = null;
    Connection con = null;

    @Override
    public boolean addUser(Direccion dir, Persona per, Usuario usr, Rol r) 
    {
        
        try {
            con=conDB.conexionDB();
            
            String sqlDireccion = "INSERT INTO Direccion"
                    +"(pais_Direccion,estado_Direccion,municipio_Direccion,calle_Direccion,colonia_Direccion,"
                    +"codigoPostal_Direccion,numeroExterior_Direccion,numeroInterior_Direccion)VALUES(?,?,?,?,?,?,?,?)";
            
            String sqlPersona = "INSERT INTO Persona"
                    +"(nombre_Persona,apellidoPeterno_Persona,apellidoMaterno_Persona,fechaNacimiento_Persona,sexo_Persona,"
                    +"telefono_Persona,correo_Persona,id_DireccionPersonaFK)VALUES(?,?,?,?,?,?,?,?)";
            
            String sqlRol = "INSERT INTO Rol(nombre_Rol)VALUES(?)";
            
            String sqlUsuario = "INSERT INTO Usuario(userName,passwordUsuario,activo_Usuario,"
                    +"id_RolUsuarioFK,id_PersonaFK)VALUES(?,?,?,?,?)";
            
            ps=con.prepareStatement(sqlDireccion);
            ps.setString(1, dir.getPais_Direccion());
            ps.setString(2, dir.getEstado_Direccion());
            ps.setString(3, dir.getMunicipio_Direccion());
            ps.setString(4, dir.getCalle_Direccion());
            ps.setString(5, dir.getColonia_Direccion());
            ps.setString(6, dir.getCodigoPostal_Direccion());
            ps.setString(7, dir.getNumeroExterior_Direccion());
            ps.setString(8, dir.getNumeroInterior_Direccion());
            ps.executeUpdate();
            esperarXsegundos();
            
            ps=con.prepareStatement("select last_insert_id() as ultimoDireccion");
            rs=ps.executeQuery();
            if(rs != null && rs.next())
            {
                dir.setid_Direccion(Integer.parseInt(rs.getString("ultimoDireccion")));
            }
            
            ps=con.prepareStatement(sqlPersona);
            ps.setString(1, per.getNombre_Persona());
            ps.setString(2, per.getPaterno_Persona());
            ps.setString(3, per.getMaterno_Persona());
            ps.setString(4, per.getFechaNacimiento_Persona());
            ps.setString(5, per.getSexo_Persona());
            ps.setString(6, per.getTelefono_Persona());
            ps.setString(7, per.getCorreo_Persona());
            ps.setInt(8, dir.getid_Direccion());
            ps.executeUpdate();
            esperarXsegundos();
            
            ps = con.prepareStatement("select last_insert_id() as ultimaPerson");
            rs = ps.executeQuery();
            if (rs != null && rs.next()) {
                per.setId_Primary(Integer.parseInt(rs.getString("ultimaPerson")));
            }
            
            ps=con.prepareStatement(sqlRol);
            ps.setString(1, r.getNombre_Rol());
            ps.executeUpdate();
            esperarXsegundos();
            
            ps=con.prepareStatement("select last_insert_id() as ultimoRol");
            rs=ps.executeQuery();
            if(rs != null && rs.next())
            {
                r.setId_Rol(Integer.parseInt(rs.getString("ultimoRol")));
            }
            
            ps=con.prepareStatement(sqlUsuario);
            ps.setString(1, usr.getUserName());
            ps.setString(2, usr.getPassUsuario());
            ps.setInt(3, r.getId_Rol());
            ps.setInt(4, per.getId_Primary());
            ps.executeUpdate();
            esperarXsegundos();
            
            for (int i = 0; i < r.getPermisos().size(); i++) {
                
                ps = con.prepareStatement("insert into Permiso(id_MenuFK,id_RolFK) values(?,?)");
                ps.setInt(1, r.getId_Rol());
                ps.setInt(2, r.getPermisos().get(i));
                ps.executeUpdate();

            }
            
            return true;
            
        } catch (SQLException ex) {
            System.out.println("Err add User " + ex.getMessage());
            Logger.getLogger(ControllerUsuario.class.getName()).log(Level.SEVERE, null, ex);
        return false;
        }

    }
    	private void esperarXsegundos() {
		try {
			Thread.sleep( 3000);
		} catch (InterruptedException ex) {
			Thread.currentThread().interrupt();
		}
	}
    

    
}
