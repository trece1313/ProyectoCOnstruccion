<%-- 
    Document   : Trabajador
    Created on : Jun 23, 2020, 5:57:38 PM
    Author     : trece
--%>

<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
if(request.getSession().getAttribute("us") == null){
 response.sendRedirect("Login.jsp");   
}

if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(12))
{ 
%>

<div class="tableClientObra" id="idtableClientObra">
    <div class="divTableClienteObraContenido" id="idTableClienteObraContenido">
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="buscarTrabajador">Buscar Trabajador
                        <input type="text" class="form-control" name="BuscarTrabajador" id="buscarTrabajador" placeholder="Buscar Trabajador"/>
                    </label>
                    <button class="btn btn-info" id="btnSearch" >Buscar</button>
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="cerrarT">
                        <a href="#" id="cerrarT" class="btn btn-warning">Cerrar</a>
                    </label>
                </div>
            </div>
        </div>
        <div id="mostrarTrabajadores">
            
        </div>


    </div>
</div>
<%
}
%>


<script src="./Javascript/Trabajador/Trabajador.js" type="text/javascript"></script>