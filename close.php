<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Close Database</title>
</head>

<body>

<?php
// does nothing but closing
// a mysql database connection
include('login/common.php');
mysqli_close($db);
?>

</body>
</html>
