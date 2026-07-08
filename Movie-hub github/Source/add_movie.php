<?php
    include "admin_check.php";
    include "databaza.php";
    $genresResult = $con->query("SELECT * FROM genres ORDER BY name");
    $platformsResult = $con->query("SELECT * FROM platforms ORDER BY name");

    $title = $_POST["title"];
    $type = $_POST["type"];
    $release_year = $_POST["release_year"];
    $description = $_POST["description"];
    $trailer = $_POST["trailer"];
    $seasons = $_POST["seasons"] ?? 0;
    $episodes = $_POST["episodes"] ?? 0;
    $posterName = $_FILES["poster"]["name"];
    $tmpName = $_FILES["poster"]["tmp_name"];
    $uploadDir = "Sliki/Uploads/";
    $posterPath = $uploadDir.time()."_".$posterName;
    move_uploaded_file($tmpName, $posterPath);

    $sql = "INSERT INTO movies(title, type, release_year, description, poster, trailer, seasons, episodes)
    VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
    
    $stmt = $con->prepare($sql);
    $stmt->bind_param("ssisssii", $title, $type, $release_year, $description, $posterPath, $trailer, $seasons, $episodes);
    
    if($stmt->execute()) {
        $movieId = $con->insert_id;
        if (isset($_POST["genres"])) {
            foreach($_POST["genres"] as $genresId) {
                $stmtGenre = $con->prepare("INSERT INTO movie_genres(movie_id, genre_id) VALUES(?, ?)");
                $stmtGenre->bind_param("ii", $movieId, $genresId);
                $stmtGenre->execute();
            }
        }
        if (isset($_POST["platforms"])) {
            foreach($_POST["platforms"] as $platformId) {
                $stmtPlatform = $con->prepare("INSERT INTO movie_platforms(movie_id, platform_id) VALUES(?, ?)");
                $stmtPlatform->bind_param("ii", $movieId, $platformId);
                $stmtPlatform->execute();
            }
        }
        // ===== ACTORS =====
        if (isset($_POST["actor_name"])) {

            foreach ($_POST["actor_name"] as $index => $name) {

                $name = trim($name);
                if ($name == "") continue;

                $check = $con->prepare("SELECT id FROM actors WHERE name=?");
                $check->bind_param("s", $name);
                $check->execute();
                $res = $check->get_result();

                if ($res->num_rows > 0) {
                    $actorId = $res->fetch_assoc()["id"];
                } else {

                    $image = "";

                    if (isset($_FILES["actor_image"]["error"][$index]) && $_FILES["actor_image"]["error"][$index] == 0) {

                        $fileName = time() . "_" . basename($_FILES["actor_image"]["name"][$index]);
                        $target = "Sliki/Uploads/" . $fileName;

                        move_uploaded_file($_FILES["actor_image"]["tmp_name"][$index], $target);
                        $image = $target;
                    }

                    $insertActor = $con->prepare("INSERT INTO actors(name, image) VALUES(?, ?)");
                    $insertActor->bind_param("ss", $name, $image);
                    $insertActor->execute();

                    $actorId = $con->insert_id;
                }

                $link = $con->prepare("INSERT INTO movie_actors(movie_id, actor_id) VALUES(?, ?)");
                $link->bind_param("ii", $movieId, $actorId);
                $link->execute();
            }
        }
        // ===== DIRECTORS =====
        if (isset($_POST["director_name"])) {

            foreach ($_POST["director_name"] as $directorName) {

                $directorName = trim($directorName);
                if ($directorName == "") continue;

                $check = $con->prepare("SELECT id FROM directors WHERE name=?");
                $check->bind_param("s", $directorName);
                $check->execute();
                $res = $check->get_result();

                if ($res->num_rows > 0) {
                    $directorId = $res->fetch_assoc()["id"];
                } else {
                    $insert = $con->prepare("INSERT INTO directors(name) VALUES(?)");
                    $insert->bind_param("s", $directorName);
                    $insert->execute();
                    $directorId = $con->insert_id;
                }

                $link = $con->prepare("INSERT INTO movie_directors(movie_id, director_id) VALUES(?, ?)");
                $link->bind_param("ii", $movieId, $directorId);
                $link->execute();
            }
        }
        header("Location:index.php");
        exit;
    } else {
        echo "Грешка!";
    }