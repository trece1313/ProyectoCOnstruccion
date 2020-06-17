/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;

import Controller.ControllerUsuario;
import Model.Direccion;
import Model.EncryptionPassword;
import Model.Persona;
import Model.Rol;
import Model.Usuario;
import ModelDAO.CRUD;
import ModelDAO.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author trece
 */
@WebServlet(name = "Usuarios", urlPatterns = {"/UsuariosDatos"})
public class Usuarios extends HttpServlet {
UsuarioDAO accUser=null;
Usuario user=null;
Direccion dir=null;
Persona per=null;
Rol rol=null;
CRUD usuDAO = null;
EncryptionPassword encryption =null;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Usuarios</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Usuarios at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter o=response.getWriter();
            accUser = new ControllerUsuario();
        if(request.getParameter("action") != null && 
           request.getParameter("action").equals("accederUser") && 
           !request.getParameter("user").equals("") && !request.getParameter("pass").equals(""))
        {
            
            
            user = accUser.accesarUser(request.getParameter("user"),request.getParameter("pass"));
                
            if(user.getId()!= 0 )
            {
                
                request.getSession().setAttribute("us",user);
            }
            else
            {
                o.println(1);
                request.getSession().setAttribute("Mensaje", "El usuario y/o password son incorrectos");
            }

        }
        if(request.getSession().getAttribute("us") != null && 
          ((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(6) )
        {
            if(request.getParameter("action").equals("addUsers"))
            {
                accUser = new ControllerUsuario();
                user =new Usuario();
                dir = new Direccion();
                per = new Persona();
                rol = new Rol();
                
                String pass = request.getParameter("PassUser");
                String confPass = request.getParameter("PassUserConf");
             if(!pass.equals("") && !confPass.equals(""))
             {
                if(pass.equals(confPass))
                {
                    try {
                        encryption = new EncryptionPassword();
                        final String secret = "Secret";
                    String passEncryption = encryption.encriptar(pass, secret);
                       
                    
                user.setUserName(request.getParameter("UserName"));
                user.setPassUsuario(passEncryption);
                user.setActivo(1);
                
                user.getPersonaUsuario().setNombre_Persona(request.getParameter("Nombre"));
                user.getPersonaUsuario().setPaterno_Persona(request.getParameter("Paterno"));
                user.getPersonaUsuario().setMaterno_Persona(request.getParameter("Materno"));
                user.getPersonaUsuario().setFechaNacimiento_Persona(request.getParameter("FechaNacimiento"));
                user.getPersonaUsuario().setSexo_Persona(request.getParameter("Sexo"));
                user.getPersonaUsuario().setTelefono_Persona(request.getParameter("Telefono"));
                user.getPersonaUsuario().setCorreo_Persona(request.getParameter("Correo"));
                
                 user.getPersonaUsuario().getDireccionPersona().setPais_Direccion(request.getParameter("Pais"));
                 user.getPersonaUsuario().getDireccionPersona().setEstado_Direccion(request.getParameter("Estado"));
                 user.getPersonaUsuario().getDireccionPersona().setMunicipio_Direccion(request.getParameter("Municipio"));
                 user.getPersonaUsuario().getDireccionPersona().setCalle_Direccion(request.getParameter("Calle"));
                 user.getPersonaUsuario().getDireccionPersona().setColonia_Direccion(request.getParameter("Colonia"));
                 user.getPersonaUsuario().getDireccionPersona().setCodigoPostal_Direccion(request.getParameter("CodigoPostal"));
                 user.getPersonaUsuario().getDireccionPersona().setNumeroExterior_Direccion(request.getParameter("NumeroExterior"));
                 user.getPersonaUsuario().getDireccionPersona().setNumeroInterior_Direccion(request.getParameter("NumeroInterior"));
                
                 user.getRolUsuario().setNombre_Rol(request.getParameter("Rol"));
                
                         String a[]=request.getParameterValues("menu");
                        for (String string : a) {
                            user.getRolUsuario().getPermisos().add(Integer.parseInt(string));
                        }

                if (accUser.add(user)) {
                    request.getSession().setAttribute("MensajeUsuario", "El Usuario se creo exitosamente");
              
                }else
                {
                request.getSession().setAttribute("MensajeUsuario", "no se creo exitosamente");
                }
                        
                        
                    } catch (UnsupportedEncodingException ex) {
                        System.out.println("Err 1 "+ ex.getMessage());
                        Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (NoSuchAlgorithmException ex) {
                        System.out.println("Err 2 "+ ex.getMessage());
                        Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (InvalidKeyException ex) {
                        System.out.println("Err 3 "+ ex.getMessage());
                        Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (NoSuchPaddingException ex) {
                        System.out.println("Err 4 "+ ex.getMessage());
                        Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (IllegalBlockSizeException ex) {
                        System.out.println("Err 5 "+ ex.getMessage());
                        Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (BadPaddingException ex) {
                        System.out.println("Err 6 "+ ex.getMessage());
                        Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                else
                {
                    request.getSession().setAttribute("Mensaje", "Las Contrasenas no coinciden");
                }
             }
             else
             {
             
             }
                
                
     
            }
            else
            {
                System.out.println("no entro");
            }
            
        }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
