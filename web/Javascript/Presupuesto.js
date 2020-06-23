
$(function(){
    
    
 $('.btnaddBudget').click(function(){
 alert($(this).val()); 
 }); 
 
 
 $('.dists').click(function(){
 $('#shw').css({'display':'none'});
 $('#idtableClientObra').css({'display':'block'});
 }); 
 
 $('#SearchBrid').keyup(function(){
     
     ajaxPresupuesto($(this).val());
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


