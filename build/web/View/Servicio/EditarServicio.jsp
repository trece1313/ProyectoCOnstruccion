<%-- 
    Document   : EditarServicio
    Created on : Jun 20, 2020, 10:17:10 PM
    Author     : trece


<%@page import="Model.Servicio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
if(request.getSession().getAttribute("us") == null){
 response.sendRedirect("../../View/Login.jsp");   
}

if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(10))
{ 

        
        int indice = Integer.parseInt(request.getParameter("idServiceUpdate"));
        
        Servicio serEdit = ((ArrayList<Servicio>) session.getAttribute("ListUpdateServ")).get(indice);
        session.setAttribute("UpdateService", serEdit);

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
                Featured
            </div>
            <div class="card-body">
                <h5 class="card-title">Descripciones Espectaculares</h5>

                <form id="formUpdateService">
                    <input type="hidden" name="action" value="updateService">
                    <fieldset>
                        <legend>Servicio Disponible</legend>
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="nameService">Type service name
                                        <input type="text" required="" class="form-control" value="<%=(serEdit.getNombre_Servicio())%>" name="nameService" id="NameService" placeholder="type service name">
                                    </label>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="descriptionService">Type the service description 
                                        <textarea cols="20" rows="3" class="form-control" name="DescriptionService" id="descriptionService" placeholder="Type the service description "><%=(serEdit.getDescipcion_Servicio())%></textarea>
                                    </label>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="precioService">Type the price per meter
                                        <input type="text" class="form-control" name="PrecioService" id="precioService" value="<%=(serEdit.getPrecioPorMetro())%>" placeholder="Type the price per meter" onkeypress="return filterFloat(event,this);" >
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-info form-control col-6 diz" style="margin-left: 25%;" id="">Update Service</button>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>

                </div>

        </div>

    </div>

                                        <div class="mensajeUsuario" id="addMensaje">

                                            <div>


                                                <%
                                                    if (session.getAttribute("MensajeServicioUpdate") != null) {
                                                %>
                                                <h3><%= session.getAttribute("MensajeServicioUpdate").toString()%> </h3>
                                                <%
                                                    session.removeAttribute("MensajeServicioUpdate");
                                                } else if(session.getAttribute("MensajeServicioUpdate") == null){
                                                %> 
                                                <h3> <%= session.getAttribute("MensajeServicioUpdate").toString()%>  No entro</h3>
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

<script>
    
    $(function(){
           $('#formUpdateService').validate({
        rules: {
           nameService:{required: true, maxlength: 20, minlength: 3}, 
           DescriptionService:{required: true, maxlength: 200, minlength: 5},
           PrecioService:{required: true, maxlength: 10, minlength: 1}
            
        },            
        submitHandler: function (form) {
           
  
  //alert($(form).serialize());
    //       return false;
  $('.loaders').css({'display': 'block'});
            setTimeout(function ()
            {
                $.ajax({
                    type: 'post',
                    url: 'DataServicio',
                    data: $(form).serialize(),
                    success: function () {
                       $('.mensajeUsuario').css({'display': 'block'});
                         $('.loaders').css({'display': 'none'});
                        setTimeout(function ()
                        {
                         
                            $('.mensajeUsuario').css({'display': 'block'});
                               
                         
                           location.reload();
                        }, 2000);
                        

                    }
                });
                
                

                
            }, 3000);

        }
    }); 
    
    
    });
    
</script>



--%>