$(function(){
    ajaxObra();
    $('#buscarObras').keyup(function () {
        ajaxBuscarObra($(this).val());
    });


    $('#searchService').prop('disabled', true);

    $('.agregarDetalle').click(function () {
        
        $('#shw').css({'display': 'none'});
        $('#idtableClientObra').css({'display': 'block'});
        $(".tableClientObra").css({'display': 'block'});
            
    });

    $('#cerrarO').click(function () {
        $('.tableClientObra').css({'display': 'none'});
        
        $('#shw').css({'display': 'block'});
        $('#idtableClientObra').css({'display': 'block'});
    });

    $("#ServDetalle").load("./View/Presupuesto/TodosServicios.jsp");
    
    
    $("#searchService").keyup(function(e){
        
    if($(this).val().length >=3)
    { 
      
     $('.divMetrosDetalle').css({'display':'block'});
     $('#shw').css({'display':'none'});
     $('#claveServicio').val($(this).val());
     $("#mtsAltura").focus(); 
        }
    });
    
       $('#mtsAltura').keypress(function(e){          
        var code = (e.keyCode ? e.keyCode : e.which);
        (code==13 && $(this).val() != "") ? $("#mtsLargo").focus(): $(this).focus();    
    });
    $('#mtsLargo').keypress(function(e){          
        var code = (e.keyCode ? e.keyCode : e.which);
        (code==13 && $(this).val() != "") ? ajaxBuscarProducto($("#claveServicio").val(),$("#mtsAltura").val(),$("#mtsLargo").val()): $(this).focus();    
    });
    // aqui Termina jQuery
    
});

function ajaxBuscarProducto(clvSer,alt,lar)
{
         $.ajax({
        type: 'post',
        url: 'PresupuestoData',
        data: {"action":"buscarServicio","codServicio":clvSer,"altura":alt,"largo":lar},
        success: function (res) {
        
        }
    });
          
}


function ajaxObra()
{
   
     $.ajax({
        type: 'post',
        url: 'DataObra',
        data: {"action":"cargarObra"},
        success: function (res) {
        
            $('#mostrarObras').load('View/Presupuesto/TodasObras.jsp'); 
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
            
            $('#mostrarObras').load('View/Presupuesto/TodasObras.jsp'); 
        }
    });
                
}