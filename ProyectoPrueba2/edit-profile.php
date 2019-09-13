<?php
session_start();
?>

<!doctype html>
<html lang="en">
  <head>
    <title>Editar Documento</title>


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  </head>

  <body>
    <?php
    if (isset($_SESSION['loggedin'])) {
    }
    else {
        echo "<div class='alert alert-danger mt-4' role='alert'>
        <h4>Necesita iniciar sesión para acceder.</h4>
        <p><a href='login.html'>Inicie sesión</a></p></div>";
        exit;
    }

    ?>
	    <?php
			include 'conn.php';
if (isset($_POST['submit'])) {
    if(is_uploaded_file($_FILES['fichero']['tmp_name'])) {



        $ruta = "Archivo/";
        $nombrefinal= trim ($_FILES['fichero']['name']);
        $nombrefinal= str_replace(" ","", $nombrefinal);
        $Archivo= $ruta . $nombrefinal;



        if(move_uploaded_file($_FILES['fichero']['tmp_name'], $Archivo)) {
            echo "<div class='alert alert-success mt-4' role='alert'><h3>Documento subido exitosamente.</h3>
            <b>
            Nombre:  <i><a href=\"".$ruta . $nombrefinal."\">".$_FILES['fichero']['name']."</a></i><br>
            Tipo MIME: <i>".$_FILES['fichero']['type']."</i><br>
            Peso: <i>".$_FILES['fichero']['size']." bytes</i><br>

            </div>";




                   $nombre  = $_POST["nombre"];
                   $description  = $_POST["description"];


                   $query = "INSERT INTO archivos (name,description,ruta,tipo,size)
    VALUES ('$nombre','$description','".$nombrefinal."','".$_FILES['fichero']['type']."','".$_FILES['fichero']['size']."')";


	$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);


	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}

	if (mysqli_query($conn, $query)) {
		echo "";

    
		} else {
			echo "Error: " . $query . "<br>" . mysqli_error($conn);
		}
	}
	mysqli_close($conn);


        }
    }

   ?>
   <div class="form-group">
    <div class="form-group">

        <h3>Edite su documento</h3>
	    <div class="container">
		<p>Bienvenido: <?php echo $_SESSION['name']; ?></p>

		<form action="<?php echo $_SERVER['PHP_SELF']?>" class="btn btn-default " method="post" enctype="multipart/form-data">
		    Seleccione el archivo: <input name="fichero" class="form-control" type="file"  type="file size="150" maxlength="150"> </input>
			<br><br> Nombre:<input name="nombre" class="form-control" type="text" size="70" maxlength="250" >
			<br><br> Descripcion:<input name="description" class="form-control" type="text" size="70" maxlength="250" >
			<br><br>
		    <input name="submit" class="btn btn-default" type="submit" value="SUBIR ARCHIVO">
		</form>

	    </div>
        <p><a href="logout.php">Cerrar sesión</a></p>
    </div>

</div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

	</body>
</html>
