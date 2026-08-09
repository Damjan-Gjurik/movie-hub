<?php
    include "session_check.php";
    include "databaza.php";

    $userId = $_SESSION["user_id"];

    if(!isset($_POST["change_password"])) {
        $username = trim($_POST["username"]);
        $email = trim($_POST["email"]);
        
        $stmtUser = $con->prepare("SELECT id FROM users WHERE username=? AND id!=?");
        $stmtUser->bind_param("si", $username, $userId);
        $stmtUser->execute();
        if($stmtUser->get_result()->num_rows>0) {
            header("Location:account_settings.php?error=usernametaken");
            exit;
        }

        $stmtMail=$con->prepare("SELECT id FROM users WHERE email=? AND id!=?");
        $stmtMail->bind_param("si", $email, $userId);
        $stmtMail->execute();
        if($stmtMail->get_result()->num_rows>0) {
            header("Location:account_settings.php?error=emailtaken");
            exit;
        }

        $stmtProfile=$con->prepare("SELECT profile_picture FROM users WHERE id=?");
        $stmtProfile->bind_param("i", $userId);
        $stmtProfile->execute();
        $user = $stmtProfile->get_result()->fetch_assoc();
        $profilePicture = $user["profile_picture"];

        if(isset($_FILES["profile_picture"]) && $_FILES["profile_picture"]["error"]==0) {
            $fileName = time()."_".basename($_FILES["profile_picture"]["name"]);
            $target = "Sliki/Uploads/".$fileName;
            move_uploaded_file($_FILES["profile_picture"]["tmp_name"], $target);
            $profilePicture = $target;
        }

        $stmtUpdate = $con->prepare("UPDATE users SET username=?, email=?, profile_picture=? WHERE id=?");
        $stmtUpdate->bind_param("sssi", $username, $email, $profilePicture, $userId);
        $stmtUpdate->execute();

        $_SESSION["username"] = $username;
        header("Location:account_settings.php?success=profile");
        exit;
    }

    $currentPassword = $_POST["current_password"];
    $newPassword = $_POST["new_password"];
    $confirmPassword = $_POST["confirm_password"];

    $stmtPass = $con->prepare("SELECT password FROM users WHERE id=?");
    $stmtPass->bind_param("i", $userId);
    $stmtPass->execute();
    $user = $stmtPass->get_result()->fetch_assoc();

    if(!password_verify($currentPassword, $user["password"])) {
        header("Location:account_settings.php?error=wrongpassword");
        exit;
    }
    if(strlen($newPassword) < 6) {
        header("Location:account_settings.php?error=shortPassword");
        exit;
    }
    if($newPassword != $confirmPassword){
        header("Location:account_settings.php?error=passwordmismatch");
        exit;
    }
    $newPasswordHash = password_hash($newPassword, PASSWORD_DEFAULT);
    $stmtUpdatePass = $con->prepare("UPDATE users SET password=? WHERE id=?");
    $stmtUpdatePass -> bind_param("si", $newPasswordHash, $userId);
    $stmtUpdatePass->execute();
    
    header("Location:account_settings.php?success=password");
    exit;
?>

