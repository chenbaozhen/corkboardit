<?php

include('login/common.php');
$CB_DT1=str_replace("/","",$_GET['CB_DateTime']);
$CB_DT2 = str_replace("%3A",":",$CB_DT1);

$CB_DateTime = str_replace("+"," ",$CB_DT2);
$PP_DT1=$_GET['PP_DateTime'];
$PP_DT2 = str_replace("%3A",":",$PP_DT1);
$PP_DateTime = str_replace("+"," ",$PP_DT2);

$user = $_SESSION['myusername'];
$text = $_GET['pushpin_comment'];
$OwnerEmail = str_replace("/","",$_GET['OwnerEmail']);

$makecommentquery="INSERT INTO Comment (CommenterEmail,Com_DateTime,PP_DateTime,Text,CB_DateTime,OwnerEmail)
						VALUES(\"".$user."\", now(), \"".$PP_DateTime."\", \"".$text."\", \"".$CB_DateTime."\", \"".$OwnerEmail."\")";
//echo $commentquery;						

mysqli_query($db,$makecommentquery);
header("location:".$_GET['back']);

?>
