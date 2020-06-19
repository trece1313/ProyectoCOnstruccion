

    callData();
  var hideWindowsClient = document.getElementById('idUserAtiend');
        hideWindowsClient.style.display = 'none';
 var idSelectedOptionClient = document.getElementById('idSelectedOptionClient');  
 
 var divClientExistsObra = document.getElementById('idClientAlreadyExists');      
  var dividExistClientDB = document.getElementById('idExistClientDB');
  
  var divClient = document.getElementById('divClient');
  var divFooterObra = document.getElementById('divFooter');
  var divObra = document.getElementById('divObra');
  var idClientAlreadyExists = document.getElementById('idClientAlreadyExists');

  
  var btnRegisterClient = document.getElementById('pararRegistrarCliente');
  var closedWindowsClient = document.getElementById('btnCLosedWindowsClient');
  
  var btnExistCLient = document.getElementById('seguir');
  
  
  btnRegisterClient.addEventListener('click',showDivClient);
  btnExistCLient.addEventListener('click',hideWindowsAsked);
  closedWindowsClient.addEventListener('click',closedWindowsClientObra);
  
  function prevClient()
  {
      alert('diste');
      
  }
  function hideWindowsAsked()
  {
      callData();
      dividExistClientDB.style.display = 'none';
      
       $("#idtableClientObra").css({"display":"block"});
       
       
      
      
      
      
  }
  function showDivClient()
  {
      console.log('Entro');
      divClient.style.display = 'block';
      divFooterObra.style.display = 'none';
      divObra.style.display = 'none';
                                           $('#nameClientObra').val("");
                        $('#lastNameClienteObra').val("");
                        $('#PaisClienObra').val("");
  }
  function closedWindowsClientObra()
  {
     // divFooterObra.style.display = 'block';
      divObra.style.display = 'block';
      divClient.style.display = 'none';
  }
  
    $(function(){
        
$('#idTableClienteObraContenido table').DataTable();
        
        

    callData();
      $('.addClientObra').click(function(){
          
          $('#btnPrevClienteObrasx').prop('disabled',true);
          $("#idtableClientObra").css({"display":"none"});
          hideWindowsClient.style.display = 'block';
          
          
          idClientAlreadyExists.style.display = 'block';
          
          
        $('#nameClientObra').val($(this).parents("tr").find("td").eq(0).html());
        $('#lastNameClienteObra').val($(this).parents("tr").find("td").eq(1).html());
        $('#PaisClienObra').val($(this).parents("tr").find("td").eq(2).html());
        
        
        
         });
         
         $('#btnPrevClienteObrasx').click(function(){
             
             idClientAlreadyExists.style.display = 'none';
             
             dividExistClientDB.style.display = 'block';
             
         });
         $('#pararRegistrarCliente').click(function(){
             
         });
         
         $('#btnNextDts').click(function(){
             
             $(this).prop('disabled',true);
             $("#btnPrevDts").prop('disabled',true);
             $('#idInicioObra').css({'display':"block"});
             
         });
         
         
         


$('input[type="radio"]').change(function(){

$(this).is(":checked")?  $('#idExistCliente').show(): $('#idExistCliente').hide();


});

$('#btnPrevDts').click(function(){
    $('#idUserAtiend').hide();
     $('#btnPrevClienteObrasx').prop('disabled',false);
});


$('#btnNextDtsCot').click(function(){
    $(this).prop('disabled',true);
    $('#btnPrevDtsCot').prop('disabled',true);
    
     $('#idAnticipoObra').css({'display':'block'});
});

$('#btnPrevDtsCot').click(function(){
            $('#btnNextDts').prop('disabled',false);
        $('#btnPrevDts').prop('disabled',false);
    
     $('#idInicioObra').css({'display':'none'});
});
   
        
        
    $('#prevFinish').click(function () {
        $('#btnNextDtsCot').prop('disabled',false);
        $('#btnPrevDtsCot').prop('disabled',false);
        $('#idAnticipoObra').css({'display': 'none'});
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
       
                $.ajax({
                    type: 'post',
                    url: 'DataClient',             
                    data: $(form).serialize(),
                    cache: false,             
                    processData: false,     
                    success: function(res) {
                        var par = JSON.parse(res);
                    
        $('#nameClientObra').val(par.personaCliente.nombre_Persona);
        $('#lastNameClienteObra').val(par.personaCliente.paterno_Persona);
        $('#PaisClienObra').val(par.personaCliente.paterno_Persona);
                         idClientAlreadyExists.style.display = 'block';
                         $("#divClient").css({'display':'none'});
                         $('#divObra').css({'display':'block'});
                         $('#idExistClientDB').css({'display':'none'});
                         $('#idUserAtiend').css({'display':'block'});
                         $('#btnPrevClienteObrasx').prop('disabled',true);
                    }
                });
            }
    });
      
     
});


function callData()
{
    
            $.ajax({
            type: 'post',
            url: 'DataClient',
            data: {action: "consultaCliente"},
            success: function () {
                
            }
        });
}

  