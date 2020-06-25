/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;


import Controller.ControllerCliente;
import Model.Usuario;
import ModelDAO.CRUD;
import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author trece
 */
@WebServlet(name = "Cliente", urlPatterns = {"/DataClient"})
public class Cliente extends HttpServlet {

CRUD cliDAO = null;
Model.Cliente cli = null;

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
            out.println("<title>Servlet Cliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Cliente at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        PrintWriter o = response.getWriter();
 if(request.getSession().getAttribute("us") != null && 
    ((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(11))
 {
     if (request.getParameter("action") != null) 
     {
  
          if (request.getParameter("action").equals("consultaCliente") && request.getParameter("filter") ==null ) 
          {
         
                    cliDAO = new ControllerCliente();                    
                    ArrayList lisClient = cliDAO.showDataCliente("");
                    request.getSession().setAttribute("listClient", lisClient);
          }
     }
     if(request.getParameter("action").equals("addClientObra"))
     {
         cliDAO = new ControllerCliente();
         
         
         cli = new Model.Cliente();
        
        
         
        cli.getPersonaCliente().getDireccionPersona().setPais_Direccion(request.getParameter("CountryClientObra"));
        cli.getPersonaCliente().getDireccionPersona().setEstado_Direccion(request.getParameter("CityClientObra"));
        cli.getPersonaCliente().getDireccionPersona().setMunicipio_Direccion(request.getParameter("MunicipalityClientObra"));
        cli.getPersonaCliente().getDireccionPersona().setCalle_Direccion(request.getParameter("StreetClientObra"));
        cli.getPersonaCliente().getDireccionPersona().setColonia_Direccion(request.getParameter("ColonyClientObra"));
        cli.getPersonaCliente().getDireccionPersona().setCodigoPostal_Direccion(request.getParameter("CodeClientObra"));
        cli.getPersonaCliente().getDireccionPersona().setNumeroExterior_Direccion(request.getParameter("ExteriorClientObra"));
        cli.getPersonaCliente().getDireccionPersona().setNumeroInterior_Direccion(request.getParameter("InteriorClientObra"));

        cli.getPersonaCliente().setNombre_Persona(request.getParameter("NamePersonObra"));
        cli.getPersonaCliente().setPaterno_Persona(request.getParameter("LastNamePersonObra"));
        cli.getPersonaCliente().setMaterno_Persona(request.getParameter("LastNameMPersonObra"));
        cli.getPersonaCliente().setFechaNacimiento_Persona(request.getParameter("BirthdatePersonObra"));
        cli.getPersonaCliente().setSexo_Persona(request.getParameter("SexPersonObra"));
        cli.getPersonaCliente().setTelefono_Persona(request.getParameter("PhonePersonObra"));
        cli.getPersonaCliente().setCorreo_Persona(request.getParameter("EmailPersonObra"));
        cli.getPersonaCliente().getDireccionPersona().getid_Direccion();

        cli.getPersonaCliente().getId_Primary();
        
        
        
        
        Model.Cliente cl=(Model.Cliente) cliDAO.adds(cli);
        if( cl.getId_Cliente() != 0 ){
            
                  
                 Gson gs = new Gson();
                 
                 o.print(gs.toJson(cl));
                 request.getSession().setAttribute("Mensaje", "El cliente se agrego corectamente");
                 
            
        }
         
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
