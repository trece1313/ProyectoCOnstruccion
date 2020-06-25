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
//       ajaxTrabajador();
     $('.goUser').click(function(){

        $('#contPrincipal').load('View/Usuario.jsp');
        
        $(".navbar-collapse").removeClass('show');
     });

     $('.btnShowHideNav').click(navConstruction);
     
     $('.agregarObra').click(function(){
         
         goOpenView('./View/Obra/AgregarObra.jsp');
     });
     $('.MostrarObras').click(function(){
         goOpenView('./View/Obra/Obra.jsp');
     });
     
    $('.agregarServicio').click(function(){
         goOpenView('./View/Servicio/AgregarServicio.jsp');
     });
    
     $('.mostrarTodosServicios').click(function(){
         
         goOpenView('./View/Servicio/Servicio.jsp');
     });
     
     $('.agregarTrabajador').click(function(){
           
         goOpenView('./View/Trabajador/AgregarTrabajador.jsp');
     });
     $('.MostrarTrabajadores').click(function(){
             
         goOpenView('./View/Trabajador/Trabajador.jsp');
     });
    $('.agregarPresupuesto').click(function(){
           
         goOpenView('./View/Presupuesto/AgregarPresupuesto.jsp');
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
                    Empleado
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item goEmployee" href="#">Agregar</a>
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
                    <a class="dropdown-item" href="#">Agregar</a>
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
                    <a class="dropdown-item agregarTrabajador" href="#">Agregar</a>
                    <a class="dropdown-item MostrarTrabajadores" href="#">Show</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
                <% }  %>
<% if (((Usuario) session.getAttribute("us")).getRolUsuario().getPermisos().contains(13)) {  %>                       
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Presupuesto
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item agregarPresupuesto" href="#">Agregar</a>
                        <a class="dropdown-item mostrarPresupuestos" href="#">Mostrar</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
<% }  %>                
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Proveedores
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Agregar</a>
                        <a class="dropdown-item" href="#">Show</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
            <% if (((Usuario) session.getAttribute("us")).getRolUsuario().getPermisos().contains(6)) {  %> 
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Usuario
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item goUser" href="#">Agregar</a>
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
                    <a class="dropdown-item agregarObra" href="#">Agregar</a>
                    <a class="dropdown-item MostrarObras" href="#">Mostrar Obra</a>

                </div>
            </li>
             <% }  %>
             <% if (((Usuario) session.getAttribute("us")).getRolUsuario().getPermisos().contains(10)) {  %> 
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Servicios
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item agregarServicio" href="#">Agregar</a>
                    <a class="dropdown-item mostrarTodosServicios" href="#">Mostrar Servicios</a>

                </div>
            </li>
             <% }  %>

            <li class="nav-item dropdown">
                <a class="btn-success" id="diste" onclick="signOut();" style="pAgregaring: 10px 15px; position: relative; top: 10px; left: 25px;">
                    Salir
                </a>

            </li>

        </ul>
    </div>
</nav>


<%
    }
%>