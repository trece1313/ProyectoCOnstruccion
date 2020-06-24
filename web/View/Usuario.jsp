<%-- 
    Document   : Usuario
    Created on : Jun 6, 2020, 3:05:33 PM
    Author     : trece
--%>
<!--
<%@page import="ModelDAO.MenuDAO"%>
<%@page import="ModelDAO.CRUD"%>
<%@page import="Model.Usuario"%>
<%@page import="Controller.ControllerMenu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   if(request.getSession().getAttribute("us") != null && 
          ((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(6) )
        {

%>
<%
    CRUD showMenu = new ControllerMenu();
ArrayList<Menu>recMenu = showMenu.showAll() ;

%>
<meta charset="utf-8">
<link href="Estilos/User.css" rel="stylesheet" type="text/css"/>
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">


<div class="loaders" id="loadImg">
    
</div> 
<div class="addUser">
    
    <form id="formaddUser">
        <fieldset>  
            <input type="hidden" name="action" value="addUsers"/>
            <div class="contUser animate__animated animate__bounce" id="contDirection">

                <legend> <h3>Datos de su Direccion</h3></legend>
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


            <div class="contPersona" id="containerPerson">

                <h3>Datos Personales</h3>
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


            <div class="contPermisos" id="contPermit">

                <h3>Persimos</h3>
                <%-- ___________________________________________________________________________________________________ --%>        
                <div class="row"> <%-- Start row Direction --%>

                    <div class="col-12"> <%-- Start col Direction --%>
                        <div class="form-group"> <%-- Start group Direction --%>
                            <input type="text" value="NUevo Rol" class="form-control col-sm-4 mx-auto BoxText" id="rol" name="Rol" placeholder="Ingrese Rol "/>
                        </div> <%-- end group Direction --%>
                    </div> <%-- end col Direction --%>

                </div> <%-- end row Direction --%>
                <%-- ___________________________________________________________________________________________________ --%>     

       
                <div class="row">     
                  

         <% for (Menu me : recMenu) {
                %>
                        <label class="col-6 col-sm-4">

                            <input class="form-check-input" type="checkbox" id="gridCheck1" name="menu" value="<%=(me.getId_Menu())%>">
                            
                                <%=(me.getNombre_Menu())%>
                            </label>

               
                        <%-- ___________________________________________________________________________________________________ --%>  
          <%
                    }
                %>


                </div>
      
                <div class="row">

                    <div class="col-sm-6">
                        <div class="form-group"> <%-- Start group Person --%>
                            <button type="button" id="btnNextRol" class=" mx-auto form-control col-sm-6 btn-info cajasTexto">
                                <span class="glyphicon glyphicon-arrow-right"> Siguiente Rol</span>
                            </button>

                        </div> <%-- end group Person --%>
                    </div>

                    <div class="col-6"> <%-- Start col Person --%>
                        <div class="form-group"> <%-- Start group Person --%>
                            <button type="button" id="btnReturnRol" class="mx-auto form-control col-sm-4 btn-info cajasTexto">
                                <span class="glyphicon glyphicon-arrow-right"> Regresar Rol</span>
                            </button>

                        </div> <%-- end group Person --%>
                    </div> <%-- end col Person --%>

                </div> 

            </div>
                
                <div class="divUsuario" id="divUsuari">
                    <header>
                        <h3>Crear Usuario para el Sistema</h3>
                    </header>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <input type="text" class="form-control col-sm-6 mx-auto BoxText" name="UserName" id="userName" placeholder="Ingrese su User Name" value="abel"/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <input type="password" class="form-control col-sm-6 mx-auto BoxText" name="PassUser" id="PassUser" placeholder="Ingrese Password" value="123"/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <input type="password" class="form-control col-sm-6 mx-auto BoxText" name="PassUserConf" id="passUserConf" placeholder="Repita su Password" value="123"/>
                            </div>
                        </div>
                    </div>
                    
 
                </div>
        </fieldset>
</form>    

            <div class="div-addUser" id="divadd-User">

                <div class="row">

                    <div class="col-sm-12">
                        <button type="button" class="btn btn-success" id="btn-AddUsers">Agregar Usuario</button>
                        <button type="button" class="btn btn-success" id="btn-ReturnUser">Regresar</button>
                    </div>

                </div>

            </div>
                    
                    <div class="mensajeUsuario" id="addMensaje">
                       
                        <div>
                           

                        <%
                            if (session.getAttribute("MensajeUsuario") != null) {
                        %>
                        <h3><%= session.getAttribute("MensajeUsuario").toString()%> </h3>
                        <%
                                session.removeAttribute("MensajeUsuario");
                            }else{
                        %> 
                        <h3>No entro</h3>
                        <%
                           }
                        %>
                        <button class="btn btn-info btnCloseMesage" > cerrar</button>
                        </div>
                    </div>

</div>

        <%
            }
        %>    -->
<!--    <script src="Javascript/addUser.js" type="text/javascript"></script>
    <script src="Javascript/ValidaterUser.js" type="text/javascript"></script>
    
    <script>
    $(function(){
      
     $('#btn-AddUsers').click(addUser);
     $(".btnCloseMesage").click(hideMessage);
        
    });  
    
    
    function hideMessage(){
        
        
               $('.mensajeUsuario').css({'display':'none'});
              $('.mensajeUsuario').empty();
        
    }
    
    function addUser()
{
    var loadDiv = document.getElementById('loadImg');
        
        loadDiv.style.display = "block";
        $('.divUsuario').css({'display':'none'});
        $('.div-addUser').css({'display':'none'});
        setTimeout(function ()
          {
              
                $.ajax({
                type: 'POST',
                url: 'UsuariosDatos',
                data: $('#formaddUser').serialize(),
                success: function () {
                    
               $('.mensajeUsuario').css({'display':'block'});
               // $('.mensajeUsuario div').css({'display':'block'});
                
                loadDiv.style.display = 'none';
                
        setTimeout(function ()
          {
              
              $('.mensajeUsuario').css({'display':'none'});
              $('.mensajeUsuario').empty();
              $('.contenedorPagPricipal').empty();
          }, 2000);
                    
                    
                },
    error : function(xhr, status) {
        alert('Disculpe, existió un problema');
    },

    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        console.log('Petición realizada');
    }
            });
              
          }, 4000);
    

 
}

        
    </script>







-->
