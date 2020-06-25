 var bandera = false;
$(function(){
    


    ajaxObra();
    
    $('#cerrarO').click(function(){
    $('.tableClientObra').css({'display':'none'});    
    });
    
     $('#buscarObras').keyup(function(){
         ajaxBuscarObra($(this).val());
     });
     
       $('input[name="radioTrabajador').change(function(){

$(this).is(":checked")? $('#idExistCliente').css({'display':'block'}) : $('#idExistCliente').css({'display':'none'}) ;

});

$('.agregarClienteObra').click(function(){
  
            bandera = true;
          $('#btnPrevClienteObrasx').prop('disabled',true);
          $("#idtableClientObra").css({"display":"none"});
          $('#idClientAlreadyExists').show();
          
          $('#idUserAtiend').show();
          $('#idInicioObra').show();
          $('#btnSigDatosCot').focus();
          
        $('#idClientObr').val($(this).val());
        $('#nameClientObra').val($(this).parents("tr").find("td").eq(0).html());
        $('#lastNameClienteObra').val($(this).parents("tr").find("td").eq(1).html());
        $('#PaisClienObra').val($(this).parents("tr").find("td").eq(2).html());
        
});

$('#btnSigDatosCot').click(function(){
    
    $('#idAnticipoObra').show();
    $('#terminar').focus();
    
   $(this).prop('disabled',true);
   $('#btnRegDtsCot').prop('disabled',true);
    
});

$('#prevFinish').click(function(){
    
    $('#idAnticipoObra').hide();
    
    $('#btnSigDatosCot').prop('disabled',false);
    $('#btnRegDtsCot').prop('disabled',false);
    
});
$('#btnRegDtsCot').click(function(){
    
    $('#idInicioObra').hide();
     $('#idUserAtiend').hide();
     $('#btnPrevClienteObrasx').prop('disabled',false);
    
});
$('#btnPrevClienteObrasx').click(function(){
    $("#idClientAlreadyExists").hide();
    $('#idExistClientDB').show();
});
              $('#formAddObra').validate({
        rules: {
            
           DateStartObra:{required: true}, 
           DateEndObra:{required: true}, 
           DateCotObra:{required: true}
           

        },           

                submitHandler: function (form) {
                    
                    agregarObra();
            }
    });
    
         $.validator.addMethod("valueNotEquals", function(value, element, arg){
  return arg !== value;
 }, "Seleccione su Pais");
  $.validator.addMethod("selectEstado", function(value, element, arg){
  return arg !== value;
 }, "Seleccione su Estado");
   $.validator.addMethod("selectSexo", function(value, element, arg){
  return arg !== value;
 }, "Seleccione su Sexo");
       // ==========================================================================
      // Form add Client Obra
    $('#formClientObra').validate({
        
        rules: {
            CountryClientObra: {valueNotEquals: "default"},
            CityClientObra: {selectEstado: "estado"},
            MunicipalityClientObra:{required: true, maxlength: 20, minlength: 5}, 
           StreetClientObra:{required: true, maxlength: 20, minlength: 5}, 
           ColonyClientObra:{required: true, maxlength: 20, minlength: 5}, 
           CodeClientObra:{required: true, maxlength: 20, minlength: 5}, 
           
            SexPersonObra: {selectSexo: "sex"},
           NamePersonObra:{required: true, maxlength: 20, minlength: 3}, 
           LastNamePersonObra:{required: true, maxlength: 20, minlength: 5},
            LastNameMPersonObra:{required: true, maxlength: 20, minlength: 5},
            
            BirthdatePersonObra: {required : true}
        },            
        
                submitHandler: function (form) {
   $('.loaders').show();
     setTimeout(function(){
                $.ajax({
                    type: 'post',
                    url: 'DataClient',             
                    data: $(form).serialize(),
                    cache: false,             
                    processData: false,     
                    success: function(res) {
                        var par = JSON.parse(res);
                        bandera = false;
                      console.log(par.id_Cliente);
                      
         $('#idClientObr').val(par.id_Cliente);
        $('#nameClientObra').val(par.personaCliente.nombre_Persona);
        $('#lastNameClienteObra').val(par.personaCliente.paterno_Persona);
        $('#PaisClienObra').val(par.personaCliente.paterno_Persona);
        $('#idClientAlreadyExists').show();
                         $('#idClientAlreadyExists').show();
                         $("#divClient").css({'display':'none'});
                         $('#divObra').css({'display':'block'});
                         $('#idExistClientDB').css({'display':'none'});
                         $('#idUserAtiend').css({'display':'block'});
                         $('#idInicioObra').css({'display':'block'});
                         
                         $('#btnPrevClienteObrasx').prop('disabled',true);
                                    $('.loaders').hide();
                  $('#addMensaje').show();
                  setTimeout(function(){
              $('#addMensaje').hide();
              location.reload();
                
                 },1600);
                    }
                });
                
                   },3000);
                
            }
    });

      $('#btnCLosedWindowsClient').hide();
      
      $('.btnCloseMesage').click(function(){
          $('#addMensaje').hide();
          location.reload();
      });
      
    
});



