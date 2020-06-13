/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;

import Controller.ControllerUsuario;
import Model.Direccion;
import Model.Persona;
import Model.Rol;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
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
ControllerUsuario accUser=null;
Usuario user=null;
Direccion dir=null;
Persona per=null;
Rol rol=null;
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
        if(request.getParameter("action") != null && 
           request.getParameter("action").equals("accederUser") && 
           !request.getParameter("user").equals("") && !request.getParameter("pass").equals(""))
        {
            accUser = new ControllerUsuario();
            
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
                user =new Usuario();
                dir = new Direccion();
                per = new Persona();
                rol = new Rol();
                
                user.setUserName(request.getParameter(""));
                user.setPassUsuario(request.getParameter(""));
                user.setActivo(Integer.parseInt(request.getParameter("")));
                
                per.setNombre_Persona(request.getParameter("Nombre"));
                per.setPaterno_Persona(request.getParameter("Paterno"));
                per.setMaterno_Persona(request.getParameter("Materno"));
                per.setFechaNacimiento_Persona(request.getParameter(""));
                per.setSexo_Persona(request.getParameter("Sexo"));
                per.setTelefono_Persona(request.getParameter("Telefono"));
                per.setCorreo_Persona(request.getParameter("FechaNacimiento"));
                
                 dir.setPais_Direccion(request.getParameter("Pais"));
                 dir.setEstado_Direccion(request.getParameter("Estado"));
                 dir.setMunicipio_Direccion(request.getParameter("Municipio"));
                 dir.setCalle_Direccion(request.getParameter("Calle"));
                 dir.setColonia_Direccion(request.getParameter("Colonia"));
                 dir.setCodigoPostal_Direccion(request.getParameter("CodigoPostal"));
                 dir.setNumeroExterior_Direccion(request.getParameter("NumeroExterior"));
                 dir.setNumeroInterior_Direccion(request.getParameter("NumeroInterior"));
                
                 rol.setNombre_Rol(request.getParameter("Rol"));
                
                Enumeration enumeration = request.getParameterNames();
                while (enumeration.hasMoreElements()) {
                    String nombreparametro = (String) enumeration.nextElement();
                    if (nombreparametro.contains("menu")) {
                        rol.getPermisos().add(Integer.parseInt(request.getParameter(nombreparametro)));
                    }
                }
                if (new AdminControl().CreaRol(rol)) {
                    request.getSession().setAttribute("Mensaje", "El rol se creo exitosamente");
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
