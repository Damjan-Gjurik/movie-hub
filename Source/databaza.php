<?php
    $host = "localhost";
    $user = "root";
    $password = "";
    $database = "moviehub";

    $con = new mysqli($host, $user, $password, $database);
    if ($con->connect_error) {
        die("Грешка!");
    }
?>