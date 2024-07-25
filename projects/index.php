<?php
$host = 'db'; 
$user = 'root';
$password = '';


$conn = new mysqli($host, $user, $password);
if ($conn->connect_error){
    echo 'connection failed' . $conn->connect_error;
} else {
    echo 'Successfully connected to MySql';
}
?>