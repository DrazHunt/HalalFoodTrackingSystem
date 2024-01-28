<?php

$cert_id = $_POST['cert_id_input'];

include '../db_connection.php';

$sql = "SELECT certRemainingDays(?, @v_expiryDate, @v_todayDate, @v_remainingDays) AS RemainingDays";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $cert_id);  
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $RemainingDays = $row['RemainingDays'];
    echo "Remaining Days: " . $RemainingDays;
} else {
    echo "No result found.";
}

$stmt->close();
$conn->close();

echo "<br><br><a href='../certificate.php'><button>Back</button></a>";

?>