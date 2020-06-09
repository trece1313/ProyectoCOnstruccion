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
  
        }
        finally
        {
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
    	private void esperarXsegundos() {
		try {
			Thread.sleep( 3000);
		} catch (InterruptedException ex) {
			Thread.currentThread().interrupt();
		}
	}

    @Override
    public Usuario accesarUser(String u, String p) {
         Usuario usr=new Usuario();
        try {
           
            String sqlAccesoUsuario = "SELECT \n" +
                    "u.id_Usuario,u.userName, u.passwordUsuario,u.activo_Usuario,\n" +
                    "r.id_Rol,r.nombre_Rol,r.activo_Rol,\n" +
                    "p.id_Persona,p.nombre_Persona,p.apellidoPeterno_Persona,p.apellidoMaterno_Persona,\n" +
                    "dir.id_Direccion ,dir.pais_Direccion ,dir.estado_Direccion,dir.municipio_Direccion\n" +
                    "FROM Usuario u \n" +
                    "INNER JOIN Persona p\n" +
                    "ON u.id_PersonaFK =p.id_Persona\n" +
                    "INNER JOIN Direccion dir\n" +
                    "ON dir.id_Direccion = p.id_DireccionPersonaFK \n" +
                    "INNER JOIN Rol r\n" +
                    "ON r.id_Rol = u.id_RolUsuarioFK \n" +
                    "WHERE u.userName = ? && U.passwordUsuario = ? && u.activo_Usuario = 1 , && r.activo_Rol = 1";
            
            con=conDB.conexionDB();
            ps=con.prepareStatement(sqlAccesoUsuario);
            ps.setString(1, u);
            ps.setString(2, p);
            rs=ps.executeQuery();
            esperarXsegundos();
            
            if(rs != null && rs.next())
            {
                usr.setId(rs.getInt("id_Usuario"));
                usr.setUserName(rs.getString("userName"));
                usr.setUserName(rs.getString("passwordUsuario"));
                usr.setUserName(rs.getString("activo_Usuario"));
                
                usr.getRolUsuario().setId_Rol(rs.getInt("id_Rol"));
                usr.getRolUsuario().setNombre_Rol(rs.getString("nombre_Rol"));
                usr.getRolUsuario().setActivo_Rol(rs.getInt("activo_Rol"));
                
                usr.getPersonaUsuario().setId_Primary(rs.getInt("id_Persona"));
                usr.getPersonaUsuario().setNombre_Persona(rs.getString("nombre_Persona"));
                usr.getPersonaUsuario().setPaterno_Persona(rs.getString("apellidoPeterno_Persona"));
                usr.getPersonaUsuario().setMaterno_Persona(rs.getString("apellidoMaterno_Persona"));
         
                
                usr.getPersonaUsuario().getDireccionPersona().setid_Direccion(rs.getInt("id_Direccion"));
                usr.getPersonaUsuario().getDireccionPersona().setPais_Direccion(rs.getString("pais_Direccion"));
                usr.getPersonaUsuario().getDireccionPersona().setEstado_Direccion(rs.getString("estado_Direccion"));
                usr.getPersonaUsuario().getDireccionPersona().setMunicipio_Direccion(rs.getString("municipio_Direccion"));
                                
                ps = con.prepareStatement("SELECT id_MenuFK FROM Permiso WHERE id_RolFK = ?");
                ps.setInt(1, usr.getRolUsuario().getId_Rol());
                rs=ps.executeQuery();
                while(rs != null && rs.next())
                {
                    usr.getRolUsuario().getPermisos().add(rs.getInt("id_MenuFK"));
                }
            }
            
            
        } catch (SQLException ex) {
            System.out.println("No esta bien mi consultra " + ex.getMessage());
            Logger.getLogger(ControllerUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
             try {
                 rs.close();
                 ps.close();
                 con.close();
             } catch (SQLException ex) {
                 Logger.getLogger(ControllerUsuario.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
     return usr;   
    }
    

    
}
