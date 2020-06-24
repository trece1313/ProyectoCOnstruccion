<%-- 
    Document   : ServicioEncontradoDetalle
    Created on : Jun 23, 2020, 10:56:25 AM
    Author     : trece


<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
if(request.getSession().getAttribute("us") == null){
 response.sendRedirect("../../View/Login.jsp");   
}

if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(13))
{ 
%>

<table border="1" class="table">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Descripcion</th>
            <td>Subtotal</td>

        </tr>
    </thead>
    <tbody>
        <tr>
            <td></td>
            <td></td>
            <td>Total</td>
 
        </tr>
    </tbody>
</table>


<%
    }
%>