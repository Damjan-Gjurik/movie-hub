<?php

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$timeout = 36000;

if (isset($_SESSION["last_activity"])) {

    if (
        time() - $_SESSION["last_activity"]
        > $timeout
    ) {

        session_unset();
        session_destroy();

        header("Location: login.html");
        exit;
    }
}

$_SESSION["last_activity"] = time();

if (!isset($_SESSION["user_id"])) {

    header("Location: login.html");
    exit;
}

?>