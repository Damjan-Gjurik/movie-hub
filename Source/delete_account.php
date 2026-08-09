<?php
    include "session_check.php";
    include "databaza.php";

    $userId = $_SESSION["user_id"];
    $con->begin_transaction();

    try{
        $stmtRating = $con->prepare("DELETE from ratings WHERE id=?");
        $stmtRating->bind_param("i", $userId);
        $stmtRating->execute();

        $stmtWatchlist = $con->prepare("DELETE from watchlist WHERE id=?");
        $stmtWatchlist->bind_param("i", $userId);
        $stmtWatchlist->execute();

        /*$stmtRating = $con->prepare("DELETE from reviews WHERE user_id=?");
        $stmtRating->bind_param("i", $userId);
        $stmtRating->execute();*/

        $stmtUser = $con->prepare("DELETE from users WHERE id=?");
        $stmtUser->bind_param("i", $userId);
        $stmtUser->execute();

        $con->commit();
        session_destroy();
        header("Location:login.html");
        exit;
    }
    catch(Exception $e){
        $con->rollback();
        die("Грешка при бришење на профил!");
        exit;
    }

?>