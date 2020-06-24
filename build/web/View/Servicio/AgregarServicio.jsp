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
if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(10))
{ 
%>
<%
ArrayList<Servicio>recService = new ControllerServicio().showAll();
session.setAttribute("ListUpdateServ", recService);
%>
   <div class="loaders" id="loadImg"></div>
     <div class="">

        <div class="card mx-auto" style="width: 50rem;">
            <div class="card-header">
                Featured
            </div>
            <div class="card-body">
                <h5 class="card-title">Descripciones Espectaculares</h5>

                <form id="formAddService">
                    <input type="hidden" name="action" value="addService">
                    <fieldset>
                        <legend>Servicio Disponible</legend>
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="nameService">Type service name
                                        <input type="text" required="" class="form-control" name="nameService" id="NameService" placeholder="type service name">
                                    </label>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="descriptionService">Type the service description 
                                        <textarea cols="20" rows="3" class="form-control" name="DescriptionService" id="descriptionService" placeholder="Type the service description "></textarea>
                                    </label>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="precioService">Type the price per meter
                                        <input type="text" class="form-control" name="PrecioService" id="precioService" placeholder="Type the price per meter" onkeypress="return filterFloat(event,this);" >
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