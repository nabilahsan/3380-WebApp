<?php
// Connection information for our MySQL database.

function OpenCon()
 {
 $dbhost = "localhost";
 $dbuser = "user2";
 $dbpass = "Hershey@2018";
 $db = "webapp";


 $conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n". $conn -> error);

 
 return $conn;
 }
 
function CloseCon($conn)
 {
 $conn -> close();
 }
   
?>