<!--written by Baozhen Chen-->
<?php
if (!isset($_SESSION)) {
    session_start();
}

define('DB_HOST', "localhost:3306");
define('DB_USER', "gatechUser");
define('DB_PASS', "gatech123");
//define('DB_USER', "root");
//define('DB_PASS', "root");
define('DB_SCHEMA', "cs6400_fa18_team058");
$db = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_SCHEMA);
if (!$db){
	die('Could not connect: '.mysql_error());
}
?>
