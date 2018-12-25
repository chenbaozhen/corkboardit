<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<LINK REL=StyleSheet HREF="layout.css" TYPE="text/css" MEDIA=screen>
		<title>CorkBoartIT | Add CorkBoard</title>
	</head>
	<body>
		
		<img src="images/logo_small.png" alt="logo" />
		<br><br>
		
<?php
include('login/common.php');


if (!isset($_SESSION['myusername'])) 
{
	echo "Session variable expired. Please log in again.";
	header("location:login/login.php");
} elseif(empty($_POST['cork_title']))
{    
	echo "Corkboard title is required. Please enter it.";
	header("location:corkboard_add.php?title_missing=1");
	
} 
elseif(empty($_POST['private'])) {
	echo "Please select corkboard visibility";
	header("location:corkboard_add.php?visibility_missing=1");
} 

elseif(($_POST['private']=='Y') and (empty($_POST['cork_pass']))) {
	echo "Please enter the required password field for a private corkboard. Or change to Public";
	header("location:corkboard_add.php?password_missing=1");
} 

else {
$user = $_SESSION['myusername'];
$title = $_POST['cork_title'];
$cat = urldecode($_POST['cork_category']);
$vis = $_POST['private'];




$query = "INSERT INTO  Corkboard (OwnerEmail, Title, Cate_Name, CB_DateTime) VALUES  (\"".$user."\", \"".$title."\", \"".$cat."\", now())";
mysqli_query($db, $query);
echo $query;

	if($vis == 'Y')
	{    
		$corkPass = $_POST['cork_pass'];
		//$query = "INSERT INTO  Corkboard (OwnerEmail, Title, Cate_Name, CB_DateTime, Visibility, Password) VALUES  (\"".$user."\", \"".$title."\", \"".$cat."\", CURDATE(), \"Private\", \"".$corkPass."\")";
		
		       $query = "INSERT INTO  private_corkboard (OwnerEmail, CB_DateTime, Password) VALUES  (\"".$user."\", now(),\"".$corkPass."\")";
	} else 
	{		
		$query = "INSERT INTO  public_corkboard (OwnerEmail, CB_DateTime) VALUES  (\"".$user."\", now())";
				
	}
	echo $query;
	echo "<br><br>";
	mysqli_query($db, $query);
	
	
	$nowsql = "SELECT now() FROM user limit 1";
	$nowres=mysqli_query($db,$nowsql);
	$now = mysqli_fetch_assoc($nowres);
	$CB_DateTime =$now['now()']; 
	echo $CB_DateTime;
	//header("location:home.php");
	header("location:corkboard_view.php?OwnerEmail=".$user."&CB_DateTime=".$CB_DateTime."");
	
	
	
}
?>
		
		
	</body>
</html>

