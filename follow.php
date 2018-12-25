<?php
include('login/common.php');

echo $_SESSION['myusername'];
echo "<br />";
echo $_POST['FolloweeEmail'];

$followquery = sprintf("
INSERT INTO Follows(FollowerEmail,FolloweeEmail)
VALUES ('%s', '%s')",
mysqli_real_escape_string($db, $_SESSION['myusername']),
mysqli_real_escape_string($db, $_POST['FolloweeEmail'])
);
echo $followquery;
mysqli_query($db, $followquery);

//remove the watch

$removewatch = sprintf("
DELETE From Watches where WatcherEmail='%s' and OwnerEmail='%s'",
mysqli_real_escape_string($db, $_SESSION['myusername']),
mysqli_real_escape_string($db, $_POST['FolloweeEmail'])
);

mysqli_query($db, $removewatch);

header("location:".$_POST['back']);

?>

