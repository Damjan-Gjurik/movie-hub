<?php
    include "session_check.php";
    include "databaza.php";

    $userId = $_SESSION["user-id"];
    $movieId = $_POST["movie_id"];

    $stmt = $con->prepare("DELETE FROM ratings WHERE user_id=? AND movie_id=?");
    $stmt->bind_param("ii", $userId, $movieId);
    $stmt->execute();
    header("Location:ratings.php");
    exit;
?>