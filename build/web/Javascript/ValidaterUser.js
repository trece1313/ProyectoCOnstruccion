$(function () {

    let pais = document.getElementById('pais');
    let estado = document.getElementById('estado');
    let municipio = document.getElementById('municipio');
    let calle = document.getElementById('calle');
    let colonia = document.getElementById('colonia');
    let postal = document.getElementById('postal');
    let exterior = document.getElementById('exterior');
    let interio = document.getElementById('interior');

 $.validator.addMethod("valueNotEquals", function(value, element, arg){
  return arg !== value;
 }, "Seleccione su Pais");
  $.validator.addMethod("selectEstado", function(value, element, arg){
  return arg !== value;
 }, "Seleccione su Estado");
   $.validator.addMethod("selectSexo", function(value, element, arg){
  return arg !== value;
 }, "Seleccione su Sexo");
 
    $('#formaddUser').validate({
        rules: {
            Pais: {valueNotEquals: "default"},
            Estado: {selectEstado: "estado"},
            Sexo: {selectSexo: "sex"},
            
            Municipio: {required: true, maxlength: 20, minlength: 5},
            Calle: {required: true, maxlength: 20, minlength: 5},
            Colonia: {required: true, maxlength: 20, minlength: 5},
            codigoPostal: {required: true, maxlength: 20, minlength: 5},
            Exterior: {required: true, maxlength: 20, minlength: 5},
            Interio: {required: true, maxlength: 20, minlength: 5}
        }
    });
    
    
    
    
    
    
    


});
    
