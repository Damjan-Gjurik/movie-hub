<?php
    include "session_check.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Добредојде,
    <?php echo $_SESSION["username"];?>
    </h1>
    <a href="logout.php">Одјави се!</a>
</body>
</html>