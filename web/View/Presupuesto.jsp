<%-- 
    Document   : Presupuesto
    Created on : Jun 22, 2020, 4:09:56 PM
    Author     : trece
--%>

<%@page import="Model.Obra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(13))
{ 

ArrayList<Obra> listObra = session.getAttribute("presObra") != null ? 
(ArrayList<Obra>) session.getAttribute("presObra") : new ArrayList();
%>

<style>
    
    #idtableClientObra{
        
    }
    
</style>
<div class="" id="">
    
    <div id="shw">
        
    </div>
   
    
    
    
    <div class="tableClientObra" id="idtableClientObra">
        <div class="divTableClienteObraContenido" id="idTableClienteObraContenido">
            <div class="row" id="nosh">
                <div class="col-6">
                    <div class="form-group">
                        <label for="searchCard">Search of Service
                            <input type="text" class="form-control" name="SearchBrid" id="SearchBrid" placeholder="Search of Obra"/>
                        </label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="searchCard">
                            <a href="#" id="cerrarS" class="btn btn-warning">Cerrar</a>
                        </label>
                    </div>
                </div>
            </div>


            <div class="row" id="yeshi">
                <%
                    for (int i = 0; i < listObra.size(); i++) {
                        Obra obra = listObra.get(i);

                %>

                <div class="col-4">
                    <div class="card text-white bg-dark mb-3" style="display: inline-grid; width: 20rem; ">
                        <div class="card-header"><header>Nombre Cliente <%= (obra.getClienteObra().getPersonaCliente().getNombre_Persona())%></header></div>
                        <div class="card-body">

                            <p class="card-text">Nombre Trabajador <br/><%= (obra.getTrabObra().getPerTrabajador().getNombre_Persona())%></p>
                            <p class="card-text">Nombre Usuario <%= (obra.getUsrObra().getPersonaUsuario().getNombre_Persona())%></p>
                            <button href="#" class="btn btn-info btnaddBudget" value="<%=i%>">Edit Service</button>
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

                <script src="./Javascript/Presupuesto.js" type="text/javascript"></script>
<%
    }
%>
