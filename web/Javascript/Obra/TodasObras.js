$(function(){
    
        ajaxObra();
    
    $('#cerrarO').click(function(){
    $('.tableClientObra').css({'display':'none'});    
    });
    
     $('#buscarObras').keyup(function(){
         ajaxBuscarObra($(this).val());
     });
     
});



function ajaxObra()
{
    
     $.ajax({
        type: 'post',
        url: 'DataObra',
        data: {"action":"cargarObra"},
        success: function (res) {
        
            $('#mostrarObras').load('View/Obra/TodasObras.jsp'); 
        }
    });
                
}
function ajaxBuscarObra(busqueda)
{
    
     $.ajax({
        type: 'post',
        url: 'DataObra',
        data: {"action":"cargarUnObra","BuscarObras": busqueda},
        success: function (res) {
            
            $('#mostrarObras').load('View/Obra/TodasObras.jsp'); 
        }
    });
                
}