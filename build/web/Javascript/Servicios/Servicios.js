$(function(){
    
    ajaxServicio();
    
    $('#cerrarS').click(function(){
    $('#idtableClientObra').css({'display':'none'});    
    });
    
    $('#buscarUnServicio').keyup(function(e){
        
ajaxBuscarTrabajador($(this).val());
            
        
    });
    
});


function ajaxServicio()
{
    
     $.ajax({
        type: 'post',
        url: 'DataServicio',
        data: {"action":"cargarServicios"},
        success: function (res) {
            $('#todosServicios').load('View/Servicio/TodosServicios.jsp'); 
        }
    });
                
}
function ajaxBuscarTrabajador(busqueda)
{
    
     $.ajax({
        type: 'post',
        url: 'DataServicio',
        data: {"action":"cargarUnServicio","BuscarUnServicio": busqueda},
        success: function (res) {
            
            $('#todosServicios').load('View/Servicio/TodosServicios.jsp'); 
        }
    });
                
}

