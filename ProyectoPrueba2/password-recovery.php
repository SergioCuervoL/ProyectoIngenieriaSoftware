<!doctype html>
<html lang="en">
	<head>
    	<title>Password Recovery</title>
   
    	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    	<!-- Bootstrap CSS -->
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  </head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-12 col-md-12 col-lg-12">

			<?php
			include 'conn.php';

			$email = $_POST['email'];
			$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

			
			if (!$conn) {
				die("Connection failed: " . mysqli_connect_error());
			}

			$sql = "SELECT Email, Password FROM users WHERE Email='$email'";
			$result = mysqli_query($conn, $sql);

			if (mysqli_num_rows($result) > 0) {
				$row = mysqli_fetch_assoc($result);

				$subject = "Your password for PHP Login";
				$body = "Your password is:" . $row['Password'];

				$headers = 'From: youremail@mail.com' . "\r\n" .
				'Reply-To: youremail@mail.com' . "\r\n" .
				'X-Mailer: PHP/' . phpversion();

				mail($email, $subject, $body, $headers);

				echo "<div class='alert alert-success alert-dismissible mt-4' role='alert'>
				<button type='button' class='close' data-dismiss='alert' aria-label='Close'>
				<span aria-hidden='true'>&times;</span></button>

				<p>El correo se envio correctamente..</p>
				<p><a class='alert-link' href=login.html>Iniciar Sesión</a></p></div>";
			} else {
				echo "Este correo no se encuentra en nuestra base de datos.";
			}
			?>
		</div>
	</div>
</div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
	</body>
</html>
