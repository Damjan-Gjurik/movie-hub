<?php
    include "session_check.php";
    include "databaza.php";

    $userId = $_SESSION["user_id"];
    $sql = "SELECT movies.* 
    FROM movies
    INNER JOIN watchlist
    ON movies.id = watchlist.movie_id
    WHERE watchlist.user_id = ?";

    $stmt = $con->prepare($sql);
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Watchlist</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <?php include "navbar.php";?>
        <div class="movie-grid">
            <?php if($result->num_rows == 0): ?>
            <h2>Нема додадени филмови во Watchlist.</h2>
            <?php endif; ?>
            <?php while($movie = $result->fetch_assoc()):?>
            <div class="movie-card">
                <img src="<?php echo $movie["poster"];?>" alt="Poster">
                <div class="movie-info">
                    <h3><?php echo $movie["title"]; ?></h3>
                    <p><?php echo $movie["release_year"]; ?></p>
                    <a href="movie.php?id=<?php echo $movie["id"]; ?>">Детали</a>
                    <form action="remove_watchlist.php"method="POST">
                    <input type="hidden" name="movie_id" value="<?php echo $movie["id"]; ?>">
                    <button class="remove-btn" type="submit">Отстрани</button>
                    </form>
                </div>
            </div>
            <?php endwhile;?>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>