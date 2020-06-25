<%-- 
    Document   : AgregarServicio
    Created on : Jun 24, 2020, 12:38:36 AM
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

%>

<style>
 
</style>
   <div class="loaders" id="loadImg"></div>
     <div class="">

        <div class="card mx-auto" style="width: 50rem;">
            <div class="card-header">
                Servicios de trabajos de construccion
            </div>
            <div class="card-body">
                <h5 class="card-title">Realizar las mejores descripciones posibles</h5>

                <form id="formAgregarService">
                    <input type="hidden" name="action" value="addService">
                    <fieldset>
                        <legend>Servicio Disponible</legend>
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="nameService">Ingrese nombre del Servicio
                                        <input type="text" required="" class="form-control" name="nameService" id="NameService" placeholder="Ingrese nombre del Servicio">
                                    </label>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="descriptionService">Ingrese la descripcion del servicio
                                        <textarea cols="20" rows="3" class="form-control" name="DescriptionService" id="descriptionService" placeholder="Ingrese la descripcion del servicio"></textarea>
                                    </label>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="precioService">Ingrese el precio por metro
                                        <input type="text" class="form-control" name="PrecioService" id="precioService" placeholder="Ingrese el precio por metro" onkeypress="return filterFloat(event,this);" >
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-info form-control col-6" style="margin-left: 25%;" id="">Add Service</button>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>

                </div>

        </div>

    </div>
                        <div class="mensajeUsuario" id="addMensaje">
                       
                        <div>
                           

                        <%
                            if (session.getAttribute("MensajeServicio") != null) {
                        %>
                        <h3><%= session.getAttribute("MensajeServicio").toString()%> </h3>
                        <%
                            
                                session.removeAttribute("MensajeServicio");
                            }else{
                        %> 
                        <h3>No entro</h3>
                        <%
                           }
                        %>
                        <button class="btn btn-info btnCloseMesage" > cerrar</button>
                        </div>
                    </div>
                        
   
   <%
       }
   %>
   
   
   <link href="./Estilos/cssMensajes.css" rel="stylesheet" type="text/css"/>
   
   <script src="./Javascript/Servicios/AgregarServicio.js" type="text/javascript"></script>