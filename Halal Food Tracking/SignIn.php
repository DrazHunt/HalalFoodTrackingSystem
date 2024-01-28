<?php      
    include 'db_connection.php';
    $username = $_POST['staff_id_input'];  
    $password = $_POST['staff_password_input'];   
      
        $sql = "select * from login where StaffID = '$username' and Password = '$password'";  
        $stmt = $conn->prepare($sql); 
        $stmt->execute();
        $result = $stmt->get_result(); 
        
        
        if($result->num_rows > 0){  
            echo "<h1><center> Login successful </center></h1>";
            echo "<br><br><a href='homepageStaff.html'><button>Back To Homepage</button></a>";  
        }  
        else{  
            echo "<h1> Login failed. Invalid username or password.</h1>";  
        }     
?>  