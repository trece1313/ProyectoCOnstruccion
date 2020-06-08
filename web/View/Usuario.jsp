<%-- 
    Document   : Usuario
    Created on : Jun 6, 2020, 3:05:33 PM
    Author     : trece
--%>

<%@page import="Controller.ControllerMenu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

ArrayList<Menu>recMenu = new ControllerMenu().showMenu();

%>

<link href="Estilos/User.css" rel="stylesheet" type="text/css"/>


<div class="loaders" id="loadImg">
    
</div> 
<div class="addUser">
    
    <form id="formaddUser">
        
        
        <div class="contUser" id="contDirection">

            <h3>Datos de su Direccion</h3>
            <%-- ___________________________________________________________________________________________________ --%>        
            <div class="row"> <%-- Start row Direction --%>

                <div class="col-sm-4"> <%-- Start col Direction --%>
                    <div class="form-group"> <%-- Start group Direction --%>
                        <select class="form-control col-md-12 mx-auto BoxText" id="pais" name="Pais" >
                            <option>Seleccione Pais</option>
                            <option selected>Mexico</option>
                        </select>
                    </div> <%-- end group Direction --%>
                </div> <%-- end col Direction --%>

                <div class="col-sm-4"> <%-- Start col Direction --%>
                    <div class="form-group"> <%-- Start group Direction --%>
                        <select class="form-control col-md-12 BoxText" id="estado" name="Estado">
                            <option>Seleccione Estado</option>
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
                        <input type="text" class="form-control col-sm-12 BoxText" id="" name="Municipio" placeholder="Ingrese su Municipio"/>
                    </div> <%-- end group Direction --%>
                </div> <%-- end col Direction --%>

            </div> <%-- end row Direction --%>
            <%-- ___________________________________________________________________________________________________ --%>

            <%-- ___________________________________________________________________________________________________ --%>

            <div class="row"> <%-- Start row Direction --%>

                <div class="col-4"> <%-- Start col Direction --%>
                    <div class="form-group"> <%-- Start group Direction --%>
                        <input type="text" class="form-control col-sm-12 BoxText" id="" name="Calle" placeholder="Ingrese su Calle"/>
                    </div> <%-- end group Direction --%>
                </div> <%-- end col Direction --%>

                <div class="col-4"> <%-- Start col Direction --%>
                    <div class="form-group"> <%-- Start group Direction --%>
                        <input type="text" class="form-control col-sm-12 BoxText" id="" name="Colonia" placeholder="Ingrese su Colonia"/>
                    </div> <%-- end group Direction --%>
                </div> <%-- end col Direction --%>

                <div class="col-4"> <%-- Start col Direction --%>
                    <div class="form-group"> <%-- Start group Direction --%>
                        <input type="text" class="form-control col-sm-12 BoxText" id="" name="CodigoPostal" placeholder="Ingrese su Codigo Postal"/>
                    </div> <%-- end group Direction --%>
                </div> <%-- end col Direction --%>

            </div> <%-- end row Direction --%>
            <%-- ___________________________________________________________________________________________________ --%>

            <%-- ___________________________________________________________________________________________________ --%>
            <div class="row"> <%-- Start row Direction --%>

                <div class="col-4"> <%-- Start col Direction --%>
                    <div class="form-group"> <%-- Start group Direction --%>
                        <input type="text" class="form-control col-sm-12 BoxText" id="" name="NumeroExterior" placeholder="Ingrese su Numero Exterior"/>
                    </div> <%-- end group Direction --%>
                </div> <%-- end col Direction --%>

                <div class="col-4"> <%-- Start col Direction --%>
                    <div class="form-group"> <%-- Start group Direction --%>
                        <input type="text" class="form-control col-sm-12 BoxText" id="" name="NumeroInterior" placeholder="Ingrese su Numero Interior"/>
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


            <div class="contPersona" id="containerPerson">
 
        <h3>Datos Personales</h3>
