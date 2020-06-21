<%-- 
    Document   : EditarServicio
    Created on : Jun 20, 2020, 10:17:10 PM
    Author     : trece
--%>

<%@page import="Model.Servicio"%>
<%@page import="java.util.ArrayList"%>
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

        
        int indice = Integer.parseInt(request.getParameter("idServiceUpdate"));
        System.out.println("siii "+ indice);
        Servicio serEdit = ((ArrayList<Servicio>) session.getAttribute("ListUpdateServ")).get(indice);
        session.setAttribute("UpdateService", serEdit);

%>

     <div class="">

        <div class="card mx-auto" style="width: 50rem;">
            <div class="card-header">
                Featured
            </div>
            <div class="card-body">
                <h5 class="card-title">Descripciones Espectaculares</h5>

                <form id="formAddService">
                    <input type="hidden" name="action" value="updateService">
                    <fieldset>
                        <legend>Servicio Disponible</legend>
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="nameService">Type service name
                                        <input type="text" required="" class="form-control" value="<%=(serEdit.getNombre_Servicio())%>" name="nameService" id="NameService" placeholder="type service name">
                                    </label>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="descriptionService">Type the service description 
                                        <textarea cols="20" rows="3" class="form-control" name="DescriptionService" id="descriptionService" placeholder="Type the service description "><%=(serEdit.getDescipcion_Servicio())%></textarea>
                                    </label>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="precioService">Type the price per meter
                                        <input type="text" class="form-control" name="PrecioService" id="precioService" value="<%=(serEdit.getPrecioPorMetro())%>" placeholder="Type the price per meter" onkeypress="return filterFloat(event,this);" >
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-info form-control col-6" style="margin-left: 25%;" id="">Update Service</button>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>

                </div>

        </div>

    </div>


<%
    }
%>


