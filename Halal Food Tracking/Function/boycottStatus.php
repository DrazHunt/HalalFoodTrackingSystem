<?php

$comp_id = $_POST['comp_id_input'];

include '../db_connection.php';

$sql = "SELECT boycottStatus(?, @v_status) AS status";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $comp_id);  
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $status = $row['status'];
    echo "Boycott status: " . $status;
} else {
    echo "No result found.";
}

$stmt->close();
$conn->close();

echo "<br><br><a href='../company.php'><button>Back</button></a>";


?>