<%-- ___________________________________________________________________________________________________ --%>        
        <div class="row"> <%-- Start row Person --%>

            <div class="col-sm-4"> <%-- Start col Person --%>
                <div class="form-group"> <%-- Start group Person --%>
                    <input type="text" class="form-control col-sm-12 BoxText" id="" name="Nombre" placeholder="Ingrese su Nombre"/>
                </div> <%-- end group Person --%>
            </div> <%-- end col Person --%>

            <div class="col-sm-4"> <%-- Start col Person --%>
                <div class="form-group"> <%-- Start group Person --%>
                    <input type="text" class="form-control col-sm-12 BoxText" id="" name="Paterno" placeholder="Ingrese su Paterno"/>
                </div> <%-- end group Person --%>
            </div> <%-- end col Person --%>

            <div class="col-sm-4"> <%-- Start col Person --%>
                <div class="form-group"> <%-- Start group Person --%>
                    <input type="text" class="form-control col-sm-12 BoxText" id="" name="Materno" placeholder="Ingrese su Materno"/>
                </div> <%-- end group Person --%>
            </div> <%-- end col Person --%>

        </div> <%-- end row Person --%>
 <%-- ___________________________________________________________________________________________________ --%>

<%-- ___________________________________________________________________________________________________ --%>

        <div class="row"> <%-- Start row Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Person --%>
                    <select type="text" class="form-control col-sm-12 BoxText" id="" name="Sexo">
                        <option>Seleccione Sexo</option>
                        <%
                            String sexo[] = {"Hombre", "Mujer", "Otro"};
                            for (String sex : sexo) {
                        %>
                        <option><%=sex%></option>
                        <%
                            }
                        %>

                    </select>
                </div> <%-- end group Person --%>
            </div> <%-- end col Person --%>

            <div class="col-4"> <%-- Start col Person --%>
                <div class="form-group"> <%-- Start group Person --%>
                    <input type="text" class="form-control col-sm-12 BoxText" id="" name="Telefono" placeholder="Ingrese su telefono"/>
                </div> <%-- end group Person --%>
            </div> <%-- end col Person --%>

            <div class="col-4"> <%-- Start col Person --%>
                <div class="form-group"> <%-- Start group Person --%>
                    <input type="date" class="form-control col-sm-12 BoxText" id="" name="FechaNacimiento"/>
                </div> <%-- end group Person --%>
            </div> <%-- end col Person --%>

        </div> <%-- end row Person --%>
<%-- ___________________________________________________________________________________________________ --%>

<%-- ___________________________________________________________________________________________________ --%>
        <div class="row"> <%-- Start row Person --%>

            <div class="col-4"> <%-- Start col Person --%>
                <div class="form-group"> <%-- Start group Person --%>
                    <input type="text" class="form-control col-sm-12 BoxText" id="" name="Correo" placeholder="Ingrese su Correo Electronico"/>
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


<div class="contPermisos" id="contPermit">
 
        <h3>Persimos</h3>
<%-- ___________________________________________________________________________________________________ --%>        
         <div class="row"> <%-- Start row Direction --%>

            <div class="col-12"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-4 mx-auto BoxText" id="" name="Rol" placeholder="Ingrese Rol "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

        </div> <%-- end row Direction --%>
<%-- ___________________________________________________________________________________________________ --%>     

                                    <%                            for (Menu me : recMenu) {
            %>
            <div class="row">     
        <div class="col-sm-12">


            <div class="form-check">

                <input class="form-check-input" type="checkbox" id="gridCheck1" name="menu<%=(me.getId_Menu())%>">
                <label class="form-check-label BoxText" for="gridCheck1">
                    <%=(me.getNombre_Menu())%>
                </label>

            </div>
            <%-- ___________________________________________________________________________________________________ --%>  

        </div>


            </div>
                                                    <%
                }
            %>
            
    
</div>

</form>    

            <div class="div-addUser" id="divadd-User">

                <div class="row">

                    <div class="col-sm-12">
                        <button type="button" class="btn btn-success" id="btn-AddUser">Agregar Usuario</button>
                        <button type="button" class="btn btn-success" id="btn-ReturnUser">Regresar</button>
                    </div>

                </div>

            </div>

</div>


    <script src="Javascript/addUser.js" type="text/javascript"></script>










