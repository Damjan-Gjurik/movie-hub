<?php
    include "admin_check.php";
    include "databaza.php";

    if (!isset($_GET["id"])) {
        header("Location: index.php");
        exit;
    }

    $id = $_GET["id"];

    // 1. ПРВО го земаме постерот со SELECT за да знаеме која слика да ја избришеме од фолдерот
    $stmtPoster = $con->prepare("SELECT poster FROM movies WHERE id = ?");
    $stmtPoster->bind_param("i", $id);
    $stmtPoster->execute();
    $result = $stmtPoster->get_result();

    if ($movie = $result->fetch_assoc()) {
        // Ако постои фајлот на серверот, го бришеме со unlink
        if (!empty($movie["poster"]) && file_exists($movie["poster"])) {
            unlink($movie["poster"]);
        }
    }
    $stmtPoster->close();

    // 2. БРИШЕЊЕ на поврзаните табели (редоследно и со точни имиња на табелите)
    
    // Актери
    $stmt = $con->prepare("DELETE FROM movie_actors WHERE movie_id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    // Жанрови
    $stmt = $con->prepare("DELETE FROM movie_genres WHERE movie_id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    // Платформи
    $stmt = $con->prepare("DELETE FROM movie_platforms WHERE movie_id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    // Оцени (Ratings)
    $stmt = $con->prepare("DELETE FROM ratings WHERE movie_id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    // Вочлист (Watchlist)
    $stmt = $con->prepare("DELETE FROM watchlist WHERE movie_id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    // Режисери (ако имаш ваква табела)
    $stmt = $con->prepare("DELETE FROM movie_directors WHERE movie_id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    // 3. ПОСЛЕДНО - Го бришеме самиот филм од табелата movies
    $stmt = $con->prepare("DELETE FROM movies WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    // Пренасочување
    header("Location: index.php");
    exit;
?>