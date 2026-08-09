<?php
    include "session_check.php";
    include "databaza.php";

    $userId = $_SESSION["user_id"];
    $movieId = $_POST["movie_id"];
    $rating = $_POST["rating"];

    $check = "SELECT * FROM ratings WHERE user_id = ? AND movie_id = ?";

    $stmt = $con->prepare($check);
    $stmt->bind_param("ii", $userId, $movieId);
    $stmt->execute();
    $result = $stmt->get_result();

    if($result->num_rows > 0){
        $update = "
        UPDATE ratings
        SET rating = ?
        WHERE user_id = ?
        AND movie_id = ?
        ";
        $stmt2 = $con->prepare($update);
        $stmt2->bind_param("iii", $rating, $userId, $movieId);
        $stmt2->execute();
    }
    else {
        $insert = "
        INSERT INTO ratings
        (user_id,movie_id,rating)
        VALUES (?,?,?)
        ";
        $stmt2 = $con->prepare($insert);
        $stmt2->bind_param("iii", $userId, $movieId, $rating);
        $stmt2->execute();
    }
    header("Location: movie.php?id=".$movieId);
    exit;
?>