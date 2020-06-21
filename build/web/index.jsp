<%-- 
    Document   : index
    Created on : Jun 5, 2020, 5:37:54 PM
    Author     : trece
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("us") == null)
{
    response.sendRedirect("View/Login.jsp");
}
%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <link href="Estilos/animate.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap CSS -->
    <link href="Estilos/cssIndex.css" rel="stylesheet" type="text/css"/>
 

   
    <link href="Estilos/Menu.css" rel="stylesheet" type="text/css"/>
    <title>Index</title>
  </head>
  <body>
      
      <div class="contenedorPrincipal">
          
          <div class="menuPrincipal">

          </div>
          
          <div class="contenedorPagPricipal" id="contPrincipal">


          </div>

      </div>
      


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        
  
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

    <script src="Javascript/jquery.validate.js" type="text/javascript"></script>
    <script src="Javascript/Menu.js" type="text/javascript"></script>

    <script>

        

function hidiDivServices(){
    //Function by hide the div Target Services
    document.getElementById('idtableClientObra').style.display = 'none';
}
function sendUpdateService(e)
{   

    
                    $.ajax({
                    type: 'post',
                    url: 'View/Update/EditarServicio.jsp',             
                    data: {"idServiceUpdate": e.value},
     
                    success: function(res) {
                      $(".contenedorPagPricipal").html(res);  
                    }
                });


}

      

    </script>
    
    
  </body>
</html>





