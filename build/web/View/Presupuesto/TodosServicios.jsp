<%-- 
    Document   : TodosServicios
    Created on : Jun 24, 2020, 12:28:16 AM
    Author     : trece
--%>

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
        Presupuesto pres = (Presupuesto) session.getAttribute("presupuesto");    


%>
<%-- Aqui va mi detalle  --%>
<table border="1" class="table table-dark">
    <thead>
        <tr>
            <th>Nombre Servicio</th>
            <th>Descripción del servicio</th>
            <th>Metros</th>
            <th>Cantidad</th>
            <th>Subtotal</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>Total</td>
        </tr>
    </tbody>
</table>

<%
    }
%>

