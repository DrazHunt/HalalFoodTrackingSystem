<?php
    include 'db_connection.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
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
    <h1>Product List</h1>
    <table>
        <tr>
            <th>Product ID </th>
            <th>Product Name </th>
            <th>Category </th>
            <th>Certificate ID</th>
            <th>Halal Status</th>
            <th>Boycott Status</th>   
        </tr>

    <?php

    $sql = "SELECT * FROM product";
    $result = mysqli_query($conn, $sql);
    $resultCheck = mysqli_num_rows($result);
    if ($resultCheck > 0){
        while ($row = mysqli_fetch_assoc($result)){
            echo "<tr>";
            echo "<td>" . $row['ProductID'] . "</td>";
            echo "<td>" . $row['ProductName'] . "</td>";
            echo "<td>" . $row['ProductCategory'] . "</td>";
            echo "<td>" . $row['CertID'] . "</td>";
            echo "<td>" . $row['HalalStatus'] . "</td>";
            echo "<td>" . $row['BoycottStatus'] . "</td>";
            echo "</tr>";
        }
    }
    else {
        echo "No results found.";
    }
    ?>
    </table>

    <div class="button_container">
    <a href="../Procedure/RetrieveProductDetails.html"><button>Search Product</button></a>
</div>

</body>
</html>