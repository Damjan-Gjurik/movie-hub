<?php
    include "admin_check.php";
    include "databaza.php";

    $id = $_GET["id"];

    //Zanrovi
    $stmt = $con->prepare("DELETE FROM movie_actors WHERE movie_id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    //movie_platforms
    $stmt = $con->prepare("DELETE FROM movie_actors WHERE movie_id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    //movie_actors
    $stmt = $con->prepare("DELETE FROM movie_actors WHERE movie_id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    //ratings
    $stmt = $con->prepare("DELETE FROM movie_actors WHERE movie_id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    //watchlist
    $stmt = $con->prepare("DELETE FROM movie_actors WHERE movie_id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    //poster
    $stmt = $con->prepare("DELETE FROM movie_actors WHERE movie_id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $movie = $result->fetch_assoc();
    if($movie && file_exists($movie["poster"])) {
        unlink($movie["poster"]);
    }

    //Samiot film
    $stmt = $con->prepare("DELETE FROM movie_actors WHERE movie_id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    header("Location:index.php");
    exit;
?>