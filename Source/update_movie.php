<?php
    include "admin_check.php";
    include "databaza.php";
    ini_set('display_errors',1);
    error_reporting(E_ALL);
    echo "START<br>";
    echo "<pre>";
    print_r($_POST);
    echo "</pre>";
    exit;

    $movieId = $_POST["movie_id"];
    $title = $_POST["title"];
    $type = $_POST["type"];
    $release_year = $_POST["release_year"];
    $description = $_POST["description"];
    $trailer = $_POST["trailer"];
    $season = $_POST["seasons"] ?? 0;
    $episodes = $_POST["episodes"] ?? 0;

    $stmtPoster = $con->prepare("SELECT poster FROM movies WHERE id=?");
    $stmtPoster->bind_param("i", $movieId);
    $stmtPoster->execute();
    $poster = $stmtPoster->get_result()->fetch_assoc()["poster"];

    if($_FILES["poster"]["error"]==0) {
        $posterName = time()."_".basename($_FILES["poster"]["name"]);
        $posterPath = "Sliki/Uploads/".$posterName;

        move_uploaded_file($_FILES["poster"]["tmp_name"],$posterPath);
        $poster = $posterPath;
    }

    $stmt = $con->prepare("UPDATE movies SET title=?, type=?, 
    release_year=?, description=?, poster=?, trailer=?, seasons=?, episodes=? WHERE id=?");
    $stmt->bind_param("ssisssiii", $title, $type, $release_year, $description, 
    $poster, $trailer, $season, $episodes, $movieId);
    if(!$stmt->execute()){
        die($stmt->error);
    }
    echo "Movies updated<br>";

    $stmtGenre = $con->prepare("DELETE FROM movie_genres WHERE movie_id=?");
    $stmtGenre->bind_param("i", $movieId);
    $stmtGenre->execute();
    if(isset($_POST["genres"])) {
        foreach($_POST["genres"] as $genreId) {
            $stmt = $con->prepare("INSERT INTO movie_genres(movie_id, genre_id) VALUES(?, ?)");
            $stmt->bind_param("ii", $movieId, $genreId);
            $stmt->execute();
        }
    }
    echo "Genres updated<br>";

    $stmtPlatform = $con->prepare("DELETE FROM movie_platforms WHERE movie_id=?");
    $stmtPlatform->bind_param("i", $movieId);
    $stmtPlatform->execute();
    if(isset($_POST["platforms"])) {
        foreach($_POST["platforms"] as $platformId) {
            $stmt = $con->prepare("INSERT INTO movie_platforms(movie_id, platform_id) VALUES(?, ?)");
            $stmt->bind_param("ii", $movieId, $platformId);
            $stmt->execute();
        }
    }
    echo "Platforms updated<br>";

    $stmtDirector = $con->prepare("DELETE FROM movie_directors WHERE movie_id=?");
    $stmtDirector->bind_param("i", $movieId);
    $stmtDirector->execute();
    if(isset($_POST["director_name"]) && is_array($_POST["director_name"])) {
        foreach($_POST["director_name"] as $directorName){
            $directorName = trim($directorName);
            if($directorName === "") continue;
            $check = $con->prepare("SELECT id FROM directors WHERE name=?");
            $check->bind_param("s", $directorName);
            $check->execute();
            $res = $check->get_result();
            if($res->num_rows > 0){
                $directorId = $res->fetch_assoc()["id"];
            } else {
                $insert = $con->prepare("INSERT INTO directors(name) VALUES(?)");
                $insert->bind_param("s", $directorName);
                $insert->execute();
                $directorId = $con->insert_id;
            }
            $link = $con->prepare("INSERT IGNORE INTO movie_directors(movie_id,director_id) VALUES(?,?)");
            $link->bind_param("ii", $movieId, $directorId);
            if(!$link->execute()){
                die($link->error);
            }
    }
    }
    echo "Directors updated<br>";   
    if(isset($_POST["actor_name"])){

        foreach($_POST["actor_name"] as $index=>$name){
            $name = trim($name);
            if($name==""){
                continue;
            }
            $actorId = $_POST["actor_id"][$index] ?? "";
            $image = "";
            if(isset($_FILES["actor_image"]["error"][$index]) &&
            $_FILES["actor_image"]["error"][$index]==0){
                $file = time()."_".basename($_FILES["actor_image"]["name"][$index]);
                $target = "Sliki/Uploads/".$file;
                move_uploaded_file(
                    $_FILES["actor_image"]["tmp_name"][$index],
                    $target
                );
                $image = $target;
            }
            // Ако актерот веќе постои
            if($actorId!=""){
                if($image!=""){
                    $stmt = $con->prepare("
                    UPDATE actors
                    SET name=?, image=?
                    WHERE id=?
                    ");
                    $stmt->bind_param("ssi",$name,$image,$actorId);
                }else{
                    $stmt = $con->prepare("
                    UPDATE actors
                    SET name=?
                    WHERE id=?
                    ");
                    $stmt->bind_param("si",$name,$actorId);
                }
                $stmt->execute();
            }else{
                // Проверка дали постои актер со исто име
                $check = $con->prepare("
                SELECT id
                FROM actors
                WHERE name=?
                ");
                $check->bind_param("s",$name);
                $check->execute();
                $res = $check->get_result();
                if($res->num_rows>0){
                    $actorId = $res->fetch_assoc()["id"];
                    if($image!=""){
                        $stmt = $con->prepare("
                        UPDATE actors
                        SET image=?
                        WHERE id=?
                        ");
                        $stmt->bind_param("si",$image,$actorId);
                        $stmt->execute();
                    }

                }else{

                    $stmt = $con->prepare("
                    INSERT INTO actors(name,image)
                    VALUES(?,?)
                    ");
                    $stmt->bind_param("ss",$name,$image);
                    $stmt->execute();

                    $actorId = $con->insert_id;
                }
            }

            // Поврзи го актерот со филмот
            $stmt = $con->prepare("
            INSERT INTO movie_actors(movie_id,actor_id)
            VALUES(?,?)
            ");
            $stmt->bind_param("ii",$movieId,$actorId);
            $stmt->execute();
        }
    }
    echo "Actors updated<br>";
    echo "END";
    header("Location:update_movie.php");
    exit;
?>
