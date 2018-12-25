<?php
include('login/common.php');
if ($_POST['Cancel']=="Cancel"){
header("location:home.php");
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<?php
$OwnerEmail=$_POST['OwnerEmail']; 
$CB_DT=$_POST['CB_DateTime'];
$CB_DateTime = str_replace("%3A",":",$CB_DT);
//$CB_DateTime = date_create_from_format('d/m/Y:H:i:s',str_replace("%3A",":",$CB_DT));
$corkpass=$_POST['cork_pass'];

echo $OwnerEmail."<br />";

echo $CB_DateTime."<br />";

echo $corkpass."<br />";

$sql=sprintf("
SELECT *
FROM private_corkboard
WHERE OwnerEmail = '%s'
AND CB_DateTime = '%s'
AND Password = '%s'",
mysqli_real_escape_string($db,$OwnerEmail),
mysqli_real_escape_string($db,$CB_DateTime),
mysqli_real_escape_string($db,$corkpass)
);

$result=mysqli_query($db,strtolower($sql));

$count=mysqli_num_rows($result);

while ($row = mysqli_fetch_assoc($result)) {
	echo $row['Password']."<br />";
}

if($count==1){
	//header("location:corkboard_view.php?email=".$email."&title=".$title);
	header("location:corkboard_view.php?OwnerEmail=".$OwnerEmail."&CB_DateTime=".$CB_DateTime);
}
else if ($_POST['Cancel']=="Cancel"){
	header("location:home.php");
}
else{
	echo "Password is wrong!";
	header("location:password_corkboard.php?password_wrong=1&OwnerEmail=".$OwnerEmail."&CB_DateTime=".$CB_DateTime);
}

?>
</body>
</html>
