$(function(){
                

    
    $(".agregarEditarObra").click(function(){
        datosParaEditarObra($(this).val());
    });
    
    $("#prevFinish").click(function(){
        $("#terminar").prop("disabled",false);
        $("#idAnticipoObra").css({"display":"none"});
         $("#btnRegDtsCot").prop("disabled",false);
          $("#btnSigDatosCot").prop("disabled",false);
        
    });
    
        $("#btnRegDtsCot").click(function(){
        
        $("#idInicioObra").css({"display":"none"});
        $("#idUserAtiend").css({"display":"none"});
        $("#btnPrevClienteObrasx").prop("disabled",false);
        
    });
    
        $("#btnPrevClienteObrasx").click(function(){
        
        $("#idClientAlreadyExists").css({"display":"none"});
        $("#idExistClientDB").css({"display":"block"});
      
        
    });
    
});


function datosParaEditarObra(indice)
{
    
         $.ajax({
        type: 'post',
        url: './View/Obra/EditarObra.jsp',
        data: {"indiceEditarObra": indice},
        success: function (res) {

            $('#contPrincipal').html(res); 
                 $("#btnSigDatosCot").prop("disabled",true);
                $("#btnRegDtsCot").prop("disabled",true);
                $("#terminar").prop("disabled",true);
                $("#btnPrevClienteObrasx").prop("disabled",true);
                $("#anticipObra").focus();
        }
    });
    
}



