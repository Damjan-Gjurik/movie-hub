<?php
    include "session_check.php";
    include "databaza.php";
    
    $categories = [[ "name" => "Акција и авантура", "genres" => ["Action", "Adventure"]],
    ["name" => "Комедија", "genres" => ["Comedy", "Family"]],
    ["name" => "Хорор", "genres" => ["Horror"]],
    ["name" => "Научна фантастика", "genres" => ["Sci-Fi", "Fantasy"]],
    ["name" => "Домашно", "genres" => ["Domestic"]],
    ["name" => "Детско", "genres" => ["Kids", "Animation"]],
    ["name" => "Драма", "genres" => ["Drama", "Thriller", "Mustery"]],
    ["name" => "Криминал", "genres" => ["Crime", "Thriller", "Mystery"]],
    ["name" => "Документарци", "genres" => ["Biography", "Documentary", "History"]],
    ["name" => "Спорт", "genres" => ["Sport"]],
    ["name" => "Музика", "genres" => ["Music"]],
    ["name" => "Романтика", "genres" => ["Romance"]],
    ["name" => "Историја", "genres" => ["History", "War"]],
    ];

    $categoryMovies = [];

    foreach($categories as $category) {
        // Ги земаме сите жанрови од категоријата
        $genresArray = $category["genres"]; 
        
        // Правиме прашалници (?) според тоа колку жанрови има (на пр. "?, ?")
        $placeholders = implode(',', array_fill(0, count($genresArray), '?'));
        // Ги одредуваме типовите за bind_param (на пр. "ss" за 2 текстуални жанра)
        $types = str_repeat('s', count($genresArray));

        $sql = "
        SELECT
            movies.*,
            ROUND(AVG(ratings.rating),1) AS avg_rating,
            GROUP_CONCAT(DISTINCT genres.name SEPARATOR ' • ') AS genres,
            GROUP_CONCAT(DISTINCT directors.name SEPARATOR ', ') AS directors
        FROM movies

        LEFT JOIN ratings ON movies.id = ratings.movie_id
        INNER JOIN movie_genres ON movies.id = movie_genres.movie_id
        INNER JOIN genres ON genres.id = movie_genres.genre_id
        LEFT JOIN movie_directors ON movies.id = movie_directors.movie_id
        LEFT JOIN directors ON directors.id = movie_directors.director_id

        WHERE genres.name IN ($placeholders)

        GROUP BY movies.id
        ORDER BY RAND()
        ";

        $stmt = $con->prepare($sql);
        $stmt->bind_param($types, ...$genresArray); // ✅ Ги динамизираме жанровите
        $stmt->execute();

        // Зачувуваме под името на категоријата
        $categoryName = $category["name"];
        $categoryMovies[$categoryName] = $stmt->get_result();
    }
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
        <?php include "navbar.php"; ?>
        <input type="text" id="search" placeholder="Пребарај филм или серија">
        <?php foreach($categoryMovies as $category => $result): ?>
            <?php if($result->num_rows > 0): ?>
                <section class="movie-section">
                    <h2 class="category-title"><?php echo htmlspecialchars($category); ?></h2>
                    <div class="carousel">
                        <button class="carousel-btn left-btn">❮</button>
                        <div class="movie-row">
                            <?php while($movie = $result->fetch_assoc()): ?>
                                <div class="movie-card">
                                    <img src="<?php echo htmlspecialchars($movie["poster"]); ?>" alt="Poster">
                                    <div class="movie-info">
                                        <h3><?php echo htmlspecialchars($movie["title"]); ?></h3>
                                        <div class="kopcinja">
                                            <a class="details-btn" href="movie.php?id=<?php echo $movie["id"]; ?>">Детали</a>
                                            <?php if(isset($_SESSION["role"]) && $_SESSION["role"] == "admin"): ?>
                                                <a class="edit-btn" href="edit_movie.php?id=<?php echo $movie["id"]; ?>">Преправи</a>
                                                <a class="delete-btn" href="delete_movie.php?id=<?php echo $movie["id"]; ?>" onclick="return confirm('Дали сигурно сакаш да го избришеш овој филм?')">Избриши</a>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                </div>
                            <?php endwhile; ?>
                        </div>
                        <button class="carousel-btn right-btn">❯</button>
                    </div>
                </section>
            <?php endif; ?>
        <?php endforeach; ?>
    </div>
    <script src="script.js"></script>
</body>
</html>