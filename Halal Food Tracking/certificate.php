<?php
    include 'db_connection.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Certificate List</title>
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
    <h1>Certificate List</h1>
    <table>
        <tr>
            <th>Certificate ID</th>
            <th>Certificate Name</th>
            <th>Staff ID</th>
            <th>Issue Date</th>
            <th>Expiry Date</th>
        </tr>

    <?php

    $sql = "SELECT * FROM certificate";
    $result = mysqli_query($conn, $sql);
    $resultCheck = mysqli_num_rows($result);
    if ($resultCheck > 0){
        while ($row = mysqli_fetch_assoc($result)){
            echo "<tr>";
            echo "<td>" . $row['CertID'] . "</td>";
            echo "<td>" . $row['CertName'] . "</td>";
            echo "<td>" . $row['StaffID'] . "</td>";
            echo "<td>" . $row['IssueDate'] . "</td>";
            echo "<td>" . $row['ExpiryDate'] . "</td>";
            echo "</tr>";
        }
    }
    else {
        echo "No results found.";
    }
    ?>
    </table>

    <div class="button_container">
    <a href="../Insertion/AddCertificate.html"><button>Add Certificate</button></a>
    <a href="../Function/certRemainingDays.html"><button>Check Certificate Remaining Days</button></a>
    <a href="../Edit/DeleteCertificates.html"><button>Delete Certificate</button></a>
</div>

</body>
</html>