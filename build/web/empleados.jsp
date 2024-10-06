<%-- 
    Document   : empleados
    Created on : 8/09/2024, 09:49:27
    Author     : Elicho
--%>

<%@page import="modelo.Puesto" %>
<%@page import="java.util.HashMap"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Empleados</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        
    </head>
    <body>
               <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
      <a class="navbar-brand" href="https://umg.edu.gt/" target='_blank'>UMG</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Index.html">Inicio</a>
        </li>
         <!-- comment        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>-->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Menu
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="empleados.jsp">Empleados</a></li>
            <li><a class="dropdown-item" href="#">Clientes</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Puestos</a></li>
          </ul>
        </li>

      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
       </header> 
        

        
        <h1>Formulario empleados</h1>
        
        <div class="container">
  <!-- Content here -->
  <form class='form-group needs-validation' novalidate action="sr_empleado" method='post'> <!-- get,post -->
            <label for="lbl_id" class="form-label"><b>ID</<b></label>
            <input type="text" class="form-control" name="txt_id" id="txt_id" value="0" readonly="">
            
            <label for="lbl_codigo" class="form-label"><b>Codigo</<b></label>
            <input type="text" class="form-control" name="txt_codigo" id="txt_codigo" placeholder="Ej: A001" pattern='[A-Z]{1}[0-9]{3}' required=''>

            <label for="lbl_nombres" class="form-label"><b>Nombres</<b></label>
            <input type="text" class="form-control" name="txt_nombres" id="txt_nombres" placeholder="Ej: Eduardo" required=''>

            <label for="lbl_apellidos" class="form-label"><b>Apellidos</<b></label>
            <input type="text" class="form-control" name="txt_apellidos" id="txt_apellidos" placeholder="Ej: Lopez" required=''>

            <label for="lbl_direccion" class="form-label"><b>Direccion</<b></label>
            <input type="text" class="form-control" name="txt_direccion" id="txt_direccion" placeholder="Ej: Ciudad" required=''>

            <label for="lbl_telefono" class="form-label"><b>Telefono</<b></label>
            <input type="number" class="form-control" name="txt_telefono" id="txt_telefono" placeholder="Ej: 12345678" required=''>

            <label for="lbl_fn" class="form-label"><b>Fecha Nacimiento</<b></label>
            <input type="date" class="form-control" name="txt_fn" id="txt_fn" placeholder="Ej: dd/mm/aaaa" required=''>
            
            <label for="lbl_puesto" class="form-label"><b>Puesto</<b></label>

<select name="drop_puesto" id="drop_puesto" class="form-select" required >
    <option selected disabled value>Seleccione</option>
    
    <%
        Puesto puesto = new Puesto();
        HashMap<String, String> drop = puesto.drop_puesto();
        for(String i:drop.keySet()){
        
        out.println("<option value='"+ i +"'>"+drop.get(i)+"</option>");
        }
        %>
                                    <select>


                                        <!--
<select class="form-select" required >
  <option selected disabled value="">Seleccionar</option>
  <option value="1">Programador</option>
  <option value="2">Digitador</option>
  <option value="3">Asistente</option>
  <option value="3">Jefe</option>
</select>           --> 
            
</br>
            
<button name='btn_crear' id='btn_crear' value='crear' class="btn btn-primary"><i class="bi bi-floppy"> </i>Crear</button>
<button name='btn_modificar' id='btn_modificar' value='crear' class="btn btn-warning"><i class="bi bi-pencil"> </i>Modificar</button>
<button name='btn_borrar' id='btn_borrar' value='crear' class="btn btn-danger"><i class="bi bi-trash"> </i>Borrar</button>
        </form>
        </div>
        
      
        
        <script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()            
            </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>        


    </body>
</html>
