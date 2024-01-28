<?php

include '../db_connection.php';
$product_id = $_POST['product_id_input'];
$product_name = $_POST['product_name_input'];
$product_category = $_POST['product_category_input'];
$certificate_id = $_POST['certificate_id_input'];
$halal_status = $_POST['halal_status_input'];
$boycott_status = $_POST['boycott_status_input'];
$company_id = $_POST['company_id_input'];
$company_name = $_POST['company_name_input'];
$company_location = $_POST['company_location_input'];
$balance = $_POST['balance_input'];


$sql = "CALL AddNewProductAndCompany(? , ?, ?, ?, ?, ? ,? ,? ,?,? )";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssssssssss", $product_id,$product_name,$product_category,$certificate_id, $halal_status, $boycott_status, $company_id, $company_name, $company_location, $balance);
$execval = $stmt->execute();

if ($execval === false) {
    echo "Insertion Failed: " . $stmt->error;
} else {
    echo "Add New Product and Company successfully.";
}

$stmt->close();
$conn->close();


echo "<br><br><a href='../ProductAndCompany.php'><button>View Updated List</button></a>";


?>