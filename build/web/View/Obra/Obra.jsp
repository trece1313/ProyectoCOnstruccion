<%-- 
    Document   : Obra
    Created on : Jun 15, 2020, 9:05:26 PM
    Author     : trece
--%>

<%@page import="Model.Usuario"%>
<%@page import="Model.Cliente"%>
<%@page import="Model.Trabajador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
        if(request.getSession().getAttribute("us") != null && 
          ((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(9))
        { %>

<%
ArrayList<Trabajador> trabajador = new Controller.ControllerTrabajador().showAll();
session.setAttribute("trabajadorAdd", trabajador);
%>

<%
ArrayList<Cliente> clientObra = session.getAttribute("listClient") != null ? 
(ArrayList<Cliente>) session.getAttribute("listClient") : new ArrayList();
%>

<div class="tableClientObra" id="">
    <div class="divTableClienteObraContenido" id="idTableClienteObraContenido">
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="buscarObra">Buscar Obra
                        <input type="text" class="form-control" name="BuscarObra" id="buscarObras" placeholder="Buscar Obra"/>
                    </label>
                   
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="cerrarT">
                        <a href="#" id="cerrarO" class="btn btn-warning">Cerrar</a>
                    </label>
                </div>
            </div>
        </div>
        <div id="mostrarObras">
            
        </div>


    </div>
</div>



<link href="./Estilos/cssObra.css" rel="stylesheet" type="text/css"/>
<script src="./Javascript/Obra/Obra.js" type="text/javascript"></script>
                                    

<!--<script src="./Javascript/Obra.js" type="text/javascript"></script>
<script src="./Javascript/jQueryValidator.js" type="text/javascript"></script>
<script src="./Javascript/jquery.validate.js" type="text/javascript"></script>-->
<%
    }
%>

