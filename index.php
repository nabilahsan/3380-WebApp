<?php

include 'dbi.php';

$conn = OpenCon();
 
echo "Connected Successfully";
 
CloseCon($conn);
 
?>