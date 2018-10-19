<?php
$servername = "localhost";

$username = "user2";

$password = "Hershey@2018";

$db = "webapp";

// Create connection
$conn = mysqli_connect($servername, $username, $password,$db);

$query1 = "SELECT * FROM Customer";
$result = mysqli_query($conn, $query1);
$check = mysqli_num_rows($result);

//Running query 1
if ($check > 0) {
    # code...
    echo "<table border='1'>
                <tr>
                <th>ID</th>
                <th>Name</th>
                </tr>";
    while ($row = mysqli_fetch_array($result)) {
        # code...
        echo '<tr>';
        echo '<td>'.$row[c_id].'</td>';
        echo '<td>'.$row[c_name].'</td>';
        echo '</tr>';
    }
    echo "</table>";
}

$query2 = "SELECT C.c_state AS State, count(*) AS CustormerCount FROM Customer C GROUP BY C.c_state;";

$result2 = mysqli_query($conn, $query2);
$check2 = mysqli_num_rows($result2);

//Running query 2
if ($check2 > 0) {
    # code...
    echo '<hr>';
    echo 'Running query 10';
    echo "<table border='1'>
                <tr>
                <th>STATE</th>
                <th>CUSTOMER COUNT</th>
                </tr>";
    while ($row = mysqli_fetch_array($result2)) {
        # code...
        echo '<tr>';
        echo '<td>'.$row[State].'</td>';
        echo '<td>'.$row[CustormerCount].'</td>';
        echo '</tr>';
    }
    echo "</table>";
}

//Stored procedures
//Ref: http://www.mysqltutorial.org/php-calling-mysql-stored-procedures/

$sp1 = "CALL `getProductName`()";

$result3 = mysqli_query($conn, $sp1);
$check3 = mysqli_num_rows($result3);

if ($check3 > 0) {
    # code...
    echo '<hr>';
    echo '<h2>Result of Stored Procedure 1: Getting Product Names</h2>';
    echo "<table border='1'>
                <tr>
                <th>Product Name</th>
                </tr>";
    while ($row = mysqli_fetch_array($result3)) {
        # code...
        echo '<tr>';
        echo '<td>'.$row[p_name].'</td>';
        echo '</tr>';
    }
    echo "</table>";
}

?>