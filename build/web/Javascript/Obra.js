


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
  }
  function closedWindowsClientObra()
  {
     // divFooterObra.style.display = 'block';
      divObra.style.display = 'block';
      divClient.style.display = 'none';
  }
  
    $(function(){

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
             
             if(!$("input[name='menu']").is(":checked"))return false;
             $('#idInicioObra').css({'display':"block"});
             
         });
         
         
         


$('input[type="radio"]').change(function(){

$(this).is(":checked")?  $('#idExistCliente').show(): $('#idExistCliente').hide();


});

$('#btnPrevDts').click(function(){
    $('#idUserAtiend').hide();
     $('#btnPrevClienteObrasx').prop('disabled',false);
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

  