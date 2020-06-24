<%-- 
    Document   : Presupuesto
    Created on : Jun 22, 2020, 4:09:56 PM
    Author     : trece

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
        display: none;
    }
    .shw{
        width: 100%;
        background-color: red;
        display: block;
        
    }
    header{
        text-align: center;
    }
    .divObra{
        width: 25%;
        background-color: green !important;
        
        
        float: left;
        
    }
    .serviciosObra{
        width: 75%;
        background-color: gray !important;
       float: left;
    }
    .elijaDatos{
       width: 90%;
    }
.divMetrosDetalle{
        width: 100%; 
        height: 100%;
        position: fixed; 
        z-index: 9999;
        opacity: .8;
        left: 0; 
        top: 0px;
        display: none;
        
        background: #BE93C5;  /* fallback for old browsers */
        background: -webkit-linear-gradient(to right, #7BC6CC, #BE93C5);  /* Chrome 10-25, Safari 5.1-6 */
        background: linear-gradient(to right, #7BC6CC, #BE93C5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

    }    
    .divContenido{
        color: black;
        font-family: 'Anton', sans-serif;
        text-align: center;
        position: absolute; 
        top: 25%; 
        left: 30%;
        width: 40%; 
        height: 20%;
        
    }
    .mensajeUsuario div button{
        color: black;
    }
        .mensajeUsuario div button:hover{
        
            background-color: black;
            color: white;
        
    }
</style>
<div class="" id="">
    
    <div id="shw">
        <div class="elijaDatos">
            <div class="row p-1">
                
                <div class="col-3">
                    <div class="form-group">
                        <button class="btn btn-info addObraDetalle">Agrege la obra</button>
                    </div>
                </div>
                <div class="col-9">
                    <div class="form-group">
                        <input type="text" class="form-control col-4 float-left" name="SearchService" id="searchService" placeholder="Ingrese el codigo del Servicio" />
                    </div>
                </div>

            </div>
        </div>
        <form>
    
        <div class="divObra">
            <header><h3>Obra</h3></header>
 
        </div>
    
                
        <div class="serviciosObra">
            <header><h3>Servicios</h3></header>
            <div id="ServDetalle">
                
            </div>
        </div>
          
        </form>
    </div>
    
    <div class="divMetrosDetalle">
        <div class="divContenido">
            <header><h3>Ingresar Cantidades</h3></header>
            <div class="row">
                <input type="hidden" name="" id="claveServicio" />
                <div class="col-6">
                    <div class="form-group">
                        <input type="text" class="form-control" name="" id="mtsAltura" placeholder="Ingrese la altura" />
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <input type="text" class="form-control" name="" id="mtsLargo" placeholder="Ingrese la Largo" />
                    </div>
                </div>
            </div>
        </div>
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
