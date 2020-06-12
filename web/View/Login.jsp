<%-- 
    Document   : Login
    Created on : Jun 5, 2020, 5:45:28 PM
    Author     : trece
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("us") == null){

%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <link href="../Estilos/Login.css" rel="stylesheet" type="text/css"/>
    <title>Login</title>
     </head>
     
  <body>

      <div class="centContent">
          
          <div class="divHeader">
              <div class="contHeader"><header><h1>Presupuestos Construcciones</h1></header></div>
          </div>
          
          <div class="contTort">
              
          </div>
          
          <div class="contLogin">
              <div class="contInput">
                  <h2>Login</h2>
                  
                  <form id="formLogin">

                      <div class="row">
                          <div class="col-sm-8">
                              <div class="form-group">
                                  <input type="text" name="Usuario" id="user" value="" placeholder="Ingrese Usuario" class="form-control">
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-sm-8">
                              <div class="form-group">
                                  <input type="password" name="PassUsuario" id="pass" value="" placeholder="Ingrese Password" class="form-control">
                              </div>
                          </div>
                      </div>
                      
                  </form>
                  <div class="row">
                      <div class="col-sm-8">
                          <div class="form-group">
                              <button type="button" class="btn btn-success form-control btnIngresar" id="btn-Ingresar">
                                  <span class="glyphicon-glyphicon-plus"></span> Iniciar Sesion
                              </button>
                          </div>
                      </div>
                  </div>
                  
 <div class="addMensaje" id="mensaje">
                <%
        if (session.getAttribute("Mensaje") != null) {
    %>
        <%=session.getAttribute("Mensaje").toString()%>
    <%
            session.removeAttribute("Mensaje");
        }
    %> 
              
          </div>

          </div>

          
          </div>


      </div>
     
      



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="../Javascript/Acceder.js" type="text/javascript"></script>

  </body>
</html>

<%
    }
%>