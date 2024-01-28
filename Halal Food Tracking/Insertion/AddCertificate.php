<?php
    include '../db_connection.php';

    $CertID = $_POST['Certificate_id_input'];
    $CertName = $_POST['Certificate_name_input'];
    $StaffID = $_POST['staff_id_input'];
    $IssueDate = $_POST['issue_date_input'];
    $ExpiryDate = $_POST['expiry_date_input'];
 
    if($conn->connect_error) {
        echo "Connection Failed: " . $conn->connect_error;
    } else {
        $stmt = $conn->prepare("INSERT INTO certificate (CertID, CertName,StaffID,IssueDate,ExpiryDate) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss",$CertID, $CertName, $StaffID, $IssueDate, $ExpiryDate);
        $execval = $stmt->execute();

        if ($execval === false) {
            echo "Insertion Failed: " . $stmt->error;
        } else {
            echo "Insertion Successful...";
        }

        $stmt->close();
        $conn->close();
    }

    echo "<br><br><a href='../certificate.php'><button>View Updated List</button></a>";
    echo "<br><br><a href='../homepageStaff.html'><button>Homepage</button></a>";
    
?>