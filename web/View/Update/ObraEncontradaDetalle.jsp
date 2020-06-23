<%-- 
    Document   : ObraEncontradaDetalle
    Created on : Jun 23, 2020, 10:26:46 AM
    Author     : trece
--%>

<%@page import="Model.Obra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
if(request.getSession().getAttribute("us") == null){
 response.sendRedirect("../../View/Login.jsp");   
}

if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(13))
{ 
  
               Obra obra = ((ArrayList<Obra>)request.getSession().getAttribute("presObra")).get(Integer.parseInt(request.getParameter("indiceObra")));
               session.setAttribute("resObraEncontrada", obra);
               
        

%>


<div class="row" id="">

    <div class="col-4">
        <div class="card text-white bg-dark mb-3" style="display: inline-grid; width: 20rem; ">
            <div class="card-header"><header>Obra </header></div>
            <div class="card-body">
                <p class="card-text">Nombre Cliente <br/><%= (obra.getClienteObra().getPersonaCliente().getNombre_Persona() + obra.getClienteObra().getPersonaCliente().getPaterno_Persona())%></p>
                <p class="card-text">Nombre Trabajador <br/><%= (obra.getTrabObra().getPerTrabajador().getNombre_Persona())%></p>
                <p class="card-text">Atiende : <br/><%= (obra.getUsrObra().getPersonaUsuario().getNombre_Persona())%></p>

            </div>                                         

        </div>
    </div>


</div>   
                
                    <%
        }
    %>