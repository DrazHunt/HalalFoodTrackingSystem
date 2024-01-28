<?php

    include '../db_connection.php';
    $StaffID = $_POST['staff_id_input'];
    $StaffName = $_POST['staff_name_input'];
    $Branch = $_POST['branch_input'];
    $ChargePerCert = $_POST['charge_input'];
 
    if($conn->connect_error) {
        echo "Connection Failed: " . $conn->connect_error;
    } else {
        $stmt = $conn->prepare("INSERT INTO jakim (StaffID, StaffName,Branch,ChargePerCert) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss",$StaffID, $StaffName, $Branch, $ChargePerCert);
        $execval = $stmt->execute();

        if ($execval === false) {
            echo "Insertion Failed: " . $stmt->error;
        } else {
            echo "Insertion Successful...";
        }

        $stmt->close();
        $conn->close();
    }

    echo "<br><br><a href='../jakim.php'><button>View Updated List</button></a>";
    echo "<br><br><a href='../homepageStaff.html'><button>Homepage</button></a>";
    
?>