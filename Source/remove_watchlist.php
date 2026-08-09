<?php
    include "session_check.php";
    include "databaza.php";
    $userId = $_SESSION["user_id"];
    $movieId = $_POST["movie_id"];

    $sql = "
    DELETE FROM watchlist
    WHERE user_id = ?
    AND movie_id = ?
    ";

    $stmt = $con->prepare($sql);
    $stmt->bind_param(
        "ii",
        $userId,
        $movieId
    );
    $stmt->execute();

    header("Location: watchlist_page.php");
    exit;
?>