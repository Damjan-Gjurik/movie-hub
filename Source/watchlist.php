<?php
    include "session_check.php";
    include "databaza.php";

    $userId = $_SESSION["user_id"];
    $movieId = $_POST["movie_id"];

    $check = "SELECT * FROM watchlist WHERE user_id = ? AND movie_id = ?";
    $stmt = $con->prepare($check);
    $stmt->bind_param("ii", $userId, $movieId);
    $stmt->execute();
    $result = $stmt->get_result();

    if($result->num_rows>0) {
        header("Location:movie.php?id=".$movieId);
        exit;
    }
    $sql = "INSERT INTO watchlist(user_id, movie_id) VALUES(?, ?)";
    $stmt2 = $con->prepare($sql);

    $stmt2->bind_param("ii", $userId, $movieId);
    $stmt2->execute();
    header("Location:movie.php?id=".$movieId);
    exit;
?>
    