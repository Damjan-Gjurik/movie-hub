<?php
    session_start();
    include "databaza.php";

    if($_SERVER["REQUEST_METHOD"] == "POST") {
        $email = trim($_POST["email"]);
        $password = trim($_POST["password"]);
        $sql = "SELECT * FROM users WHERE email = ?";

        $stmt = $con->prepare($sql);
        $stmt->bind_param("s", $email);;
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows==1) {
            $user = $result->fetch_assoc();
            if (password_verify($password, $user["password"])) {
                $_SESSION["user_id"] = $user["id"];
                $_SESSION["username"] = $user["username"];
                $_SESSION["email"] = $user["email"];
                $_SESSION["role"] = $user["role"];
                $_SESSION["last_activity"] =
                time();

                header("Location: index.php");
                exit;
            } else {
            echo "Погрешна лозинка!";
            }
        }
        else {
            echo "Корисникот не постои!";
        }
    }