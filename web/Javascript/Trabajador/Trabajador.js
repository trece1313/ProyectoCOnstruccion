$(function(){
    
    ajaxTrabajador();
    
    $('#cerrarT').click(function(){
    $('#idtableClientObra').css({'display':'none'});    
    });
    
    $('#buscarTrabajador').keyup(function(e){
        
ajaxBuscarTrabajador($(this).val());
            
        
    });
    
});


function ajaxTrabajador()
{
    
     $.ajax({
        type: 'post',
        url: 'DataTrabajador',
        data: {"action":"cargarTrabajadores"},
        success: function (res) {
            $('#mostrarTrabajadores').load('View/Trabajador/TodosTrabajadores.jsp'); 
        }
    });
                
}
function ajaxBuscarTrabajador(busqueda)
{
    
     $.ajax({
        type: 'post',
        url: 'DataTrabajador',
        data: {"action":"cargarUnTrabajadores","BuscarTrabajador": busqueda},
        success: function (res) {
            $('#mostrarTrabajadores').load('View/Trabajador/TodosTrabajadores.jsp'); 
        }
    });
                
}
