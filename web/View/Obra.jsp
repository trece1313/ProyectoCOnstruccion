<%-- 
    Document   : Obra
    Created on : Jun 15, 2020, 9:05:26 PM
    Author     : trece
--%>

<%@page import="Model.Usuario"%>
<%@page import="Model.Cliente"%>
<%@page import="Model.Trabajador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
        if(request.getSession().getAttribute("us") != null && 
          ((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(9))
        { %>

<%
ArrayList<Trabajador> trabajador = new Controller.ControllerTrabajador().allWorkers();
%>
<%
ArrayList<Cliente> clientObra = session.getAttribute("listClient") != null ? 
(ArrayList<Cliente>) session.getAttribute("listClient") : new ArrayList();

%>

<link href="./Estilos/cssObra.css" rel="stylesheet" type="text/css"/>
<style>
    

</style>

<div class="divObra" id="divObra">
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
                    <div class="divExistClientDB" id="idExistClientDB">
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
                    </div>
                    
                                   <div class="divClientAlreadyExists" id="idClientAlreadyExists">

                        <div class="row">
                            <input type="hidden" class="form-control  mx-auto col-12" disabled="" name="idClientObra" id="">
                            <div class="col-3">
                                <div class="form-group">
                                    <label for="nameClientObra" class="col-8">Nombre del Cliente
                                        <input type="text" class="form-control  mx-auto col-12" disabled="" name="" id="nameClientObra">
                                    </label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group mx-auto">
                                    <label for="lastNameClienteObra" class="col-12">Apellidos Cliente
                                        <input type="text" class="form-control col-12" disabled="" name="" id="lastNameClienteObra">
                                    </label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group mx-auto">
                                    <label for="lastNameClienteObra" class="col-12">Pais y Estado
                                        <input type="text" class="form-control col-12" disabled="" name="" id="PaisClienObra">
                                    </label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group mx-auto">
                                    <label for="" class="col-8"></label>
                                    <button type="button" class="form-control col-8 btn btn-warning s" id="btnPrevClienteObrasx">Return to Client</button>
                                    
                                </div>
                            </div>
                        </div>

                    </div>


                </fieldset>
            </div>

            <div class="divUserAtiend" id="idUserAtiend">
                <fieldset>

                    <legend>Atiende</legend>
                    <h3>Datos de quien lo atiende</h3>

                    <%-- ---------------------------------------------------- --%>
                    <div class="row">
  

                        <div class="divShowClient" id="idShowClient">

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


                    </div>
                            <div class="row">
                                
                                <div class="col-6">
                                    <div class="form-group mx-auto">
                                        <label for="" class="col-8"></label>
                                        <button type="button" class="form-control col-8 btn btn-warning s" id="btnNextDts">Next</button>

                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group mx-auto">
                                        <label for="" class="col-8"></label>
                                        <button type="button" class="form-control col-8 btn btn-warning s" id="btnPrevDts">Prev</button>

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
                    
                                         <div class="row">
                                
                                <div class="col-6">
                                    <div class="form-group mx-auto">
                                        <label for="" class="col-6"></label>
                                        <button type="button" class="form-control col-6 btn btn-warning s" id="btnNextDtsCot">Next</button>

                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group mx-auto">
                                        <label for="" class="col-6"></label>
                                        <button type="button" class="form-control col-6 btn btn-warning s" id="btnPrevDtsCot">Prev</button>

                                    </div>
                                </div>
                                
                            </div>


                </fieldset>
            </div>

            <div class="divAnticipoObra" id="idAnticipoObra">
                <fieldset>

                    <legend>Finalizar</legend>
                    <h3>Pago Anticipo</h3>
                    <div class="row">

                        <div class="col-6">
                            <div class="form-group mx-auto">
                                <label for="fechaInicio">Fecha Inicio de Obra</label>
                                <input type="text" class="form-control textBox col-6" value="2020-10-10" placeholder="" name="" id=""/>
                            </div>
                        </div>
                                <div class="col-6">
                                    <div class="form-group mx-auto">
                                        <label for="" class="col-6"></label>
                                        <button type="button" class="form-control col-6 btn btn-warning s" id="Finish">Finish</button>

                                    </div>
                                </div>

                    </div>  
                </fieldset>
            </div>


        </form>
    </div>

</div>

<div class="divFooters" id="divFooter">
    <div class="row">
        <div class="col-6">
            <div class="form-group">
                <label></label>
                <button class="btn btn-success form-control" id="">Alta de Obras</button> 

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

<div class="divCliente" id="divClient">
    <div class="divContenido">
        <div class="btnClosedWindowsClient">
            <button class="btn btn-warning" id="btnCLosedWindowsClient"> Cerrar</button>
        </div>
        <header><h2>Registrar Cliente</h2></header>
        <form id="">
            <fieldset>
                <legend>Direccion Cliente</legend>


                <input type="hidden" name="action" value="addUsers"/>
                <div class="contUser animate__animated animate__bounce" id="contDirection">
                    <%-- ___________________________________________________________________________________________________ --%>        
                    <div class="row"> <%-- Start row Direction --%>

                        <div class="col-sm-4"> <%-- Start col Direction --%>
                            <div class="form-group"> <%-- Start group Direction --%>
                                <select class="form-control col-md-12 mx-auto BoxText" id="pais" name="CountryClientObra" >
                                    <option value="default">Seleccione Pais</option>
                                    <option selected>Mexico</option>
                                </select>
                            </div> <%-- end group Direction --%>
                        </div> <%-- end col Direction --%>

                        <div class="col-sm-4"> <%-- Start col Direction --%>
                            <div class="form-group"> <%-- Start group Direction --%>
                                <select class="form-control col-md-12 BoxText" id="estado" name="CityClientObra">
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
                                <input type="text" required="" value="LLuvianos" class="form-control col-sm-12 BoxText" id="municipio" name="MunicipalityClientObra" placeholder="Ingrese su Municipio"/>
                            </div> <%-- end group Direction --%>
                        </div> <%-- end col Direction --%>

                    </div> <%-- end row Direction --%>
                    <%-- ___________________________________________________________________________________________________ --%>

                    <%-- ___________________________________________________________________________________________________ --%>

                    <div class="row"> <%-- Start row Direction --%>

                        <div class="col-4"> <%-- Start col Direction --%>
                            <div class="form-group"> <%-- Start group Direction --%>
                                <input type="text" value="Colonia" class="form-control col-sm-12 BoxText" id="calle" name="StreetClientObra" placeholder="Ingrese su Calle"/>
                            </div> <%-- end group Direction --%>
                        </div> <%-- end col Direction --%>

                        <div class="col-4"> <%-- Start col Direction --%>
                            <div class="form-group"> <%-- Start group Direction --%>
                                <input type="text" value="Colonia" class="form-control col-sm-12 BoxText" id="colonia" name="ColonyClientObra" placeholder="Ingrese su Colonia"/>
                            </div> <%-- end group Direction --%>
                        </div> <%-- end col Direction --%>

                        <div class="col-4"> <%-- Start col Direction --%>
                            <div class="form-group"> <%-- Start group Direction --%>
                                <input type="text" value="51440" class="form-control col-sm-12 BoxText" id="postal" name="CodeClientObra" placeholder="Ingrese su Codigo Postal"/>
                            </div> <%-- end group Direction --%>
                        </div> <%-- end col Direction --%>

                    </div> <%-- end row Direction --%>
                    <%-- ___________________________________________________________________________________________________ --%>

                    <%-- ___________________________________________________________________________________________________ --%>
                    <div class="row"> <%-- Start row Direction --%>

                        <div class="col-4"> <%-- Start col Direction --%>
                            <div class="form-group"> <%-- Start group Direction --%>
                                <input type="text" value="512" class="form-control col-sm-12 BoxText" id="exterior" name="ExteriorClientObra" placeholder="Ingrese su Numero Exterior"/>
                            </div> <%-- end group Direction --%>
                        </div> <%-- end col Direction --%>

                        <div class="col-4"> <%-- Start col Direction --%>
                            <div class="form-group"> <%-- Start group Direction --%>
                                <input type="text" value="513" class="form-control col-sm-12 BoxText" id="interior" name="InteriorClientObra" placeholder="Ingrese su Numero Interior"/>
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
                                <input type="text" required="" value="Abel" minlength="5" class="form-control col-sm-12 BoxText" id="nombre" name="NamePersonObra" placeholder="Ingrese su Nombre"/>
                            </div> <%-- end group Person --%>
                        </div> <%-- end col Person --%>

                        <div class="col-sm-4"> <%-- Start col Person --%>
                            <div class="form-group"> <%-- Start group Person --%>
                                <input type="text" required="" value="Tiburcio" minlength="5" class="form-control col-sm-12 BoxText" id="paterno" name="LastNamePersonObra" placeholder="Ingrese su Paterno"/>
                            </div> <%-- end group Person --%>
                        </div> <%-- end col Person --%>

                        <div class="col-sm-4"> <%-- Start col Person --%>
                            <div class="form-group"> <%-- Start group Person --%>
                                <input type="text" required="" value="Felipe" minlength="5" class="form-control col-sm-12 BoxText" id="materno" name="LastNameMPersonObra" placeholder="Ingrese su Materno"/>
                            </div> <%-- end group Person --%>
                        </div> <%-- end col Person --%>

                    </div> <%-- end row Person --%>
                    <%-- ___________________________________________________________________________________________________ --%>

                    <%-- ___________________________________________________________________________________________________ --%>

                    <div class="row"> <%-- Start row Person --%>

                        <div class="col-4"> <%-- Start col Person --%>
                            <div class="form-group"> <%-- Start group Person --%>
                                <select type="text" class="form-control col-sm-12 BoxText" required="" id="sexo" name="SexPersonObra">
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
                                <input type="text" minlength="10" value="7221111793" maxlength="10" class="form-control col-sm-12 BoxText" id="telefono" name="PhonePersonObra" placeholder="Ingrese su telefono"/>
                            </div> <%-- end group Person --%>
                        </div> <%-- end col Person --%>

                        <div class="col-4"> <%-- Start col Person --%>
                            <div class="form-group"> <%-- Start group Person --%>
                                <input type="date" value="13-05-1994" required="" class="form-control col-sm-12 BoxText" id="fechaNacimiento" name="BirthdatePersonObra"/>
                            </div> <%-- end group Person --%>
                        </div> <%-- end col Person --%>

                    </div> <%-- end row Person --%>
                    <%-- ___________________________________________________________________________________________________ --%>

                    <%-- ___________________________________________________________________________________________________ --%>
                    <div class="row"> <%-- Start row Person --%>

                        <div class="col-4"> <%-- Start col Person --%>
                            <div class="form-group"> <%-- Start group Person --%>
                                <input type="email" minlength="10" value="abel@gmail.com" class="form-control col-sm-12 BoxText" id="correo" name="EmailPersonObra" placeholder="Ingrese su Correo Electronico"/>
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
                    
              
                    <div class="tableClientObra" id="idtableClientObra">
                        <div class="divTableClienteObraContenido" id="idTableClienteObraContenido">
                        <table border="1" class="table">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Apellidos</th>
                                    <th>Pais</th>
                                    
                                    <th>agregar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                for (int i=0; i<clientObra.size();i++) {
                                       Cliente cli = clientObra.get(i);
                                       

                                %>                            
                                <tr>
                                    <td><%= (cli.getPersonaCliente().getNombre_Persona()) %></td>
                                    <td><%= (cli.getPersonaCliente().getPaterno_Persona() + " "+cli.getPersonaCliente().getMaterno_Persona())%></td>
                                    <td><%=(cli.getPersonaCliente().getDireccionPersona().getPais_Direccion() + " " + cli.getPersonaCliente().getDireccionPersona().getEstado_Direccion()) %></td>
                                    
                                    <td><button class="btn btn-info addClientObra" id="btn-addClient" value="<%= i%>">add</button></td>
                                </tr>
                                <%
                                  }
                                %>
                            </tbody>
                        </table>
                        </div>
                    </div>
        


           
                                    
                                    
                                    
<script src="./Javascript/Obra.js" type="text/javascript"></script>

<%
    }
%>