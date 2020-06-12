<%-- 
    Document   : Menu
    Created on : Jun 5, 2020, 6:12:58 PM
    Author     : trece
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("us") != null){
%>
<script>
 
 $(function(){
     $('.goEmployee').click(function(){
         
         
        $('#contPrincipal').load('View/Usuario.jsp');

     });
          $('.goClient').click(function(){
        

         $('#contPrincipal').load('View/Cliente.jsp');

     });
     
 });
    
</script>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="Login.jsp">Bienvenidos</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Employee
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item goEmployee" href="#">add</a>
                    <a class="dropdown-item" href="#">show Employee</a>

                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="Cliente.jsp" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Client
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item goClient" href="#">add</a>
                    <a class="dropdown-item" href="#">show Clients</a>

                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Proveedor
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">add</a>
                    <a class="dropdown-item" href="#">Show</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Proveedor
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">add</a>
                    <a class="dropdown-item" href="#">Show</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Proveedores
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">add</a>
                    <a class="dropdown-item" href="#">Show</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>


            <li class="nav-item dropdown">
                <a class="btn-success" id="diste" onclick="signOut();" style="padding: 10px 15px; position: relative; top: 10px; left: 25px;">
                    Salir
                </a>

            </li>

        </ul>
    </div>
</nav>


<%
    }
%>