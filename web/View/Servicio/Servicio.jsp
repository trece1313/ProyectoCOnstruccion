<%-- 
    Document   : Servicio
    Created on : Jun 20, 2020, 10:28:39 AM
    Author     : trece
--%>

<%@page import="Controller.ControllerServicio"%>
<%@page import="Model.Servicio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
if(request.getSession().getAttribute("us") == null){
 response.sendRedirect("./View/Login.jsp");   
}
if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(10))
{ 
%>
<%

%>

<style>
    
/*    #idtableClientObra{
        display: none;
    }*/
</style>

<!--<link href="./Estilos/cssServic.css" rel="stylesheet" type="text/css"/>-->
<div class="services">

  

    <div class="tableClientObra" id="idtableClientObra">
        <div class="divTableClienteObraContenido" id="idTableClienteObraContenido">
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label for="buscarUnServicio">Buscar Servicio
                            <input type="text" class="form-control" name="buscarUnServicio" id="buscarUnServicio" placeholder="Buscar Servicio"/>
                        </label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="searchCard">
                            <a href="#" id="cerrarS" class="btn btn-warning"">Cerrar</a>
                        </label>
                    </div>
                </div>
            </div>
            <div id="todosServicios">

            </div>

        </div>
    </div>

                                              
                                              
                                              
                                              
                                              

</div>



<%    }
%>

<script src="./Javascript/Servicios/Servicios.js" type="text/javascript"></script>

