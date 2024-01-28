<?php
// db_connection.php

$conn = new mysqli('localhost', 'root', '', 'project_database');

// Check for connection errors
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>