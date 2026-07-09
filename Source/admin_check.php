<?php
    include "session_check.php";

    if($_SESSION["role"] != "admin") {
        die("Пристапот е забранет!");
    }
?>