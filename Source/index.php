<?php
    include "session_check.php";
    include "databaza.php";

    $sql = "
    SELECT
    movies.*,
    ROUND(AVG(ratings.rating),1) AS avg_rating,
    GROUP_CONCAT(DISTINCT genres.name SEPARATOR ' • ') AS genres,
    GROUP_CONCAT(DISTINCT directors.name SEPARATOR ', ') AS directors
    FROM movies
    LEFT JOIN ratings
    ON movies.id = ratings.movie_id
    LEFT JOIN movie_genres
    ON movies.id = movie_genres.movie_id
    LEFT JOIN genres
    ON genres.id = movie_genres.genre_id
    LEFT JOIN movie_directors
    ON movies.id = movie_directors.movie_id
    LEFT JOIN directors
    ON directors.id = movie_directors.director_id
    GROUP BY movies.id
    ORDER BY movies.title
    ";
    $result = $con->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovieHub</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <?php include "navbar.php";?>
        <input type="text" id="search" placeholder="Пребарај филм или серија">
        <div class="movie-grid">
            <?php
            while($movie = $result->fetch_assoc()) :?>
            <div class="movie-card">
                <img src="<?php echo $movie["poster"];?>" alt="Poster">
                <div class="movie-info">
                    <h3><?php echo $movie["title"];?></h3>
                    <div class="movie-year">
                        <p><?php echo $movie["release_year"];?></p>
                    </div>
                    <div class="movie-genres">
                        <p><?php echo $movie["genres"];?></p>
                        <p><?php echo $movie["type"]?></p>
                        <p class="movie-director"><?php echo $movie["directors"];?></p>
                    </div>
                    <p class="movie-rating">
                        ⭐<?php if($movie["avg_rating"]) {
                            echo round($movie["avg_rating"], 1);
                        } else {
                            echo "Нема податоци";
                        }?>
                    </p>
                    <div class="kopcinja">
                        <a class="details-btn" href="movie.php?id=<?php echo $movie["id"];?>">Детали</a>

                        <?php if(isset($_SESSION["role"]) && $_SESSION["role"] == "admin"):?>
                            <a class="edit-btn" href="edit_movie.php?id=<?php echo $movie["id"]?>">Преправи</a>
                            <a class="delete-btn" href="delete_movie.php?id=<?php echo $movie["id"]?>"
                            onclick="return confirm('Дали сигурно сакаш да го избришеш овој филм?')">Избриши</a>
                        <?php endif;?>
                    </div>
                </div>
            </div>
            <?php endwhile;?>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>