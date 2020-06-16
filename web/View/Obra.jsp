<%-- 
    Document   : Obra
    Created on : Jun 15, 2020, 9:05:26 PM
    Author     : trece
--%>

<%@page import="Model.Trabajador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
ArrayList<Trabajador> trabajador = new Controller.ControllerTrabajador().allWorkers();
%>


<style>
    
    .divObra{
        width: 95%;
        height: auto;
        margin: auto;
        background: red !important;
    }
    header{
        text-align: center;
    }
    legend,h3{
        text-align: center;
    }
    #seguir{
        margin-left: 50%;
    }
    #pararRegistrarCliente{
    margin-left: 0%;
    }
    
</style>

<div class="divObra">
    <header><h2>Registrar Obra</h2></header>
    
    <div class="divBody">
        <form id="" class="">
            
            <fieldset>
                
                <legend>Trabajador asignado</legend>
                
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
             <fieldset>
                
                <legend>Cliente</legend>
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
                
                
            </fieldset>
             <fieldset>
                
                <legend>Atiende</legend>
                <h3>Datos de quien lo atiende</h3>
                <div class="row">
                    
                    <div class="col-6">
                        <div class="form-group mx-auto">
                            <button class="btn btn-info form-control col-6" id="seguir"> Si</button>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <button class="btn btn-info form-control col-6" id="pararRegistrarCliente"> No</button>
                        </div>
                    </div>                    
                </div>
                
                
            </fieldset>
            
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
                
                
            </fieldset>
            
             <fieldset>
                
                <legend>Anticipo</legend>
                <h3>Pago Anticipo</h3>
                <div class="row">
                    
                    <div class="col-4">
                        <div class="form-group mx-auto">
                            <label for="fechaInicio">Fecha Inicio de Obra</label>
                            <input type="text" class="form-control textBox" value="2020-10-10" placeholder="" name="" id=""/>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-group">
                            <label></label>
                            <button class="btn btn-success form-control" id="">Alta de Obra</button> 
                            
                        </div>
                    </div>    
                    <div class="col-4">
                        <div class="form-group">
                            <label></label>
                            <button class="btn btn-success form-control" id=""> Regresar</button> 
                            
                        </div>
                    </div>  
                </div>
                
                
            </fieldset>
            
        </form>
    </div>
    
    <div class="divFooter">
        
    </div>
    
</div>
