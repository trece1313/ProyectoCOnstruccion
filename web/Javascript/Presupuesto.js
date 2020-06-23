
$(function(){
    
    $('#searchService').prop('disabled',true);
    
 $('.btnaddBudget').click(function(){
 

     ajaxPresupuesto($(this).val());
     
 }); 
 
 
 $('.dists').click(function(){
 $('#shw').css({'display':'none'});
 $('#idtableClientObra').css({'display':'block'});
 }); 
 
 $('#SearchBrid').keyup(function(){
     
     ajaxPresupuesto($(this).val());
 });
 
 $('.addObraDetalle').click(function(){
     
     $('#searchService').prop('disabled',false);
     $('#shw').css({'display':'none'});
     $('#idtableClientObra').css({'display':'block'});

 });
 
 $('#ServDetalle').load('View/Update/ServicioEncontradoDetalle.jsp');
 
 $('#searchService').keyup(function(){
     
    if($(this).val().length >=3){ 
     $('.divMetrosDetalle').css({'display':'block'});
     $('#shw').css({'display':'none'});
     
     $('#claveServicio').val($(this).val());
 }
 
 });
 $('#mtsAltura').keyup(function(e){
        var code = (e.keyCode ? e.keyCode : e.which);
        if(code==13){
            $(this).val() != "" ? $('#mtsLargo').focus() : $(this).focus();
        }

 });
 
 
 
});


function ajaxPresupuesto(val)
{
    
                 $.ajax({
                    type: 'post',
                    url: 'PresupuestoData',
                    data: {"action":"searchBudget","filter":val},
                    success: function (res) {
                        
                        $('#yeshi').load('View/Presupuesto.jsp #yeshi');
                    }
                });
}
function ajaxPresupuesto(serachObra)
{
    
                 $.ajax({
                    type: 'post',
                    url: 'View/Update/ObraEncontradaDetalle.jsp',
                    data: {"action":"obraEncontrada","indiceObra":serachObra},
                    success: function (res) {
                          
                    $('#shw').css({'display':'block'});
                      $('#idtableClientObra').css({'display':'none'});
                        $('.divObra').html(res);
                        
                    }
                });
}


