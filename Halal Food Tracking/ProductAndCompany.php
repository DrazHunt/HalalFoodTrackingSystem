<?php
    include 'db_connection.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Product And Company List</title>
    <link rel="stylesheet" href="navbar_style.css" type="text/css" media="screen"/>
    <body>
    <div class="navbar">
      <a href="homepageStaff.html"
        ><img src="home_icon.png" width="18" height="18"
      /></a>
      <a href="jakim.php">Staff</a>
      <a href="ProductAndCompany.php">Product</a>
      <a href="certificate.php">Certificate</a>
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

    <br>
    <h1>Company List</h1>
    <table>
        <tr>
            <th>Company ID</th>
            <th>Company Name</th>
            <th>Product ID</th>
            <th>Company Location</th>
            <th>Balance (RM)</th>
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
            echo "<td>" . $row['Balance'] . "</td>";
            echo "</tr>";
        }
    }
    else {
        echo "No results found.";
    }
    ?>
    </table>

    <div class="button_container">
    <a href="../Procedure/AddNewProduct&Company.html"><button>Add Product and Company</button></a>
</div>

</body>
</html>