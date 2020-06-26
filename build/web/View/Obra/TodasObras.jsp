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
                                    
                                    
                                    <td><button class="btn btn-info agregarEditarObra" id="btnEditarObra" value="<%= i%>">Actualizar Obra</button></td>
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

<script src="./Javascript/Obra/EditarObra.js" type="text/javascript"></script>