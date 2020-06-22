

$(function(){
        ajaxTrabajador();


    

    
    soloNumeros($('#diasTrabajados'));
     $.validator.addMethod("valueNotEquals", function(value, element, arg){
  return arg !== value;
 }, "Seleccione su Pais");
  $.validator.addMethod("selectEstado", function(value, element, arg){
  return arg !== value;
 }, "Seleccione su Estado");
   $.validator.addMethod("selectSexo", function(value, element, arg){
  return arg !== value;
 }, "Seleccione su Sexo");
 
 
   
        $('#formAddWorker').validate({
        rules: {
           Nombre:{required: true, maxlength: 20, minlength: 3}, 
           Paterno:{required: true, maxlength: 25, minlength: 5},
           Materno:{required: true, maxlength: 25, minlength: 1},
           Telefono:{required: true, maxlength: 10, minlength: 0},
           FechaNacimiento:{required: true},
           Sexo: {selectSexo: "sex"},
           Correo:{maxlength: 25, minlength: 5},

            Pais: {valueNotEquals: "default"},
            Estado: {selectEstado: "estado"},
            Municipio: {required: true, maxlength: 20, minlength: 5},
            Calle: {required: true, maxlength: 20, minlength: 5},
            Colonia: {required: true, maxlength: 20, minlength: 5},
            CodigoPostal: {required: true, maxlength: 20, minlength: 5},
            NumeroExterior: {maxlength: 20, minlength: 2},
            NumeroInterior: {required: true, maxlength: 20, minlength: 2},
            
            NameEspecialidad: {required: true, maxlength: 20, minlength: 4},
            diasTrabajados: {required: true,number:true, maxlength: 1, minlength: 1},
            HrasTrabajadas: {required: true, maxlength: 2, minlength: 1},
            precioDia: {required: true, minlength: 1}
        },            
        submitHandler: function (form) {
        
           
//
//   alert($(form).serialize());
//           return false;
 $('.loaders').css({'display': 'block'});
            setTimeout(function ()
            {
                $.ajax({
                    type: 'post',
                    url: 'DataTrabajador',
                    data: $(form).serialize(),
                    cache: false,
                    processData: false,
                    success: function (res) {
                        $('.mensajeUsuario').css({'display': 'block'});
                         $('.loaders').css({'display': 'none'});
                        setTimeout(function ()
                        {
                         
                            $('.mensajeUsuario').css({'display': 'block'});
                               
                         
                           location.reload();
                        }, 2000);
                        

                    }
                });
                
                

                
            }, 3000);

        }
    }); 
    
    // --------------------------------------------------------------------------------------------------------------------------//
    // Form validate Update Worker //
    
            $('#formUpdateWorker').validate({
        rules: {
           Nombre:{required: true, maxlength: 20, minlength: 3}, 
           Paterno:{required: true, maxlength: 25, minlength: 5},
           Materno:{required: true, maxlength: 25, minlength: 1},
           Telefono:{required: true, maxlength: 10, minlength: 0},
           FechaNacimiento:{required: true},
           Sexo: {selectSexo: "sex"},
           Correo:{maxlength: 25, minlength: 5},

            Pais: {valueNotEquals: "default"},
            Estado: {selectEstado: "estado"},
            Municipio: {required: true, maxlength: 20, minlength: 5},
            Calle: {required: true, maxlength: 20, minlength: 5},
            Colonia: {required: true, maxlength: 20, minlength: 5},
            CodigoPostal: {required: true, maxlength: 20, minlength: 5},
            NumeroExterior: {maxlength: 20, minlength: 2},
            NumeroInterior: {required: true, maxlength: 20, minlength: 2},
            
            NameEspecialidad: {required: true, maxlength: 20, minlength: 4},
            diasTrabajados: {required: true,number:true, maxlength: 1, minlength: 1},
            HrasTrabajadas: {required: true, maxlength: 2, minlength: 1},
            precioDia: {required: true, minlength: 1}
        },            
        submitHandler: function (form) {
        
           

//   alert($(form).serialize());
//           return false;
           
           
 $('.loaders').css({'display': 'block'});
            setTimeout(function ()
            {
                $.ajax({
                    type: 'post',
                    url: 'DataTrabajador',
                    data: $(form).serialize(),
                    cache: false,
                    processData: false,
                    success: function (res) {
                        $('.mensajeUsuario').css({'display': 'block'});
                         $('.loaders').css({'display': 'none'});
                        setTimeout(function ()
                        {
                         
                          $('.mensajeUsuario').css({'display': 'block'});
                               
                         
                           location.reload();
                        }, 2000);
                        

                    }
                });
                
                

                
            }, 3000);

        }
    }); 
    

    
});



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

function soloNumeros(numero)
{
    $(numero).bind('keypress', function(event) {
        var regex = new RegExp("^[0-9]+$");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
          event.preventDefault();
          return false;
        }
      });
}

function numeroLetras(letra)
{
    $(letra).bind('keypress', function(event) {
        var regex = new RegExp("^[a-zA-Z0-9 ]+$");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
          event.preventDefault();
          return false;
       }
      });
}

function ajaxTrabajador()
{
                 $.ajax({
                    type: 'post',
                    url: 'DataTrabajador',
                    data: {"action":"loadWorker"},
                    success: function (res) {
                        console.log(res);
                    }
                });
                
}