


window.onload = function() {
    let btnAcceder = document.getElementById('btn-Ingresar');

btnAcceder.addEventListener('click',accederSistema);
};


$(function(){
     
          $("#user").keypress(function () {
            $("#mensaje").empty();
        });
        $("#pass").keypress(function () {
            $("#mensaje").empty();
        }); 
        
        $('#pass').keypress(function(e){         
           
        var code = (e.keyCode ? e.keyCode : e.which);
        if(code==13){    
         accederSistema();
     }
    });
});
    




function accederSistema(){
    
//    console.log($('#formLogin').serialize());
//    return false;
//    

    if($('#user').val() == "" || $('#pass').val() == "")
    {
        
        return false;
        
    }
    else if($('#user').val() != "" && $('#pass').val() != "" )
    {
        console.log('no Entro');
            $.ajax({
        type: 'POST',
        url: '../UsuariosDatos',
        data: {action:"accederUser",user:$('#user').val() , pass:$('#pass').val() },
        success: function (rec) {
            console.log(rec);
            if(rec != 1){
                
                $(location).attr('href','../index.jsp');
            }else{
                
                location.reload();
            }
          
        },
        error: function (xhr, status) {
            console.log('Disculpe, existió un problema');
        },

        // código a ejecutar sin importar si la petición falló o no
        complete: function (xhr, status) {
            console.log('Petición realizada');
        }
    });
    }


    
}