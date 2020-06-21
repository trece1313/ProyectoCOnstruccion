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
if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(10))
{ 
%>
<%
ArrayList<Servicio>recService = new ControllerServicio().showAll();
session.setAttribute("ListUpdateServ", recService);
%>

<style>
    
    #idtableClientObra{
        display: none;
    }
</style>

<link href="./Estilos/cssServic.css" rel="stylesheet" type="text/css"/>
<div class="services">

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
                        
                        <div class="tableClientObra" id="idtableClientObra">
                            <div class="divTableClienteObraContenido" id="idTableClienteObraContenido">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                        <label for="searchCard">Search of Service
                                            <input type="text" class="form-control" name="SearchCard" id="searchCard" placeholder="Search of Service"/>
                                        </label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                        <label for="searchCard">
                                            <a href="#" id="cerrarS" class="btn btn-warning" onclick="hidiDivServices();">Cerrar</a>
                                        </label>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                 <div class="row">
                                        <%
                                        for (int i = 0; i <recService.size();i++) {
                                         Servicio servicio=recService.get(i);
                                          
                                        %>
                                      
                                        <div class="col-4">
                                            <div class="card text-white bg-dark mb-3" style="display: inline-grid; width: 20rem; ">
                                                <div class="card-header"><header>Nombre Servicio <%= (servicio.getNombre_Servicio())%></header></div>
                                                <div class="card-body">

                                                    <p class="card-text">Descripccion <br/><%= (servicio.getDescipcion_Servicio())%></p>
                                                    <p class="card-text">Precio por metro <%= (servicio.getPrecioPorMetro())%></p>
                                                    <button href="#" class="btn btn-info btnUpdateService" onclick="sendUpdateService(this);" value="<%=i%>">Edit Service</button>
                                                </div>

                                            </div>
                                        </div>
                                  
                                        <%
                                          }
                                        %>
                                              </div>
                            </div>
                        </div>
                                              
                                              
                                              
                                              
                                              
                                              

</div>

<script src="Javascript/ServicesValidator.js" type="text/javascript"></script>
<script src="Javascript/jquery.validate.js" type="text/javascript"></script>
<script src="Javascript/jQueryValidator.js" type="text/javascript"></script>

<%    }
%>


