<?php
    include "admin_check.php";
    include "databaza.php";

    $id = $_GET["id"];
    $stmt = $con->prepare("SELECT * FROM movies WHERE id=?");
    $stmt -> bind_param("i", $id);
    $stmt -> execute();
    $movie = $stmt->get_result()->fetch_assoc();
    if(!$movie) {
        die("Филмот не постои");
    }

    $allGenres = $con->query("SELECT * FROM genres ORDER BY name");
    $allPlatforms = $con->query("SELECT * FROM platforms ORDER BY name");

    $selectedGenres = [];
    $sqlGenre = "SELECT genre_id FROM movie_genres WHERE movie_id=?";
    $stmtGenre = $con->prepare($sqlGenre);
    $stmtGenre -> bind_param("i", $id);
    $stmtGenre -> execute();
    $selectedGenresResult = $stmtGenre->get_result();
    while($row=$selectedGenresResult->fetch_assoc()) {
        $selectedGenres[]=$row["genre_id"];
    }

    $selectedPlatforms = [];
    $sqlPlatform = "SELECT platform_id FROM movie_platforms WHERE movie_id=?";
    $stmtPlatform = $con->prepare($sqlPlatform);
    $stmtPlatform -> bind_param("i", $id);
    $stmtPlatform -> execute();
    $selectedPlatformResult = $stmtPlatform->get_result();
    while($row=$selectedPlatformResult->fetch_assoc()) {
        $selectedPlatforms[]=$row["platform_id"];
    }

    $sqlActor = "SELECT actors.id, actors.name, actors.image FROM actors INNER JOIN movie_actors
    ON actors.id=movie_actors.actor_id WHERE movie_actors.movie_id=?";
    $stmtActor = $con->prepare($sqlActor);
    $stmtActor -> bind_param("i", $id);
    $stmtActor -> execute();
    $actorResult = $stmtActor->get_result();

    $sqlDirector="SELECT directors.id,directors.name FROM directors INNER JOIN 
    movie_directors ON directors.id=movie_directors.director_id WHERE movie_directors.movie_id=?";
    $stmtDirector=$con->prepare($sqlDirector);
    $stmtDirector->bind_param("i",$id);
    $stmtDirector->execute();
    $directorResult=$stmtDirector->get_result();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="admin.css">
</head>
<body>
    <div class="container">
        <?php include "navbar.php";?>
        <form class="edit-form" action="update_movie.php" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="movie_id" value="<?php echo $movie["id"];?>">
            <label>Наслов:</label>
            <input type="text" name="title" value="<?php echo htmlspecialchars($movie["title"]);?>">
            <label>Тип:</label>
            <select name="type" id="typeSelect">
                <option value="Филм" <?php if($movie["type"]=="Филм") echo "selected";?>>Филм</option>
                <option value="Серија" <?php if($movie["type"]=="Серија") echo "selected";?>>Серија</option>
            </select>
            <div id="seriesFields">
                <label>Број на сезони</label>
                <input type="number" name="seasons" min="1" value="<?php echo $movie["seasons"]; ?>">
                <label>Број на епизоди</label>
                <input type="number" name="episodes" min="1" value="<?php echo $movie["episodes"]; ?>">
            </div>
            <input type="number" name="release_year" value="<?php echo $movie["release_year"];?>">
            <textarea name="description"><?php echo htmlspecialchars($movie["description"]); ?></textarea>
            <input type="text" name="trailer" value="<?php echo htmlspecialchars($movie["trailer"]);?>">
            <div class="poster">
                <img src="<?php echo $movie["poster"];?>" width="180">
                <input type="file" name="poster">
            </div>
            <div class="admin-section">
                <div class="checkbox-group">
                    <?php while($genre = $allGenres->fetch_assoc()):?>
                    <label>
                        <input type="checkbox" name="genres[]" value="<?php echo $genre["id"];?>"
                        <?php if(in_array($genre["id"], $selectedGenres)) echo "checked";?>>
                        <?php echo $genre["name"];?>
                    </label>
                    <?php endwhile; ?>
                </div>
            </div>
            <div class="admin-section">
                <div class="checkbox-group">
                    <?php while($platform = $allPlatforms->fetch_assoc()):?>
                    <label>
                        <input type="checkbox" name="platforms[]" value="<?php echo $platform["id"];?>"
                        <?php if(in_array($platform["id"], $selectedPlatforms)) echo "checked";?>>
                        <?php echo $platform["name"];?>
                        <img src="<?php echo $platform["logo"];?>">
                    </label>
                    <?php endwhile; ?>
                </div>
            </div>
            <div class="actorsContainer" id="actorsContainer">
                <?php while($actor = $actorResult->fetch_assoc()):?>
                <div class="actor-item">
                    <input class="actor-fields" type="hidden" name="actor_id[]" value="<?php echo $actor["id"];?>">
                    <input class="actor-fields" type="text" name="actor_name[]" value="<?php echo htmlspecialchars($actor["name"]);?>">
                    <input class="actor-fields" type="file" name="actor_image[]">
                    <button type="button" class="removeActor">Отстрани</button>
                </div>
                <?php endwhile; ?>
            </div>
            <button type="button" class="secondaryBtn" id="addActor">+ Додади актер</button><br><br>
            <h3>Режисер</h3>
                <div id="directorsContainer">
                    <?php while($director=$directorResult->fetch_assoc()):?>
                        <div class="director-row">
                            <input type="hidden" name="director_id[]" value="<?php echo $director["id"];?>">
                            <input type="text" name="director_name[]" value="<?php echo htmlspecialchars($director["name"]);?>">
                            <button type="button" class="removeDirector">Избриши</button>
                        </div>
                        <?php endwhile; ?>
                    <button type="button" id="addDirector" class="secondaryBtn">+ Додади режисер</button><br><br>
                </div>
            <button class="save-btn" type="submit">Зачувај промени</button>
        </form>
    </div>
    <script src="edit_movie.js"></script>
</body>
</html>
