<?php
include('login/common.php');

$CB_DT=$_POST['CB_DateTime'];
echo $CB_DT;
$CB_DateTime = str_replace("%3A",":",$CB_DT);

$watchquery = sprintf("
INSERT INTO Watches
VALUES ('%s', '%s', '%s')
",
mysqli_real_escape_string($db,$_SESSION['myusername']),
mysqli_real_escape_string($db,$CB_DateTime),
mysqli_real_escape_string($db,$_POST['OwnerEmail'])
);
mysqli_query($db,$watchquery);

echo $watchquery;

header("location:".$_POST['back']);

?>

