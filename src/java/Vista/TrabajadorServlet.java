/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;


import Controller.ControllerTrabajador;
import Model.Trabajador;
import Model.Usuario;
import ModelDAO.CRUD;
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
@WebServlet(name = "TrabajadorServlet", urlPatterns = {"/DataTrabajador"})
public class TrabajadorServlet extends HttpServlet {
CRUD CrudMethod = null;
Trabajador traAtt = null;
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
            out.println("<title>Servlet TrabajadorServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TrabajadorServlet at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException 
    {
        if (request.getSession().getAttribute("us") != null
                && ((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(12)) 
        {
            if (request.getParameter("action") != null && !request.getParameter("action").equals("")) 
            {
                CrudMethod = new ControllerTrabajador();

                if (request.getParameter("action").equals("addTrabajador")) 
                {
                    traAtt = new Trabajador();

                    
                 traAtt.getPerTrabajador().setNombre_Persona(request.getParameter("Nombre"));
                traAtt.getPerTrabajador().setPaterno_Persona(request.getParameter("Paterno"));
                traAtt.getPerTrabajador().setMaterno_Persona(request.getParameter("Materno"));
                traAtt.getPerTrabajador().setFechaNacimiento_Persona(request.getParameter("FechaNacimiento"));
                traAtt.getPerTrabajador().setSexo_Persona(request.getParameter("Sexo"));
                traAtt.getPerTrabajador().setTelefono_Persona(request.getParameter("Telefono"));
                traAtt.getPerTrabajador().setCorreo_Persona(request.getParameter("Correo"));
                
                 traAtt.getPerTrabajador().getDireccionPersona().setPais_Direccion(request.getParameter("Pais"));
                 traAtt.getPerTrabajador().getDireccionPersona().setEstado_Direccion(request.getParameter("Estado"));
                 traAtt.getPerTrabajador().getDireccionPersona().setMunicipio_Direccion(request.getParameter("Municipio"));
                 traAtt.getPerTrabajador().getDireccionPersona().setCalle_Direccion(request.getParameter("Calle"));
                 traAtt.getPerTrabajador().getDireccionPersona().setColonia_Direccion(request.getParameter("Colonia"));
                 traAtt.getPerTrabajador().getDireccionPersona().setCodigoPostal_Direccion(request.getParameter("CodigoPostal"));
                 traAtt.getPerTrabajador().getDireccionPersona().setNumeroExterior_Direccion(request.getParameter("NumeroExterior"));
                 traAtt.getPerTrabajador().getDireccionPersona().setNumeroInterior_Direccion(request.getParameter("NumeroInterior"));
                    
                    traAtt.setEspecialidad_Trabajador(request.getParameter("NameEspecialidad"));
                    traAtt.setDiasTrabajoSemanaTrabajador(Integer.parseInt(request.getParameter("diasTrabajados")));
                    traAtt.setHorasPorDiaTrabajadas(Integer.parseInt(request.getParameter("HrasTrabajadas")));
                    traAtt.setPrecioPorDiaTrabajado(Double.parseDouble(request.getParameter("precioDia")));
                    
                    if(CrudMethod.add(traAtt))
                    {
                        request.getSession().setAttribute("MensajeTrabajadorAdd", "El Trabajador se Agrego corectamente");
                    }
                    
                }
                    if(request.getParameter("action").equals("loadWorker") && request.getParameter("filtro") == null) 
                    {
                        
                    ArrayList listaWorked = CrudMethod.showDataCliente("");
                    request.getSession().setAttribute("ListWorkers", listaWorked);
                    
                    }
                    if(request.getParameter("action").equals("showOneWorker") && request.getParameter("filter") != null) 
                    {
                        
                    ArrayList listaWorked = CrudMethod.showDataCliente(request.getParameter("filter"));
                    request.getSession().setAttribute("ListWorkers", listaWorked);
                    
                    }
                    if(request.getParameter("action").equals("updateTrabajador")) 
                    {
                        
                     traAtt = new Trabajador();
                     Trabajador workerUpdate = (Trabajador)request.getSession().getAttribute("UpdateWorker");
                     
                workerUpdate.getPerTrabajador().setNombre_Persona(request.getParameter("Nombre"));
                workerUpdate.getPerTrabajador().setPaterno_Persona(request.getParameter("Paterno"));
                workerUpdate.getPerTrabajador().setMaterno_Persona(request.getParameter("Materno"));
                workerUpdate.getPerTrabajador().setFechaNacimiento_Persona(request.getParameter("FechaNacimiento"));
                workerUpdate.getPerTrabajador().setSexo_Persona(request.getParameter("Sexo"));
                workerUpdate.getPerTrabajador().setTelefono_Persona(request.getParameter("Telefono"));
                workerUpdate.getPerTrabajador().setCorreo_Persona(request.getParameter("Correo"));
                
                 workerUpdate.getPerTrabajador().getDireccionPersona().setPais_Direccion(request.getParameter("Pais"));
                 workerUpdate.getPerTrabajador().getDireccionPersona().setEstado_Direccion(request.getParameter("Estado"));
                 workerUpdate.getPerTrabajador().getDireccionPersona().setMunicipio_Direccion(request.getParameter("Municipio"));
                 workerUpdate.getPerTrabajador().getDireccionPersona().setCalle_Direccion(request.getParameter("Calle"));
                 workerUpdate.getPerTrabajador().getDireccionPersona().setColonia_Direccion(request.getParameter("Colonia"));
                 workerUpdate.getPerTrabajador().getDireccionPersona().setCodigoPostal_Direccion(request.getParameter("CodigoPostal"));
                 workerUpdate.getPerTrabajador().getDireccionPersona().setNumeroExterior_Direccion(request.getParameter("NumeroExterior"));
                 workerUpdate.getPerTrabajador().getDireccionPersona().setNumeroInterior_Direccion(request.getParameter("NumeroInterior"));
                    
                    workerUpdate.setEspecialidad_Trabajador(request.getParameter("NameEspecialidad"));
                    workerUpdate.setDiasTrabajoSemanaTrabajador(Integer.parseInt(request.getParameter("diasTrabajados")));
                    workerUpdate.setHorasPorDiaTrabajadas(Integer.parseInt(request.getParameter("HrasTrabajadas")));
                    workerUpdate.setPrecioPorDiaTrabajado(Double.parseDouble(request.getParameter("precioDia")));
                    
                    if(CrudMethod.update(workerUpdate))
                    { 
                        request.getSession().setAttribute("MensajeTrabajadorUps", "El Trabajador se actualizo corectamente");
                    }
                    
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
