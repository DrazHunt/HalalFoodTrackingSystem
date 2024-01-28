<?php
include '../db_connection.php';
$product_id = $_POST['product_id_input'];

$sql = "CALL GetProductDetail(?);";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $product_id);
$stmt->execute();

$result = $stmt->get_result();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo 'Product Name: '.$row['ProductName']. "<br>";
        echo 'Category: '.$row['ProductCategory']. "<br>";
        echo 'Halal Status: '.$row['HalalStatus']. "<br>";
        echo 'Boycott Status: '.$row['BoycottStatus']. "<br>" ;
        echo 'Company Name: '.$row['CompanyName']. "<br>";
        echo 'Company Location: '.$row['CompLocation']. "<br>";
        echo 'Certificate Name: '.$row['CertName']. "<br>";
    }
} 
else {
    echo "No booking found with the provided ID.";
}

$stmt->close();
$conn->close();


echo "<br><br><a href='../product.php'><button>Back</button></a>";

?>