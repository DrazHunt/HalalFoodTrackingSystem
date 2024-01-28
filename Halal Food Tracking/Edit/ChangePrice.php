<?php

$staff_id = $_POST['staff_id_input'];
$charge_per_cert = $_POST['Charge_input'];

include '../db_connection.php';

$sql = "CALL ChrgPerCert(?,?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $staff_id, $charge_per_cert);  
$execval = $stmt->execute();

        if ($execval === false) {
            echo "Change Failed: " . $stmt->error;
        } else {
            echo "Change Successful...";
        }

$stmt->close();
$conn->close();

echo "<br><br><a href='../jakim.php'><button>Back</button></a>";


?>