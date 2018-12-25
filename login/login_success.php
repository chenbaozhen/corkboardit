<?php
include('common.php');
if (isset($_SESSION['myusername'])){
header("location:../home.php");
}else{
header("location:login.php");
}
?>

<html>
<body>
Login Successful
</body>
</html>
