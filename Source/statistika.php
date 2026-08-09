<?php
    include "session_check.php";
    include "databaza.php";

    $userId = $_SESSION["user_id"];
    $checkStmt = $con->prepare("
    SELECT COUNT(*) AS total
    FROM ratings
    WHERE user_id=?
    ");
    $checkStmt->bind_param("i", $userId);
    $checkStmt->execute();
    $checkResult = $checkStmt->get_result()->fetch_assoc();
    if($checkResult["total"] == 0){
        $noRatings = true;
    } else {
        $noRatings = false;
    }

    $stmt = $con->prepare("
        SELECT COUNT(*) AS total_ratings, ROUND(AVG(rating), 1) AS average_rating,
        MAX(rating) AS highest_rating,
        MIN(rating) AS lowest_rating
        FROM ratings WHERE user_id=?");
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $summary = $stmt->get_result()->fetch_assoc();

    $stmtRatingCount = $con->prepare("
        SELECT rating, COUNT(*) AS total
        FROM ratings
        WHERE user_id=?
        GROUP BY rating
        ORDER BY rating ASC");
    $stmtRatingCount->bind_param("i", $userId);
    $stmtRatingCount->execute();
    $ratingResult = $stmtRatingCount->get_result();
    $ratingsData = [];
    $maxRatingCount = 0;
    while($rating = $ratingResult->fetch_assoc()) {
        $ratingsData[] = $rating;
        if($rating["total"] > $maxRatingCount) {
            $maxRatingCount = $rating["total"];
        }
    }

    $stmtHighest = $con->prepare("
        SELECT movies.title, movies.poster, ratings.rating
        FROM ratings
        INNER JOIN movies ON ratings.movie_id = movies.id
        WHERE ratings.user_id=?
        ORDER BY ratings.rating DESC
        LIMIT 5");
    $stmtHighest->bind_param("i", $userId);
    $stmtHighest->execute();
    $highestResult = $stmtHighest->get_result();

    $stmtMonths = $con->prepare("
        SELECT
        DATE_FORMAT(kreirano_na, '%Y-%m') AS month,
        COUNT(*) AS total
        FROM ratings
        WHERE user_id=?
        GROUP BY month
        ORDER BY month ASC");
    $stmtMonths->bind_param("i", $userId);
    $stmtMonths->execute();
    $monthsResult = $stmtMonths->get_result();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Статистика</title>
    <link rel="stylesheet" href="settings.css">
    <link rel="stylesheet" href="statistika.css">
</head>
<body>
    <div class="container">
        <?php include "navbar.php";?>
        <?php if($noRatings): ?>
        <div class="no-ratings">
            <h1>Сè уште немаш оценето ниту еден филм или серија 🎬</h1>
            <p>Откако ќе оцениш филм или серија, тука ќе можеш да ја видиш твојата статистика.</p>
            <a href="index.php" class="browse-btn">Разгледај филмови и серии</a>
        </div>
        <?php else: ?>
            <div class="statistics-page">
                <h1>Моја статистика</h1>
                <div class="statistics-summary">
                    <div class="statistics-card">
                        <h2><?php echo $summary["total_ratings"] ?? 0 ?></h2>
                        <p>Вкупно оценки</p>
                    </div>
                    <div class="statistics-card">
                        <h2><?php echo $summary["average_rating"] ?? 0 ?></h2>
                        <p>Просечна оценка</p>
                    </div>
                    <div class="statistics-card">
                        <h2><?php echo $summary["highest_rating"] ?? 0 ?></h2>
                        <p>Највисока оценка</p>
                    </div>
                    <div class="statistics-card">
                        <h2><?php echo $summary["lowest_rating"] ?? 0 ?></h2>
                        <p>Најниска оценка</p>
                    </div>
                </div>
                <div class="statistics-box">
                    <h2>Распределба на оценките</h2>
                    <div class="rating-chart">
                        <?php foreach($ratingsData as $rating):
                        $barHeight = ($rating["total"] / $maxRatingCount) * 100;
                        ?>
                        <div class="rating-bar">
                            <div class="rating-number">
                                <?php echo $rating["rating"]; ?>
                            </div>
                            <div class="bar-container">
                                <div class="bar" style="height: <?php echo $barHeight; ?>%;"></div>
                            </div>
                            <div class="rating-count">
                                <?php echo $rating["total"]; ?>
                            </div>
                        </div>
                        <?php endforeach; ?>
                    </div>
                </div>
                <div class="statistics-box">
                    <h2>Топ 5 највисоко оценети</h2>
                    <div class="top-movies">
                        <?php while($movie = $highestResult->fetch_assoc()):?>
                            <div class="top-movie">
                                <img src="<?php echo htmlspecialchars($movie["poster"]);?>" alt="">
                                <div class="top-movie-info">
                                    <h3><?php echo htmlspecialchars($movie["title"]);?></h3>
                                    <div class="user-rating">⭐<?php echo $movie["rating"];?>/10</div>
                                </div>
                            </div>
                        <?php endwhile;?>
                    </div>
                </div>
                <div class="statistics-box">
                    <h2>Активност по месеци</h2>
                    <div class="monthly-chart">
                        <?php while($month = $monthsResult->fetch_assoc()):?>
                            <div class="month-column">
                                <div class="month-bar" style="height:<?php echo $month["total"]*40;?>px"></div>
                                <span><?php echo $month["total"];?></span>
                                <small><?php echo $month["month"];?></small>
                            </div>
                        <?php endwhile;?>
                    </div>
                </div>
            </div>
        <?php endif;?>
    </div>
</body>
</html>