<?php
    include "databaza.php";
    
    if($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = trim($_POST["username"]);
        $email = trim($_POST["email"]);
        $password = trim($_POST["password"]);

        $check = "SELECT id FROM users WHERE email = ?";
        $stmt = $con->prepare($check);
        $stmt->bind_param("s", $email);
        $stmt->execute();

        $result = $stmt->get_result();

        if($result->num_rows>0) {
            echo "Email веќе постои!";
            exit;
        }
        $checkUsername ="SELECT id FROM users WHERE username = ?";
        $stmtUser =
        $con->prepare($checkUsername);
        $stmtUser->bind_param("s",$username);
        $stmtUser->execute();
        $userResult =
        $stmtUser->get_result();
        if ($userResult->num_rows > 0) {
            die("Корисничкото име веќе постои!");
        }

        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
        $insert = "INSERT INTO users (username, email, password) VALUES(?, ?, ?)";

        $stmt2 = $con->prepare($insert);
        $stmt2->bind_param("sss", $username, $email, $hashedPassword);

        if($stmt2->execute()) {
            header("Location:index.php");
        } else {
            echo "Грешка!";
        }
    }
?>