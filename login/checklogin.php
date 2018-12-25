<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Checklogin Document</title>
</head>

<body>

<?php
include('common.php');
//input email and pin
$myusername = mysqli_real_escape_string($db,$_POST['myusername']);
$mypassword = mysqli_real_escape_string($db,$_POST['mypassword']);

$query = "SELECT * FROM user where Email='$myusername' and PIN='$mypassword'";
$result = mysqli_query($db, $query);
$count = mysqli_num_rows($result);
if($count==1){
// Register $myusername, $mypassword and redirect to file "login_success.php"
$_SESSION['myusername'] = $_POST['myusername'];
header("location:login_success.php");
}
else {
$failed_login=1;
header("location:login.php?failed_login=1");
}
?>
</body>
</html>
