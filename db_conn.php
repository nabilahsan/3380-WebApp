<?php

$servername = "localhost";

$username = "user2";

$password = "Hershey@2018";

$db = "webapp";



// Create connection

$conn = mysqli_connect($servername, $username, $password,$db);



// Check connection

if (!$conn) {

   die("Connection failed: " . mysqli_connect_error());

}

?>