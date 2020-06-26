<%-- 
    Document   : Presupuesto
    Created on : Jun 22, 2020, 4:09:56 PM
    Author     : trece

<%@page import="Model.Obra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
--%>
<%@page import="Model.Obra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%    
if(request.getSession().getAttribute("us") != null && 
((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(13))
{ 

    
    int Indice = Integer.parseInt(request.getParameter("indiceAgregarDetalleObra"));
    
Obra obra = ((ArrayList<Obra>)session.getAttribute("listaTodosObras")).get(Indice);



%>

<style>
/*    
    #idtableClientObra{
        display: none;
    }
    .shw{
        width: 100%;
        background-color: red;
        display: block;
        
    }
    header{
        text-align: center;
    }
    .divObra{
        width: 25%;
        background-color: green !important;
        position: relative;
        float: left;
        
    }
    .serviciosObra{
        width: 75%;
        background-color: gray !important;
       float: left;
    }
    .elijaDatos{
       width: 90%;
    }
.divMetrosDetalle{
        width: 100%; 
        height: 100%;
        position: fixed; 
        z-index: 9999;
        opacity: .8;
        left: 0; 
        top: 0px;
        display: none;
        
        background: #BE93C5; fallback for old browsers 
        background: -webkit-linear-gradient(to right, #7BC6CC, #BE93C5);  
        background: linear-gradient(to right, #7BC6CC, #BE93C5); 

    }   
    .divContenido{
        color: black;
        font-family: 'Anton', sans-serif;
        text-align: center;
        position: absolute; 
        top: 25%; 
        left: 30%;
        width: 40%; 
        height: 20%;
        
    }
    .mensajeUsuario div button{
        color: black;
    }
        .mensajeUsuario div button:hover{
        
            background-color: black;
            color: white;
        
    }
    */
    #yeshi{
        width: 100%;
  
  
    }

</style>

            <div class="row" id="yeshi">

                <div class="col-12">
                    <div class="card text-white bg-dark mb-3" style="display: inline-grid; width: 100%">
                        <div class="card-header"><header>Nombre Cliente <%= (obra.getClienteObra().getPersonaCliente().getNombre_Persona())%></header></div>
                        <div class="card-body">

                            <p class="card-text">Nombre Trabajador <br/><%= (obra.getTrabObra().getPerTrabajador().getNombre_Persona())%></p>
                            <p class="card-text">Nombre Usuario <%= (obra.getUsrObra().getPersonaUsuario().getNombre_Persona())%></p>
                          
                        </div>                                         

                    </div>
                </div>


            </div>
                                    


               
<%
    }
%>
