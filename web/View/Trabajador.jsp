<%-- 
    Document   : Trabajador
    Created on : Jun 21, 2020, 1:55:55 PM
    Author     : trece
--%>

<%@page import="Model.Trabajador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
if(request.getSession().getAttribute("us") == null){
 response.sendRedirect("Login.jsp");   
}

if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(12))
{ 

ArrayList<Trabajador> listaTrabajador = session.getAttribute("ListWorkers") != null ? 
(ArrayList<Trabajador>) session.getAttribute("ListWorkers") : new ArrayList();
%>

<style>
    #idtableClientObra{
        display : none;
    }
    
</style>
<link href="./Estilos/cssServic.css" rel="stylesheet" type="text/css"/>

<div class="services">

    <div class="loaders" id="loadImg"></div>
    <div class="">

        <div class="card mx-auto" style="width: 50rem;">
            <div class="card-header">
                <header class="">Trabajador</header>
            </div>
            <div class="card-body">
                <h5 class="card-title">Agregando Trabajador</h5>

                <form id="formAddWorker">
                    <input type="hidden" name="action" value="addTrabajador">

                    <fieldset>
                        <legend>Datos Personales</legend>
                        <div class="contPersona" id="containerPerson">


                            <%-- ___________________________________________________________________________________________________ --%>        
                            <div class="row"> <%-- Start row Person --%>

                                <div class="col-sm-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <input type="text" required="" value="Abel" minlength="5" class="form-control col-sm-12 BoxText" id="nombre" name="Nombre" placeholder="Ingrese su Nombre"/>
                                    </div> <%-- end group Person --%>
                                </div> <%-- end col Person --%>

                                <div class="col-sm-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <input type="text" required="" value="Tiburcio" minlength="5" class="form-control col-sm-12 BoxText" id="paterno" name="Paterno" placeholder="Ingrese su Paterno"/>
                                    </div> <%-- end group Person --%>
                                </div> <%-- end col Person --%>

                                <div class="col-sm-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <input type="text" required="" value="Felipe" minlength="5" class="form-control col-sm-12 BoxText" id="materno" name="Materno" placeholder="Ingrese su Materno"/>
                                    </div> <%-- end group Person --%>
                                </div> <%-- end col Person --%>

                            </div> <%-- end row Person --%>
                            <%-- ___________________________________________________________________________________________________ --%>

                            <%-- ___________________________________________________________________________________________________ --%>

                            <div class="row"> <%-- Start row Person --%>

                                <div class="col-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <select type="text" class="form-control col-sm-12 BoxText" required="" id="sexo" name="Sexo">
                                            <option value="sex">Seleccione Sexo</option>
                                            <%
                                                String sexo[] = {"Hombre", "Mujer", "Otro"};
                                                for (String sex : sexo) {
                                            %>
                                            <option selected><%=sex%></option>
                                            <%
                                                }
                                            %>

                                        </select>
                                    </div> <%-- end group Person --%>
                                </div> <%-- end col Person --%>

                                <div class="col-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <input type="text" minlength="10" value="7221111793" maxlength="10" class="form-control col-sm-12 BoxText" id="telefono" name="Telefono" placeholder="Ingrese su telefono"/>
                                    </div> <%-- end group Person --%>
                                </div> <%-- end col Person --%>

                                <div class="col-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <input type="date" value="13-05-1994" required="" class="form-control col-sm-12 BoxText" id="fechaNacimiento" name="FechaNacimiento"/>
                                    </div> <%-- end group Person --%>
                                </div> <%-- end col Person --%>

                            </div> <%-- end row Person --%>
                            <%-- ___________________________________________________________________________________________________ --%>

                            <%-- ___________________________________________________________________________________________________ --%>
                            <div class="row"> <%-- Start row Person --%>

                                <div class="col-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <input type="email" minlength="10" value="abel@gmail.com" class="form-control col-sm-12 BoxText" id="correo" name="Correo" placeholder="Ingrese su Correo Electronico"/>
                                    </div> <%-- end group Person --%>
                                </div> <%-- end col Person --%>

    

                            </div> <%-- end row Person --%>
                            <%-- ___________________________________________________________________________________________________ --%>        

                        </div>
                    </fieldset>

                    <%-- -------------------------------------------------------------------------------------------------------------- --%>

                    <fieldset>
                        <legend>Direccion del Trabajador</legend>
                        <div class="row"> <%-- Start row Direction --%>

                            <div class="col-sm-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <select class="form-control col-md-12 mx-auto BoxText" id="pais" name="Pais" >
                                        <option value="default">Seleccione Pais</option>
                                        <option selected>Mexico</option>
                                    </select>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                            <div class="col-sm-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <select class="form-control col-md-12 BoxText" id="estado" name="Estado">
                                        <option value="estado">Seleccione Estado</option>
                                        <%                                        String municipios[] = {"Ciudad de México", "Aguascalientes", "Baja California", "Baja California Sur",
                                                "Campeche", "Chiapas", "Chihuahua", "Coahuila", "Colima", "Durango", "Estado de México",
                                                "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "Michoacán", "Morelos", "Nayarit",
                                                "Nuevo León", "Oaxaca", "Puebla", "Querétaro", "Quintana Roo", "San Luis Potosí",
                                                "Sinaloa", "Sonora", "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatán", "Zacatecas"};

                                            for (String mun : municipios) {
                                        %>
                                        <option selected><%=mun%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                            <div class="col-sm-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <input type="text" required="" value="LLuvianos" class="form-control col-sm-12 BoxText" id="municipio" name="Municipio" placeholder="Ingrese su Municipio"/>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                        </div> <%-- end row Direction --%>
                        <%-- ___________________________________________________________________________________________________ --%>

                        <%-- ___________________________________________________________________________________________________ --%>

                        <div class="row"> <%-- Start row Direction --%>

                            <div class="col-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <input type="text" value="Colonia" class="form-control col-sm-12 BoxText" id="calle" name="Calle" placeholder="Ingrese su Calle"/>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                            <div class="col-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <input type="text" value="Colonia" class="form-control col-sm-12 BoxText" id="colonia" name="Colonia" placeholder="Ingrese su Colonia"/>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                            <div class="col-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <input type="text" value="51440" class="form-control col-sm-12 BoxText" id="postal" name="CodigoPostal" placeholder="Ingrese su Codigo Postal"/>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                        </div> <%-- end row Direction --%>
                        <%-- ___________________________________________________________________________________________________ --%>

                        <%-- ___________________________________________________________________________________________________ --%>
                        <div class="row"> <%-- Start row Direction --%>

                            <div class="col-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <input type="text" value="512" class="form-control col-sm-12 BoxText" id="exterior" name="NumeroExterior" placeholder="Ingrese su Numero Exterior"/>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                            <div class="col-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <input type="text" value="513" class="form-control col-sm-12 BoxText" id="interior" name="NumeroInterior" placeholder="Ingrese su Numero Interior"/>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>


                        </div> <%-- end row Direction --%>
                        <%-- ___________________________________________________________________________________________________ --%>        
                    </fieldset>

                    <%-- --------------------------------------------------------------------------------------------------------------- --%>

                    <fieldset>
                        <legend>Trabajador</legend>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="nameEspecialidad">Ingrese su Especialidad
                                        <input type="text" required="" class="form-control" name="NameEspecialidad" id="nameEspecialidad" placeholder="Ingrese su Especialidad" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="diasTrabajados">Ingrese dias que trabaja
                                        <input type="number" class="form-control" name="diasTrabajados" id="diasTrabajados" placeholder="Ingrese dias que trabaja" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="nameEspecialidad">Ingrese horas Trabajadas
                                        <input type="text" class="form-control" name="HrasTrabajadas" id="HrasTrabajadas" placeholder="Ingrese horas Trabajadas" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="precioDia">Precio por dia Trabajado
                                        <input type="text" class="form-control" name="precioDia" id="precioDia" placeholder="Precio por dia Trabajado" onkeypress="return filterFloat(event,this);" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                    </fieldset>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <button type="submit" class="btn btn-info form-control col-6" style="margin-left: 25%;" id="">Add Worker</button>
                            </div>
                        </div>
                    </div>

                </form>

            </div>

        </div>

    </div>
                          <div class="mensajeUsuario" id="addMensaje">

                                            <div>


                                                <%
                                                    if (session.getAttribute("MensajeTrabajadorAdd") != null) {
                                                %>
                                                <h3><%= session.getAttribute("MensajeTrabajadorAdd").toString()%> </h3>
                                                <%
                                                    session.removeAttribute("MensajeTrabajadorAdd");
                                                } else if(session.getAttribute("MensajeTrabajadorAdd") == null){
                                                %> 
                                                <h3>No se Agrego xD</h3>
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
                                                   <input type="text" class="form-control" name="SearchCard" id="searchCardd" placeholder="Search of Service"/>
                                               </label>
                                               <button class="btn btn-info" id="btnSearch" onclick="searchWorkers();">Buscar</button>
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
                                        for (int i = 0; i < listaTrabajador.size(); i++) {
                                            Trabajador trabajador = listaTrabajador.get(i);

                                    %>

                                    <div class="col-4">
                                        <div class="card text-white bg-dark mb-3" style="display: inline-grid; width: 20rem; ">
                                            <div class="card-header"><header>Nombre TRabajador <%= (trabajador.getPerTrabajador().getNombre_Persona())%></header></div>
                                            <div class="card-body">

                                                <p class="card-text">Especialidad <br/><%= (trabajador.getEspecialidad_Trabajador())%></p>
                                                <p class="card-text">Pais <%= (trabajador.getPerTrabajador().getDireccionPersona().getPais_Direccion())%></p>
                                                <button href="#" class="btn btn-info btnUpdateService" onclick="sendUpdateService(this);" value="<%=i%>">Edit Worker</button>
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


<script src="Javascript/jquery.validate.js" type="text/javascript"></script>
<script src="Javascript/jQueryValidator.js" type="text/javascript"></script>

<script src="./Javascript/Trabajador13.js" type="text/javascript"></script>

<%
    }
%>


<script>
    

    
</script>