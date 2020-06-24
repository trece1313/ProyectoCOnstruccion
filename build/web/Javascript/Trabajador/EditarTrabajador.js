$(function(){
    
 
    
    
    // Apartado de editar catpeta Vista Trabajador y vista TodosTrabajadores.jsp
    $('.btnActualizarTrabajador').click(function(){
        datosParaEditarTrabajador($(this).val());
        
        
    });
    
    
   // Termina Codigo de TodosTRabajadores
    
});


function datosParaEditarTrabajador(indice)
{
         $.ajax({
        type: 'post',
        url: 'View/Trabajador/EditarTrabajador.jsp',
        data: {"indiceEditarTrabajador": indice},
        success: function (res) {
            $('#contPrincipal').html(res); 
        }
    });
    
}