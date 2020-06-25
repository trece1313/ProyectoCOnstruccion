$(function(){
    $('#searchService').prop('disabled',true);
    
     $('.agregarDetalle').click(function(){
     
     $('#searchService').prop('disabled',false);
     $('#shw').css({'display':'none'});
     $('#idtableClientObra').css({'display':'block'});

 });
});
