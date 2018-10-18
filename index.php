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
?>