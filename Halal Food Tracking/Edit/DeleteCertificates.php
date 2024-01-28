<?php

$cert_id = $_POST['cert_id_input'];

include '../db_connection.php';

$sql = "CALL DeleteCertificate(?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $cert_id);  
$execval = $stmt->execute();

        if ($execval === false) {
            echo "Deletion Failed: " . $stmt->error;
        } else {
            echo "Deletion Successful...";
        }

$stmt->close();
$conn->close();

echo "<br><br><a href='../certificate.php'><button>Back</button></a>";


?>