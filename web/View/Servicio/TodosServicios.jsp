<%-- 
    Document   : TodosServicios
    Created on : Jun 24, 2020, 12:28:16 AM
    Author     : trece
--%>

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
ArrayList<Servicio> listaServicios = session.getAttribute("listaTodosServicios") != null ? 
(ArrayList<Servicio>) session.getAttribute("listaTodosServicios") : new ArrayList();

%>

<div class="row">
    <%
        for (int i = 0; i < listaServicios.size(); i++) {
            Servicio servicio = listaServicios.get(i);
            
            

    %>

    <div class="col-4">
        <div class="card text-white bg-dark mb-3" style="display: inline-grid; width: 20rem; ">
            <div class="card-header"><header>Nombre Servicio <%= (servicio.getNombre_Servicio())%></header></div>
            <div class="card-body">

                <p class="card-text">Descripccion <br/><%= (servicio.getDescipcion_Servicio())%></p>
                <p class="card-text">Precio por metro <%= (servicio.getPrecioPorMetro())%></p>
                <button href="#" class="btn btn-info btnEnviarActualizar" value="<%=i%>">Editar Servicio</button>
            </div>

        </div>
    </div>

    <%
        }
    %>
</div>
<%
    }
%>

<script src="./Javascript/Servicios/EditarServicio.js" type="text/javascript"></script>