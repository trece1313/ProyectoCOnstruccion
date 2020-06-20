/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.ConectaDB;
import Model.Usuario;
import ModelDAO.UsuarioDAO;
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
public class ControllerUsuario implements UsuarioDAO
{

    PreparedStatement ps = null;
    ResultSet rs = null;
    ConectaDB conDB = null;
    Connection con = null;

    

    @Override
    public Usuario accesarUser(String u, String p) {
         Usuario usr=new Usuario();
        try {
            conDB = new ConectaDB();
           
            String sqlAccesoUsuario = "SELECT  \n" +
"                    u.id_Usuario,u.userName, u.passwordUsuario,u.activo_Usuario, \n" +
"                    r.id_Rol,r.nombre_Rol,r.activo_Rol, \n" +
"                    p.id_Persona,p.nombre_Persona,p.apellidoPeterno_Persona,p.apellidoMaterno_Persona, \n" +
"                    dir.id_Direccion ,dir.pais_Direccion ,dir.estado_Direccion,dir.municipio_Direccion \n" +
"                    FROM Usuario u  \n" +
"                    INNER JOIN Persona p \n" +
"                    ON u.id_PersonaFK =p.id_Persona \n" +
"                    INNER JOIN Direccion dir \n" +
"                    ON dir.id_Direccion = p.id_DireccionPersonaFK  \n" +
"                    INNER JOIN Rol r \n" +
"                    ON r.id_Rol = u.id_RolUsuarioFK  \n" +
"                    WHERE u.userName = ? && u.passwordUsuario = ? \n" +
"                    && u.activo_Usuario = 1 && r.activo_Rol = 1";
            
            
            con = conDB.conexionDB();
            ps=con.prepareStatement(sqlAccesoUsuario);
            ps.setString(1, u);
            ps.setString(2, p);
            rs=ps.executeQuery();
//            esperarXsegundos();
            
            if(rs != null && rs.next())
            {
                usr.setId(rs.getInt("id_Usuario"));
                usr.setUserName(rs.getString("userName"));
                usr.setPassUsuario(rs.getString("passwordUsuario"));
                usr.setActivo(rs.getInt("activo_Usuario"));
                
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
        }        finally
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

     return usr;   
    }
    
//    public static void main(String[] args) {
//        
//        ControllerUsuario cu=new ControllerUsuario();
//        Direccion dir=new Direccion();
//        Persona per=new Persona();
//        Rol rol=new Rol();
//        Usuario user = new Usuario();
//        
//                user.setUserName("UserName");
//                user.setPassUsuario("123");
//                user.setActivo(1);
//                
//                per.setNombre_Persona("Nombre");
//                per.setPaterno_Persona("Paterno");
//                per.setMaterno_Persona("Materno");
//                per.setFechaNacimiento_Persona("2020-10-10");
//                per.setSexo_Persona("Sexo");
//                per.setTelefono_Persona("Telefono");
//                per.setCorreo_Persona("FechaNacimiento");
//                
//                 dir.setPais_Direccion("Pais");
//                 dir.setEstado_Direccion("Estado");
//                 dir.setMunicipio_Direccion("Municipio");
//                 dir.setCalle_Direccion("Calle");
//                 dir.setColonia_Direccion("Colonia");
//                 dir.setCodigoPostal_Direccion("CodigoPostal");
//                 dir.setNumeroExterior_Direccion("NumeroExterior");
//                 dir.setNumeroInterior_Direccion("NumeroInterior");
//                
//                 rol.setNombre_Rol("Rol");
//                
//                 for (int i = 0; i < rol.getPermisos().size(); i++) {
//                       rol.getPermisos().add(1);
//        }
//                 
//                   
//                   System.out.println(cu.addUser(dir, per, user, rol)?"si":"no");
//                        
//                
//        
//    }
//    

    @Override
    public ArrayList showDataCliente(String f) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList showAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    	private void esperarXsegundos() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException ex) {
			Thread.currentThread().interrupt();
		}
    }

    @Override
    public boolean add(Usuario usr) {
                     try {
            conDB = new ConectaDB();
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
            ps.setString(1, usr.getPersonaUsuario().getDireccionPersona().getPais_Direccion());
            ps.setString(2, usr.getPersonaUsuario().getDireccionPersona().getEstado_Direccion());
            ps.setString(3, usr.getPersonaUsuario().getDireccionPersona().getMunicipio_Direccion());
            ps.setString(4, usr.getPersonaUsuario().getDireccionPersona().getCalle_Direccion());
            ps.setString(5, usr.getPersonaUsuario().getDireccionPersona().getColonia_Direccion());
            ps.setString(6, usr.getPersonaUsuario().getDireccionPersona().getCodigoPostal_Direccion());
            ps.setString(7, usr.getPersonaUsuario().getDireccionPersona().getNumeroExterior_Direccion());
            ps.setString(8, usr.getPersonaUsuario().getDireccionPersona().getNumeroInterior_Direccion());
            ps.executeUpdate();
            esperarXsegundos();
            
            ps=con.prepareStatement("select last_insert_id() as ultimoDireccion");
            rs=ps.executeQuery();
            if(rs != null && rs.next())
            {
                usr.getPersonaUsuario().getDireccionPersona().setid_Direccion(Integer.parseInt(rs.getString("ultimoDireccion")));
            }
            
            ps=con.prepareStatement(sqlPersona);
            ps.setString(1, usr.getPersonaUsuario().getNombre_Persona());
            ps.setString(2, usr.getPersonaUsuario().getPaterno_Persona());
            ps.setString(3, usr.getPersonaUsuario().getMaterno_Persona());
            ps.setString(4, usr.getPersonaUsuario().getFechaNacimiento_Persona());
            ps.setString(5, usr.getPersonaUsuario().getSexo_Persona());
            ps.setString(6, usr.getPersonaUsuario().getTelefono_Persona());
            ps.setString(7, usr.getPersonaUsuario().getCorreo_Persona());
            ps.setInt(8, usr.getPersonaUsuario().getDireccionPersona().getid_Direccion());
            ps.executeUpdate();
           esperarXsegundos();
            
            ps = con.prepareStatement("select last_insert_id() as ultimaPerson");
            rs = ps.executeQuery();
            if (rs != null && rs.next()) {
                usr.getPersonaUsuario().setId_Primary(Integer.parseInt(rs.getString("ultimaPerson")));
            }
            
            ps=con.prepareStatement(sqlRol);
            ps.setString(1, usr.getRolUsuario().getNombre_Rol());
            ps.executeUpdate();
           esperarXsegundos();
            
            ps=con.prepareStatement("select last_insert_id() as ultimoRol");
            rs=ps.executeQuery();
            if(rs != null && rs.next())
            {
                usr.getRolUsuario().setId_Rol(Integer.parseInt(rs.getString("ultimoRol")));
            }
            
            ps=con.prepareStatement(sqlUsuario);
            ps.setString(1, usr.getUserName());
            ps.setString(2, usr.getPassUsuario());
            ps.setInt(3, usr.getActivo());
            ps.setInt(4, usr.getRolUsuario().getId_Rol());
            ps.setInt(5, usr.getPersonaUsuario().getId_Primary());
            ps.executeUpdate();
            esperarXsegundos();

            for (int i = 0; i < usr.getRolUsuario().getPermisos().size(); i++) {
                
                ps = con.prepareStatement("insert into Permiso(id_MenuFK,id_RolFK) values(?,?)");
                ps.setInt(1, usr.getRolUsuario().getPermisos().get(i));
                ps.setInt(2, usr.getRolUsuario().getId_Rol());
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

    @Override
    public boolean update(Usuario t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Usuario t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Usuario adds(Usuario t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
