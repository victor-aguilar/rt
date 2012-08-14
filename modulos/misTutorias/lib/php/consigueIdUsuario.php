     <?php
     session_start();
     
     
     if( isset($_SESSION['idUsuario']))
     {
         echo $_SESSION['idUsuario'];

     } else {   
         echo"no";
      }
     ?>