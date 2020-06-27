<%-- 
    Document   : TodosServicios
    Created on : Jun 24, 2020, 12:28:16 AM
    Author     : trece
--%>

<%@page import="Model.Obra"%>
<%@page import="Model.DetalleServicioPresupuesto"%>
<%@page import="Model.Presupuesto"%>
<%@page import="Controller.ControllerServicio"%>
<%@page import="Model.Servicio"%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
if(request.getSession().getAttribute("us") == null){
 response.sendRedirect("../../View/Login.jsp");   
}
if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(10))
{ 
%>
<%
        Obra or = (Obra) session.getAttribute("obra");    


%>
<style>
    #tabServicios{
        font-family: 'Anton', sans-serif;
        text-align: center;
   
        background: #0F2027 !important;  /* fallback for old browsers */
        background: -webkit-linear-gradient(to bottom, #2C5364, #203A43, #0F2027)!important;  /* Chrome 10-25, Safari 5.1-6 */
        background: linear-gradient(to bottom, #2C5364, #203A43, #0F2027) !important; /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        border-radius: 7px;
       box-shadow: 3px -1px 8px 4px #3B5A73;
                 overflow: scroll;
                 overflow-x: hidden;
                 border-radius: 7px;
                     
        
    }
</style>
<%-- Aqui va mi detalle  --%>
<table border="1" id="tabServicios" class="table table-dark">
    <thead>
        <tr>
            <th>Nombre Servicio</th>
            <th>Descripción del servicio</th>
            <th>Metros</th>
            <th>Precio por Metro</th>
            <th>Subtotal</th>
        </tr>
    </thead>
    <tbody>
        
                    <%
            for (int i = 0; i < or.getDetSerPreObra().size(); i++) {
                DetalleServicioPresupuesto d = or.getDetSerPreObra().get(i);
                

            %>
        
        <tr>
                
            <td><%=(d.getServicioDetalle().getNombre_Servicio())%></td>
            <td><%=(d.getServicioDetalle().getDescipcion_Servicio())%></td>
            <td><%=(d.getMetrosCuadradoDetalle())%> m²</td>
            <td>$ <%=(d.getServicioDetalle().getPrecioPorMetro())%></td>
            <td>$ <%=(d.getSubtotalDetalle())%></td>
        </tr>

          <%
              }
            %>
                    <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>Total $ <%=(or.getTotal_Obra())%></td>
        </tr>
    </tbody>
</table>

<%
    }
%>

