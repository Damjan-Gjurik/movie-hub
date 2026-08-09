<?php 
    include "admin_check.php";
    include "databaza.php";

    $genreResult = $con->query("SELECT * FROM genres ORDER BY name");
    $platformResult = $con->query("SELECT * FROM platforms ORDER BY name");
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
        <h1 class="admin-title">Админ панел</h1>
        <?php 
            $totalMovies = $con->query("SELECT COUNT(*) total FROM movies")->fetch_assoc()["total"];
            $totalRatings = $con->query("SELECT COUNT(*) total FROM ratings")->fetch_assoc()["total"];
            $totalWatchlists = $con->query("SELECT COUNT(*) total FROM watchlist")->fetch_assoc()["total"];
            $totalUsers = $con->query("SELECT COUNT(*) total FROM users")->fetch_assoc()["total"];
        ?>
        <div class="dashboard">
            <div class="dashboard-card">
                <h2>🎬</h2>
                <span><?php echo $totalMovies;?></span>
                <h2>Филмови и серии</h2>
            </div>
            <div class="dashboard-card">
                <h2>⭐</h2>
                <span><?php echo $totalRatings;?></span>
                <h2>Оценки</h2>
            </div>
            <div class="dashboard-card">
                <h2>❤️</h2>
                <span><?php echo $totalWatchlists;?></span>
                <h2>Watchlist</h2>
            </div>
            <div class="dashboard-card">
                <h2>👤</h2>
                <span><?php echo $totalUsers;?></span>
                <h2>Корисници</h2>
            </div>
        </div>
        <div class="admin-panel">
            <form action="add_movie.php" method="POST" class="admin-form" enctype="multipart/form-data">
            <div class="admin-section">
                <label>Наслов</label>
                <input type="text" name="title" required>

                <label>Тип</label>
                <select name="type" id="typeSelect">
                    <option value="Филм">Филм</option>
                    <option value="Серија">Серија</option>
                </select>
                <div id="seriesFields" style="display:none;">
                    <label>Број на сезони</label>
                    <input type="number" name="seasons" min="1">

                    <label>Број на епизоди</label>
                    <input type="number" name="episodes" min="1">
                </div>
                <br>
                <label>Година</label>
                <input type="number" name="release_year" required>

                <label>Опис</label>
                <textarea name="description" rows="5"></textarea>

                <label>Постер</label>
                <input type="file" name="poster" accept="image/*">

                <label>Трејлер</label>
                <input type="text" name="trailer">
            </div>
                <div class="admin-section">
                    <h3>Жанрови</h3><br>
                    <div class="checkbox-group">
                        <?php while($genre = $genreResult->fetch_assoc()):?>
                            <div class="check-item">
                                <label>
                                    <input type="checkbox" name="genres[]" value="<?php echo $genre["id"];?>">
                                    <?php echo $genre["name"];?>
                                </label>
                            </div>
                            <?php endwhile;?>
                    </div>
                </div>
                <div class="admin-section">
                    <h3>Достапни платформи</h3><br>
                    <div class="checkbox-group">
                        <?php while($platform = $platformResult->fetch_assoc()):?>
                            <div class="check-item">
                                <label>
                                    <input type="checkbox" name="platforms[]" value="<?php echo $platform["id"];?>">
                                    <img src="<?php echo $platform["logo"];?>" class="platform-icon">
                                    <?php echo $platform["name"];?>
                                </label>
                            </div>
                            <?php endwhile;?>
                    </div>
                </div>
                <div class="admin-section">
                    <h3>Актери</h3>
                    <div id="actorsContainer">
                        <div class="actor-item">
                            <input type="text" name="actor_name[]" placeholder="Име на актер">
                            <input type="file" name="actor_image[]" accept="image/*">
                            <button type="button" class="removeActor" style="display:none;">Избриши</button>
                        </div>
                        <button type="button" id="addActorBtn" class="secondaryBtn">+ Додади актер</button>
                    </div><br><br>
                    
                    <h3>Режисер</h3>
                    <div id="directorsContainer">
                        <div class="director-row">
                            <input type="text" name="director_name[]">
                            <button type="button" class="removeDirector">Избриши</button>
                        </div>
                        <button type="button" id="addDirector">+ Додади режисер</button>
                    </div><br><br>
                <button class="admin-btn" type="submit">Додади!</button>
            </form>
        </div>
    </div>
    <script src="admin.js"></script>
</body>
</html>