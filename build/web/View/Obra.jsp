<%-- 
    Document   : Obra
    Created on : Jun 15, 2020, 9:05:26 PM
    Author     : trece
--%>

<%@page import="Model.Trabajador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
ArrayList<Trabajador> trabajador = new Controller.ControllerTrabajador().allWorkers();
%>


<style>
    
    .divObra{
        width: 95%;
        height: auto;
        margin: auto;
        
    }
    header{
        text-align: center;
    }
    legend,h3{
        text-align: center;
    }
    #seguir{
        margin-left: 50%;
    }
    #pararRegistrarCliente{
    margin-left: 0%;
    }
    
    .divCliente{
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
        background-color: green;
        text-align: center;
        position: absolute; 
        top: 15%; 
        left: 25%;
        width: 50%; 
        
        
    }
    
</style>

<div class="divObra">
    <header><h2>Registrar Obra</h2></header>
    
    <div class="divBody">
        <form id="" class="">
            
            <div class="divTrabajadorObra" id="idTrabajadorObra">
            <fieldset>
                
                <legend>Seleccione al Trabajador</legend>
                
                <div class="row">     
                  

         <% for (Trabajador tra : trabajador) {
                %>
                        <label class="col-4 col-sm-4">

                            <input class="form-check-input" type="radio" id="gridCheck1" name="menu" value=""/>
                            
                                <%=(tra.getPerTrabajador().getNombre_Persona()) + " " + (tra.getPerTrabajador().getPaterno_Persona())%>
                            </label>

               
                        <%-- ___________________________________________________________________________________________________ --%>  
          <%
                    }
                %>


                </div>
                
                
            </fieldset>
          </div>     
                 <div class="divExistCliente" id="idExistCliente">
             <fieldset>
                
                <legend>Cliente</legend>
                <h3>Esta Registrado?</h3>
                <div class="row">
                    
                    <div class="col-6">
                        <div class="form-group mx-auto">
                            <button type="button" class="btn btn-info form-control col-6" id="seguir"> Si</button>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <button type="button" class="btn btn-info form-control col-6" id="pararRegistrarCliente"> No</button>
                        </div>
                    </div>                    
                </div>
                
                
            </fieldset>
                 </div>
                
                <div class="divUserAtiend" id="idUserAtiend">
             <fieldset>
                
                <legend>Atiende</legend>
                <h3>Datos de quien lo atiende</h3>
                <div class="row">
                    
                    <div class="col-6">
                        <div class="form-group mx-auto">
                            <button class="btn btn-info form-control col-6" id="seguir"> Si</button>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <button class="btn btn-info form-control col-6" id="pararRegistrarCliente"> No</button>
                        </div>
                    </div>                    
                </div>
                
                
            </fieldset>
                </div>
                <div class="divInicioObra" id="idInicioObra">
             <fieldset>
                
                <legend>Inicio de Obra</legend>
                <h3>Datos de quien lo atiende</h3>
                <div class="row">
                    
                    <div class="col-4">
                        <div class="form-group mx-auto">
                            <label for="fechaInicio">Fecha Inicio de Obra</label>
                            <input type="text" class="form-control textBox" value="2020-10-10" placeholder="" name="" id=""/>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-group">
                            <label for="fechaInicio" class="">Fecha FIn de Obra</label>
                            <input type="text" class="form-control textBox" value="2020-10-10" placeholder="" name="" id=""/>
                        </div>
                    </div>    
                    <div class="col-4">
                        <div class="form-group">
                            <label for="fechaInicio">Fecha Cotizacion de Obra</label>
                            <input type="text" class="form-control textBox" value="2020-10-10" placeholder="" name="" id=""/>
                        </div>
                    </div>  
                </div>
                
                
            </fieldset>
                </div>
                
                <div class="divAnticipoObra" id="idAnticipoObra">
             <fieldset>
                
                <legend>Anticipo</legend>
                <h3>Pago Anticipo</h3>
                <div class="row">
                    
                    <div class="col-12">
                        <div class="form-group mx-auto">
                            <label for="fechaInicio">Fecha Inicio de Obra</label>
                            <input type="text" class="form-control textBox" value="2020-10-10" placeholder="" name="" id=""/>
                        </div>
                    </div>

                    </div>  
                </div>
                
                
            </fieldset>
                </div>
        </form>
    </div>
    
    <div class="divFooter">
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label></label>
                    <button class="btn btn-success form-control" id="">Alta de Obra</button> 

                </div>
            </div>    
            <div class="col-6">
                <div class="form-group">
                    <label></label>
                    <button class="btn btn-success form-control" id=""> Regresar</button> 

                </div>
        </div>
    </div>
    
</div>
                
                <div class="divCliente">
                    <div class="divContenido">
                        <header><h2>Cliente</h2></header>
                        <form id="">
                            <fieldset>
                                <legend>Direccion Cliente</legend>


                                <input type="hidden" name="action" value="addUsers"/>
                                <div class="contUser animate__animated animate__bounce" id="contDirection">
                                    <%-- ___________________________________________________________________________________________________ --%>        
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

                                        <div class="col-4"> <%-- Start col Direction --%>
                                            <div class="form-group"> <%-- Start group Direction --%>
                                                <button  type="button" id="btnSigDireccion" class="form-control col-sm-4 btn-info BoxText">
                                                    <span class="glyphicon glyphicon-arrow-right"> Siguiente</span>
                                                </button>

                                            </div> <%-- end group Direction --%>
                                        </div> <%-- end col Direction --%>

                                    </div> <%-- end row Direction --%>
                                    <%-- ___________________________________________________________________________________________________ --%>        

                                </div>


                            </fieldset>
                            <fieldset>
                                
                                <div class="contPersona" id="containerPerson">

                                    <legend> <h3>Datos Personales</h3></legend>
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

                                        <div class="col-4"> <%-- Start col Person --%>
                                            <div class="form-group"> <%-- Start group Person --%>
                                                <button type="button" id="btnNextPerson" class="form-control col-sm-4 btn-info cajasTexto">
                                                    <span class="glyphicon glyphicon-arrow-right"> Siguiente</span>
                                                </button>

                                            </div> <%-- end group Person --%>
                                        </div> <%-- end col Person --%>

                                        <div class="col-4"> <%-- Start col Person --%>
                                            <div class="form-group"> <%-- Start group Person --%>
                                                <button type="button" id="btnReturnPerson" class="form-control col-sm-4 btn-info cajasTexto">
                                                    <span class="glyphicon glyphicon-arrow-right"> Regresar</span>
                                                </button>

                                            </div> <%-- end group Person --%>
                                        </div> <%-- end col Person --%>

                                    </div> <%-- end row Person --%>
                                    <%-- ___________________________________________________________________________________________________ --%>        

                                </div>

                            </fieldset>
                
                        </form>
                    </div>
                </div>
