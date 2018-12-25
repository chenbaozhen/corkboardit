<?php
include('login/common.php');

//echo $_SESSION['myusername'];
//echo "<br />";
//echo $_POST['PP_DateTime'];
//echo $_POST['OwnerEmail'];
//echo $_POST['CB_DateTime'];
$CB_DT1=$_POST['CB_DateTime'];
//echo $CB_DT1;
//echo " first step";
$CB_DT2 = str_replace("%3A",":",$CB_DT1);
//echo $CB_DT2;
//echo " second step";
$CB_DateTime = str_replace("+"," ",$CB_DT2);
$PP_DT1=$_POST['PP_DateTime'];
$PP_DT2 = str_replace("%3A",":",$PP_DT1);
$PP_DateTime = str_replace("+"," ",$PP_DT2);

$LikeOrNot=$_POST['LikeOrNot'];

//echo $_POST['OwnerEmail'];
//echo $CB_DateTime;
//echo "too bad";
//echo $PP_DateTime;
echo $_SESSION['myusername'];

$Likequery = sprintf("
INSERT INTO Likes VALUES ('%s', '%s','%s','%s')",
mysqli_real_escape_string($db, $_POST['OwnerEmail']),
mysqli_real_escape_string($db, $CB_DateTime),
mysqli_real_escape_string($db, $PP_DateTime),
mysqli_real_escape_string($db, $_SESSION['myusername'])
);
echo $Likequery;
//mysqli_query($db, $Likequery);


$UnLikequery = sprintf("
DELETE From Likes where OwnerEmail='%s' and 
CB_DateTime='%s' and  PP_DateTime='%s' and LikerEmail='%s'",
mysqli_real_escape_string($db, $_POST['OwnerEmail']),
mysqli_real_escape_string($db, $CB_DateTime),
mysqli_real_escape_string($db, $PP_DateTime),
mysqli_real_escape_string($db, $_SESSION['myusername'])
);
echo $UnLikequery;
//mysqli_query($db, $UnLikequery);

if ($LikeOrNot=='Like!'){
	mysqli_query($db, $Likequery);
}
else{
	mysqli_query($db, $UnLikequery);
}

header("location:".$_POST['back']);

?>

