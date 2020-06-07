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
   
<style>
        
    .addUser{
        width: 100%;
        height: auto;
        background: red;
        display: block;
    }
    .contUser{
        display: block;
        width: 92%;
        height: 37%;
        background: green;
        margin-left: auto;
        margin-right: auto;
    }
    .contPersona{
        display: block;
        width: 92%;
        height: 37%;
        background: gray;
        margin-left: auto;
        margin-right: auto;
    }
    .contPermisos{
        display: block;
        width: 92%;
        height: auto;
        background: green;
        margin-left: auto;
        margin-right: auto; 
    }
    .div-addUser{
        display: block;
        width: 180px;
        height: auto;
        background: gray;
        margin-left: auto;
        margin-right: auto; 
    }
    button{
        
        margin-left: auto;
        margin-right: auto;
        
        
    }
    h4,h3{
         font-family: 'Anton', sans-serif;
         text-align: center;
    }
</style>

<div class="addUser">
    
    <form id="formaddUser">
        
    
    <div class="contUser">
 <div class="loader"></div> 
        <h3>Datos de su Direccion</h3>
<%-- ___________________________________________________________________________________________________ --%>        
        <div class="row"> <%-- Start row Direction --%>

            <div class="col-sm-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="pais" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-sm-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-sm-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

        </div> <%-- end row Direction --%>
 <%-- ___________________________________________________________________________________________________ --%>

<%-- ___________________________________________________________________________________________________ --%>

        <div class="row"> <%-- Start row Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

        </div> <%-- end row Direction --%>
<%-- ___________________________________________________________________________________________________ --%>

<%-- ___________________________________________________________________________________________________ --%>
        <div class="row"> <%-- Start row Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <button  id="btnSigDireccion" class="form-control col-sm-4 btn-info cajasTexto">
                        <span class="glyphicon glyphicon-arrow-right"> Siguiente</span>
                    </button>
                    
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

        </div> <%-- end row Direction --%>
<%-- ___________________________________________________________________________________________________ --%>        

    </div>


  <div class="contPersona">
 <div class="loader"></div> 
        <h3>Datos Personales</h3>
<%-- ___________________________________________________________________________________________________ --%>        
        <div class="row"> <%-- Start row Direction --%>

            <div class="col-sm-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-sm-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-sm-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

        </div> <%-- end row Direction --%>
 <%-- ___________________________________________________________________________________________________ --%>

<%-- ___________________________________________________________________________________________________ --%>

        <div class="row"> <%-- Start row Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

        </div> <%-- end row Direction --%>
<%-- ___________________________________________________________________________________________________ --%>

<%-- ___________________________________________________________________________________________________ --%>
        <div class="row"> <%-- Start row Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-12" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

            <div class="col-4"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <button  id="btnNextPerson" class="col-sm-4 btn-info cajasTexto">
                        <span class="glyphicon glyphicon-arrow-right"> Siguiente</span>
                    </button>
                    <button  id="btnReturnPerson" class="col-sm-4 btn-info cajasTexto">
                        <span class="glyphicon glyphicon-arrow-right"> Regresar</span>
                    </button>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

        </div> <%-- end row Direction --%>
<%-- ___________________________________________________________________________________________________ --%>        

    </div>


  <div class="contPermisos">
 <div class="loader"></div> 
        <h3>Permisos</h3>
<%-- ___________________________________________________________________________________________________ --%>        
         <div class="row"> <%-- Start row Direction --%>

            <div class="col-12"> <%-- Start col Direction --%>
                <div class="form-group"> <%-- Start group Direction --%>
                    <input type="text" class="form-control col-sm-4 mx-auto" id="" name="" placeholder="Ingrese su "/>
                </div> <%-- end group Direction --%>
            </div> <%-- end col Direction --%>

        </div> <%-- end row Direction --%>
<%-- ___________________________________________________________________________________________________ --%>     
<fieldset>
    <div class="form-group row">
                                    <%                            for (Menu me : recMenu) {
            %>
        
        <div class="col-sm-12">


            <div class="form-check">

                <input class="form-check-input" type="checkbox" id="gridCheck1" name="menu<%=(me.getId_Menu())%>">
                <label class="form-check-label" for="gridCheck1">
                    <%=(me.getNombre_Menu())%>
                </label>

            </div>
            <%-- ___________________________________________________________________________________________________ --%>  

        </div>
                                        <%
                }
            %>
    </div>
</fieldset>

    
</div>

</form>    

    <div class="div-addUser">
        
        <div class="row">

            <div class="col-sm-12">
                <buton class="btn btn-success" id="btn-AddUser">Agregar</buton>
                <buton class="btn btn-success" id="btn-ReturnUser">Regresar</buton>
            </div>

        </div>
        
    </div>

</div>

    <script>
        $(function(){
            alert("Diste");
            
        $('#btn-AddUser').click(function(){
            
            alert($("#formaddUser").serialize());
            
        });
        
        });
    </script>










