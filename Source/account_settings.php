<?php
    include "session_check.php";
    include "databaza.php";

    $userId = $_SESSION["user_id"];
    $stmt = $con->prepare("SELECT username, email, role, kreirano_na, profile_picture FROM users WHERE id=?");
    $stmt -> bind_param("i", $userId);
    $stmt -> execute();
    $user = $stmt->get_result()->fetch_assoc();

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Settings</title>
    <link rel="stylesheet" href="settings.css">
</head>
<body>
    <div class="container">
        <?php include "navbar.php"; ?>
        <div class="settings-wrapper">
            <?php if(isset($_GET["error"])) {
                echo "<div class='error-message'";
                switch($_GET["error"]) {
                    case "wrongpassword": echo "Тековната лозинка не е точна!"; break;
                    case "passwordmismatch": echo "Новите лозинки не се совпаѓаат!"; break;
                    case "shortpassword": echo "Лозинката мора да има најмалку 6 карактери!"; break;
                    case "usernametaken": echo "Ова корисничко име веќе постои."; break;
                    case "emailtaken": echo "Оваа е-пошта веќе постои."; break;
                }
                echo "</div>";
            }
            if(isset($_GET["success"])) {
                echo "<div class='success-message'>";
                if($_GET["success"]=="profile"){
                    echo "Профилот е успешно ажуриран!";
                }
                if($_GET["success"]=="profile"){
                    echo "Лозинката е успешно променета!";
                }
                echo "</div>";
            }
            ?>
            <form action="update_account.php" method="POST" enctype="multipart/form-data" class="settings-form">
                <h2>Информации за профилот</h2>
                <div class="profile-picture">
                    <?php if($user["profile_picture"]!=""): ?>
                        <img src="<?php echo $user["profile_picture"]; ?>">
                    <?php else: ?>
                        <img src="Sliki/default-user.png">
                    <?php endif; ?>
                    <label class="upload-btn" for="profile_picture">Промени фотографија</label>
                    <input id="profile_picture" type="file" name="profile_picture">
                </div>
                <label>Корисничко име:</label>
                <input type="text" name="username" value="<?php echo htmlspecialchars($user["username"]);?>">

                <label>Е-пошта</label>
                <input type="email" name="email" value="<?php echo htmlspecialchars($user["email"]);?>">

                <label>Член од:</label>
                <input type="text" readonly value="<?php echo date("d.m.Y",strtotime($user["kreirano_na"])); ?>">
                
                <button type="submit">Зачувај промени</button>
            </form>
            <hr class="settings-divider">
            <h2>Промена на лозинка</h2>
            <form action="update_account.php" method="POST" class="password-form">
                <label>Тековна лозинка</label>
                <input type="password" name="current_password" required>

                <label>Нова лозинка</label>
                <input type="password" name="new_password">

                <label>Потврди нова лозинка</label>
                <input type="password" name="confirm_password">

                <button type="submit" name="change_password">Промени лозинка</button>
            </form>
            <div class="danger-zone">
                <h2>Опасна зона</h2>
                <p>Бришењето на профилот е трајно. Сите оценки, watchlist и податоци ќе бидат избришани.</p>
                <button class="delete-btn" type="button" id="openDeleteModal">Избриши профил</button>
            </div>
        </div>
    </div>
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <div class="modal-icon">⚠️</div>
            <h2>Избриши профил.</h2>
            <p>Дали сте сигурни дека сакате трајно да го избришете профилот?</p>
            <p class="warning">Оваа акција не може да се поништи!</p>
            <div class="modal-buttons">
                <button id="cancelDelete" class="cancel-btn">Откажи!</button>
                <form action="delete_account.php" method="POST">
                    <button type="submit" class="confirm-delete-btn">Избриши профил!</button>
                </form>
            </div>
        </div>
    </div>
    <script src="settings.js"></script>
</body>
</html>