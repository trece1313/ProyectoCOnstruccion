<%-- 
    Document   : TodosTrabajadores
    Created on : Jun 23, 2020, 5:17:37 PM
    Author     : trece
--%>

<%@page import="Model.Trabajador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(request.getSession().getAttribute("us") == null){
 response.sendRedirect("Login.jsp");   
}

if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(12))
{ 

ArrayList<Trabajador> listaTrabajadores = session.getAttribute("listaTodosTrabajadores") != null ? 
(ArrayList<Trabajador>) session.getAttribute("listaTodosTrabajadores") : new ArrayList();




%>
<div class="row">
    <%                                        
        for (int i = 0; i < listaTrabajadores.size(); i++) {
            Trabajador trabajador = listaTrabajadores.get(i);

    %>

    <div class="col-4">
        <div class="card text-white bg-dark mb-3" style="display: inline-grid; width: 20rem; ">
            <div class="card-header"><header>Nombre Trabajador <%= (trabajador.getPerTrabajador().getNombre_Persona())%></header></div>
            <div class="card-body">

                <p class="card-text">Especialidad <br/><%= (trabajador.getEspecialidad_Trabajador())%></p>
                <p class="card-text">Pais <%= (trabajador.getPerTrabajador().getDireccionPersona().getPais_Direccion())%></p>
                <button href="#" class="btn btn-info btnActualizarTrabajador" value="<%=i%>">Editar Trabajador</button>
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

<script src="./Javascript/Trabajador/EditarTrabajador.js" type="text/javascript"></script>



