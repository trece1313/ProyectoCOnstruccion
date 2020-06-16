


    var divPermit = document.getElementById('contPermit');
    var loadDiv = document.getElementById('loadImg');
    var divaddUser = document.getElementById('divadd-User');
    var divShowUser = document.getElementById('divUsuari');
    
    var divDireccion = document.getElementById('contDirection');

    var divPerson = document.getElementById('containerPerson');
    
    var btnDirection = document.getElementById('btnSigDireccion');

    var btnPerson = document.getElementById('btnNextPerson');
    var btnPrevPerson = document.getElementById('btnReturnPerson');
    
    var btnRol = document.getElementById('btnNextRol');
    var btnPrevRol = document.getElementById('btnReturnRol');
    
    var btnPrevPermit = document.getElementById('btn-ReturnUser');
    

    

    loadDiv.style.display = 'none';
    
     


    btnDirection.addEventListener('click',hidecontainerDirectio);
    
    btnPerson.addEventListener('click',NextPermit);
    
    btnPrevPerson.addEventListener('click',returnDirectio);
    
    btnPrevPermit.addEventListener('click',returnPerson);
    
    btnRol.addEventListener('click',nextUsers);
    btnPrevRol.addEventListener('click',prevRol);



   



function  hidecontainerDirectio() {

    
    let pais = document.getElementById('pais');
    let estado = document.getElementById('estado');
    let municipio = document.getElementById('municipio');
    let calle = document.getElementById('calle');
    let colonia = document.getElementById('colonia');
    let postal = document.getElementById('postal');
    let exterior = document.getElementById('exterior');
    let interio = document.getElementById('interior');


    if (pais.value == 'Seleccione Pais' || estado.value == 'Seleccione Estado' ||
            municipio.value == '' || calle.value == '' || colonia.value == '' ||
            postal.value == '' || exterior.value == '' || interio.value == '')
    {


        return false;
        this.disabled = true;


    } else if (pais.value != 'Seleccione Pais' && estado.value != 'Seleccione Estado' &&
            municipio.value != '' && calle.value != '' && colonia.value != '' &&
            postal.value != '' && exterior.value != '' && interio.value != '')
    {
        
        
        loadDiv.style.display = 'block';
        divDireccion.classList.add('animate__bounceOutLeft');
        setTimeout(function ()
        {
            
            loadDiv.style.display = 'none';
            
            divDireccion.style.display = 'none';
            
            
            divPerson.classList.add('animate__animated','animate__bounceInLeft');
            divPerson.style.display = 'block';
            

        }, 1200);

    }
}

function returnDirectio() {
    

    
    loadDiv.style.display = 'block';
            divPerson.classList.remove("animate__bounceInLeft");
        divDireccion.classList.remove("animate__bounceOutLeft");
    
     
     
     
    setTimeout(function ()
    {
        
        loadDiv.style.display = 'none';
        
        divPerson.style.display = 'none';
        
      ;
        
        divDireccion.classList.add('animate__bounceInLeft');
          divDireccion.style.display = 'block';

    }, 1200);
}
function  NextPermit() {
    let nombre = document.getElementById('nombre');
    let paterno = document.getElementById('paterno');
    let materno = document.getElementById('materno');
    let sexo = document.getElementById('sexo');
    let telefono = document.getElementById('telefono');
    let fechaNacimiento = document.getElementById('fechaNacimiento');
    let correo = document.getElementById('correo');
    

    
        divPermit.classList.remove("animate__bounceInLeft");
        divPermit.classList.remove("animate__bounceOutLeft");
    
    
    if(nombre.value == "" || paterno.value == "" || materno.value == "" || sexo.value == "Seleccione Sexo" ||
       telefono.value == "" || fechaNacimiento.value == "" ||correo.value == "" )
    {
        return false;
        
        
    }
    else if(nombre.value != "" && paterno.value != "" && materno.value != "" && 
            sexo.value != "Seleccione Sexo" &&
       telefono.value != "" && fechaNacimiento.value != "" && correo.value != "")
    {
            loadDiv.style.display = 'block';
            divPerson.classList.add('animate__animated', 'animate__bounceOutLeft');
            
    setTimeout(function ()
    {
        loadDiv.style.display = 'none';
        divPerson.style.display = 'none';
        divPermit.style.display = 'block';
        
        divPermit.classList.add('animate__animated', 'animate__bounceInLeft');



    }, 1200);
        
    }
 
    

}

function returnPerson() 
{

        divPermit.classList.remove("animate__bounceInLeft");
        divPermit.classList.remove("animate__bounceOutLeft");
        divShowUser.classList.remove("animate__bounceInLeft");   
        divaddUser.classList.remove("animate__bounceInLeft");
        

        
    loadDiv.style.display = 'block';
            divShowUser.classList.add('animate__bounceOutLeft');
        
        divaddUser.classList.add('animate__bounceOutLeft');
        
        divPermit.classList.add('animate__bounceInLeft');
    setTimeout(function ()
    {
 

        
        divShowUser.style.display = 'none';
        divaddUser.style.display = 'none';
        
        divPermit.classList.add("animate__bounceInLeft");
        divPermit.style.display = 'block';
       
      
        
        loadDiv.style.display = 'none';


    }, 1200);
}

function nextUsers()
{
    let rol = document.getElementById('rol');
    if(rol.value == '')
    {
        return false;
    }
    else if(rol.value != '')
    {
        loadDiv.style.display = 'block';
        divPermit.classList.add('animate__bounceOutLeft');
    divShowUser.classList.remove("animate__bounceOutLeft");
    divaddUser.classList.remove("animate__bounceOutLeft");
        setTimeout(function ()
        {
            
             divPermit.style.display = 'none';
            divaddUser.style.display = 'block';
            
            divShowUser.style.display = 'block';
            
            divShowUser.classList.add( 'animate__animated','animate__bounceInLeft');
            divaddUser.classList.add('animate__animated','animate__bounceInLeft');
            loadDiv.style.display = 'none';
            

  

        }, 1200);
    
        
    }
        
}
function prevRol()
{
        divPerson.classList.remove("animate__bounceInLeft");
        divPerson.classList.remove("animate__bounceOutLeft");
        
        
     loadDiv.style.display = 'block';

        
     divPermit.classList.add('animate__bounceOutLeft');
     
     
    setTimeout(function ()
    {
        
        loadDiv.style.display = 'none';
        
        divPermit.style.display = 'none';
        
    
        
        divPerson.classList.add('animate__bounceInLeft');
          divPerson.style.display = 'block';

    }, 1200);
    
}



/*



let btnNextPermit = document.getElementById('btn-AddUser');

*/







