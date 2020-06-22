<%-- 
    Document   : EditarTrabajador
    Created on : Jun 21, 2020, 11:44:55 PM
    Author     : trece
--%>

<%@page import="Model.Trabajador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
if(request.getSession().getAttribute("us") == null){
 response.sendRedirect("../../View/Login.jsp");   
}

if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(12))
{ 
        int indice = Integer.parseInt(request.getParameter("idWorkerUpdate"));
        Trabajador traEdit = ((ArrayList<Trabajador>) session.getAttribute("ListWorkers")).get(indice);
        session.setAttribute("UpdateWorker", traEdit);

%>

<style>
    
    .loaders{
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    display: none;
    background: url('Imagenes/cargandoImagen.gif') 50% 30% no-repeat rgb(249,249,249);
    opacity: .8;
    }
        .mensajeUsuario{
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
    .mensajeUsuario div{
        color: black;
        font-family: 'Anton', sans-serif;
        text-align: center;
        position: absolute; 
        top: 25%; 
        left: 25%;
        width: 50%; 
        height: 50%;
    }
    .mensajeUsuario div button{
        color: black;
    }
        .mensajeUsuario div button:hover{
        
            background-color: black;
            color: white;
        
    }
    </style>
 <div class="loaders" id="loadImg"></div>
    <div class="">

        <div class="card mx-auto" style="width: 50rem;">
            <div class="card-header">
                <header class="">Trabajador</header>
            </div>
            <div class="card-body">
                <h5 class="card-title">Agregando Trabajador</h5>

                <form id="formUpdateWorker">
                    <input type="hidden" name="action" value="updateTrabajador">

                    <fieldset>
                        <legend>Datos Personales</legend>
                        <div class="contPersona" id="containerPerson">


                            <%-- ___________________________________________________________________________________________________ --%>        
                            <div class="row"> <%-- Start row Person --%>

                                <div class="col-sm-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <input type="text" required="" value="<%=(traEdit.getPerTrabajador().getNombre_Persona())%>" minlength="5" class="form-control col-sm-12 BoxText" id="nombre" name="Nombre" placeholder="Ingrese su Nombre" />
                                    </div> <%-- end group Person --%>
                                </div> <%-- end col Person --%>

                                <div class="col-sm-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <input type="text" required="" value="<%=(traEdit.getPerTrabajador().getPaterno_Persona())%>" minlength="5" class="form-control col-sm-12 BoxText" id="paterno" name="Paterno" placeholder="Ingrese su Paterno"/>
                                    </div> <%-- end group Person --%>
                                </div> <%-- end col Person --%>

                                <div class="col-sm-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <input type="text" required="" value="<%=(traEdit.getPerTrabajador().getMaterno_Persona())%>" minlength="5" class="form-control col-sm-12 BoxText" id="materno" name="Materno" placeholder="Ingrese su Materno"/>
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
                                        <input type="text" minlength="10" value="<%=(traEdit.getPerTrabajador().getTelefono_Persona())%>" maxlength="10" class="form-control col-sm-12 BoxText" id="telefono" name="Telefono" placeholder="Ingrese su telefono"/>
                                    </div> <%-- end group Person --%>
                                </div> <%-- end col Person --%>

                                <div class="col-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <input type="date" value="<%=(traEdit.getPerTrabajador().getFechaNacimiento_Persona())%>" required="" class="form-control col-sm-12 BoxText" id="fechaNacimiento" name="FechaNacimiento"/>
                                    </div> <%-- end group Person --%>
                                </div> <%-- end col Person --%>

                            </div> <%-- end row Person --%>
                            <%-- ___________________________________________________________________________________________________ --%>

                            <%-- ___________________________________________________________________________________________________ --%>
                            <div class="row"> <%-- Start row Person --%>

                                <div class="col-4"> <%-- Start col Person --%>
                                    <div class="form-group"> <%-- Start group Person --%>
                                        <input type="email" minlength="10" value="<%=(traEdit.getPerTrabajador().getCorreo_Persona() == null ? "" : traEdit.getPerTrabajador().getCorreo_Persona())%>" class="form-control col-sm-12 BoxText" id="correo" name="Correo" placeholder="Ingrese su Correo Electronico"/>
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
                                        <option value="<%=(traEdit.getPerTrabajador().getDireccionPersona().getPais_Direccion())%>" selected>Mexico</option>
                                    </select>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                            <div class="col-sm-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <select class="form-control col-md-12 BoxText" id="estado" name="Estado">
                                        <option value="estado">Seleccione Estado</option>
                                        <%                                        
                                            String municipios[] = {"Ciudad de México", "Aguascalientes", "Baja California", "Baja California Sur",
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
                                    <input type="text" required="" value="<%=(traEdit.getPerTrabajador().getDireccionPersona().getMunicipio_Direccion())%>" class="form-control col-sm-12 BoxText" id="municipio" name="Municipio" placeholder="Ingrese su Municipio"/>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                        </div> <%-- end row Direction --%>
                        <%-- ___________________________________________________________________________________________________ --%>

                        <%-- ___________________________________________________________________________________________________ --%>

                        <div class="row"> <%-- Start row Direction --%>

                            <div class="col-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <input type="text" value="<%=(traEdit.getPerTrabajador().getDireccionPersona().getCalle_Direccion())%>" class="form-control col-sm-12 BoxText" id="calle" name="Calle" placeholder="Ingrese su Calle"/>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                            <div class="col-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <input type="text" value="<%=(traEdit.getPerTrabajador().getDireccionPersona().getColonia_Direccion())%>" class="form-control col-sm-12 BoxText" id="colonia" name="Colonia" placeholder="Ingrese su Colonia"/>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                            <div class="col-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <input type="text" value="<%=(traEdit.getPerTrabajador().getDireccionPersona().getCodigoPostal_Direccion())%>" class="form-control col-sm-12 BoxText" id="postal" name="CodigoPostal" placeholder="Ingrese su Codigo Postal"/>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                        </div> <%-- end row Direction --%>
                        <%-- ___________________________________________________________________________________________________ --%>

                        <%-- ___________________________________________________________________________________________________ --%>
                        <div class="row"> <%-- Start row Direction --%>

                            <div class="col-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <input type="text" value="<%=(traEdit.getPerTrabajador().getDireccionPersona().getNumeroExterior_Direccion())%>" class="form-control col-sm-12 BoxText" id="exterior" name="NumeroExterior" placeholder="Ingrese su Numero Exterior"/>
                                </div> <%-- end group Direction --%>
                            </div> <%-- end col Direction --%>

                            <div class="col-4"> <%-- Start col Direction --%>
                                <div class="form-group"> <%-- Start group Direction --%>
                                    <input type="text" value="<%=(traEdit.getPerTrabajador().getDireccionPersona().getNumeroInterior_Direccion())%>" class="form-control col-sm-12 BoxText" id="interior" name="NumeroInterior" placeholder="Ingrese su Numero Interior"/>
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
                                        <input type="text" required="" value="<%=(traEdit.getEspecialidad_Trabajador())%>" class="form-control" name="NameEspecialidad" id="nameEspecialidad" placeholder="Ingrese su Especialidad" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="diasTrabajados">Ingrese dias que trabaja
                                        <input type="number" value="<%=(traEdit.getDiasTrabajoSemanaTrabajador())%>" class="form-control" name="diasTrabajados" id="diasTrabajados" placeholder="Ingrese dias que trabaja" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="nameEspecialidad">Ingrese horas Trabajadas
                                        <input type="text" value="<%=(traEdit.getHorasPorDiaTrabajadas())%>" class="form-control" name="HrasTrabajadas" id="HrasTrabajadas" placeholder="Ingrese horas Trabajadas" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="precioDia">Precio por dia Trabajado
                                        <input type="text" value="<%=(traEdit.getPrecioPorDiaTrabajado())%>" class="form-control" name="precioDia" id="precioDia" placeholder="Precio por dia Trabajado" onkeypress="return filterFloat(event,this);" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                    </fieldset>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <button type="submit" class="btn btn-info form-control col-6" style="margin-left: 25%;" id="">Update Worker</button>
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
                                                    if (session.getAttribute("MensajeTrabajadorUps") != null) {
                                                %>
                                                <h3><%= session.getAttribute("MensajeTrabajadorUps").toString()%> </h3>
                                                <%
                                                    session.removeAttribute("MensajeTrabajadorUps");
                                                } else if(session.getAttribute("MensajeTrabajadorUps") == null){
                                                %> 
                                                <h3><%= session.getAttribute("MensajeTrabajadorUps").toString()%> </h3>
                                                <%
                                                    }
                                                %>
                                                <button class="btn btn-info btnCloseMesage" > cerrar</button>
                                            </div>
                                        </div>
    
    
<%
    }
%>
    <script src="./Javascript/jquery.validate.js" type="text/javascript"></script>
<script src="./Javascript/jQueryValidator.js" type="text/javascript"></script>
<script src="./Javascript/Trabajador13.js" type="text/javascript"></script>

<script>
    
    
    $(function(){
       
        
    });
    
</script>