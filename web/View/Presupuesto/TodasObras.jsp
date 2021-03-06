<%-- 
    Document   : TodasObras
    Created on : Jun 24, 2020, 12:53:28 AM
    Author     : trece
--%>

<%@page import="Model.Obra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    if (request.getSession().getAttribute("us") != null
    && ((Usuario) request.getSession().getAttribute("us")).getRolUsuario().getPermisos().contains(9)) {
        
ArrayList<Obra> listaObras = session.getAttribute("listaTodosObras") != null ? 
(ArrayList<Obra>) session.getAttribute("listaTodosObras") : new ArrayList();




%>


                    <div class="tableClientObra" id="">
                        <div class="divTableClienteObraContenido" id="idTableClienteObraContenido">
                            <table border="1" class="table" id="tbl">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Apellidos</th>
                                    
                                    
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                for (int i=0; i<listaObras.size();i++) {
                                       Obra obr = listaObras.get(i);
                                %>                            
                                <tr>
                                    <td><%= (obr.getClienteObra().getPersonaCliente().getNombre_Persona()) %></td>
                                    <td><%= (obr.getClienteObra().getPersonaCliente().getPaterno_Persona())%></td>
                                    
                                    
                                    <td><button class="btn btn-info agregarDetalleObra" id="btnDetalleObra" value="<%= i%>">Agregar Obra</button></td>
                                </tr>
                                <%
                                  }
                                %>
                            </tbody>
                        </table>
                        </div>
                    </div>
        

<%
    }
%>
<script>
    $(function(){
        $(".agregarDetalleObra").click(function(){
            
            datosDetalleObra($(this).val());
        });
        
        
        
        function datosDetalleObra(indice)
{
    
         $.ajax({
        type: 'post',
        url: 'View/Presupuesto/Presupuesto.jsp',
        data: {"indiceAgregarDetalleObra": indice},
        success: function (res) {
            $(".tableClientObra").hide();
            $("#shw").show();
            $('#searchService').prop('disabled', false);
            $('#searchService').focus();
            $('#ObraDetalle').html(res); 
        }
    });
    
}
        
    });
</script>
