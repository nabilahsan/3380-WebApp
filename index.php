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
    <title>PHP in HTML Example</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</head>

</html>
<?php
    //Stored procedures
    //Ref: http://www.mysqltutorial.org/php-calling-mysql-stored-procedures/
    $sp1 = "CALL `ProductLineSale`()";
    mysqli_query($conn, $sp1); // Initiate Procedure
    $sp1 = "SELECT * FROM Product;";
    $result3 = mysqli_query($conn, $sp1); // Get Product Contents
    if (mysqli_num_rows($result3) > 0) {
        echo '<hr>';
        echo '<h2>Result of Stored Procedure 1: Products with new SalesPrice column</h2>';
        echo "<table class='table table-striped'>
                    <tr>
                        <th scope='col'>ID</th>
                        <th scope='col' >Name</th>
                        <th scope='col'>Finish</th>
                        <th scope='col'>Price</th>
                        <th scope='col'>Product Line ID</th>
                        <th scope='col'>Photo</th>
                        <th scope='col'>SalePrice</th>
                    </tr>";
        while ($row = mysqli_fetch_array($result3)) {
            # code...
    /*
            echo '<tr>';
            echo '<td>'.$row['SalePrice'].'</td>'; // was giving me a warning in the browser
            echo '</tr>';
    */
            echo '  <tr>
                        <td>'.$row['p_id'].'</td>
                        <td>'.$row['p_name'].'</td>
                        <td>'.$row['p_finish'].'</td>
                        <td>'.$row['p_standard_price'].'</td>
                        <td>'.$row['pl_id'].'</td>
                        <td>'.$row['p_photo'].'</td>
                        <td>'.$row['SalePrice'].'</td>
                    </tr>';
    
        }
        echo "</table>";
    } else
        echo 'Nothing in table';
?>