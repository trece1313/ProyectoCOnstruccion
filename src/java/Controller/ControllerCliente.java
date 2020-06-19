/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Cliente;
import Model.ConectaDB;
import ModelDAO.CRUD;
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
    
        	private void esperarXsegundos() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException ex) {
			Thread.currentThread().interrupt();
		}
}

    @Override
    public Cliente adds(Cliente t) {
         try {
            conDB = new ConectaDB();
            
            con=conDB.conexionDB();
            
            String sqlDireccion = "INSERT INTO Direccion"
                    +"(pais_Direccion,estado_Direccion,municipio_Direccion,calle_Direccion,colonia_Direccion,"
                    +"codigoPostal_Direccion,numeroExterior_Direccion,numeroInterior_Direccion)VALUES(?,?,?,?,?,?,?,?)";
            
            String sqlPersona = "INSERT INTO Persona"
                    +"(nombre_Persona,apellidoPeterno_Persona,apellidoMaterno_Persona,fechaNacimiento_Persona,sexo_Persona,"
                    +"telefono_Persona,correo_Persona,id_DireccionPersonaFK)VALUES(?,?,?,?,?,?,?,?)";
            
             String sqlClient = "INSERT INTO Cliente(id_PersonaClienteFK)VALUES(?)";
            ps=con.prepareStatement(sqlDireccion);
            ps.setString(1, t.getPersonaCliente().getDireccionPersona().getPais_Direccion());
            ps.setString(2, t.getPersonaCliente().getDireccionPersona().getEstado_Direccion());
            ps.setString(3, t.getPersonaCliente().getDireccionPersona().getMunicipio_Direccion());
            ps.setString(4, t.getPersonaCliente().getDireccionPersona().getCalle_Direccion());
            ps.setString(5, t.getPersonaCliente().getDireccionPersona().getColonia_Direccion());
            ps.setString(6, t.getPersonaCliente().getDireccionPersona().getCodigoPostal_Direccion());
            ps.setString(7, t.getPersonaCliente().getDireccionPersona().getNumeroExterior_Direccion());
            ps.setString(8, t.getPersonaCliente().getDireccionPersona().getNumeroInterior_Direccion());
            ps.executeUpdate();
            esperarXsegundos();
            
            ps=con.prepareStatement("select last_insert_id() as ultimoDireccion");
            rs=ps.executeQuery();
            if(rs != null && rs.next())
            {
                t.getPersonaCliente().getDireccionPersona().setid_Direccion(Integer.parseInt(rs.getString("ultimoDireccion")));
            }
            
            ps=con.prepareStatement(sqlPersona);
            ps.setString(1, t.getPersonaCliente().getNombre_Persona());
            ps.setString(2, t.getPersonaCliente().getPaterno_Persona());
            ps.setString(3, t.getPersonaCliente().getMaterno_Persona());
            ps.setString(4, t.getPersonaCliente().getFechaNacimiento_Persona());
            ps.setString(5, t.getPersonaCliente().getSexo_Persona());
            ps.setString(6, t.getPersonaCliente().getTelefono_Persona());
            ps.setString(7, t.getPersonaCliente().getCorreo_Persona());
            ps.setInt(8, t.getPersonaCliente().getDireccionPersona().getid_Direccion());
            ps.executeUpdate();
            esperarXsegundos();
            
            ps = con.prepareStatement("select last_insert_id() as ultimaPerson");
            rs = ps.executeQuery();
            if (rs != null && rs.next()) {
                t.getPersonaCliente().setId_Primary(Integer.parseInt(rs.getString("ultimaPerson")));
            }
            ps = con.prepareStatement(sqlClient);
            ps.setInt(1, t.getPersonaCliente().getId_Primary());
            ps.executeUpdate();
            esperarXsegundos();
            ps = con.prepareStatement("select last_insert_id() as ultimaCLient");
            rs = ps.executeQuery();
            if (rs != null && rs.next()) {
                t.setId_Cliente(Integer.parseInt(rs.getString("ultimaClient")));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ControllerCliente.class.getName()).log(Level.SEVERE, null, ex);
        }finally
         {
             try {
                 ps.close();
                 rs.close();
                 con.close();
             } catch (SQLException ex) {
                 System.out.println("error return CLient " + ex.getMessage());
                 Logger.getLogger(ControllerCliente.class.getName()).log(Level.SEVERE, null, ex);
             }
         }
         return t;
    }
    public static void main(String[] args) {
        CRUD ve=new ControllerCliente();
                Cliente s=new Cliente();
                s.getPersonaCliente().getDireccionPersona().setPais_Direccion("Mexico");

        s.getPersonaCliente().getDireccionPersona().setEstado_Direccion("Gola");
        s.getPersonaCliente().getDireccionPersona().setMunicipio_Direccion("Gola");
        s.getPersonaCliente().getDireccionPersona().setCalle_Direccion("Gola");
        s.getPersonaCliente().getDireccionPersona().setColonia_Direccion("Gola");
        s.getPersonaCliente().getDireccionPersona().setCodigoPostal_Direccion("Gola");
        s.getPersonaCliente().getDireccionPersona().setNumeroExterior_Direccion("Gola");
        s.getPersonaCliente().getDireccionPersona().setNumeroInterior_Direccion("Gola");

        s.getPersonaCliente().setNombre_Persona("Racka");
        s.getPersonaCliente().setPaterno_Persona("Clienta");
        s.getPersonaCliente().setMaterno_Persona("CLienta");
        s.getPersonaCliente().setFechaNacimiento_Persona("2020-05-05");
        s.getPersonaCliente().setSexo_Persona("SI");
        s.getPersonaCliente().setTelefono_Persona("SI");
        s.getPersonaCliente().setCorreo_Persona("SI");
        s.getPersonaCliente().getDireccionPersona().getid_Direccion();

        s.getPersonaCliente().getId_Primary();
        
        ve.adds(s);
        
      
        if(s.getId_Cliente() != 0)
        {
              
        System.out.println(s.getPersonaCliente().getDireccionPersona().getEstado_Direccion());
        System.out.println(s.getPersonaCliente().getDireccionPersona().getMunicipio_Direccion());
        System.out.println(s.getPersonaCliente().getDireccionPersona().getCalle_Direccion());
        System.out.println(s.getPersonaCliente().getDireccionPersona().getColonia_Direccion());
        System.out.println(s.getPersonaCliente().getDireccionPersona().getCodigoPostal_Direccion());
        System.out.println(s.getPersonaCliente().getDireccionPersona().getNumeroExterior_Direccion());
        System.out.println(s.getPersonaCliente().getDireccionPersona().getNumeroInterior_Direccion());

        System.out.println(s.getPersonaCliente().getNombre_Persona());
        System.out.println(s.getPersonaCliente().getPaterno_Persona());
        System.out.println(s.getPersonaCliente().getMaterno_Persona());
        System.out.println(s.getPersonaCliente().getFechaNacimiento_Persona());
        System.out.println(s.getPersonaCliente().getSexo_Persona());
        System.out.println(s.getPersonaCliente().getTelefono_Persona());
        System.out.println(s.getPersonaCliente().getCorreo_Persona());
        System.out.println(s.getPersonaCliente().getDireccionPersona().getid_Direccion());
        
        
        }else
        {
            System.out.println("Nada");
        }
    }
    
    }
