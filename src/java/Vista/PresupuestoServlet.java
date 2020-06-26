/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;

import Controller.ControllerObra;
import Controller.ControllerPresupuesto;
import Controller.ControllerServicio;
import Model.Obra;
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
@WebServlet(name = "PresupuestoServlet", urlPatterns = {"/PresupuestoData"})
public class PresupuestoServlet extends HttpServlet {
CRUD CrudMethod = null;
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
            out.println("<title>Servlet PresupuestoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PresupuestoServlet at " + request.getContextPath() + "</h1>");
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
         if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(13))
{
        if(request.getParameter("action") != null && !request.getParameter("action").equals("") )
    {
            CrudMethod = new ControllerObra();
        
        if(request.getParameter("action").equals("searchBudget") && request.getParameter("filter") == null)
        {
               ArrayList prespuppuestoObra = CrudMethod.showDataCliente("");
               request.getSession().setAttribute("presObra", prespuppuestoObra);
               
        }
        if(request.getParameter("action").equals("searchBudget") && request.getParameter("filter") != null)
        {
               ArrayList prespuppuestoObra = CrudMethod.showDataCliente(request.getParameter("filter"));
               request.getSession().setAttribute("presObra", prespuppuestoObra);
               
        }
        if(request.getParameter("action").equals("buscarServicio") && 
          request.getParameter("codServicio") != null)
        {
            System.out.println("entro");
            String codServicio = request.getParameter("codServicio");
            String altura = request.getParameter("altura");
            String largo = request.getParameter("largo");
            System.out.println(codServicio + " "+ altura + " "+ largo);
               
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
