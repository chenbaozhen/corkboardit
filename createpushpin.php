<?php
include('login/common.php');

$OwnerEmail = $_POST['OwnerEmail'];
$CB_DT1=$_POST['CB_DateTime'];
$CB_DT2 = str_replace("%3A",":",$CB_DT1);
$CB_DateTime = str_replace("+"," ",$CB_DT2);
$url = $_POST['pushpin_url'];
$description = $_POST['pushpin_description'];
$tags = $_POST['pushpin_tags'];

$split = explode(',', $tags);
//echo $OwnerEmail;
//echo $url;
//echo $CB_DateTime;
//echo $description;
//echo $tags;

$checkquery = sprintf("
SELECT * 
FROM PushPin
WHERE Link = '%s' 
AND OwnerEmail = '%s'
AND CB_DateTime = '%s'
",
mysqli_real_escape_string($db,$url),
mysqli_real_escape_string($db,$OwnerEmail),
mysqli_real_escape_string($db,$CB_DateTime));
$result = mysqli_query($db,$checkquery);

$nowsql = "SELECT now() FROM user limit 1";
$nowres=mysqli_query($db,$nowsql);
$now = mysqli_fetch_assoc($nowres);
$PP_DateTime =$now['now()']; 
echo $PP_DateTime;

if (mysqli_num_rows($result) == 0) {
	$addpushpin = sprintf("
	INSERT INTO PushPin 
	VALUES ('%s', '%s', now(),'%s', '%s')
	",
	mysqli_real_escape_string($db,$OwnerEmail),
	mysqli_real_escape_string($db,$CB_DateTime),
	mysqli_real_escape_string($db,$url),
	mysqli_real_escape_string($db,$description)
	);
	$result = mysqli_query($db,$addpushpin);


if (!empty(trim($tags))) {
	foreach ($split as &$tag) {
	//echo $tag;
	$addpushpintag = sprintf("
	INSERT INTO pushpin_tag 
	VALUES ('%s', '%s', now(),lower('%s'))
	",
	mysqli_real_escape_string($db,$OwnerEmail),
	mysqli_real_escape_string($db,$CB_DateTime),
	mysqli_real_escape_string($db,trim($tag))
	);
	$result = mysqli_query($db,$addpushpintag);
	//echo $addpushpintag;
	
	}
	}
}
header("location:pushpin_view.php?OwnerEmail=".$OwnerEmail."&CB_DateTime=".$CB_DateTime."&PP_DateTime=".$PP_DateTime."");

?>

