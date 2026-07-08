<?php
if(session_status() === PHP_SESSION_NONE){
    session_start();
}
?>

<!DOCTYPE html>
<html lang="mk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovieHub</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="top-bar">
        <h1>🎬 Македонски каталог за филмови и серии</h1>
        <div class="nav-right">
            <?php $currentPage = basename($_SERVER["PHP_SELF"]);
            if ($currentPage != "index.php"):?><a href="index.php" class="home-btn">Почетна</a><?php endif; ?>
            <div class="user-menu">
                <button id="menuBtn"><?php echo $_SESSION["username"]; ?> ▼</button>
                <div id="dropdownMenu" class="dropdown hidden">
                    <div class="menu-header">
                        <strong><?php echo $_SESSION["username"] ?? "Guest";?></strong>
                        <p><?php echo $_SESSION["email"] ?? "";?></p>
                    </div>
                    <?php if($_SESSION["role"] == "admin"):?>
                    <div class="menu-section">
                        <a href="admin.php">Admin Panel</a>
                    </div>
                    <?php endif;?>
                    <div class="menu-section">
                        <a href="watchlist_page.php">My Watchlist</a>
                        <a href="ratings.php">My Ratings</a>
                    </div>
                    <div class="menu-section">
                        <a href="#">Account Settings</a>
                        <a href="#">Статистика</a>
                    </div>
                    <div class="menu-section">
                        <a href="logout.php">Одјави се</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
