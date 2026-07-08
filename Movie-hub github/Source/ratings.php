<?php
    include "session_check.php";
    include "databaza.php";

    $userId = $_SESSION["user_id"];
    $sort = $_GET["sort"] ?? "title";
    switch($sort){
        case "highest":
            $orderBy = "ratings.rating DESC";
            break;
        case "lowest":
            $orderBy = "ratings.rating ASC";
            break;
        case "newest":
            $orderBy = "ratings.id DESC";
            break;
        default:
            $orderBy = "movies.title ASC";
    }
    $summarySql = "SELECT AVG(rating) AS avg_rating, 
    COUNT(*) AS total, MAX(rating) AS highest, 
    MIN(rating) AS lowest FROM ratings WHERE user_id = ?";

    $summaryStmt = $con->prepare($summarySql);
    $summaryStmt->bind_param("i", $userId);
    $summaryStmt->execute();
    $summary = $summaryStmt->get_result()->fetch_assoc();

    $sql = "SELECT movies.id, movies.title, movies.poster, movies.type, ratings.rating,
    (SELECT ROUND(AVG(r2.rating),1) FROM ratings r2 WHERE r2.movie_id = movies.id) AS avg_rating
    FROM ratings INNER JOIN movies ON ratings.movie_id = movies.id WHERE ratings.user_id = ? ORDER BY $orderBy";

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
    <title>My Ratings</title>
    <link rel="stylesheet" href="settings.css">
</head>
<body>
    <div class="container">
        <?php include "navbar.php";?>
        <br>
        <div class="rating-page">
            <h1>Мои оцени</h1>
            <div class="ratings-summary">
                <div class="summary-card">
                    <h2><?php echo round($summary["avg_rating"], 1);?></h2>
                    <p>Просечна оцена</p>
                </div>
                <div class="summary-card">
                    <h2><?php echo round($summary["total"]);?></h2>
                    <p>Оценети филмови</p>
                </div>
                <div class="summary-card">
                    <h2><?php echo round($summary["highest"], 1);?></h2>
                    <p>Највисока оцена</p>
                </div>
                <div class="summary-card">
                    <h2><?php echo round($summary["lowest"], 1);?></h2>
                    <p>Најниска оцена</p>
                </div>
                <div class="ratings-toolbar">
                    <form method="GET">
                        <p>Подреди по:</p>
                        <select name="sort" onchange="this.form.submit()">
                            <option value="title" <?php if($sort=="title") {echo "selected";}?>>Азбучен ред</option>
                            <option value="highest" <?php if($sort=="highest") {echo "selected";}?>>Нјависока оценка</option>
                            <option value="lowest" <?php if($sort=="lowest") {echo "selected";}?>>Најниска оценка</option>
                            <option value="newest" <?php if($sort=="newest") {echo "selected";}?>>Најнова оценка</option>
                        </select>
                    </form>
                </div>
            </div>
            <div class="ratings-list">
                <?php while($movie = $result->fetch_assoc()):?>
                    <div class="rating-card">
                        <img src="<?php echo $movie["poster"];?>">
                        <div class="rating-info">
                            <h2><?php echo $movie["title"];?></h2>
                            <p><?php echo $movie["type"]?></p>
                            <form class="rating-update" action="rate.php" method="POST">
                                <input type="hidden" name="movie_id" value="<?php echo $movie["id"];?>">
                                <label>Твоја оцена:</label>
                                <select name="rating" onchange="this.form.submit()">
                                    <?php for($i=1; $i<=10; $i++):?>
                                        <option value="<?php echo $i;?>" <?php if($movie["rating"]==$i){echo "selected";}?>>
                                            <?php echo $i;?>
                                        </option>
                                        <?php endfor; ?>
                                </select>
                            </form>
                            <form action="delete_rating.php" method="POST" onsubmit="return confirm('Дали сигурно сакаш да ја избришеш оценката?')">
                                <input type="hidden" name="movie_id" value="<?php echo $movie["id"];?>">
                                <button type="submit" class="delete-rating">Избриши оцена</button>
                            </form>
                            <p>Просечна оцена:<strong><?php echo $movie["avg_rating"];?></strong></p>
                            <div class="kopcinja">
                                <a class="details-btn" href="movie.php?id=<?php echo $movie["id"];?>">Детали</a>
                            </div>
                        </div>
                    </div>
                <?php endwhile;?>
            </div>
        </div>
    </div>
</body>
</html>

