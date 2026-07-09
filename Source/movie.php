<?php
    include "session_check.php";
    include "databaza.php";

    $id = $_GET["id"];
    $sql = "SELECT * FROM movies WHERE id=?";
    $stmt = $con->prepare($sql);
    $stmt -> bind_param("i",$id);
    $stmt -> execute();
    $result = $stmt->get_result();
    $movie = $result->fetch_assoc();

    $genreSql = "
    SELECT genres.name
    FROM genres
    INNER JOIN movie_genres
    ON genres.id = movie_genres.genre_id
    WHERE movie_genres.movie_id = ?";
    $genreStmt = $con->prepare($genreSql);
    $genreStmt -> bind_param("i", $id);
    $genreStmt -> execute();
    $genreResult = $genreStmt->get_result();
    
    $genres = [];
    while($row = $genreResult->fetch_assoc()) {
        $genres[] = $row["name"];
    }

    $actorSql = "SELECT actors.name, actors.image
    FROM actors
    INNER JOIN movie_actors
    ON actors.id = movie_actors.actor_id
    WHERE movie_actors.movie_id = ?
    LIMIT 5";
    $actorStmt = $con->prepare($actorSql);
    $actorStmt -> bind_param("i", $id);
    $actorStmt -> execute();
    $actorResult = $actorStmt->get_result();

    $platformSql = "
    SELECT platforms.name, platforms.logo
    FROM platforms
    INNER JOIN movie_platforms
    ON platforms.id = movie_platforms.platform_id
    WHERE movie_platforms.movie_id = ?
    ";
    $platformStmt = $con->prepare($platformSql);
    $platformStmt->bind_param("i",$id);
    $platformStmt->execute();
    $platformResult = $platformStmt->get_result();

    $avgSql = "
    SELECT AVG(rating) as avg_rating,
    COUNT(*) as total_votes
    FROM ratings
    WHERE movie_id = ?
    ";
    $avgStmt = $con->prepare($avgSql);
    $avgStmt->bind_param("i",$id);
    $avgStmt->execute();
    $avgResult = $avgStmt->get_result();
    $ratingData = $avgResult->fetch_assoc();

    $directorSql = "
    SELECT directors.name
    FROM directors
    INNER JOIN movie_directors
    ON directors.id=movie_directors.director_id
    WHERE movie_directors.movie_id=?
    ";
    $directorStmt=$con->prepare($directorSql);
    $directorStmt->bind_param("i",$id);
    $directorStmt->execute();
    $directorResult=$directorStmt->get_result();
    
    $directors=[];
    while($row=$directorResult->fetch_assoc()){
    $directors[]=$row["name"];

}
    if (!$movie) {
        die("Филмот не постои!");
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $movie["title"];?></title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <?php include "navbar.php";?>
        <div class="movie-details">
            <h1><?php echo $movie["title"];?></h1>
            <p class="genre">
                <?php echo $movie["type"];?> | 
                <?php echo implode(" | ", $genres);?> | 
                <?php echo $movie["release_year"];?>
            </p>
            <p class="director-line">
                Режисер<?php echo count($directors)>1 ? "и ":"";?>:
                <?php echo implode(", ", $directors);?>
            </p>

            <div class="top-section">
                <img src="<?php echo $movie["poster"];?>" alt="Poster" class="poster">

                <div class="info-section">
                    <div class="description">
                        <?php echo $movie["description"];?>
                    </div>

                    <div class="platforms">
                        <h3>Достапно на:</h3>
                        <?php while($platform = $platformResult->fetch_assoc()):?>
                            <div class="platform-item">
                                <img src="<?php echo $platform["logo"];?>" alt="<?php echo $platform["name"];?>">
                            </div>
                        <?php endwhile;?>
                    </div>
                    <?php if($movie["type"] == "Серија"):?>
                        <div class="series-card">
                            <div class="series-item">
                                <span class="series-icon">📺</span>
                                <div>
                                    <div class="series-label">Сезони</div>
                                    <div class="series-value"><?php echo $movie["seasons"];?></div>
                                </div>
                            </div>
                            <div class="series-divider"></div>
                                <div class="series-item">
                                    <span class="series-icon">🎞️</span>
                                    <div>
                                        <div class="series-label">Епизоди</div>
                                        <div class="series-value"><?php echo $movie["episodes"];?></div>
                                    </div>
                                </div>
                        </div>
                    <?php endif;?>
                </div>
            </div>
                <div class="actions">
                    <form action="watchlist.php" method="POST">
                        <input type="hidden" name="movie_id" value="<?php echo $movie["id"]; ?>">
                        <button class="watchlist-btn" data-id="<?php echo $movie["id"];?>">+ Add to watchlist</button>
                    </form>
                    <form action="rate.php" method="POST" class="rating-form">
                        <input
                            type="hidden"
                            name="movie_id"
                            value="<?php echo $movie["id"]; ?>">
                        <select name="rating">
                            <option value="" selected disabled>Избери оцена</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                        <button class="rate" type="submit">Rate</button>
                    </form>
                    <div class="rating-placeholder">⭐<?php
                        if($ratingData["avg_rating"]) {
                            echo round($ratingData["avg_rating"], 1);
                        }
                        else {
                            echo "Нема податоци!";
                        }?>(<?php echo $ratingData["total_votes"];?> оцени)
                    </div>
                </div><br>
                <h2>Глумци</h2>
                <div class="actors">
                    <?php while($actor = $actorResult->fetch_assoc()) :?>
                    <div class="actor-card">
                        <img src="<?php echo $actor["image"]; ?>"
                        alt="<?php echo $actor["name"]; ?>">
                        <p><?php echo $actor["name"]?></p>
                    </div>
                    <?php endwhile;?>
                </div>
                <h2>Трејлер</h2><br>
                <iframe src="<?php echo $movie["trailer"];?>" allowfullscreen></iframe>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
