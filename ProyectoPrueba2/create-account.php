<!doctype html>
<html lang="en">
  <head>
    <title>Trabajo Ingeniería de Software</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  </head>
<body>

<div class="container">

	<?php

	include 'conn.php';

	$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);


	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}

	$checkEmail = "SELECT * FROM users WHERE Email = '$_POST[email]' ";


	$result = $conn-> query($checkEmail);


	$count = mysqli_num_rows($result);


	if ($count == 1) {
	echo "<div class='alert alert-warning mt-4' role='alert'>
					<p>El correo que acaba de ingresar ya se encuentra en nuestra base de datos.</p>
					<p><a href='login.html'>Por favor, inicie sesión.</a></p>
				</div>";
	} else {


	$name = $_POST['name'];
	$email = $_POST['email'];
	$pass = $_POST['password'];
  $tipousuario = $_POST['tipousuario'];

	$passHash = password_hash($pass, PASSWORD_DEFAULT);


	$query = "INSERT INTO users (Name, Email, Password, TipoUsuario) VALUES ('$name', '$email', '$passHash','$tipousuario')";

	if (mysqli_query($conn, $query)) {
		echo "<div class='alert alert-success mt-4' role='alert'><h3>Su cuenta fue creada exitosamente.</h3>
		<a class='btn btn-outline-primary' href='login.html' role='button'>Inicie sesión</a></div>";
		} else {
			echo "Error: " . $query . "<br>" . mysqli_error($conn);
		}
	}
	mysqli_close($conn);
	?>
</div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
  </body>
</html>
