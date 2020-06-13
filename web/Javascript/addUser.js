

    var divDireccion = document.getElementById('contDirection');
    var divPerson = document.getElementById('containerPerson');
    var divPermit = document.getElementById('contPermit');
    var loadDiv = document.getElementById('loadImg');
    var divaddUser = document.getElementById('divadd-User');
    
    let btnNextDirection = document.getElementById('btnSigDireccion');
    
    let btnNextPerson = document.getElementById('btnNextPerson');
    let btnPrevPerson = document.getElementById('btnReturnPerson');
    
    let btnPrevPermit = document.getElementById('btn-ReturnUser');
    
    

    loadDiv.style.display = 'none';
    
     


    btnNextDirection.addEventListener('click',hidecontainerDirectio);
    
    btnNextPerson.addEventListener('click',NextPermit);
    
    btnPrevPerson.addEventListener('click',returnDirectio);
    
    btnPrevPermit.addEventListener('click',returnPerson);
    
    



   



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
        divDireccion.classList.add('animate__animated', 'animate__bounceOutLeft');
        setTimeout(function ()
        {
            
            loadDiv.style.display = 'none';
            
            divDireccion.style.display = 'none';
            divPerson.style.display = 'block';
            
            divPerson.classList.add('animate__animated', 'animate__bounceInLeft');

        }, 3000);
    }
}

function  returnDirectio() {
    loadDiv.style.display = 'block';
     divDireccion.classList.add('animate__animated', 'animate__bounceOutLeft');
    setTimeout(function ()
    {
        loadDiv.style.display = 'none';
        divDireccion.style.display = 'block';
        divPerson.style.display = 'none';

    }, 3000);
}
function  NextPermit() {
    let nombre = document.getElementById('nombre');
    let paterno = document.getElementById('paterno');
    let materno = document.getElementById('materno');
    let sexo = document.getElementById('sexo');
    let telefono = document.getElementById('telefono');
    let fechaNacimiento = document.getElementById('fechaNacimiento');
    let correo = document.getElementById('correo');
    
    
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
        divaddUser.style.display = 'block';
        divaddUser.classList.add('animate__animated', 'animate__bounceInLeft');

    }, 3000);
        
    }
 
    

}

function returnPerson() {
    loadDiv.style.display = 'block';
    setTimeout(function ()
    {
        loadDiv.style.display = 'none';
        divPerson.style.display = 'block';
        divPermit.style.display = 'none';
        divaddUser.style.display = 'none';

    }, 3000);
}




/*



let btnNextPermit = document.getElementById('btn-AddUser');

*/







