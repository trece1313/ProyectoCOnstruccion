<%-- 
    Document   : AgregarPresupuesto
    Created on : Jun 24, 2020, 3:42:19 PM
    Author     : trece
--%>

<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(13))
{ 



%>

<div class="" id="">

    <div id="shw">
        <div class="elijaDatos">
            <div class="row p-1">

                <div class="col-3">
                    <div class="form-group">
                        <button class="btn btn-info agregarDetalle">Agrege la obra</button>
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

</div>







<link href="./Estilos/cssPresupuesto.css" rel="stylesheet" type="text/css"/>
<script src="./Javascript/Presupuesto/Prespuesto.js" type="text/javascript"></script>
<%
 }
%>