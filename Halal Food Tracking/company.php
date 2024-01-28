<?php
    include 'db_connection.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Company List</title>
    <link rel="stylesheet" href="navbar_style.css" type="text/css" media="screen"/>
    <body>
    <div class="navbar">
      <a href="homepage.html"
        ><img src="home_icon.png" width="18" height="18"
      /></a>
      <a href="product.php">Product</a>
      <a href="company.php">Company</a>
      <a href="SignIn.html">Sign In</a>
    </div>
</head>
    <br>
    <h1>Company List</h1>
    <table>
        <tr>
            <th>Company ID</th>
            <th>Company Name</th>
            <th>Product ID</th>
            <th>Company Location</th>
        </tr>

    <?php

    $sql = "SELECT * FROM company";
    $result = mysqli_query($conn, $sql);
    $resultCheck = mysqli_num_rows($result);
    if ($resultCheck > 0){
        while ($row = mysqli_fetch_assoc($result)){
            echo "<tr>";
            echo "<td>" . $row['CompanyID'] . "</td>";
            echo "<td>" . $row['CompanyName'] . "</td>";
            echo "<td>" . $row['ProductID'] . "</td>";
            echo "<td>" . $row['CompLocation'] . "</td>";
            echo "</tr>";
        }
    }
    else {
        echo "No results found.";
    }
    ?>
    </table>

    <div class="button_container">
    <a href="../Function/boycottStatus.html"><button>Check Boycott Status</button></a>
</div>

</body>
</html>