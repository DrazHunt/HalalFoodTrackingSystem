<?php
    include 'db_connection.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Jakim Staff List</title>
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
    <h1>Jakim List</h1>
    <table>
        <tr>
            <th>Staff ID</th>
            <th>Staff Name</th>
            <th>Branch</th>
            <th>ChargePerCertificate (RM)</th>
        </tr>

    <?php

    $sql = "SELECT * FROM jakim";
    $result = mysqli_query($conn, $sql);
    $resultCheck = mysqli_num_rows($result);
    if ($resultCheck > 0){
        while ($row = mysqli_fetch_assoc($result)){
            echo "<tr>";
            echo "<td>" . $row['StaffID'] . "</td>";
            echo "<td>" . $row['StaffName'] . "</td>";
            echo "<td>" . $row['Branch'] . "</td>";
            echo "<td>" . $row['ChargePerCert'] . "</td>";
            echo "</tr>";
        }
    }
    else {
        echo "No results found.";
    }
    ?>
    </table>

    <div class="button_container">
    <a href="../Insertion/JakimAdd.html"><button>Add staff</button></a>
    <a href="../Edit/Changeprice.html"><button>Change Price Per Certificate</button></a>
</div>

</body>
</html>