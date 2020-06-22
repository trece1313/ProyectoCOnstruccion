<%-- 
    Document   : Menu
    Created on : Jun 5, 2020, 6:12:58 PM
    Author     : trece
--%>

<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("us") != null){
%>
<script>
 
 $(function(){
       ajaxTrabajador();
     $('.goUser').click(function(){

        $('#contPrincipal').load('View/Usuario.jsp');
        
        $(".navbar-collapse").removeClass('show');
     });

     $('.btnShowHideNav').click(navConstruction);
     
     $('.goObra').click(function(){
         goOpenView('./View/Obra.jsp');
     });
     
    $('.goService').click(function(){
         goOpenView('./View/Servicio.jsp');
     });
    
     $('.goShowAll').click(function(){
         goOpenView('./View/Servicio.jsp #idtableClientObra');
     });
     
     $('.goWorker').click(function(){
           
         goOpenView('./View/Trabajador.jsp');
     });
     $('.showAllWorker').click(function(){
             ajaxTrabajador();
         goOpenView('./View/Trabajador.jsp #idtableClientObra');
    
         
     });
     
     
    // $().click();
    // $().click();
    // $().click();
    // $().click();
    // $().click();
    // $().click();
    // $().click();
    // $().click();
    // $().click();

     
 });
 
 
 function ajaxTrabajador()
{
    
                 $.ajax({
                    type: 'post',
                    url: 'DataTrabajador',
                    data: {"action":"loadWorker"},
                    cache: false,
                    processData: false,
                    success: function (res) {
       
                    }
                });
                
}
 
 
   function goOpenView(nameView)
   {
       $('#contPrincipal').load(nameView);
       
       $(".navbar-collapse").removeClass('show');
   }
   // function (){}
   // function (){}
   // function (){}
   // function (){}
   // function (){}// function (){}
   // function (){}
   // function (){}
   // function (){}
   
 
      function navConstruction()
     {
         
         $('#contPrincipal').empty();
         
     }
    
</script>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="Login.jsp">Bienvenidos</a>
    <button class="navbar-toggler btnShowHideNav" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">

         <% if (((Usuario) session.getAttribute("us")).getRolUsuario().getPermisos().contains(1)) {  %> 
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Employee
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item goEmployee" href="#">add</a>
                    <a class="dropdown-item" href="#">show Employee</a>

                </div>
            </li>
             <% }  %>

             <% if (((Usuario) session.getAttribute("us")).getRolUsuario().getPermisos().contains(2)) {  %>             
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
            <% }  %>
<% if (((Usuario) session.getAttribute("us")).getRolUsuario().getPermisos().contains(12)) {  %>              
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Trabajador
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item goWorker" href="#">add</a>
                    <a class="dropdown-item showAllWorker" href="#">Show</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
                <% }  %>
                
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
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Proveedores
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">add</a>
                        <a class="dropdown-item" href="#">Show</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
            <% if (((Usuario) session.getAttribute("us")).getRolUsuario().getPermisos().contains(6)) {  %> 
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    User
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item goUser" href="#">add</a>
                    <a class="dropdown-item" href="#">show Employee</a>

                </div>
            </li>
             <% }  %>
             
             <% if (((Usuario) session.getAttribute("us")).getRolUsuario().getPermisos().contains(9)) {  %> 
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Obra
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item goObra" href="#">add</a>
                    <a class="dropdown-item" href="#">show Obra</a>

                </div>
            </li>
             <% }  %>
             <% if (((Usuario) session.getAttribute("us")).getRolUsuario().getPermisos().contains(10)) {  %> 
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Service
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item goService" href="#">add</a>
                    <a class="dropdown-item goShowAll" href="#">show Service</a>

                </div>
            </li>
             <% }  %>

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