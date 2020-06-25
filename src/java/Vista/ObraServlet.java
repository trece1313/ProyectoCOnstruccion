/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;

import Controller.ControllerObra;

import Model.Obra;
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
@WebServlet(name = "ObraServlet", urlPatterns = {"/DataObra"})
public class ObraServlet extends HttpServlet {
CRUD obraAdd = null;
Obra attObra = null;
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
            out.println("<title>Servlet ObraServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ObraServlet at " + request.getContextPath() + "</h1>");
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
                
 if(request.getSession().getAttribute("us") != null && 
    ((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(9))
 {
     
     obraAdd = new ControllerObra();
     
     
    if(request.getParameter("action") != null && !request.getParameter("action").equals("") )
    {
        
        if(request.getParameter("action").equals("agregarObra"))
        {
            System.out.println("vveamos ahora si " + request.getParameter("idTrabajadorObra"));
             Trabajador trab = ((ArrayList<Trabajador>)request.getSession().getAttribute("trabajadorAgregado")).get(Integer.parseInt(request.getParameter("idTrabajadorObra")));
            if(Boolean.parseBoolean(request.getParameter("bandObra")))
            {
                  
            
            Model.Cliente cle = ((ArrayList<Model.Cliente>)request.getSession().getAttribute("listClient")).get(Integer.parseInt(request.getParameter("idClienteObra")));
            
           
            
            attObra = new Obra();
            
            attObra.getTrabObra().setId_Trabajador(trab.getId_Trabajador());
            
            attObra.getClienteObra().setId_Cliente(cle.getId_Cliente());
            
            attObra.getUsrObra().setId(((Usuario)request.getSession().getAttribute("us")).getId());
            
            attObra.setFechaInicio_Obra(request.getParameter("fechaInicioObra"));
            
            attObra.setFechaFin_Obra(request.getParameter("fechaFinObra"));
            
            attObra.setTotal_Obra(0);
           
            attObra.setPagoInicioObra(Double.parseDouble(request.getParameter("pagoInicioObraAnticipo")));
            
            attObra.setPagoFinalObra(Integer.parseInt(request.getParameter("pagoInicioObraAnticipo")));
            
            attObra.setFechaCotizacionObra(request.getParameter("fechaCotObra"));
            
            if(obraAdd.add(attObra))
            {
                 request.getSession().setAttribute("Mensaje", "La obra se agrego corectamente");
            }
            }else
            {
                attObra = new Obra();

                attObra.getTrabObra().setId_Trabajador(trab.getId_Trabajador());

                attObra.getClienteObra().setId_Cliente(Integer.parseInt(request.getParameter("idClienteObra")));

                attObra.getUsrObra().setId(((Usuario) request.getSession().getAttribute("us")).getId());

                attObra.setFechaInicio_Obra(request.getParameter("fechaInicioObra"));

                attObra.setFechaFin_Obra(request.getParameter("fechaFinObra"));

                attObra.setTotal_Obra(0);

                attObra.setPagoInicioObra(Double.parseDouble(request.getParameter("pagoInicioObraAnticipo")));

                attObra.setPagoFinalObra(Integer.parseInt(request.getParameter("pagoInicioObraAnticipo")));

                attObra.setFechaCotizacionObra(request.getParameter("fechaCotObra"));
                if (obraAdd.add(attObra))
            {
                 request.getSession().setAttribute("Mensaje", "La obra se agrego corectamente");
            }
               
            }
           
        }
    
        if (request.getParameter("action").equals("cargarObra") && request.getParameter("filter") == null) 
        {

        
            ArrayList listaTodosServicios = obraAdd.showDataCliente("");
            request.getSession().setAttribute("listaTodosObras", listaTodosServicios);
        }
       
        if (request.getParameter("action").equals("cargarUnObra") && request.getParameter("BuscarObras") != null) 
        {
           
            ArrayList listaTodosServicios = obraAdd.showDataCliente(request.getParameter("BuscarObras"));
            request.getSession().setAttribute("listaTodosObras", listaTodosServicios);

        }
    }
  

 }
 else
 {

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
