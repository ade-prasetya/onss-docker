<?php
// Database credentials from environment variables
$DB_HOST = getenv('DB_HOST') ?: 'mysql';
$DB_USER = getenv('DB_USER') ?: 'root';
$DB_PASS = getenv('DB_PASSWORD') ?: 'rootpassword';
$DB_NAME = getenv('DB_NAME') ?: 'onssdb';

try {
    $dbh = new PDO(
        "mysql:host=$DB_HOST;dbname=$DB_NAME;charset=utf8",
        $DB_USER,
        $DB_PASS,
        array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION)
    );
} catch (PDOException $e) {
    exit("Error: " . $e->getMessage());
}
?>
