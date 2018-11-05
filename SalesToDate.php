<?php
$servername = "localhost";

$username = "user2";

$password = "Hershey@2018";

$db = "webapp";

// Create connection
$conn = mysqli_connect($servername, $username, $password,$db);

?>

<html>

<head>
    <title>Sales To Date</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</head>

</html>
<?php

    //Stored procedures
    //Ref: http://www.mysqltutorial.org/php-calling-mysql-stored-procedures/
    $sp2 = "CALL `SaleToDate`()";

    $result1 = mysqli_query($conn, $sp2);

    $check3 = mysqli_num_rows($result1);


   echo '<hr>';
    echo '<h2 style="text-align: center; margin-top: 10%;">Result of Stored Procedure 1: Listing Sales to Date</h2>';
    if ($check3 > 0) {
        echo "<table class='table table-striped container'>
                    <tr>
                        <th scope='col'>Product ID</th>
                        <th scope='col'>Product Name</th>
                        <th scope='col'>Quantity Ordered</th>
                    </tr>";
        while ($row = mysqli_fetch_array($result1)) {
            echo '  <tr>
                        <td>'.$row['ProductID'].'</td>
                        <td>'.$row['ProductName'].'</td>
                        <td>'.$row['QuantityOrdered'].'</td>
                    </tr>';
        }
        echo "</table>";
    } else
        echo 'Nothing in table';

?>