function agregarObra(){

$('.loaders').show();
      if(bandera)
    {
        
            let objAddObra = 
            {
               action : "agregarObra",
               bandObra:bandera,
               idTrabajadorObra: $('#idRadioTrabajador:checked').val(),
               idClienteObra : $('#idClientObr').val(),
               fechaInicioObra : $('#fechaInicio').val(),
               fechaFinObra : $('#dateEnd').val(),
               fechaCotObra: $('#dateCot').val(),
               
               pagoInicioObraAnticipo : $('#anticipObra').val()

            };
        setTimeout(function(){
            
      
            $.ajax({
            type: 'post',
            url: 'DataObra',
            data: objAddObra,
            success: function () {
              
                $('.loaders').hide();
                  $('#addMensaje').show();
                  setTimeout(function(){
              $('#addMensaje').hide();
              location.reload();
                
                 },1600);
                
            }
        });
          
          },3000);
        
    }
    else
    {

         let objAddObra = 
            {
               action : "agregarObra",
               bandObra:bandera,
               idTrabajadorObra: $('#idRadioTrabajador:checked').val(),
               idClienteObra : $('#idClientObr').val(),
               fechaInicioObra : $('#fechaInicio').val(),
               fechaFinObra : $('#dateEnd').val(),
               fechaCotObra: $('#dateCot').val(),
               
               pagoInicioObraAnticipo : $('#anticipObra').val()

            };
       setTimeout(function(){
            $.ajax({
            type: 'post',
            url: 'DataObra',
            data: objAddObra,
            success: function () {
                              $('.loaders').hide();
                  $('#addMensaje').show();
                  setTimeout(function(){
              $('#addMensaje').hide();
              location.reload();
                
                 },1600);
            }
        });
        
          },3000);
    }
    
};

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

var btnRegistrarCliente = document.getElementById('pararRegistrarCliente');
var btnExisteCliente = document.getElementById('seguir');
var divClient = document.getElementById('divClient');
var divObra = document.getElementById('divObra');
var dividExistClientDB = document.getElementById('idExistClientDB');
 
 btnExisteCliente.addEventListener('click',ocultarVentanaPregunra);
 btnRegistrarCliente.addEventListener('click',mostrarVentanaPreguntar);
     
     
      function ocultarVentanaPregunra()
  {
      dividExistClientDB.style.display = 'none';    
       $("#idtableClientObra").css({"display":"block"});
       bandera = true;btnSigDatosCot
  }
  
  function mostrarVentanaPreguntar()
  {
      
    divClient.style.display = 'block';
    divObra.style.display = 'none';
    $('#nameClientObra').val("");
    $('#lastNameClienteObra').val("");
    $('#PaisClienObra').val("");
  }
  
  
  function filterFloat(evt,input){
    // Backspace = 8, Enter = 13, ‘0′ = 48, ‘9′ = 57, ‘.’ = 46, ‘-’ = 43
    var key = window.Event ? evt.which : evt.keyCode;    
    var chark = String.fromCharCode(key);
    var tempValue = input.value+chark;
    if(key >= 48 && key <= 57){
        if(filter(tempValue)=== false){
            return false;
        }else{       
            return true;
        }
    }else{
          if(key == 8 || key == 13 || key == 0) {     
              return true;              
          }else if(key == 46){
                if(filter(tempValue)=== false){
                    return false;
                }else{       
                    return true;
                }
          }else{
              return false;
          }
    }
}
function filter(__val__){
    var preg = /^([0-9]+\.?[0-9]{0,2})$/; 
    if(preg.test(__val__) === true){
        return true;
    }else{
       return false;
    }
    
}

