<?php
$servername = "db";
$username = "openfids";
$password = "Lt69lzYJNoLCPH5s";
$dbname = "fids";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>